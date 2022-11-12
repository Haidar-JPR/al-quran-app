import 'package:al_quran_app/App/modules/views/home.dart';
import 'package:al_quran_app/shared.dart';
import 'package:flutter/material.dart';
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
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: whiteSpace),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Sesibuk itukah kamu sampai belum membaca al-quran ?',
                style: greyTextStyle.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            Lottie.asset('assets/lotties/quran.json', width: 400),
            SizedBox(height: whiteSpace),
            ElevatedButton(
              onPressed: () => Get.offAll(HomePage()),
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                padding: EdgeInsets.symmetric(
                  horizontal: whiteSpace,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(whiteSpace),
                ),
              ),
              child: Text(
                'GET STARTED',
                style: whiteTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
