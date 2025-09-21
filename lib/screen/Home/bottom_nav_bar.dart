import 'package:flutter/material.dart';
import 'package:paddyguard/screen/Home/disease_screen.dart';
import 'package:paddyguard/screen/Home/expert_screen.dart';
import 'package:paddyguard/screen/Home/home_screen.dart';
import 'package:paddyguard/screen/Home/myPaddy_screen.dart';
import 'package:paddyguard/screen/Home/camera_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // add your real screens here
  final List<Widget> _screens = [
    HomeScreen(), // index 0
    DiseaseScreen(), // index 1
    ExpertScreen(), // index 2
    MypaddyScreen(), // index 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // display screen based on index
      body: _screens[_selectedIndex],

      floatingActionButton: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        padding: const EdgeInsets.all(6),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CameraScreen()),
            );
          },
          child: const Icon(Icons.camera_alt, size: 28, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.green.shade50,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home,
                        color:
                            _selectedIndex == 0 ? Colors.green : Colors.grey),
                    Text("Home",
                        style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.green
                                : Colors.grey,
                            fontSize: 12)),
                  ],
                ),
              ),
              // Disease
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.health_and_safety,
                        color:
                            _selectedIndex == 1 ? Colors.green : Colors.grey),
                    Text("Disease",
                        style: TextStyle(
                            color: _selectedIndex == 1
                                ? Colors.green
                                : Colors.grey,
                            fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(width: 40), // space for FAB
              // Expert
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.support_agent,
                        color:
                            _selectedIndex == 2 ? Colors.green : Colors.grey),
                    Text("Expert",
                        style: TextStyle(
                            color: _selectedIndex == 2
                                ? Colors.green
                                : Colors.grey,
                            fontSize: 12)),
                  ],
                ),
              ),
              // My Paddy
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.eco,
                        color:
                            _selectedIndex == 3 ? Colors.green : Colors.grey),
                    Text("My Paddy",
                        style: TextStyle(
                            color: _selectedIndex == 3
                                ? Colors.green
                                : Colors.grey,
                            fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
