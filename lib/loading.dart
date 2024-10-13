import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'foodscreen.dart';
import 'dart:io'; // To handle the file

class LoadingScreen extends StatefulWidget {
  final String chefMode;
  final File image;
  final Map<String, dynamic> preferences;
  const LoadingScreen({
    super.key,
    required this.chefMode,
    required this.image,
    this.preferences = const {},
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    if (widget.chefMode == 'cook') {
      Future.delayed(Duration(seconds: 7), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Foodscreen(imageFile: widget.image, data: {})),
        );
      });
    } else if (widget.chefMode == 'personalize') {
      Future.delayed(Duration(seconds: 7), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Foodscreen(imageFile: widget.image, data: {})),
        );
      });
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
        child: const Column(
         children: [
            Padding(
              padding: EdgeInsets.only(top: 300),
              child: Center(
                child: SizedBox(
                  width: 200,  // Desired width
                  height: 200, // Desired height
                  child: RiveAnimation.asset(
                    'assets/pan_flip.riv',
                    fit: BoxFit.contain, // Ensures it scales down within this box
                  ),
                ),
              ),
            ),
            Text('Cooking...', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500))
         ]
        )
      ),
    );
  }
}
