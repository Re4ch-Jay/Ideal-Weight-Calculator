import 'package:flutter/material.dart';
import '../utils.dart';

class AvatarGender extends StatelessWidget {
  const AvatarGender({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("images/$image"),
            radius: 80,
          ),
        ),
        Text(
          title,
          style: kCardTitleTextStyle,
        ),
      ],
    );
  }
}
