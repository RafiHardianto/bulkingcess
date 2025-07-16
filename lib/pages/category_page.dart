import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'program_page.dart';

class CategoryPage extends StatelessWidget {
  final String bmiCategory;
  final String bmiExplanation;

  const CategoryPage({
    super.key,
    required this.bmiCategory,
    required this.bmiExplanation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false, // Menghilangkan tombol kembali
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Konten BMI
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Kategori BMI Kamu',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      bmiCategory,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      bmiExplanation,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                // Tombol Next dengan ukuran dan efek hover
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                      if (states.contains(MaterialState.hovered)) {
                        return Colors.lightBlueAccent; // Hover effect
                      } else if (states.contains(MaterialState.pressed)) {
                        return Colors.blue[800]!; // Pressed effect
                      }
                      return Colors.blue; // Default
                    }),
                    fixedSize: MaterialStateProperty.all<Size>(const Size(267, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProgramPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Next',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
