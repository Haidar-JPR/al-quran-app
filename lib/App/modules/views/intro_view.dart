import 'package:al_quran_app/App/modules/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class IntrodutionView extends StatelessWidget {
  const IntrodutionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Al-Quran Apps",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Sesibuk itukah kamu sampai belum membaca al-quran ?',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Lottie.asset('assets/lotties/quran.json', width: 400),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Get.to(HomePage()),
              child: Text(
                'GET STARTED',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
