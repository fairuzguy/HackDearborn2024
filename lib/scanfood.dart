import 'package:flutter/material.dart';
import 'package:hackdearborn/foodscreen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // To handle the file
import 'loading.dart';

class ScanfoodScreen extends StatefulWidget {
  final File imageFile; // Accept the image file as a parameter

  const ScanfoodScreen({super.key, required this.imageFile}); // Constructor

  @override
  State<ScanfoodScreen> createState() => _ScanfoodScreenState();
}

class _ScanfoodScreenState extends State<ScanfoodScreen> {
  File? _image; // Store the current image file
  final ImagePicker _picker = ImagePicker(); // Create an instance of ImagePicker

  @override
  void initState() {
    super.initState();
    _image = widget.imageFile; // Set the initial image to the one passed from Homepage
  }

  // Function to retake the photo using the camera
  Future<void> retakePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the image with the new photo
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/ScreenBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Container(
                width: 300, // Set desired width
                height: 300, // Set desired height
                decoration: BoxDecoration(
                  color: Colors.white, // White background for the box
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 7,
                    ),
                  ],
                  // Display the captured image (updated when retaking photo)
                  image: DecorationImage(
                    image: FileImage(_image!), // Use the updated image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Scan Food Button
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                    ),
                    backgroundColor: const Color.fromRGBO(255, 192, 77, 1),
                    elevation: 2,
                    minimumSize: const Size(180, 50),
                  ),
                  onPressed: () {
                     Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => LoadingScreen(
                      chefMode: 'cook',
                      image: _image!,
                    )), //Foodscreen(imageFile: widget.imageFile)),
                  );

                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min, // Ensure the button fits the content
                    children: [
                      Text(
                        'Scan Food',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Retake Photo Button
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                    ),
                    backgroundColor: const Color.fromRGBO(255, 129, 116, 1),
                    elevation: 2,
                    minimumSize: const Size(120, 40),
                  ),
                  onPressed: retakePhoto, // Call the retake photo function
                  child: const Row(
                    mainAxisSize: MainAxisSize.min, // Ensure the button fits the content
                    children: [
                      Text(
                        'Retake',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 8), // Space between icon and text
                      Icon(Icons.camera_alt, color: Colors.white, size: 25),
                    ],
                  ),
                ),
              ),
            ),

            // TechRamsay logo
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Image.asset(
                'assets/TechRamsay.png',
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
