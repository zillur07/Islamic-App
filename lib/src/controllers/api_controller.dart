import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:muslim_app/src/models/expanded_model.dart';

import '../config/appConfigs.dart';
import '../models/quran_model.dart';

class ApiController extends GetxController {
  final _dio = Dio();
  final isExpand = RxBool(false);
  final allSura = Rx<QuranModel?>(null);
  final expendedList = RxList<ExpendedSelect?>([]);
  final allverse = RxList<Result?>([]);
  final allverse1 = RxList<Result?>([]);
  final pageNumbers = RxInt(0);
  final controller = Rx<ScrollController?>(null);
  final isMoreLoading = RxBool(false);
  final hasnotData = RxBool(false);
  @override
  void onReady() async {
    // Get called after widget is rendered on the screen

    getAllSura();

    super.onReady();
  }

  loadmore() async {
    if (controller.value!.position.pixels ==
            controller.value!.position.maxScrollExtent &&
        !hasnotData.value) {
      isMoreLoading.value = true;
      await getAllSura();
      isMoreLoading.value = false;
    }
  }

  getAllSura() async {
    pageNumbers.value++;

    print('calling');
    try {
      final res = await _dio.get(
          'http://api.quran.com/api/v3/search?q=quran&size=10&page=${pageNumbers.value}&language=en');

      // final List<QuranModel> quranData = res.data['results']
      //     .map((json) => QuranModel.fromJson(json))
      //     .toList()
      //     .cast<QuranModel>();

      final data = QuranModel.fromJson(res.data);
      print(data.search!.results![0]!.translations![0]!.name);
      allSura.value = data;
      if (allSura.value!.search!.results!.isNotEmpty) {
        print('has data');

        for (var a in allSura.value!.search!.results!) {
          expendedList.add(
            ExpendedSelect(
              isSelect: false,
              verse_id: a!.verseId.toString(),
            ),
          );
        }
        allverse1.clear();
        allverse1.addAll(allSura.value!.search!.results!);
        await GetStorage().write('all', allverse1);

        allverse.addAll(await GetStorage().read('all'));
      } else {
        print('has no data');
        hasnotData.value = true;
      }

      // print('++++++++++++++++++++++++++');
      // print(res.data);
      // print(res.statusCode);
      // print(res.realUri);
      // print(res.requestOptions);
      // print('++++++++++++++++++++++++++++++++');

    } catch (e) {
      hasnotData.value = true;
      print(e);
    }
  }
}
