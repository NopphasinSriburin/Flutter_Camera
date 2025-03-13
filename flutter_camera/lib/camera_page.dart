import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '📷 Take a Photo',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.teal.shade600,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        _image!,
                        height: 350,
                        width: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Icon(
                        Icons.image_outlined,
                        size: 100,
                        color: Colors.teal.shade300,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'No Image Taken',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.teal.shade800,
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 30),
            FadeInDown(
              duration: const Duration(milliseconds: 500),
              child: FloatingActionButton(
                onPressed: _takePhoto,
                backgroundColor: Colors.teal.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child:
                    const Icon(Icons.camera_alt, color: Colors.white, size: 30),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Tap the button to take a picture',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.teal.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
