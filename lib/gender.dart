import 'package:flutter/material.dart';
import 'savedata.dart'; // استيراد فئة SaveData من ملف savedata.dart
import 'saved.dart'; // استيراد صفحة SavePage

class GenderPage extends StatefulWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String? selectedGender; // لتخزين الجنس المختار

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC6D1A8),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 40),
            const Text(
              "نريد أن نتعرف عليك أكثر\nهل أنت",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // فتى
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = "boy"; // تحديد الجنس
                    });
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'images/green.png.png',  // صورة الولد
                        height: 150,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "فتى",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: selectedGender == "boy" ? Colors.blue : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                // فتاة
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = "girl"; // تحديد الجنس
                    });
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'images/red.png.png',  // صورة البنت
                        height: 150,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "فتاة",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: selectedGender == "girl" ? Colors.pink : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // أزرار التنقل
            Column(
              children: [
                ElevatedButton(
                  onPressed: selectedGender != null
                      ? () async {
                          // حفظ بيانات الجنس باستخدام SaveData
                          await SaveData.saveUserData(selectedGender == "boy");

                          // الانتقال إلى SavePage بعد حفظ البيانات
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SavePage(), // الانتقال إلى SavePage
                            ),
                          );
                        }
                      : null,
                  child: const Text("التالي"),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // يرجع لصفحة سابقة
                  },
                  child: const Text("السابق"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
