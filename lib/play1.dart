import 'package:flutter/material.dart';

class Play1Page extends StatelessWidget {
  const Play1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("اللعبة")),
      body: Center(
        child: const Text("مرحباً بك في الصفحة الرئيسية للعبة!"),
      ),
    );
  }
}
