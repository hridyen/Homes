import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Increased size for better visibility
      width: 100,  // Increased size for better visibility
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            spreadRadius: 4,
            blurRadius: 8,
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: _image == null
          ? IconButton(
        icon: const Icon(
          Icons.upload_rounded,
          color: Colors.black45,
          size: 40,
        ),
        onPressed: getImageFromGallery,
      )
          : InkWell(
        onTap: getImageFromGallery,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50), // Match container shape
          child: Image.file(
            _image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
