import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/models/location.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MyPostButton extends StatelessWidget {
  final Future<AppLatLong> Function() myLocation;
  final YandexMapController controller;
  const MyPostButton(
      {super.key, required this.myLocation, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () async {
                  final location = await myLocation();
                  await controller.moveCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: Point(
                            latitude: location.lat, longitude: location.long),
                        zoom: 16,
                      ),
                    ),
                    animation: const MapAnimation(duration: 1),
                  );
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Ionicons.navigate_outline,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
