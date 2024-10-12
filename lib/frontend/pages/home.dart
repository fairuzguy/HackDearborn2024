import 'package:flutter/material.dart';
import 'camera_view.dart';
import '../../widgets/page_builder.dart';
import '../../backend/tech_ramsay.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget background({required Widget child}) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/ScreenBackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child
    );
  }

  void capture() {
    /*
    Navigator.of(context).push(PageBuilder(
      newPageWidget: CameraView(),
      transition: PageRouteTransition.slide,
    ).createPageRouteBuilder(context));*/
    TechRamsay.cook();

  }

  Widget captureButton() {
    return Padding(
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
          onPressed: capture,
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
              SizedBox(width: 8),  // Space between icon and text
              Icon(Icons.camera_alt, color: Colors.white, size: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget techRamsayText() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Image.asset('assets/TechRamsay.png',
      width: 150,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: background(
        child: Column(
          children: [
            captureButton(),
            techRamsayText(),
          ],
        )
      ),
    );
  }
}