import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String content;
  final String imagePath;

  const MyContainer(
      {super.key, required this.content, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        color: Colors.grey[230],
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: 220, // Kutunun yüksekliği sabit
            color: Colors.black
                .withOpacity(0.4), // Metin arka plan rengi siyah yarı saydam
            child: Center(
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
