import 'package:bmi_calculator/LargeActionButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColour = activeCardMale.withOpacity(0.25);
  // Color femaleCardColour = activeCardFemale.withOpacity(0.25);

  // void genderCardSelected(String type) {
  //     maleCardColour = activeCardMale.withOpacity(type == 'male' ? 1.0 : 0.25);
  //     femaleCardColour = activeCardFemale.withOpacity(type == 'female' ? 1.0 : 0.25);
  // }

  Gender? selectedGender;
  updateSelectedGender(Gender type) {
    setState(() {
      selectedGender = type;
    });
  }
  setWeight([String? operation]) {
    setState(() {
      operation == 'add' ? weight++ : weight--;
    });
  }

  setAge([String? operation]) {
    setState(() {
      operation == 'add' ? age++ : age--;
    });
  }

  double height = ((kmaxHeight + kminHeight)/2).round().toDouble();
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  updateSelectedGender(Gender.male);
                },
                colour: selectedGender == Gender.male
                    ? kactiveCardMale
                    : kactiveCardMale.withOpacity(0.25),
                cardChild: const IconContent(
                    icon: FontAwesomeIcons.mars, text: 'MALE'),
              )),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    updateSelectedGender(Gender.female);
                  },
                  colour: selectedGender == Gender.female
                      ? kactiveCardFemale
                      : kactiveCardFemale.withOpacity(0.25),
                  cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kactiveCardBg,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                    Text(height.toString(), style: kNumberTextStyle),
                    const Text('cm', style: klabelTextStyle),
                  ]
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: kgrayColor,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      thumbColor: kprimaryColor,
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                      overlayColor: const Color(0x45EB1555),
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                        value: height,
                        onChanged: (double val) {
                          setState(() {
                            height = val;
                          });
                        },
                      min: kminHeight,
                      max: kmaxHeight,
                      divisions: (kmaxHeight - kminHeight).round(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(child: ReusableCard(
                    colour: kactiveCardBg,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('WEIGHT', style: klabelTextStyle,),
                        const SizedBox(height: 10.0,),
                        Text(weight.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, operation: () {  setWeight(); }),
                            const SizedBox(width: 14.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, operation: () { setWeight('add'); }),
                          ],
                        ),
                      ],
                    ),
                )),
                Expanded(child: ReusableCard(
                    colour: kactiveCardBg,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: klabelTextStyle,),
                        const SizedBox(height: 10.0,),
                        Text(age.toString(), style: kNumberTextStyle,),
                        const SizedBox(height: 10.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, operation: () { setAge(); }),
                            const SizedBox(width: 14.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, operation: () { setAge('add'); }),
                          ],
                        ),
                      ],
                    ),
                ))
              ],
          )),
          GestureDetector(
            onTap: () { Navigator.pushNamed(context, '/results'); },
            child: LargeActionButton(text: 'CALCULATE'),
          ),
        ],
      ),
      // floatingActionButton: Theme(
      //   data: ThemeData(
      //       colorScheme:
      //           ColorScheme.fromSwatch(accentColor: Colors.tealAccent)),
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.pushNamed(context, 'test2');
      //     },
      //     tooltip: 'Increment',
      //     child: const Icon(Icons.add),
      //   ),
      // ),
    );
  }
}


class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.operation, Key? key}) : super(key: key);

  final IconData icon;
  final VoidCallback operation;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: operation,
      elevation: 6.0,
      textStyle: const TextStyle(color: Colors.white),
      fillColor: Colors.white12,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      child: Icon(icon),
    );
  }
}
