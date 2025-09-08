import 'package:flutter/material.dart';
import 'level.dart';  // تأكد من المسار الصحيح لملف MushroomMap
import 'savedata.dart'; // استيراد فئة SaveData من ملف savedata.dart

class ReadyPage extends StatelessWidget {
  const ReadyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC6D1A8), // نفس لون الخلفية
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'اقرأ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'والان يا صديقي سوف ننتقل للعبه فاستعد !\n'
                'يوجد لديك عدة مراحل يوجد بها تلوث بيئي\n'
                'فلنتساعدنا على المحافظة على البيئة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.brown,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Image.asset(
              'images/mushroom.png.PNG', // تأكد أن اسم الصورة والمجلد صحيحين
              height: 150,
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () async {
                // بعد الضغط على التالي، يتم الانتقال إلى MushroomMap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MushroomMap()),
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
            TextButton(
              onPressed: () {
                Navigator.pop(context); // العودة إلى صفحة سابقة
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
