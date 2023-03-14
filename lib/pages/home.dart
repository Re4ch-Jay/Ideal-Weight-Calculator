import 'package:flutter/material.dart';
import 'package:ideal_weight_calculator/helper/calculator_brain.dart';
import 'package:ideal_weight_calculator/widgets/action_button.dart';
import 'package:ideal_weight_calculator/pages/result.dart';
import 'package:slide_to_act/slide_to_act.dart';
import '../widgets/custom_card.dart';
import '../widgets/avatar_gender.dart';
import '../utils.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<SlideActionState> _key = GlobalKey();

  double height = 170;
  int age = 19;
  Gender isSelected = Gender.MALE;

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ActionButton(
                      borderRaduis: BorderRadius.circular(20),
                      onTap: () => setState(() {
                        isSelected = Gender.MALE;
                      }),
                      child: Card(
                        elevation: 15,
                        color: isSelected == Gender.MALE
                            ? Colors.deepPurple[300]
                            : Colors.grey[50],
                        child: const AvatarGender(
                          title: 'Male',
                          image: 'male.png',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ActionButton(
                      borderRaduis: BorderRadius.circular(20),
                      onTap: () => setState(() {
                        isSelected = Gender.FEMALE;
                      }),
                      child: Card(
                        elevation: 15,
                        color: isSelected == Gender.FEMALE
                            ? Colors.deepPurple[300]
                            : Colors.grey[50],
                        child: const AvatarGender(
                          title: 'Female',
                          image: 'female.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Card(
                  elevation: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Height",
                        style: kCardTitleTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            height.toStringAsFixed(1),
                            style: kValueTextStyle,
                          ),
                          const Text("cm")
                        ],
                      ),
                      Slider(
                        value: height,
                        max: 220,
                        min: 120,
                        inactiveColor: Colors.deepPurple[200],
                        onChanged: (double value) => setState(() {
                          height = value;
                        }),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomCard(
                        title: "AGE",
                        value: age.toString(),
                        onTapIncrement: () => setState(
                          () {
                            age++;
                          },
                        ),
                        onTapDecrement: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Builder(builder: (context) {
                final GlobalKey<SlideActionState> _key = GlobalKey();
                return SlideAction(
                  text: "Slide to calculate",
                  outerColor: Colors.deepPurple,
                  innerColor: Colors.white,
                  borderRadius: 15,
                  elevation: 15,
                  key: _key,
                  onSubmit: () {
                    CalculatorBrain calculatorBrain = CalculatorBrain(
                      gender: isSelected,
                      height: height,
                      age: age,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(
                          checkGenderGetResult: calculatorBrain.getResult(),
                        ),
                      ),
                    );
                    Future.delayed(
                      const Duration(seconds: 1),
                      () => _key.currentState?.reset(),
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
