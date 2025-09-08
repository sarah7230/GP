import 'package:flutter/material.dart';
import 'level.dart'; // تأكد أن الملف موجود
import 'video1.dart'; // صفحة الفيديو
import 'camera1.dart'; // ✅ اسم جديد للعبة بعد التعديل

class FirstStagePage extends StatefulWidget {
  const FirstStagePage({Key? key}) : super(key: key);

  @override
  State<FirstStagePage> createState() => _FirstStagePageState();
}

class _FirstStagePageState extends State<FirstStagePage> {
  bool hasWatchedVideo = false; // المستخدم شاهد الفيديو؟

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCF1D3),
      body: Stack(
        children: [
          // الخلفية
          Positioned.fill(
            child: Image.asset(
              'images/backg.png.png',
              fit: BoxFit.cover,
            ),
          ),

          // زر "اقرأ"
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

          // زر الرجوع
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MushroomMap()),
                );
              },
            ),
          ),

          // المحتوى الأساسي
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 100),

                // ✅ الرسالة التي تتغير بعد مشاهدة الفيديو
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[100]!.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    hasWatchedVideo
                        ? 'عمل جيد يا صديقي، ارجو أن تكون قد استفدت من القصة!\nوالآن أنت قادر على بدء اللعبة!'
                        : 'مرحباً بك في المرحلة الأولى!\nيوجد لدينا تلوث بحري، ونرجو منك مساعدتنا على تنظيف البحر، ولكن قبل أن تبدأ اللعبة يجب عليك الاستماع إلى قصتنا المفيدة والجميلة',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.brown),
                  ),
                ),

                const SizedBox(height: 20),

                // صورة الفطر
                Image.asset(
                  'images/mushroom.png.PNG',
                  height: 200,
                ),

                const SizedBox(height: 40),

                // مشغل الفيديو
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Video1Page()),
                    ).then((_) {
                      setState(() {
                        hasWatchedVideo = true;
                      });
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC6D1A8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          '01',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('البحر وأهميته',
                                  style: TextStyle(color: Colors.brown, fontSize: 18)),
                              Text('6:10 mins', style: TextStyle(color: Colors.brown)),
                            ],
                          ),
                        ),
                        Icon(Icons.play_circle_fill, color: Colors.green, size: 40),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // زر "اللعب"
                ElevatedButton.icon(
                  onPressed: hasWatchedVideo
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Camera1Page()), // ✅ استدعاء الصفحة الجديدة
                          );
                        }
                      : null,
                  icon: Icon(
                    hasWatchedVideo ? Icons.videogame_asset : Icons.lock,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'العب',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC6D1A8),
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
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
