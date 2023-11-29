class ProfilePercentCounter {
  ProfilePercentCounter._();

  static int count({
    required Map<String, dynamic> profile,
  }) {
    final maxFields = 15;
    var profileProgress = 0;
    var nonNullFields = 0;
    profile.forEach((key, value) {
      if (key == 'name' ||
          key == 'age' ||
          key == 'desc' ||
          key == 'sign' ||
          key == 'education' ||
          key == 'work') {
        value.toString().isNotEmpty ? nonNullFields++ : null;
      }
      if (key == 'photos') {
        final photos = value as List<String>;
        nonNullFields += photos.length;
      }
      if (key == 'interests') {
        final interest = value as List<String>;
        interest.isNotEmpty ? nonNullFields++ : null;
      }
      if (key == 'additionalInfo') {
        final additionalInfo = value as Map;
        additionalInfo.isNotEmpty ? nonNullFields++ : null;
      }
    });
    profileProgress = ((nonNullFields / maxFields) * 100).toInt();
    return profileProgress;
  }
}
