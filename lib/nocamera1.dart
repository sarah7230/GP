import 'package:flutter/material.dart';
import 'camera1.dart'; // تأكد أنك مسميها بنفس الاسم

class NoCamera1Page extends StatelessWidget {
  const NoCamera1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCF1D3),
      body: Stack(
        children: [
          // ✅ الخلفية
          Positioned.fill(
            child: Image.asset(
              'images/backg.png.png',
              fit: BoxFit.cover,
            ),
          ),

          // زر الرجوع ← للعودة اليدوية إذا حبيت
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context); // يرجع للي قبلها
              },
            ),
          ),

          // زر "اقرأ" في الأعلى
          Positioned(
            top: 40,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'اقرأ',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          // ✅ المحتوى الرئيسي
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ✅ فقاعة الكلام
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green[100]!.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Text(
                      'لا يمكنك بدء اللعبة إلا في\nحال السماح بالوصول للكاميرا!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // ✅ صورة الفطر
                Image.asset(
                  'images/mushroom.png.PNG',
                  height: 150,
                ),

                const SizedBox(height: 40),

                // ✅ زر "لقد فهمت"
                ElevatedButton(
                  onPressed: () {
                    // يرجع لصفحة الكاميرا (Camera1Page)
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Camera1Page()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC6D1A8),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text(
                    'لقد فهمت',
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
