import 'package:flutter/material.dart';
import 'play1.dart'; // تأكد من استيراد ملف play1.dart

class YesCamera1Page extends StatelessWidget {
  const YesCamera1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCF1D3),
      body: Stack(
        children: [
          // ✅ الخلفية
          Positioned.fill(
            child: Image.asset(
              'images/backg.png.png', // تأكد من أن الصورة موجودة في المسار الصحيح
              fit: BoxFit.cover,
            ),
          ),

          // زر الرجوع
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // ✅ المحتوى
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ✅ رسالة الشكر
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green[100]!.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'شكراً لك للسماح بالوصول إلى\nالكاميرا! أنت الآن قادر على بدء\nاللعبة وتنظيف البحر!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ✅ صورة الفطر
                  Image.asset(
                    'images/mushroom.png.PNG', // تأكد من أن الصورة موجودة في المسار الصحيح
                    height: 150,
                  ),

                  const SizedBox(height: 30),

                  // ✅ زر ابدأ
                  ElevatedButton.icon(
                    onPressed: () {
                      // انتقل إلى صفحة "Play1Page"
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Play1Page()),
                      );
                    },
                    icon: const Icon(Icons.sports_esports, color: Colors.white),
                    label: const Text(
                      'ابدأ',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC6D1A8),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

