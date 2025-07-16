import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'height_weight_screen.dart'; // Import halaman tinggi dan berat badan

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),

              // Judul
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome Warriors!',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Subjudul
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Apa Jenis Kelaminmu?',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Dua kartu gender secara vertikal
              _GenderOptionCard(
                label: 'Female',
                iconData: Icons.female,
                selected: _selectedGender == 'female',
                onTap: () => _onGenderSelected('female'),
              ),
              const SizedBox(height: 16),
              _GenderOptionCard(
                label: 'Male',
                iconData: Icons.male,
                selected: _selectedGender == 'male',
                onTap: () => _onGenderSelected('male'),
              ),

              const SizedBox(height: 32),

              // Tombol Next
              SizedBox(
                width: 160,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedGender == null
                        ? Colors.grey.shade400
                        : Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed:
                      _selectedGender == null ? null : _goToHeightWeightScreen,
                  child: Text(
                    'Next',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  void _onGenderSelected(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  void _goToHeightWeightScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const HeightWeightScreen(),
      ),
    );
  }
}

class _GenderOptionCard extends StatelessWidget {
  const _GenderOptionCard({
    required this.label,
    required this.iconData,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData iconData;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bgColor = selected ? Colors.grey.shade300 : Colors.grey.shade200;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 328,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Icon(
              iconData,
              size: 36,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
