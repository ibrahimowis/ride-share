import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  static final ImagePicker _picker = ImagePicker();
  static Future<File?> pickImage(BuildContext context) async {
    File? pickedImage;

    pickedImage = await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('التقاط الصزره بالكاميرا'),
                onTap: () async {
                  final pickedFile = await _picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (pickedFile != null) {
                    Navigator.pop(context, File(pickedFile.path));
                  } else {
                    Navigator.pop(context, null);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('اختر من المعرض'),
                onTap: () async {
                  final PickedFile = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (PickedFile != null) {
                    Navigator.pop(context, File(PickedFile.path));
                  } else {
                    Navigator.pop(context, null);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
    return pickedImage;
  }
}
