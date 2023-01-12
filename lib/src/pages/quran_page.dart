import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:muslim_app/src/config/appTheme.dart';
import 'package:muslim_app/src/controllers/base_controller.dart';
import 'package:muslim_app/src/models/quran_model.dart';
import 'package:muslim_app/src/widget/kText.dart';

import '../component/quharn_hedar.dart';
import '../config/appColors.dart';

class QuranPage extends StatefulWidget {
  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> with BaseController {
  final storage = GetStorage();
  @override
  void initState() {
    suraGetC.controller.value = ScrollController()
      ..addListener(() {
        suraGetC.loadmore();
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.ac_unit,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: white2,
        elevation: 0,
        title: KText(
          text: 'Al Quran ',
          fontSize: 20,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(125),
          child: QuranHeader(),
        ),
      ),
      backgroundColor: white2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => SizedBox(
                height: Get.height * .7,
                child: ListView.builder(
                  controller: suraGetC.controller.value,
                  physics: BouncingScrollPhysics(),
                  primary: false,
                  itemCount: suraGetC.allverse.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = suraGetC.allverse[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                          child: Container(
                            height: 200,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white60,
                                  blurRadius: 1,
                                  offset: Offset(
                                    1,
                                    1,
                                  ), // Shadow position
                                ),
                                BoxShadow(
                                  color: Colors.white60,
                                  blurRadius: 1,
                                  offset: Offset(
                                    -1,
                                    -1,
                                  ), // Shadow position
                                ),
                                BoxShadow(
                                  color: Colors.white60,
                                  blurRadius: 1,
                                  offset: Offset(
                                    -1,
                                    1,
                                  ), // Shadow position
                                ),
                                BoxShadow(
                                  color: Colors.white60,
                                  blurRadius: 1,
                                  offset: Offset(
                                    1,
                                    -1,
                                  ), // Shadow position
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: KText(maxline: 3, text: item!.text!),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.all(10.0),
                                //   child: KText(text: item.translations![0]!.text!),
                                // ),
                                Obx(
                                  () => Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              suraGetC.expendedList[index]!
                                                      .isSelect =
                                                  !suraGetC.expendedList[index]!
                                                      .isSelect!;
                                            });
                                          },
                                          child: suraGetC.expendedList[index]!
                                                  .isSelect!
                                              ? Icon(Icons.arrow_drop_down)
                                              : Icon(Icons.arrow_drop_up))),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Visibility(
                          visible: suraGetC.expendedList[index]!.isSelect!,
                          child: SizedBox(
                            height: 200,
                            child: ListView(
                              shrinkWrap: true,
                              children: item.translations!
                                  .map(
                                    (e) => Container(
                                      height: 200,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white60,
                                            blurRadius: 1,
                                            offset: Offset(
                                              1,
                                              1,
                                            ), // Shadow position
                                          ),
                                          BoxShadow(
                                            color: Colors.white60,
                                            blurRadius: 1,
                                            offset: Offset(
                                              -1,
                                              -1,
                                            ), // Shadow position
                                          ),
                                          BoxShadow(
                                            color: Colors.white60,
                                            blurRadius: 1,
                                            offset: Offset(
                                              -1,
                                              1,
                                            ), // Shadow position
                                          ),
                                          BoxShadow(
                                            color: Colors.white60,
                                            blurRadius: 1,
                                            offset: Offset(
                                              1,
                                              -1,
                                            ), // Shadow position
                                          ),
                                        ],
                                        color: Colors.grey.shade300,
                                      ),
                                      child: ListTile(
                                        title: KText(
                                          text: e!.name != null
                                              ? e.name!.toString()
                                              : 'NAI',
                                        ),
                                        subtitle: KText(
                                            text: e.text != null
                                                ? e.text!.toString()
                                                : 'NAI'),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
            Obx(
              () => suraGetC.isMoreLoading.value
                  ? SizedBox(height: 40, child: CircularProgressIndicator())
                  : suraGetC.hasnotData.value
                      ? SizedBox(
                          height: 40,
                          child: KText(text: 'No New Data Available'))
                      : KText(text: ''),
            )
          ],
        ),
      ),
    );
  }
}
