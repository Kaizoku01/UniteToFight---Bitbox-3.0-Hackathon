library myprj.global;

import 'dart:math';

import 'package:flutter/material.dart';
double deviceHeight = 0.0;
double deviceWidth = 0.0;
bool isImagePicked = false;


SnackBar fileSizePromptSnackBar = const SnackBar(
  content: Text(
    'File size greater than 10Mb',
    style: TextStyle(fontSize: 15),
  ),
  backgroundColor: Colors.redAccent,
);

String formatBytes(int bytes, int decimals) {
  if (bytes <= 0) return "0 B";
  const suffixes = ["B", "KB", "MB"];
  var i = (log(bytes) / log(1024)).floor();
  return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
      ' ' +
      suffixes[i];
}

SnackBar incompleteFormPromptSnackBar =  const SnackBar(
  content: Text(
    'Incomplete Form',
    style: TextStyle(fontSize: 15),
  ),
  backgroundColor: Colors.redAccent,
);

SnackBar invalidResumePromptSnackBar =  const SnackBar(
  content: Text(
    'Incomplete Form',
    style: TextStyle(fontSize: 15),
  ),
  backgroundColor: Colors.redAccent,
);