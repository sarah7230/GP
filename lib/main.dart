import 'package:flutter/material.dart';
import 'name.dart'; // ✅ استيراد الصفحة الثانية

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFCAD7AC),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: height * 0.1),
              Text(
                'مرحباً بك في زاهي!',
                style: TextStyle(
                  fontSize: width * 0.09,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: const [
                    Shadow(
                      blurRadius: 2.0,
                      color: Colors.black45,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),
              Text(
                'هيا نساعد البيئة',
                style: TextStyle(
                  fontSize: width * 0.05,
                  color: Colors.grey.shade700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.03),
              Container(
                height: height * 0.4,
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Image.asset(
                  'images/mushroom.png.PNG',
                  fit: BoxFit.contain,
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.05),
                child: ElevatedButton(
                  onPressed: () {
                    // ✅ هنا ننتقل إلى الصفحة الموجودة في name.dart
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NameScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.15,
                      vertical: height * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    textStyle: TextStyle(fontSize: width * 0.055),
                  ),
                  child: const Text('ابدأ الآن'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
