import 'package:flutter/material.dart';
import 'package:bmi/constent.dart';

class iconColumn extends StatelessWidget {
  final IconData? icon;
  final String? gender;

  const iconColumn({required this.icon, this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          gender!,
          style: KlabelTexyStlye,
        )
      ],
    );
  }
}
