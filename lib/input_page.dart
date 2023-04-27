import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardBg = Color(0xFF1F1F2E);
const activeCardMale = Colors.blueAccent;
const activeCardFemale = Colors.pinkAccent;
enum Gender {
  male,
  female
}
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.male ? activeCardMale : activeCardMale.withOpacity(0.25),
                    cardChild: const IconContent(icon: FontAwesomeIcons.mars, text: 'MALE'),
                  ),
                )
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.female ? activeCardFemale : activeCardFemale.withOpacity(0.25),
                    cardChild: const IconContent(icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                  ),
                ),

              ),
            ],
          )),
          Expanded(
              child: Row(
            children: const <Widget>[
              Expanded(
                child: ReusableCard(colour: activeCardBg),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: const <Widget>[
              Expanded(child: ReusableCard(colour: activeCardBg)),
              Expanded(child: ReusableCard(colour: activeCardBg))
            ],
          )),
          Container(
            color: const Color(0xFFEB1555),
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
          ),
        ],
      ),
      floatingActionButton: Theme(
        data: ThemeData(
            colorScheme: ColorScheme.fromSwatch(accentColor: Colors.tealAccent)),
        child: const FloatingActionButton(
          onPressed: null,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
