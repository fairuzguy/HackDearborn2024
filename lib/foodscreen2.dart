import 'package:flutter/material.dart';
import 'package:hackdearborn/dietaryscreen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // For handling File

class Foodscreen extends StatefulWidget {
  final File imageFile;
  final Map<dynamic, dynamic> data;
  const Foodscreen({
    super.key, 
    required this.imageFile,
    this.data = const {},
  });
    

  @override
  State<Foodscreen> createState() => _FoodscreenState();
}

class _FoodscreenState extends State<Foodscreen> {
  // Sample ingredients and instructions for a hamburger
  List<String> ingredients = [];
  List<String> instructions = [];
  List<String> lettuceBurgerIngredients = [
  "4 large lettuce leaves (iceberg or romaine)",
  "1/2 pound ground halal beef",
  "1/4 teaspoon salt",
  "1/4 teaspoon black pepper",
  "1/4 teaspoon garlic powder",
  "1/4 cup sliced onion (optional)",
  "1/4 cup sliced tomato",
  "1/4 cup pickles (optional)",
  "2 tablespoons dairy-free mayonnaise",
  "2 tablespoons mustard (optional)",
  "1/4 avocado, sliced (optional)",
];


  List<String> lettuceBurgerInstructions = [
  "Season the ground halal beef with salt, pepper, and garlic powder.",
  "Form the beef into patties and cook on medium heat for 4-5 minutes on each side until fully cooked.",
  "Prepare the lettuce leaves by rinsing and drying them.",
  "Once the patties are cooked, place each patty on a large lettuce leaf.",
  "Top the patty with onion slices, tomato slices, pickles, avocado, mayonnaise, and mustard.",
  "Wrap the patty with the lettuce leaves to form a 'bun' and serve."
];


  bool showMoreIngredients = false;
  bool showMoreInstructions = false;
  
  void _addItem() {
    setState(() {
      ingredients.add('Item ${ingredients.length + 1}');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //ingredients = widget.data['ingredients'];
    //instructions = widget.data['instructions'];
    ingredients = lettuceBurgerIngredients;
    instructions = lettuceBurgerInstructions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/ScreenBackground.png"), // Your background image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Scrollable Content
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50, left: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: const Color.fromRGBO(255, 129, 116, 1),
                            elevation: 2,
                            padding: const EdgeInsets.all(8),
                            minimumSize: const Size(30, 30),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.home, color: Colors.white, size: 30),
                        ),
                      ),
                    ),
                  ],
                ),

                // Container for the captured image
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                        ),
                      ],
                      border: Border.all(
                        color: const Color.fromRGBO(161, 231, 255, 1),
                        width: 4,
                      ),
                      image: widget.imageFile != null
                          ? DecorationImage(
                              image: FileImage(widget.imageFile!), // Use the captured image
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: widget.imageFile == null
                        ? const Center(
                            child: Text("No image captured",
                                style: TextStyle(fontSize: 18)))
                        : null,
                  ),
                ),

                // Meal Name
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: const Text('Lettuce burger',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500)),
                ),

                // Macros
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 31),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      maxWidth: 320,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Calories
                        Column(
                          children: const [
                            Text('Calories',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                            Text("750 kcal",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),

                        // Fat
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Column(
                            children: const [
                              Text('Fat',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              Text("20g",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),

                        // Protein
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Column(
                            children: const [
                              Text('Protein',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              Text("32g",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Ingredients Section
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: ExpansionTile(
                    title: const Text('Ingredients',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600)),
                    initiallyExpanded: showMoreIngredients,
                    children: ingredients.map((ingredient) {
                      return ListTile(
                        title: Text(ingredient,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18)),
                      );
                    }).toList(),
                  ),
                ),

                // Instructions Section
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: ExpansionTile(
                    
                    title: const Text('Instructions',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600)),
                    initiallyExpanded: showMoreInstructions,
                    children: instructions.map((instruction) {
                      return ListTile(
                        title: Text(instruction,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18)),
                      );
                    }).toList(),
                  ),
                ),

                // Personalize Button
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 129, 116, 1),
                      elevation: 2,
                      minimumSize: const Size(180, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Rounded corners
                      ),
                    ),
                    onPressed: () {
                     Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => DietaryScreen(image: widget.imageFile)),
                   );
                  },
                    child: const Text('Personalize',
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
