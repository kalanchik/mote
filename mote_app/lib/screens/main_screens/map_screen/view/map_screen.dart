import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mote_app/models/app_location.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/models/location.dart';
import 'package:mote_app/screens/main_screens/map_screen/widgets/all_date_sheet.dart';
import 'package:mote_app/screens/main_screens/map_screen/widgets/my_pos_button.dart';
import 'package:mote_app/screens/main_screens/map_screen/widgets/zoom_buttons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

@RoutePage()
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapControllerCompleter = Completer<YandexMapController>();
  final List<MapObject> mapsObjects = [];
  final MapObjectId circleId = const MapObjectId('date-radius');
  final MapObjectId placemarkId = const MapObjectId('inner_placemark');
  final seed = Random();
  late YandexMapController mapController;

  bool isCreated = false;

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
    final maxHeight = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
        child: SlidingUpPanel(
          minHeight: 100,
          maxHeight: maxHeight,
          color: const Color.fromARGB(255, 245, 245, 245),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          panelBuilder: (sc) => AllDateSheet(
            controller: sc,
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                YandexMap(
                  mapType: MapType.vector,
                  logoAlignment: const MapAlignment(
                    horizontal: HorizontalAlignment.left,
                    vertical: VerticalAlignment.top,
                  ),
                  modelsEnabled: false,
                  mapObjects: mapsObjects,
                  mode2DEnabled: true,
                  rotateGesturesEnabled: false,
                  nightModeEnabled: false,
                  onMapCreated: (controller) {
                    mapController = controller;
                    mapControllerCompleter.complete(controller);
                    setState(() {
                      isCreated = true;
                    });
                  },
                ),
                // const MyLocation(city: 'Нижний Новгород'),
                isCreated
                    ? ZoomButtons(
                        controller: mapController,
                      )
                    : const SizedBox.shrink(),
                isCreated
                    ? MyPostButton(
                        myLocation: () async {
                          AppLatLong location;
                          final defLocation = MoscowLocation();
                          try {
                            location =
                                await LocationService().getCurrentLocation();
                          } catch (_) {
                            location = defLocation;
                          }
                          return location;
                        },
                        controller: mapController,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
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

  Future<Uint8List> drawRectangleWithText() async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);

    final rectSize = const Size(200, 100);
    final borderRadius = const Radius.circular(15.0);
    final rectPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final rect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: const Offset(55.7522200, 37.6155600),
          width: rectSize.width,
          height: rectSize.height),
      borderRadius,
    );

    canvas.drawRRect(rect, rectPaint);

    final textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );

    final text = 'mote';
    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout();

    final textX = 55.7522200 - textPainter.width / 2;
    final textY = 37.6155600 - textPainter.height / 2;

    textPainter.paint(canvas, Offset(textX, textY));

    final picture = recorder.endRecording();
    final img =
        await picture.toImage(rectSize.width.toInt(), rectSize.height.toInt());
    final byteData = await img.toByteData(format: ImageByteFormat.png);
    final uint8List = byteData!.buffer.asUint8List();

    return uint8List;
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
                  // image: BitmapDescriptor.fromBytes(
                  //     await _buildClusterAppearance(cluster)),
                  image:
                      BitmapDescriptor.fromBytes(await drawRectangleWithText()),
                  scale: 1),
            ),
          ),
        );
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
    );
  }
}
