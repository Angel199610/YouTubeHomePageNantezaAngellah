import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      title: Row(
        children: [
          Image.network(
            'https://cdn-icons-png.flaticon.com/128/174/174883.png', // YouTube logo link
            width: 50,
          ),
          const SizedBox(width: 10), // Space between image and text
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.white, // Default text color
                fontSize: 20,        // Main text size
                fontWeight: FontWeight.bold,
              ),
              children: [
                const TextSpan(text: 'YouTube'), // Main text
                WidgetSpan(
                  child: Transform.translate(
                    offset: const Offset(2, -6), // Moves the superscript up and right
                    child: const Text(
                      'UG', // Superscript text
                      style: TextStyle(
                        fontSize: 12, // Smaller font for superscript
                        fontWeight: FontWeight.normal, // Normal weight for superscript
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
