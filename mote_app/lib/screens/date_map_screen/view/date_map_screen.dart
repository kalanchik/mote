import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mote_app/models/app_location.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/models/location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

@RoutePage()
class DateMapScreen extends StatefulWidget {
  const DateMapScreen({super.key});

  @override
  State<DateMapScreen> createState() => _DateMapScreenState();
}

class _DateMapScreenState extends State<DateMapScreen> {
  final mapControllerCompleter = Completer<YandexMapController>();
  final List<MapObject> mapsObjects = [];
  final MapObjectId circleId = const MapObjectId('date-radius');
  final MapObjectId placemarkId = const MapObjectId('inner_placemark');
  final seed = Random();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    _initPermission().ignore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                YandexMap(
                  onMapCreated: (controller) {
                    mapControllerCompleter.complete(controller);
                  },
                  mapObjects: mapsObjects,
                ),
                Column(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0),
                          ],
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Ваш город\nНижний Новгород',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 150,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    final defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    await _moveToCurrentLocation(location);
  }

  Future<void> _moveToCurrentLocation(AppLatLong appLatLong) async {
    await (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(CameraPosition(
        target: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
        zoom: 14,
      )),
    );
    final cluster = _generateClusterAndMark(100);
    setState(() {
      mapsObjects.add(cluster);
    });
    setState(() {
      mapsObjects.add(CircleMapObject(
        mapId: circleId,
        circle: Circle(
          center: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
          radius: 10000,
        ),
        strokeColor: Theme.of(context).primaryColor,
        fillColor: const Color.fromARGB(0, 61, 20, 20),
        strokeWidth: 5,
      ));
    });
  }

  Future<Uint8List> _buildClusterAppearance(Cluster cluster) async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    const size = Size(200, 200);
    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = Theme.of(context).primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    const radius = 60.0;

    final textPainter = TextPainter(
        text: TextSpan(
            text: cluster.size.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 50)),
        textDirection: TextDirection.ltr);

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    final textOffset = Offset((size.width - textPainter.width) / 2,
        (size.height - textPainter.height) / 2);
    final circleOffset = Offset(size.height / 2, size.width / 2);

    canvas.drawCircle(circleOffset, radius, fillPaint);
    canvas.drawCircle(circleOffset, radius, strokePaint);
    textPainter.paint(canvas, textOffset);

    final image = await recorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final pngBytes = await image.toByteData(format: ImageByteFormat.png);

    return pngBytes!.buffer.asUint8List();
  }

  double _randomDouble() {
    return (500 - seed.nextInt(1000)) / 10000;
  }

  ClusterizedPlacemarkCollection _generateClusterAndMark(int count) {
    return ClusterizedPlacemarkCollection(
      mapId: const MapObjectId('main_claster'),
      radius: 30,
      minZoom: 15,
      onClusterAdded:
          (ClusterizedPlacemarkCollection self, Cluster cluster) async {
        return cluster.copyWith(
          appearance: cluster.appearance.copyWith(
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                  image: BitmapDescriptor.fromBytes(
                      await _buildClusterAppearance(cluster)),
                  scale: 1),
            ),
          ),
        );
      },
      onClusterTap: (ClusterizedPlacemarkCollection self, Cluster cluster) {
        print('Tapped cluster');
      },
      placemarks: List<PlacemarkMapObject>.generate(count, (i) {
        return PlacemarkMapObject(
            opacity: 1,
            mapId: MapObjectId('placemark_$i'),
            point: Point(
                latitude: 56.3068657 + _randomDouble(),
                longitude: 43.9859811 + _randomDouble()),
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    '${Constants.imagePath}date_icon.png'),
                scale: 1)));
      }),
      onTap: (ClusterizedPlacemarkCollection self, Point point) =>
          print('Tapped me at $point'),
    );
  }
}
