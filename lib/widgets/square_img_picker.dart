import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SquareImgPicker extends StatefulWidget {
  final void Function(File pickedImageParam) forwardImage;

  SquareImgPicker(this.forwardImage);

  @override
  _SquareImgPickerState createState() => _SquareImgPickerState();
}

class _SquareImgPickerState extends State<SquareImgPicker> {
  File _pickedProfilePicture;
  void imagePicker() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery, imageQuality: 50, maxWidth: 150);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickedProfilePicture = pickedImageFile;
    });
    widget.forwardImage(pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 100,
            height: 100,
            child: _pickedProfilePicture != null
                ? Image.file(_pickedProfilePicture)
                : Image.network(
                    'https://www.centerforempathy.org/wp-content/uploads/2019/11/placeholder.png')),
        FlatButton.icon(
          onPressed: imagePicker,
          icon: Icon(Icons.image),
          label: Text('Choose a profile picture'),
        ),
      ],
    );
  }
}
