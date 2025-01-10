import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImagePer extends StatefulWidget {
  const ImagePer({super.key});

  @override
  State<ImagePer> createState() => _ImagePerState();
}

class _ImagePerState extends State<ImagePer> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  // Pick an image from the gallery
  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _saveImageLocally(File(image.path));
    }
  }

  // Capture an image using the camera
  Future<void> _captureImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _saveImageLocally(File(image.path));
    }
  }

  // Save the image locally and store the file path in SharedPreferences
  Future<void> _saveImageLocally(File image) async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = '${directory.path}/user_image.png';

    // Save the image to the app's directory
    await image.copy(imagePath);

    // Store the file path in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_image_path', imagePath);

    setState(() {
      _selectedImage = File(imagePath); // Update the state to display the image
    });
  }

  // Load the image from the stored file path
  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('user_image_path');

    if (imagePath != null && File(imagePath).existsSync()) {
      setState(() {
        _selectedImage = File(imagePath);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadImage(); // Load the image when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: _selectedImage != null
          ? FileImage(_selectedImage!) // Display the locally saved image
          : null,
      child: _selectedImage == null
          ? GestureDetector(
        onTap: () async {
          await showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo, color: Colors.blue),
                    title: const Text('Pick from Gallery'),
                    onTap: () async {
                      Navigator.pop(context);
                      await _pickImageFromGallery();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt, color: Colors.green),
                    title: const Text('Capture with Camera'),
                    onTap: () async {
                      Navigator.pop(context);
                      await _captureImageFromCamera();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add_a_photo, size: 40, color: Colors.white),
      )
          : null,
    );
  }
}
