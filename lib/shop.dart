import 'package:flutter/material.dart';
import 'clicker.dart';
import 'constants.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  ShopPageState createState() => ShopPageState();
}

class ShopPageState extends State<ShopPage> {
  num veloNums = 0;
  num multiplier = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Transform.translate(
            offset: const Offset(500, 3000), // Adjust the offset value as needed
            child: Text(
              'Velo: ${veloNums.toStringAsFixed(4)}',
              style: const TextStyle(
                fontSize: 35,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    blurRadius: 5,
                  ),
                ],
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.wavy,
                fontFamily: 'Roboto',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 20.0),
            child: Column(
              children: [
                Text(
                  'Multiplier: ${multiplier.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                    fontFamily: 'Roboto',
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Cost: ${kInsanePrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red,
                    decorationThickness: 2.0,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                    fontFamily: 'Roboto',
                  ),
                  textAlign: TextAlign.center,
                ),

              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.yellow,
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    if (veloNums >= kInsanePrice) {
                      setState(() {
                        veloNums -= kInsanePrice;
                        multiplier *= kInsaneMultiplier;
                       // _saveGameState();
                      });
                    } else {
                      showAlertDialog(context);
                    }
                  },
                  child: const Text('${kInsaneMultiplier}x'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.red,
      title: Text(
        'VeloClicker',
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.yellow,
            size: 30,
          ),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VeloPage()),
            );
          },
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
