import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category_page.dart';

class HeightWeightScreen extends StatefulWidget {
  const HeightWeightScreen({super.key});

  @override
  State<HeightWeightScreen> createState() => _HeightWeightScreenState();
}

class _HeightWeightScreenState extends State<HeightWeightScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  bool _isFormValid = false;
  String _bmiCategory = '';
  String _bmiExplanation = '';

  @override
  void initState() {
    super.initState();
    _heightController.addListener(_validateForm);
    _weightController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      final height = double.tryParse(_heightController.text);
      final weight = double.tryParse(_weightController.text);
      _isFormValid = height != null && height > 0 && weight != null && weight > 0;

      if (_isFormValid) {
        _bmiCategory = _getBMICategory(height!, weight!);
        _bmiExplanation = _getBMIExplanation(_bmiCategory);
      } else {
        _bmiCategory = '';
        _bmiExplanation = '';
      }
    });
  }

  String _getBMICategory(double heightCm, double weightKg) {
    final bmi = weightKg / ((heightCm / 100) * (heightCm / 100));
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  String _getBMIExplanation(String cat) {
    switch (cat) {
      case 'Underweight':
        return 'Kamu kekurangan berat badan.';
      case 'Normal':
        return 'Berat badanmu ideal!';
      case 'Overweight':
        return 'Kamu kelebihan berat badan.';
      case 'Obese':
        return 'Kamu berada dalam kategori obesitas.';
      default:
        return '';
    }
  }

  void _navigateToCategoryPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CategoryPage(
          bmiCategory: _bmiCategory,
          bmiExplanation: _bmiExplanation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sekarang beri tau aku ...',
                          style: GoogleFonts.plusJakartaSans(fontSize: 16),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Berapa tinggi badanmu?',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _inputBox(controller: _heightController),
                        const SizedBox(height: 8),
                        _unitLabel('cm'),
                        const SizedBox(height: 32),
                        Text(
                          'Berapa berat badanmu?',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _inputBox(controller: _weightController),
                        const SizedBox(height: 8),
                        _unitLabel('kg'),
                        const SizedBox(height: 40),
                        Center(
                          child: ElevatedButton(
                            onPressed: _isFormValid ? _navigateToCategoryPage : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _isFormValid ? Colors.black87 : Colors.grey.shade300,
                              minimumSize: const Size(260, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            child: Text(
                              'Next',
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 90,
                color: Colors.grey.shade300,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _inputBox({required TextEditingController controller}) => Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.black, width: 5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                hintText: '',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      );

  Widget _unitLabel(String unit) => Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade400, width: 1),
          ),
          child: Text(
            unit,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
            ),
          ),
        ),
      );
}
