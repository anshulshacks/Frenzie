import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicker extends StatefulWidget {
  final void Function(File pickedImageParam) forwardImage;

  ProfilePicker(this.forwardImage);
  
  @override  
  _ProfilePickerState createState() => _ProfilePickerState();
}

class _ProfilePickerState extends State<ProfilePicker> {
  File _pickedProfilePicture;
  void imagePicker() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
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
        CircleAvatar(radius: 40, backgroundImage: _pickedProfilePicture != null ? FileImage(_pickedProfilePicture) : NetworkImage('https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png')),
        FlatButton.icon(
          onPressed: imagePicker,
          icon: Icon(Icons.image),
          label: Text('Choose a profile picture'),
        ),
      ],
    );
  }
}
