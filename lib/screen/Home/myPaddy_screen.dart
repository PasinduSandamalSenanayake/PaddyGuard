import 'package:flutter/material.dart';

class MypaddyScreen extends StatefulWidget {
  const MypaddyScreen({super.key});

  @override
  State<MypaddyScreen> createState() => _MypaddyScreenState();
}

class _MypaddyScreenState extends State<MypaddyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "My Paddy Screen",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
