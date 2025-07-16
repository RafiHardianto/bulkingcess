import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detail_program_page.dart';
import 'finish_page.dart'; // Halaman ucapan selamat

class ProgramPage extends StatefulWidget {
  const ProgramPage({super.key});

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  final List<String> days = [
    for (int i = 1; i <= 10; i++) 'DAY $i',
    'FINISH',
  ];

  final Set<String> completedDays = {}; // Simulasi penyimpanan progress

  void _onDayTap(String day) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailProgramPage(day: day)),
    );

    if (result == true) {
      setState(() {
        completedDays.add(day);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isAllDaysCompleted = days
        .where((d) => d != 'FINISH')
        .every((day) => completedDays.contains(day));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Konsisten adalah Kunci!',
                style: GoogleFonts.oswald(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Tombol debug: Selesaikan semua DAY 1-10
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    for (int i = 1; i <= 10; i++) {
                      completedDays.add('DAY $i');
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Selesaikan Semua',
                  style: GoogleFonts.oswald(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListView.builder(
                    itemCount: days.length,
                    itemBuilder: (context, index) {
                      final label = days[index];
                      final isFinish = label == 'FINISH';
                      final isCompleted = completedDays.contains(label);

                      bool isClickable = false;
                      Color boxColor = Colors.white;

                      if (isFinish) {
                        isClickable = isAllDaysCompleted;
                        boxColor = isClickable
                            ? Colors.lightBlue.shade100.withOpacity(0.5)
                            : Colors.grey.shade400;
                      } else if (isCompleted) {
                        isClickable = false;
                        boxColor = Colors.lightBlue.shade100.withOpacity(0.5);
                      } else {
                        isClickable = true;
                        boxColor = Colors.white;
                      }

                      return GestureDetector(
                        onTap: isClickable
                            ? () {
                                if (isFinish) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const FinishPage(),
                                    ),
                                  );
                                } else {
                                  _onDayTap(label);
                                }
                              }
                            : null,
                        child: Opacity(
                          opacity: isClickable ? 1.0 : 0.6,
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: boxColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              label,
                              style: GoogleFonts.oswald(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
