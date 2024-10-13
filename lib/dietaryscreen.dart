import 'package:flutter/material.dart';
import 'loading.dart';
import 'dart:io';

class DietaryScreen extends StatefulWidget {
  final File image;
  const DietaryScreen({
    super.key,
    required this.image,
  });

  @override
  _DietaryScreenState createState() => _DietaryScreenState();
}

class _DietaryScreenState extends State<DietaryScreen> {
  bool isGlutenFree = false; // Track if the button is selected
  bool isNutFree = false;
  bool isLactoseFree = false;
  bool isPaleo = false;
  bool isKeto = false;
  bool isHalal = false;
  bool isVegetarian = false;
  bool isVegan = false;
  bool isLowFodMap = false;

  final TextEditingController _controller = TextEditingController();

  final TextEditingController _controller1 = TextEditingController();

  Map<String, dynamic> createData() {
    return {
      'flags': {
        'isGlutenFree': isGlutenFree,
        'isNutFree': isNutFree,
        'isLactoseFree': isLactoseFree,
        'isPaleo': isPaleo,
        'isKeto': isKeto,
        'isHalal': isHalal,
        'isVegetarian': isVegetarian,
        'isVegan': isVegan,
        'isLowFodMap': isLowFodMap,
      },
      'allergies': _controller.text,
      'others': _controller1.text,
    };
  }


  void _printEnteredAllergies() {
   String enteredText = _controller.text;
   print('User entered: $enteredText'); // Print the entered text
 }

  void _printEnteredOthers() {
   String enteredText = _controller1.text;
   print('User entered: $enteredText'); // Print the entered text
 }
  
  void _printBools(){

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
             const Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Text(
                'Dietary Restrictions',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white)
              )
            ),
            //ROW 1
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 55), // Move row padding outside
                child: Row(
                  children: [
                    Column(
                      children: [
                        Stack(        
                          children: [
                            // Transparent button that changes background color when pressed
                            OutlinedButton(
                              onPressed: () {
                                // No need to trigger the state here
                              },
                              style: ButtonStyle(
                                // Change background color based on whether it's selected
                                backgroundColor: MaterialStateProperty.all(
                                  isGlutenFree ? Colors.green : Colors.transparent,
                                ),
                                side: MaterialStateProperty.all(BorderSide.none), // No border
                                padding: MaterialStateProperty.all(EdgeInsets.zero), // No padding
                              ),
                              child: const SizedBox(
                                width: 50,
                                height: 60,
                                child: null, // No child, purely for visual effect
                              ),
                            ),

                            // Image placed on top, always visible
                            Image.asset(
                              'assets/GlutenIcon.png', // Replace with your image path
                              width: 65,
                              height: 65,
                            ),

                            // Invisible button on top of everything, which triggers the background change
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isGlutenFree = !isGlutenFree; // Toggle the state on press
                                    });
                                  },
                                  splashColor: Colors.transparent, // Invisible splash
                                  highlightColor: Colors.transparent, // Invisible highlight
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        // Text under the button
                        const SizedBox(height: 8), // Space between button and text
                        const Text(
                          "Gluten Free", // Your label text here
                          style: TextStyle(
                            color: Colors.white, // Text color (can be customized)
                            fontSize: 16, // Font size
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Stack(        
                            children: [
                              // Transparent button that changes background color when pressed
                              OutlinedButton(
                                onPressed: () {
                                  // No need to trigger the state here
                                },
                                style: ButtonStyle(
                                  // Change background color based on whether it's selected
                                  backgroundColor: MaterialStateProperty.all(
                                    isNutFree ? Colors.green : Colors.transparent,
                                  ),
                                  side: MaterialStateProperty.all(BorderSide.none), // No border
                                  padding: MaterialStateProperty.all(EdgeInsets.zero), // No padding
                                ),
                                child: const SizedBox(
                                  width: 50,
                                  height: 60,
                                  child: null, // No child, purely for visual effect
                                ),
                              ),
                      
                              // Image placed on top, always visible
                              Image.asset(
                                'assets/NutIcon.png', // Replace with your image path
                                width: 65,
                                height: 65,
                              ),
                      
                              // Invisible button on top of everything, which triggers the background change
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isNutFree = !isNutFree; // Toggle the state on press
                                      });
                                    },
                                    splashColor: Colors.transparent, // Invisible splash
                                    highlightColor: Colors.transparent, // Invisible highlight
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          // Text under the button
                          const SizedBox(height: 8), // Space between button and text
                          const Text(
                            "Nut Free", // Your label text here
                            style: TextStyle(
                              color: Colors.white, // Text color (can be customized)
                              fontSize: 16, // Font size
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Stack(        
                            children: [
                              // Transparent button that changes background color when pressed
                              OutlinedButton(
                                onPressed: () {
                                  // No need to trigger the state here
                                },
                                style: ButtonStyle(
                                  // Change background color based on whether it's selected
                                  backgroundColor: MaterialStateProperty.all(
                                    isLactoseFree ? Colors.green : Colors.transparent,
                                  ),
                                  side: MaterialStateProperty.all(BorderSide.none), // No border
                                  padding: MaterialStateProperty.all(EdgeInsets.zero), // No padding
                                ),
                                child: const SizedBox(
                                  width: 50,
                                  height: 60,
                                  child: null, // No child, purely for visual effect
                                ),
                              ),
                      
                              // Image placed on top, always visible
                              Image.asset(
                                'assets/LactoseFreeIcon.png', // Replace with your image path
                                width: 65,
                                height: 65,
                              ),
                      
                              // Invisible button on top of everything, which triggers the background change
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isLactoseFree = !isLactoseFree; // Toggle the state on press
                                      });
                                    },
                                    splashColor: Colors.transparent, // Invisible splash
                                    highlightColor: Colors.transparent, // Invisible highlight
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          // Text under the button
                          const SizedBox(height: 8), // Space between button and text
                          const Text(
                            "Lactose Free", // Your label text here
                            style: TextStyle(
                              color: Colors.white, // Text color (can be customized)
                              fontSize: 16, // Font size
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            //ROW 2
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 65), // Move row padding outside
                child: Row(
                  children: [
                    Column(
                      children: [
                        Stack(        
                          children: [
                            // Transparent button that changes background color when pressed
                            OutlinedButton(
                              onPressed: () {
                                // No need to trigger the state here
                              },
                              style: ButtonStyle(
                                // Change background color based on whether it's selected
                                backgroundColor: MaterialStateProperty.all(
                                  isPaleo ? Colors.green : Colors.transparent,
                                ),
                                side: MaterialStateProperty.all(BorderSide.none), // No border
                                padding: MaterialStateProperty.all(EdgeInsets.zero), // No padding
                              ),
                              child: const SizedBox(
                                width: 50,
                                height: 60,
                                child: null, // No child, purely for visual effect
                              ),
                            ),

                            // Image placed on top, always visible
                            Image.asset(
                              'assets/PaleoIcon.png', // Replace with your image path
                              width: 65,
                              height: 65,
                            ),

                            // Invisible button on top of everything, which triggers the background change
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPaleo = !isPaleo; // Toggle the state on press
                                    });
                                  },
                                  splashColor: Colors.transparent, // Invisible splash
                                  highlightColor: Colors.transparent, // Invisible highlight
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        // Text under the button
                        const SizedBox(height: 8), // Space between button and text
                        const Text(
                          "Paleo", // Your label text here
                          style: TextStyle(
                            color: Colors.white, // Text color (can be customized)
                            fontSize: 16, // Font size
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Column(
                        children: [
                          Stack(        
                            children: [
                              // Transparent button that changes background color when pressed
                              OutlinedButton(
                                onPressed: () {
                                  // No need to trigger the state here
                                },
                                style: ButtonStyle(
                                  // Change background color based on whether it's selected
                                  backgroundColor: MaterialStateProperty.all(
                                    isKeto ? Colors.green : Colors.transparent,
                                  ),
                                  side: MaterialStateProperty.all(BorderSide.none), // No border
                                  padding: MaterialStateProperty.all(EdgeInsets.zero), // No padding
                                ),
                                child: const SizedBox(
                                  width: 50,
                                  height: 60,
                                  child: null, // No child, purely for visual effect
                                ),
                              ),
                      
                              // Image placed on top, always visible
                              Image.asset(
                                'assets/KetoIcon.png', // Replace with your image path
                                width: 65,
                                height: 65,
                              ),
                      
                              // Invisible button on top of everything, which triggers the background change
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isKeto = !isKeto; // Toggle the state on press
                                      });
                                    },
                                    splashColor: Colors.transparent, // Invisible splash
                                    highlightColor: Colors.transparent, // Invisible highlight
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          // Text under the button
                          const SizedBox(height: 8), // Space between button and text
                          const Text(
                            "Keto", // Your label text here
                            style: TextStyle(
                              color: Colors.white, // Text color (can be customized)
                              fontSize: 16, // Font size
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        children: [
                          Stack(        
                            children: [
                              // Transparent button that changes background color when pressed
                              OutlinedButton(
                                onPressed: () {
                                  // No need to trigger the state here
                                },
                                style: ButtonStyle(
                                  // Change background color based on whether it's selected
                                  backgroundColor: MaterialStateProperty.all(
                                    isHalal ? Colors.green : Colors.transparent,
                                  ),
                                  side: MaterialStateProperty.all(BorderSide.none), // No border
                                  padding: MaterialStateProperty.all(EdgeInsets.zero), // No padding
                                ),
                                child: const SizedBox(
                                  width: 50,
                                  height: 60,
                                  child: null, // No child, purely for visual effect
                                ),
                              ),
                      
                              // Image placed on top, always visible
                              Image.asset(
                                'assets/HalalIcon.png', // Replace with your image path
                                width: 65,
                                height: 65,
                              ),
                      
                              // Invisible button on top of everything, which triggers the background change
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isHalal = !isHalal; // Toggle the state on press
                                      });
                                    },
                                    splashColor: Colors.transparent, // Invisible splash
                                    highlightColor: Colors.transparent, // Invisible highlight
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          // Text under the button
                          const SizedBox(height: 8), // Space between button and text
                          const Text(
                            "Halal", // Your label text here
                            style: TextStyle(
                              color: Colors.white, // Text color (can be customized)
                              fontSize: 16, // Font size
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            //ROW 3
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 55), // Move row padding outside
                child: Row(
                  children: [
                    Column(
                      children: [
                        Stack(        
                          children: [
                            // Transparent button that changes background color when pressed
                            OutlinedButton(
                              onPressed: () {
                                // No need to trigger the state here
                              },
                              style: ButtonStyle(
                                // Change background color based on whether it's selected
                                backgroundColor: MaterialStateProperty.all(
                                  isVegetarian ? Colors.green : Colors.transparent,
                                ),
                                side: MaterialStateProperty.all(BorderSide.none), // No border
                                padding: MaterialStateProperty.all(EdgeInsets.zero), // No padding
                              ),
                              child: const SizedBox(
                                width: 50,
                                height: 60,
                                child: null, // No child, purely for visual effect
                              ),
                            ),

                            // Image placed on top, always visible
                            Image.asset(
                              'assets/VegetarianIcon.png', // Replace with your image path
                              width: 65,
                              height: 65,
                            ),

                            // Invisible button on top of everything, which triggers the background change
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isVegetarian = !isVegetarian; // Toggle the state on press
                                    });
                                  },
                                  splashColor: Colors.transparent, // Invisible splash
                                  highlightColor: Colors.transparent, // Invisible highlight
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        // Text under the button
                        const SizedBox(height: 8), // Space between button and text
                        const Text(
                          "Vegetarian", // Your label text here
                          style: TextStyle(
                            color: Colors.white, // Text color (can be customized)
                            fontSize: 16, // Font size
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        children: [
                          Stack(        
                            children: [
                              // Transparent button that changes background color when pressed
                              OutlinedButton(
                                onPressed: () {
                                  // No need to trigger the state here
                                },
                                style: ButtonStyle(
                                  // Change background color based on whether it's selected
                                  backgroundColor: MaterialStateProperty.all(
                                    isVegan ? Colors.green : Colors.transparent,
                                  ),
                                  side: MaterialStateProperty.all(BorderSide.none), // No border
                                  padding: MaterialStateProperty.all(EdgeInsets.zero), // No padding
                                ),
                                child: const SizedBox(
                                  width: 50,
                                  height: 60,
                                  child: null, // No child, purely for visual effect
                                ),
                              ),
                      
                              // Image placed on top, always visible
                              Image.asset(
                                'assets/VeganIcon.png', // Replace with your image path
                                width: 65,
                                height: 65,
                              ),
                      
                              // Invisible button on top of everything, which triggers the background change
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isVegan = !isVegan; // Toggle the state on press
                                      });
                                    },
                                    splashColor: Colors.transparent, // Invisible splash
                                    highlightColor: Colors.transparent, // Invisible highlight
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          // Text under the button
                          const SizedBox(height: 8), // Space between button and text
                          const Text(
                            "Vegan", // Your label text here
                            style: TextStyle(
                              color: Colors.white, // Text color (can be customized)
                              fontSize: 16, // Font size
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          Stack(        
                            children: [
                              // Transparent button that changes background color when pressed
                              OutlinedButton(
                                onPressed: () {
                                  // No need to trigger the state here
                                },
                                style: ButtonStyle(
                                  // Change background color based on whether it's selected
                                  backgroundColor: MaterialStateProperty.all(
                                    isLowFodMap ? Colors.green : Colors.transparent,
                                  ),
                                  side: MaterialStateProperty.all(BorderSide.none), // No border
                                  padding: MaterialStateProperty.all(EdgeInsets.zero), // No padding
                                ),
                                child: const SizedBox(
                                  width: 50,
                                  height: 60,
                                  child: null, // No child, purely for visual effect
                                ),
                              ),
                      
                              // Image placed on top, always visible
                              Image.asset(
                                'assets/LowFodmapIcon.png', // Replace with your image path
                                width: 65,
                                height: 65,
                              ),
                      
                              // Invisible button on top of everything, which triggers the background change
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isLowFodMap = !isLowFodMap; // Toggle the state on press
                                      });
                                    },
                                    splashColor: Colors.transparent, // Invisible splash
                                    highlightColor: Colors.transparent, // Invisible highlight
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          // Text under the button
                          const SizedBox(height: 8), // Space between button and text
                          const Text(
                            "Low Fodmap", // Your label text here
                            style: TextStyle(
                              color: Colors.white, // Text color (can be customized)
                              fontSize: 16, // Font size
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

              const Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Allergies',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white)
              )
            ),

            Padding( 
             padding: const EdgeInsets.only(top: 20),
             child: SizedBox(
                 width: 330,
                 child: Stack(
                   children: [
                   TextFormField(
                     controller: _controller,
                     decoration: InputDecoration(
                       filled: true,
                       fillColor: const Color.fromRGBO(243, 242, 231, 1),
                       hintText: 'List Allergies Here (ex. Apples, Pears, Oranges)',
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide.none,
                       ),
                       contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                     ),
                   ),
                  ],
                ),
              ),
            ),

              const Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Others',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white)
              )
            ),

            Padding( 
             padding: const EdgeInsets.only(top: 10),
             child: SizedBox(
                 width: 330,
                 child: Stack(
                   children: [
                   TextFormField(
                     controller: _controller1,
                     decoration: InputDecoration(
                       filled: true,
                       fillColor: const Color.fromRGBO(243, 242, 231, 1),
                       hintText: 'List Other Preferences (ex. Low Cal, Low Fat)',
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide.none,
                       ),
                       contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                     ),
                   ),
                  ],
                ),
              ),
            ),

            Padding( // See All Cuisines Button
             padding: const EdgeInsets.only(top: 20, bottom: 40),
             child: Center(
               child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                    ),
                 backgroundColor: const Color.fromRGBO(255, 129, 116, 1),
                 minimumSize: const Size(300, 50),
               ),
               onPressed: () {
                     Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => DietaryScreen(image: widget.image)),
                   );
                  },
               child: const Text('Generate Recipe',
                 style: TextStyle(
                   color: Color.fromARGB(255, 255, 255, 255),
                   fontSize: 30,
                 ),
               ),
               ),
             ),
           ),

    ]
    ),
  )
    );
  }
}