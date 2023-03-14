import 'package:flutter/material.dart';
import 'package:ideal_weight_calculator/utils.dart';
import 'action_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.value,
    required this.onTapIncrement,
    required this.onTapDecrement,
  });

  final String title;
  final String value;
  final VoidCallback onTapIncrement;
  final VoidCallback onTapDecrement;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: kCardTitleTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: kValueTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ActionButton(
                color: Colors.white,
                borderRaduis: BorderRadius.circular(100),
                onTap: onTapDecrement,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(FontAwesomeIcons.minus),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ActionButton(
                color: Colors.white,
                borderRaduis: BorderRadius.circular(100),
                onTap: onTapIncrement,
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
