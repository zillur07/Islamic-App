import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_app/src/config/appTheme.dart';
import 'package:muslim_app/src/controllers/base_controller.dart';
import 'package:muslim_app/src/pages/quran_page.dart';
import 'package:muslim_app/src/widget/kText.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BaseController {
  int _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: Get.height / 3,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset('img/bgMinar.png'),
                      ),
                      Positioned(
                        top: 30,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              KText(
                                text: 'Assalamualaikum',
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 115,
                              ),
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 26,
                              ),
                              Icon(
                                Icons.notification_important_rounded,
                                color: Colors.white,
                                size: 25,
                              ),
                              Image.asset('img/user.png'),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: KText(
                            text: 'Ahmad Maulana',
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Container(
                                  height: 80,
                                  width: 83,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 1,
                                        offset: Offset(
                                          1,
                                          1,
                                        ), // Shadow position
                                      ),
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 1,
                                        offset: Offset(
                                          -1,
                                          -1,
                                        ), // Shadow position
                                      ),
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 1,
                                        offset: Offset(
                                          -1,
                                          1,
                                        ), // Shadow position
                                      ),
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 1,
                                        offset: Offset(
                                          1,
                                          -1,
                                        ), // Shadow position
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                  ),
                                  child: Image.asset('img/quran.png'),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: Get.height / 1,
              width: Get.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: Get.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(
                            1,
                            1,
                          ), // Shadow position
                        ),
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(
                            -1,
                            -1,
                          ), // Shadow position
                        ),
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(
                            -1,
                            1,
                          ), // Shadow position
                        ),
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1,
                          offset: Offset(
                            1,
                            -1,
                          ), // Shadow position
                        ),
                      ],
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Image.asset(
                              'img/bigMinar.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KText(
                              text: 'Sudah baca Alqur’an? ',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            KText(
                              text: 'QS. AL-BAQARAH : Ayat 30',
                              fontSize: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            // suraGetC.getAllSura();
                            Get.to(QuranPage());
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    width: Get.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      primary: false,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 260,
                            width: 230,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  offset: Offset(
                                    1,
                                    1,
                                  ), // Shadow position
                                ),
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  offset: Offset(
                                    -1,
                                    -1,
                                  ), // Shadow position
                                ),
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  offset: Offset(
                                    -1,
                                    1,
                                  ), // Shadow position
                                ),
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  offset: Offset(
                                    1,
                                    -1,
                                  ), // Shadow position
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 110,
                                  padding: EdgeInsets.all(8),
                                  child: KText(
                                      maxline: 3,
                                      fontSize: 15,
                                      text:
                                          'وَإِنَّ مِنْهُمْ لَفَرِيقًا يَلْوُۥنَ أَلْسِنَتَهُم بِٱلْكِتَـٰبِ لِتَحْسَبُوهُ مِنَ ٱلْكِتَـٰبِ وَمَا هُوَ مِنَ ٱلْكِتَـٰبِ وَيَقُولُونَ هُوَ مِنْ عِندِ ٱللَّهِ وَمَا هُوَ مِنْ عِندِ ٱللَّهِ وَيَقُولُونَ عَلَى ٱللَّهِ ٱلْكَذِبَ وَهُمْ يَعْلَمُونَ'),
                                ),
                                Container(
                                  height: 121,
                                  padding: EdgeInsets.all(8),
                                  child: KText(
                                    maxline: 4,
                                    fontSize: 15,
                                    color: Colors.white,
                                    text:
                                        'A group of them twist their tongues around concerning the Book (<em>Quran</em>) so you will reckon [something] comes from the Book (<em>Quran</em>) while it is not from the Book A group of them twist their tongues around concerning the Book (<em>Quran</em>) so you will reckon [something] comes from the Book (<em>Quran</em>) while it is not from the Book  (<em>Quran</em>)',
                                  ),
                                  color: Colors.teal,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.person_outline_outlined,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: KText(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            text: 'Dr. T. B. Irving'),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.teal,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                              15,
                                            ),
                                          )),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Users'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Messages test for mes teset test test ',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
