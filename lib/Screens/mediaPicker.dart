import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unitetofight/globalConstants.dart' as global;

class MediaPicker extends StatefulWidget {
  MediaPicker({Key? key}) : super(key: key);

  @override
  State<MediaPicker> createState() => _MediaPicker();
}

class _MediaPicker extends State<MediaPicker> {
  FilePickerResult? result;
  String _fileName = '';
  String? _fileSize = '';
  String? _filePath = '';
  PlatformFile? pickedFile;
  //flags
  bool isLoading = false;
  bool isBelow10Mb = false;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png']);
      if (result != null) {
        _fileName = result!.files.first.name;
        _filePath = result!.files.first.path;
        pickedFile = result!.files.first;
        int byteSize = result!.files.first.size;
        if (isBelow10MB(byteSize) == false) {
          result = null;
        }

        ///console test : print('File name $_fileName');///
      }
      setState(() {
        if (result != null) {
          global.isImagePicked = true;
        } else {
          isLoading = false;
        }
      });
    } catch (e) {
      print(e);
    }
  }

  bool isBelow10MB(int sizeInBytes) {
    double sizeInMb = sizeInBytes / (1024 * 1024);
    if (sizeInMb < 10) {
      _fileSize = global.formatBytes(sizeInBytes, 0);
      return isBelow10Mb = true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        global.fileSizePromptSnackBar,
      );
      isLoading = false;
      return isBelow10Mb = false;
    }
  }

  void fileRemoved() {
    FilePicker.platform.clearTemporaryFiles();
    setState(() {
      global.isImagePicked = false;
      isBelow10Mb = false;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pickFile();
      },
      child: global.isImagePicked && isBelow10Mb
          ? Container(
        height: 100,
        width: 340,
        decoration: BoxDecoration(
          color: Color(0xffA9DCE6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(15),
          title: Text('File Added ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          subtitle: Text(
            _fileName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.red,
            ),
            onPressed: () {
              fileRemoved();
            },
          ),
        ),
      )
          : DottedBorder(
              radius: const Radius.circular(18),
              borderType: BorderType.RRect,
              color: Colors.grey.shade400,
              strokeCap: StrokeCap.round,
              strokeWidth: 1.5,
              dashPattern: const [12, 10],
              child: Container(
                height: 130,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: isLoading
                    ? Center(
                        child: SpinKitCircle(
                          size: 55,
                          color: Color(0xff246BFD),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.file_upload_rounded,
                            size: 30,
                          ),
                          Text(
                            'Browse File',
                            style: TextStyle(color: Colors.grey.shade500),
                          )
                        ],
                      ),
              ),
            ),
    );
  }
}

