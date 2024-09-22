import 'package:flutter/material.dart';
import 'constent.dart';

class ButtonBotom extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  ButtonBotom({required this.onTap, required this.text}) {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Color(0xFFEB1555),
        height: 80,
        width: double.infinity,
        child: Center(
            child: Text(
          text,
          style: KlabelLargstly,
        )),
      ),
    );
  }
}
