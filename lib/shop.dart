import 'package:flutter/material.dart';
import 'clicker.dart';
import 'constants.dart';

class ShopPage extends StatefulWidget{
  const ShopPage({Key? key}) : super(key: key);

  @override
  ShopPageState createState() => ShopPageState();
}
class ShopPageState extends State<ShopPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: _appBar(context),
        backgroundColor: Colors.black,
      body: Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.red, // background
    onPrimary: Colors.yellow,),
                  onPressed: () {
                    if (veloNums >= kInsanePrice) {
                      setState(() {
                        veloNums -= kInsanePrice;
                        multiplier = kInsaneMultiplier;
                      });
                    } else {
                      showAlertDialog(context);
                    }
                  },
                  child: Text('$kInsaneMultiplier' + 'x'),
                ),
              ),
            ],
          ),
        ], // children
      ),
    );
  }
}

_appBar(context) {
  return AppBar(
      elevation: 0,
      backgroundColor: Colors.red,
      title: Text('VeloClicker', style: TextStyle(color: Colors.yellow, fontSize: 25, fontWeight: FontWeight.w700),),
      actions: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
            color: Colors.yellow,
            size: 30,
          ), onPressed: () async{ Navigator.push(context, MaterialPageRoute(builder: (context) => VeloPage())); },
        ),
        SizedBox(
          width: 20,
        ),
      ]);
}