import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/kText.dart';

class QuranHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset('img/bgMinar.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: KText(
              text: 'Ahmad Maulana',
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          Positioned(
            top: 35,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: KText(
                text: 'Ahmad Maulana',
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: KText(
                text: 'Ahmad Maulana',
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
