import 'package:flutter/material.dart';
import 'package:ideal_weight_calculator/widgets/action_button.dart';
import '../utils.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    required this.checkGenderGetResult,
  });

  final double checkGenderGetResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "IDEAL WEIGHT",
          style: kTitleTextStyle,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "The ideal weight for you is",
                        style: kResultCardTitleTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            checkGenderGetResult.toStringAsFixed(1),
                            style: kResultValueTextStyle,
                          ),
                          const Text(
                            "kgs",
                            style: kCardTitleTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ActionButton(
                onTap: () => Navigator.pop(context),
                borderRaduis: BorderRadius.circular(15),
                color: Colors.deepPurple,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "Calculate Again",
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
