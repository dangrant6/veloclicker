import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:veloclicker/shop.dart';
import 'constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

num veloNums = 0;
num multiplier = 1;

class VeloPage extends StatefulWidget {
  @override
  _VeloPageState createState() => _VeloPageState();
}

class _VeloPageState extends State<VeloPage> {

  @override
  Widget build(BuildContext context) {
    resizeToAvoidBottomPadding: true;
    bool isEnabled = false;
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Velo: ' + num.parse(veloNums.toStringAsFixed(4)).toString(),
            style: TextStyle(
              fontSize: 35,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 80.0),
            child: Text(
              'Multiplier: ' +
                  num.parse(multiplier.toStringAsFixed(2)).toString(),
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Material(
          child: Padding(padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child: IconButton(
            icon: Icon(Icons.shopify_outlined,
              color: Colors.deepOrange,
              size: 30,
            ), onPressed: () async{ Navigator.push(context, MaterialPageRoute(builder: (context) => ShopPage())); },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red, // background
                    onPrimary: Colors.yellow,),

                  onPressed: () {
                    if (veloNums >= kUpgrade1Price) {
                      setState(() {
                        veloNums -= kUpgrade1Price;
                        multiplier = kUpgrade1Multiplier;
                      });
                    } else {
                      showAlertDialog(context);
                    }
                  },
                  child: Text('$kUpgrade1Multiplier' + 'x'),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red, // background
                    onPrimary: Colors.yellow,),
                  onPressed: () {
                    if (veloNums >= kUpgrade2Price) {
                      setState(() {
                        veloNums -= kUpgrade2Price;
                        multiplier = kUpgrade2Multiplier;
                      });
                    } else {
                      showAlertDialog(context);
                    }
                  },
                  child: Text('$kUpgrade2Multiplier' + 'x'),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red, // background
                    onPrimary: Colors.yellow,),
                  onPressed: () {
                    if (veloNums >= kUpgrade3Price) {
                      setState(() {
                        veloNums -= kUpgrade3Price;
                        multiplier = kUpgrade3Multiplier;
                      });
                    } else {
                      showAlertDialog(context);
                    }
                  },
                  child: Text('$kUpgrade3Multiplier' + 'x'),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red, // background
    onPrimary: Colors.yellow,),
                  onPressed: () {
                    if (veloNums >= kUpgrade4Price) {
                      setState(() {
                        veloNums -= kUpgrade4Price;
                        multiplier = kUpgrade4Multiplier;
                      });
                    } else {
                      showAlertDialog(context);
                    }
                  },
                  child: Text('$kUpgrade4Multiplier' + 'x'),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: Text('$kUpgrade1Price' + ' Velo',
                    style: TextStyle(fontSize: 15, color: Colors.orange),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: Text('$kUpgrade2Price' + ' Velo',
                  style: TextStyle(fontSize: 15, color: Colors.orange),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: Text(
                    '$kUpgrade3Price' + ' Velo',
                    style: TextStyle(fontSize: 15,
                      color: Colors.orange,
                    ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: Text(
                  '$kUpgrade4Price' + ' Velo',
                  style: TextStyle(fontSize: 15,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 30.0),
            child: BouncingWidget(
              duration: Duration(milliseconds: 100),
              scaleFactor: 2.0,
              onPressed: () {
                setState(() {
                  veloNums += multiplier;
                });
              },
              child: Image.asset(
                'imgs/baseballP.png',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = OutlinedButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Insufficient Funds!"),
    content: Text("You don't have enough Velo to purchase this upgrade."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

save() async{
  final prefs = await SharedPreferences.getInstance();
}