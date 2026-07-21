import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  bool water = false;
  bool workout = false;
  bool reading = false;
  bool prayer = false;
  bool journal = false;

  final TextEditingController waterController = TextEditingController();
  final TextEditingController readingController = TextEditingController();
  final TextEditingController workoutController = TextEditingController();
  final TextEditingController reflectionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,

      appBar: AppBar(
        title: const Text("Today's Record"),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Daily Check-In",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                "Record what you've accomplished today.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 25),

              const Text(
                "Daily Habits",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              // Workout
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CheckboxListTile(
                  title: const Text("Workout"),
                  value: workout,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      workout = value!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Reading
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CheckboxListTile(
                  title: const Text("Read 20 Pages"),
                  value: reading,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      reading = value!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Water
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CheckboxListTile(
                  title: const Text("Drink 3 Litres of water"),
                  value: water,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      water = value!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Prayer
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CheckboxListTile(
                  title: const Text("Pray"),
                  value: prayer,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      prayer = value!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Journal
              Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CheckboxListTile(
                  title: const Text("Journal"),
                  value: journal,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      journal = value!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
