import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_screen.dart';

class FinishPage extends StatefulWidget {
  const FinishPage({super.key});

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  bool isPressed = false;

  void _handleFinish() {
    setState(() {
      isPressed = true;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const SplashScreen()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Congratulations!!',
                style: GoogleFonts.oswald(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              // Box from Figma style
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 25, vertical: 71),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    width: 7,
                  ),
                ),
                child: Text(
                  "One step closer to the best version of myself. I'm proud of what I did today!",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.oswald(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromRGBO(11, 9, 9, 1),
                    height: 1.2,
                  ),
                ),
              ),

              const Spacer(),

              // Button
              Center(
                child: SizedBox(
                  width: 130,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _handleFinish,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isPressed
                          ? Colors.blue
                          : const Color.fromRGBO(217, 217, 217, 1),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      'FINISH!',
                      style: GoogleFonts.oswald(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
