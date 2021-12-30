import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'calculate_brain.dart';

enum GenderData { male, female }

GenderData selectedGender;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColour;
  Color femaleCardColor = inactiveCardColour;
  int height = 180;
  int weight = 60;
  int age = 20;

  // 0=male ; 1=female
  // void updateColor(GenderData gender) {
  //   if (gender == GenderData.male) {
  //     if (maleCardColor == activeCardColour) {
  //       maleCardColor = inactiveCardColour;
  //     } else {
  //       maleCardColor = activeCardColour;
  //       femaleCardColor = inactiveCardColour;
  //     }
  //   } else {
  //     if (femaleCardColor == activeCardColour) {
  //       femaleCardColor = inactiveCardColour;
  //     } else {
  //       femaleCardColor = activeCardColour;
  //       maleCardColor = inactiveCardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        //backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderData.male;
                      });
                    },
                    colour: selectedGender == GenderData.male ? activeCardColour : inactiveCardColour,
                    cardChild: IconContent(
                      icons: Icon(
                        FontAwesomeIcons.mars,
                        size: 80.0,
                      ),
                      texts: Text('MALE', style: labelStyle),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderData.female;
                      });
                    },
                    colour: selectedGender == GenderData.female ? activeCardColour : inactiveCardColour,
                    cardChild: IconContent(
                      icons: Icon(
                        FontAwesomeIcons.venus,
                        size: 80.0,
                      ),
                      texts: Text('FEMALE', style: labelStyle),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: labelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: labelStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(inactiveTrackColor: inactiveCardColour, activeTrackColor: Colors.white, thumbColor: bottomContainerColour, thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0), overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0), overlayColor: Color(0x29EB1555)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 300.0,
                        onChanged: (double value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                iconChild: FontAwesomeIcons.minus,
                                onClick: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                }),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                iconChild: FontAwesomeIcons.plus,
                                onClick: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                iconChild: FontAwesomeIcons.minus,
                                onClick: () {
                                  setState(() {
                                    age -= 1;
                                  });
                                }),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                iconChild: FontAwesomeIcons.plus,
                                onClick: () {
                                  setState(() {
                                    age += 1;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculateBrain calc = CalculateBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultPage(calc: calc);
                }),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconChild, this.onClick});
  final IconData iconChild;
  final Function onClick;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconChild),
      constraints: BoxConstraints.tight(Size(56, 56)),
      onPressed: onClick,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Colors.grey,
    );
  }
}
