import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'program_page.dart'; // Import halaman sebelumnya

class DetailProgramPage extends StatelessWidget {
  final String day;

  const DetailProgramPage({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Judul atas
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    "Don't Give Up!",
                    style: GoogleFonts.oswald(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Section WORKOUT
              _buildSectionLabel("Workout"),
              const SizedBox(height: 10),
              _buildRoundedContainer("Program olahraga akan ditampilkan di sini"),

              const SizedBox(height: 32),

              // Section FOOD
              _buildSectionLabel("Food"),
              const SizedBox(height: 10),
              _buildRoundedContainer("Rekomendasi makanan akan ditampilkan di sini"),

              const Spacer(),

              // Tombol Kembali & Selesai
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    context,
                    label: 'Kembali',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const ProgramPage()),
                      );
                    },
                  ),
                  _buildActionButton(
                    context,
                    label: 'Selesai',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const ProgramPage()),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title.toUpperCase(),
          style: GoogleFonts.oswald(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedContainer(String placeholderText) {
    return Container(
      width: double.infinity,
      height: 184,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          placeholderText,
          textAlign: TextAlign.center,
          style: GoogleFonts.oswald(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context,
      {required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.oswald(
              fontSize: 10,
              letterSpacing: 1.25,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              height: 2,
            ),
          ),
        ),
      ),
    );
  }
}
