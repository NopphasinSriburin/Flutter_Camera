import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
        title: const Text('📷 Take a Photo'),
        backgroundColor: Colors.teal.shade600,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(_image!, height: 300, fit: BoxFit.cover))
                : const Text('No Image Taken', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: _takePhoto,
              backgroundColor: Colors.teal.shade700,
              child: const Icon(Icons.camera_alt, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<File> _galleryImages = [];

  Future<void> _loadImagesFromGallery() async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null) {
      setState(() {
        _galleryImages = images.map((image) => File(image.path)).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadImagesFromGallery();
  }

  void _viewFullScreenImage(File image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImagePage(image: image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🖼 Gallery'),
        backgroundColor: Colors.teal.shade600,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: _galleryImages.isNotEmpty
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _galleryImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _viewFullScreenImage(_galleryImages[index]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                          Image.file(_galleryImages[index], fit: BoxFit.cover),
                    ),
                  );
                },
              )
            : const Center(
                child: Text('No images found', style: TextStyle(fontSize: 18))),
      ),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final File image;
  const FullScreenImagePage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Full Screen', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.file(image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
