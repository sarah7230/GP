import 'package:flutter/material.dart';
import 'savedata.dart'; // استيراد فئة SaveData من ملف savedata.dart
import 'ready.dart'; // استيراد صفحة ReadyPage

class SavePage extends StatelessWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC6D1A8), // لون خلفية الصفحة مثل الصورة المرفوعة
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // النص في أعلى الصفحة
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'اقرأ', // النص كما في الصورة
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // نص تأكيد الحفظ
            const Text(
              'لقد تم حفظ معلوماتك بنجاح!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.brown,
              ),
            ),

            const SizedBox(height: 30),

            // صورة الفطر
            Image.asset(
              'images/mushroom.png.PNG', // تأكد من وجود الصورة في المسار الصحيح
              height: 200,
            ),

            const SizedBox(height: 60),

            // زر "التالي"
            ElevatedButton(
              onPressed: () {
                // بعد الضغط على التالي، يتم الانتقال إلى ReadyPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReadyPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.white.withOpacity(0.3),
              ),
              child: const Text(
                'التالي',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),

            const SizedBox(height: 15),

            // زر "السابق"
            TextButton(
              onPressed: () {
                Navigator.pop(context); // العودة لصفحة سابقة
              },
              child: const Text(
                'السابق',
                style: TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
