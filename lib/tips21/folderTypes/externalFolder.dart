import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class CreateFolder {
  externalFolder() async {
    if (await Permission.manageExternalStorage.isGranted) {
      final path = Directory('/storage/emulated/0/30FlutterTips/');
      String res = "";

      if (await path.exists()) {
        res = path.path;
      } else {
        final Directory appDocDirNewFolder = await path.create(recursive: true);

        res = appDocDirNewFolder.path;
      }
      final File file = File("${res}tips21.dart");
      await file.writeAsString("data");
    } else {
      await Permission.manageExternalStorage.request();
    }
  }

  internalFolder() async {
    final abc = (await getExternalStorageDirectories())!.first;
    final path = Directory('${abc.path}/30FlutterTips/');
    String res = "";

    if (await path.exists()) {
      res = path.path;
    } else {
      final Directory appDocDirNewFolder = await path.create(recursive: true);

      res = appDocDirNewFolder.path;
    }
    final File file = File("${res}tips21.dart");
    await file.writeAsString("data");
  }
}
