import 'package:al_quran_app/App/data/models/detail_surah.dart' as detail;
import 'package:al_quran_app/App/modules/controllers/detail_surah.controller.dart';
import 'package:al_quran_app/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/surah.dart';

class DetailSurahPage extends StatelessWidget {
  const DetailSurahPage({super.key});

  @override
  Widget build(BuildContext context) {
    //NOTE: get surah from previous page
    final Surah surah = Get.arguments;
    //NOTE: inject depedency controller
    final detailSurahC = Get.put(DetailSurahC());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          surah.name?.transliteration?.id ?? 'Error...',
          style: whiteTextStyle,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(whiteSpace),
        children: [
          //NOTE: Card 1
          Card(
            child: Padding(
              padding: EdgeInsets.all(whiteSpace),
              child: Column(
                children: [
                  Text(
                    surah.name?.transliteration?.id ?? 'Error..',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                  ),
                  Text(
                    '( ${surah.name?.translation?.id ?? 'Error..'} )',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: whiteSpace),
                  Text(
                    '${surah.numberOfVerses} Ayat | ${surah.revelation?.id}',
                    style: blackTextStyle,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: whiteSpace),

          //NOTE: Build content
          FutureBuilder<detail.DetailSurah>(
              future: detailSurahC.getDetailSurah(surah.number.toString()),
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
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.verses?.length ?? 0,
                    itemBuilder: (context, index) {
                      if (snapshot.data?.verses?.length == 0) {
                        return const SizedBox();
                      }
                      detail.Verse? ayat = snapshot.data?.verses?[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: whiteSpace + 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(child: Text('${index + 1}')),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.bookmark_border_outlined),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.play_arrow),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            ayat!.text?.arab ?? 'Error..',
                            style: blackTextStyle.copyWith(fontSize: 20),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            ayat.text?.transliteration?.en ?? 'Error..',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(height: whiteSpace + 10),
                          Text(
                            ayat.translation?.id ?? 'Error..',
                            style: blackTextStyle.copyWith(fontSize: 14),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: whiteSpace),
                        ],
                      );
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
