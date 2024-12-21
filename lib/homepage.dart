import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListMapState();
  }
}

class ListMapState extends State<Homepage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bgcolor = Colors.indigo.shade100;

  // var arrData = [
  //   {'name': 'Adam', 'Company': 'Amazon', 'id': 1},
  //   {'name': 'Sophia', 'Company': 'Google', 'id': 2},
  //   {'name': 'Liam', 'Company': 'Microsoft', 'id': 3},
  //   {'name': 'Olivia', 'Company': 'Apple', 'id': 4},
  //   {'name': 'Noah', 'Company': 'Facebook', 'id': 5},
  //   {'name': 'Emma', 'Company': 'Netflix', 'id': 6},
  //   {'name': 'Ethan', 'Company': 'Tesla', 'id': 7},
  //   {'name': 'Ava', 'Company': 'Twitter', 'id': 8},
  //   {'name': 'Mason', 'Company': 'Adobe', 'id': 9},
  //   {'name': 'Isabella', 'Company': 'Spotify', 'id': 10}
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Know Your BMI'),
          foregroundColor: Colors.white,
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'BMI',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter your wt  in KGs'),
                      prefixIcon: Icon(Icons.line_weight),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter ur height in ft'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24))),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: inchController,
                    decoration: InputDecoration(
                        label: Text('Enter ur height after ft in inches'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24))),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inchController.text.toString();
                        if (wt != "" && ft != '' && inch != '') {
                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInch = int.parse(inch);

                          var tInch = (iFt * 12) + iInch;
                          var tCm = tInch * 2.54;
                          var mtr = tCm / 100;
                          var BMI = iWt / (mtr * mtr);
                          var indicator = "";

                          if (BMI > 25) {
                            bgcolor = Colors.orange;
                            indicator = "OverWeight";
                          } else if (BMI < 18) {
                            bgcolor = Colors.yellow;
                            indicator = 'underWeight';
                          } else {
                            bgcolor = Colors.green;
                            indicator = 'Fit';
                          }
                          result =
                              "Your BMI is ${BMI.toStringAsFixed(2)}\nyou are $indicator ";
                          setState(() {});
                        } else {
                          result = "Please fill all the blank fields";
                          setState(() {});
                        }
                      },
                      child: Text('Calculate'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color
                        foregroundColor: Colors.white, // Text color
                        minimumSize: Size(200, 50), // Width and height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ) // Rounded corners)
                      ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
