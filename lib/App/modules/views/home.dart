import 'package:al_quran_app/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../App/data/models/surah.dart';
import '../../../App/modules/views/detail_surah_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final home = Get.put(HomeController()); //NOTE: Inject depedency
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Al-Quran',
          style: whiteTextStyle.copyWith(
            fontWeight: bold,
            color: ayatBgColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: ayatBgColor,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder<List<Surah>>(
          future: home.getAllSurah(), //NOTE: Ambil semua data surah dari api
          builder: (context, snapshot) {
            //NOTE: Snapshot adalah data api
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData) {
              return const Text('Tidak Ada Data.');
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Surah surah = snapshot
                    .data![index]; //NOTE: Agar bisa mengambil per satu surah
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: secondColor,
                    child: Text(
                      '${index + 1}',
                      style: whiteTextStyle,
                    ),
                  ),
                  title: Text(
                    surah.name?.transliteration?.id ?? 'Error...',
                    style: whiteTextStyle,
                  ),
                  subtitle: Text(
                    '${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? 'Error...'}',
                    style: greyTextStyle,
                  ),
                  trailing: Text(
                    surah.name?.short ?? 'Error...',
                    style: whiteTextStyle.copyWith(
                      color: secondColor,
                    ),
                  ),
                  onTap: () {
                    Get.to(const DetailSurahPage(), arguments: surah);
                  },
                );
              },
            );
          }),
    );
  }
}
