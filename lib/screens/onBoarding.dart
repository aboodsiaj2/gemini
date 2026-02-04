import 'package:flutter/material.dart';
import 'package:gemini/screens/Chat%20Screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Your AI Assistant",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff3369FF),
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Using this software, you can ask questions and receive articles using artificial intelligence assistant",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Color(0xff757575)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Container(
            height: 324,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/onbording.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff3369FF),
              fixedSize: const Size(333, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ChatScreen()),
              );
            },
            label: const Text(
              "Continue",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
