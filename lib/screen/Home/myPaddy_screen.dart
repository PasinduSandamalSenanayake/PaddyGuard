import 'package:flutter/material.dart';

class MypaddyScreen extends StatefulWidget {
  const MypaddyScreen({super.key});

  @override
  State<MypaddyScreen> createState() => _MypaddyScreenState();
}

class _MypaddyScreenState extends State<MypaddyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Row
            _buildMenuItem(
              icon: Icons.person,
              text: "Profile",
              bgColor: Colors.grey.shade400,
              onTap: () {},
            ),

            const SizedBox(height: 12),

            // Paddy History Row
            _buildMenuItem(
              icon: Icons.eco,
              text: "Paddy History",
              bgColor: Colors.greenAccent.shade100,
              onTap: () {},
            ),

            const SizedBox(height: 12),

            // Language Row
            _buildMenuItem(
              icon: Icons.language,
              text: "Language",
              bgColor: Colors.grey.shade400,
              onTap: () {},
            ),

            const Spacer(),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  // handle logout
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red.shade700),
                      const SizedBox(width: 10),
                      Text(
                        "Log out",
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.red.shade700, size: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    IconData? icon,
    ImageProvider? image,
    required String text,
    required Color bgColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            if (icon != null)
              Icon(icon, color: Colors.black, size: 22)
            else if (image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: image,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
