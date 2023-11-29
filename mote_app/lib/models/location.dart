class AppLatLong {
  final double lat;
  final double long;

  AppLatLong({required this.lat, required this.long});
}

class MoscowLocation extends AppLatLong {
  MoscowLocation({
    super.lat = 55.7522200,
    super.long = 37.6155600
  });
}