import 'package:flutter/material.dart';
import 'package:mote_app/models/app_location.dart';
import 'package:mote_app/models/constants.dart';
import 'package:mote_app/models/location.dart';
import 'package:mote_app/screens/create_date_screen/widgets/confrom_action.dart';
import 'package:mote_app/screens/create_date_screen/widgets/map_header.dart';
import 'package:mote_app/screens/create_date_screen/widgets/map_marker.dart';
import 'package:mote_app/screens/create_date_screen/widgets/save_pos_button.dart';
import 'package:mote_app/utils/theme/theme.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ChoicePlaceDialog extends StatefulWidget {
  final void Function(Point point) setPlace;
  const ChoicePlaceDialog({super.key, required this.setPlace});

  @override
  State<ChoicePlaceDialog> createState() => _ChoicePlaceDialogState();
}

class _ChoicePlaceDialogState extends State<ChoicePlaceDialog> {
  late final YandexMapController mapController;

  final List<MapObject> mapObject = [];

  bool isCreated = false;

  bool isSelected = false;

  Point? choicePlace;

  @override
  void initState() {
    _initPermission().ignore();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MapHeader(
          headerText: isSelected ? 'Сохранить место?' : 'Отметь место на карте',
        ),
        const SizedBox(
          height: 30,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            height: 400,
            child: Stack(
              children: [
                YandexMap(
                  mapObjects: mapObject,
                  nightModeEnabled: isLight(context) ? false : true,
                  onCameraPositionChanged:
                      (cameraPosition, reason, finished) {},
                  onMapCreated: (controller) {
                    mapController = controller;
                    setState(() {
                      isCreated = true;
                    });
                  },
                ),
                isSelected
                    ? const SizedBox.shrink()
                    : MarkerButton(
                        onTap: getCameraPosition,
                      ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        isSelected
            ? ConfrimAction(
                onBack: () {
                  setState(() {
                    isSelected = false;
                    mapObject.clear();
                  });
                },
                onSave: widget.setPlace,
                choicePlace: choicePlace,
              )
            : SavePosButton(onTap: getCameraPosition),
      ],
    );
  }

  void getCameraPosition() async {
    if (isCreated) {
      final cameraPos = await mapController.getCameraPosition();
      choicePlace = cameraPos.target;
      if (choicePlace != null) {
        setState(() {
          isSelected = true;
          mapObject.add(PlacemarkMapObject(
            opacity: 1,
            mapId: const MapObjectId('date_place'),
            point: choicePlace!,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    '${Constants.imagePath}date_icon.png'),
              ),
            ),
          ));
        });
      }
    }
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
    if (isCreated) {
      await mapController.moveCamera(
        animation:
            const MapAnimation(type: MapAnimationType.linear, duration: 1),
        CameraUpdate.newCameraPosition(CameraPosition(
          target: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
          zoom: 17,
        )),
      );
    }
  }
}
