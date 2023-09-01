import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';

import '../constants/colorConstants.dart';
import '../constants/stringConstant.dart';
import '../utils/lotOfThemes.dart';

class ImageUploader extends StatefulWidget {
  final String label;
  bool lightTheme;
  final Function(String?) callback;

  ImageUploader({Key? key, required this.label, required this.callback,
  this.lightTheme=true
  })
      : super(key: key);

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 6.0),
          child:
              Text('Please upload ${widget.label}', style: widget.lightTheme?LotOfThemes.dark14:LotOfThemes.light14),
        ),
        InkWell(
          onTap: () async {
            File? tempFile = await imgFromGallery();
            if (tempFile == null) {
              widget.callback('');
              return;
            }
            setState(() => file = tempFile);
            Uint8List imageBytes =
                await tempFile!.readAsBytes(); //convert to bytes
            String base64Image = base64.encode(imageBytes);
            debugPrint(base64Image);
            widget.callback(base64Image);
          },
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: ColorConstants.midGrey, width: 1),
            ),
            child: Center(
                child: file != null
                    ? Image.file(
                        File(file?.path ?? ''),
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.9,
                        fit: BoxFit.cover,
                      )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.upload_file_rounded),
                    Text(
                      StringConstants.uploadDocument,
                      style: TextStyle(fontSize: 14.sp),
                    )
                  ],
                )
            ),
          ),
        )
      ],
    );
  }

  imgFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    File? compressedFile = image == null
        ? null
        : await FlutterNativeImage.compressImage(image!.path,
            quality: 70, percentage: 70);
    return compressedFile;
  }

  imgFromGallery() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    File? compressedFile = image == null
        ? null
        : await FlutterNativeImage.compressImage(image!.path,
            quality: 70, percentage: 70);
    return compressedFile;
  }
}
