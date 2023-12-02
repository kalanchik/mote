import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mote_app/models/meet/meet_model.dart';

class MeetService {
  static Future<bool> createMeet({
    required MeetModel meet,
  }) async {
    final doc = FirebaseFirestore.instance.collection('meets').doc(meet.id);
    await doc.set(meet.toJson());
    try {
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String?> uploadMeetPhoto(File photo, String id) async {
    final storage = FirebaseStorage.instance.ref(id);
    try {
      await storage.putFile(photo);
      final url = await storage.getDownloadURL();
      return url;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> changeMeetPhoto(File photo, String id) async {
    final url = await uploadMeetPhoto(photo, id);
    if (url != null) {
      final meetDoc = FirebaseFirestore.instance.collection('meets').doc(id);
      try {
        await meetDoc.update({
          'meetPhoto': url,
        });
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }
}
