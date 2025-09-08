import 'package:flutter/material.dart';
import 'savedata.dart'; // استيراد فئة SaveData من ملف savedata.dart

class ProfilePage extends StatelessWidget {
  final bool isBoy;  // إضافة المعامل isBoy

  // إضافة هذا المعامل إلى المُنشئ
  const ProfilePage({Key? key, required this.isBoy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC6D1A8),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'الملف الشخصي',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              isBoy ? 'أنت ولد' : 'أنت بنت',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 30),
            Image.asset(
              isBoy ? 'images/green.png.png' : 'images/red.png.png',  // تحديد الصورة بناءً على الجنس
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
