import 'dart:io';

import 'package:exam_app/model/PhotoModel.dart';
import 'package:exam_app/service/PhotoService.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class PhotoDBService {
  Box<PhotoModel>? photobox;
  PhotoService photoService = PhotoService();

  Future<dynamic> checkbox() async {
    await openbox();
    if (photobox!.isNotEmpty) {
      return photobox!.values.toList();
    } else {
      return getPhoto();
    }
  }

  static void registeradapter() {
    Hive.registerAdapter(PhotoModelAdapter());
  }

  Future<void> openbox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    photobox = await Hive.openBox("Photo");
  }

  Future<void> writeToDB(List<PhotoModel> model) async {
    await openbox();
    await photobox!.clear();
    await photobox!.addAll(model);
    print(photobox!.length);
  }

  Future<dynamic> getPhoto() async {
    dynamic response = await photoService.getPhotos();
    if (response is List<PhotoModel>) {
      await openbox();
      await writeToDB(response);
      return photobox!.values.toList();
    } else {
      return response;
    }
  }
}
