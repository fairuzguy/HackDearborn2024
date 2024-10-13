import 'package:flutter/material.dart';
import 'package:hackdearborn/dietaryscreen.dart';
import 'package:hackdearborn/foodscreen.dart';
import 'package:hackdearborn/loading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:io'; // To use File class for the image
import 'scanfood.dart'; // Import the ScanfoodScreen
import 'tech_ramsay.dart';

const String api = "https://dearbornhackathon2024-d91cfd195691.herokuapp.com/";
late TechRamsay techRamsay;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  IO.Socket socket = IO.io(api, IO.OptionBuilder()
    .setTransports(['websocket']) // for Flutter or Dart VM
    .build()
  );
  techRamsay = TechRamsay(socket: socket);
  TechRamsay.masterChef = techRamsay;

  runApp(MaterialApp(
    theme: ThemeData(
        dividerColor: const Color.fromRGBO(159, 230, 255, 1), // Change the divider color globally
      ), 
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ImagePicker _picker = ImagePicker(); // Create an instance of ImagePicker

  // Function to capture a photo using the camera
  Future<void> UploadPhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Navigate to ScanfoodScreen immediately after the photo is taken
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanfoodScreen(imageFile: File(pickedFile.path)),
        ),
      );
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
              padding: const EdgeInsets.only(top: 400),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                    ),
                    backgroundColor: const Color.fromRGBO(255, 129, 116, 1),
                    elevation: 2,
                    minimumSize: const Size(150, 60),
                  ),
                  onPressed: UploadPhoto, // Capture the photo and navigate
                  child: const Row(
                    mainAxisSize: MainAxisSize.min, // Ensure the button fits the content
                    children: [
                      // Camera icon
                      Text(
                        'Capture',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(width: 8), // Space between icon and text
                      Icon(Icons.camera_alt, color: Colors.white, size: 30),
                    ],
                  ),
                ),
              ),
            ),
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
