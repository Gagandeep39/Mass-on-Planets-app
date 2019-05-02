import 'package:flutter/material.dart';

///Created on Android Studio Canary Version
///User: Gagandeep
///Date: 02-05-2019
///Time: 10:29
///Project Name: weight_on_planet_app
///

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  num radioValue = -1;  //-1 lets no radio button to be selected by default
  var activeColor;
  var planetName = "X";
  double _finalResult = 0.0;
  final TextEditingController _weightController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight On Planet X"),
        backgroundColor: activeColor,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            Image.asset(
              'images/planet.png',
              color: activeColor,
            ),
            Container(
              alignment: Alignment.center,
              child: TextField(
                obscureText: false,
                keyboardType: TextInputType.number,
                controller: _weightController,
                decoration: InputDecoration(
                    labelText: "Your Weight on Earth",
                    hintText: "KG",
                    icon: Icon(Icons.person_outline)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio<int>(
                    onChanged: handleRadioValueChange,
                    groupValue: radioValue,
                    value: 0,
                    activeColor: activeColor),
                Text("Neptune"),
                Radio<int>(
                    onChanged: handleRadioValueChange,
                    groupValue: radioValue,
                    value: 1,
                    activeColor: activeColor),
                Text("Venus"),
                Radio<int>(
                    onChanged: handleRadioValueChange,
                    groupValue: radioValue,
                    value: 2,
                    activeColor: activeColor),
                Text("Pluto")
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
            ),
            Center(
              child: Text(
                _weightController.text.isEmpty
                    ? "Enter Weight !!"
                    : "Mass on $planetName is ${_finalResult.toStringAsFixed(2)} KG",
                style: TextStyle(
                  color: activeColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 19.4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateWeight(String weight, double multiplier) {
    if (weight.toString().isNotEmpty && int.parse(weight) > 0)
      return int.parse(weight) * multiplier;
    else
      return 180 * 0.38;
  }

  handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0: //Neptune
          activeColor = Colors.blue;
          _finalResult = calculateWeight(_weightController.text, 1.19);
          planetName = "Neptune";
          break;
        case 1: //Venus
          activeColor = Colors.amber;
          _finalResult = calculateWeight(_weightController.text, 0.91);
          planetName = "Venus";
          break;
        case 2: //Pluto
          activeColor = Colors.brown;
          _finalResult = calculateWeight(_weightController.text, 0.06);
          planetName = "Pluto";
          break;
      }
    });
  }
}
