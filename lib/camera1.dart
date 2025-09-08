import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'nocamera1.dart';  // صفحة التنبيه
import 'yescamera1.dart'; // الصفحة التي تظهر عند السماح بالكاميرا

class Camera1Page extends StatelessWidget {
  const Camera1Page({super.key});

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

          // زر الرجوع
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // ✅ المحتوى الرئيسي
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ✅ الرسالة
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green[100]!.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'قبل بدء اللعبة يجب عليك السماح لنا\nبـالوصول للكاميرا !',
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
                    'images/mushroom.png.PNG',
                    height: 150,
                  ),

                  const SizedBox(height: 30),

                  // ✅ زر "اسمح"
                  ElevatedButton(
                    onPressed: () async {
                      final status = await Permission.camera.request();
                      if (status.isGranted) {
                        // إذا تم السماح بالكاميرا، انتقل إلى صفحة "شكراً"
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم السماح بالكاميرا!')),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const YesCamera1Page()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('يرجى السماح بالكاميرا للمتابعة')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC6D1A8),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'اسمح',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ✅ زر "لا اسمح"
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NoCamera1Page()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC6D1A8).withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'لا اسمح',
                      style: TextStyle(fontSize: 20, color: Colors.white),
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
