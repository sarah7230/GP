import 'package:flutter/material.dart';

// تأكد من استيراد صفحة num1.dart
import 'num1.dart';
import 'profile.dart';

class MushroomMap extends StatelessWidget {
  const MushroomMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset(
              'images/back.png.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // فطر 1 مع GestureDetector للضغط والتنقل
          Positioned(
            bottom: 0,
            right: -100,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstStagePage()),
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/homem.png.png',
                    width: 350,
                    height: 350,
                  ),
                  const Text(
                    '1',
                    style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.white,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // فطر 2
          Positioned(
            bottom: 200,
            left: -70,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'images/homeb.png.png',
                  width: 300,
                  height: 300,
                ),
                const Text(
                  '2',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.white,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // فطر 3
          Positioned(
            top: 180,
            right: -80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'images/homeb.png.png',
                  width: 300,
                  height: 300,
                ),
                const Text(
                  '3',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.white,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // فطر 4 (على اليسار فوق)
          Positioned(
            top: 90,
            left: -70,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'images/homeb.png.png',
                  width: 280,
                  height: 280,
                ),
                const Text(
                  '4',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.white,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // فطر 5 (أعلى يمين)
          Positioned(
            top: -20,
            right: -60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'images/homeb.png.png',
                  width: 280,
                  height: 280,
                ),
                const Text(
                  '5',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.white,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // زر البروفايل - أسفل يسار
          Positioned(
            bottom: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                // هنا يجب تمرير isBoy إلى ProfilePage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(isBoy: true), // أو false بناءً على حالتك
                  ),
                );
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
