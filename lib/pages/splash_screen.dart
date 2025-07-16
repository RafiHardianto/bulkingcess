import 'package:flutter/material.dart';
import 'gender_selection_screen.dart'; // Import GenderSelectionScreen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Setelah 4 detik, navigasi ke GenderSelectionScreen
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GenderSelectionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gambar utama
          Image.asset(
            'assets/image/splashscreen.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          // Bagian bawah: ikon + teks
          Positioned(
            bottom: 70,
            left: 90,
            right: 25,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar otot / ikon
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.redAccent,
                    image: const DecorationImage(
                      image: AssetImage('assets/image/halaman_awal.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Teks motivasi
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Progress, not perfection',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Plus Jakarta Sans',
                        ),
                      ),
                      SizedBox(height: 4),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'your effort matters ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Plus Jakarta Sans',
                              ),
                            ),
                            TextSpan(
                              text: 'more than the outcome.',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontFamily: 'Plus Jakarta Sans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
