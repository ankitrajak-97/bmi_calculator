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
  var bgColor = Colors.pink.shade100;
  bool _showResult = false; // State variable for animation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Know Your BMI'),
        foregroundColor: Colors.white,
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your wt in KGs'),
                    prefixIcon: Icon(Icons.line_weight),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in ft'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in inches'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inchController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var mtr = tCm / 100;
                      var BMI = iWt / (mtr * mtr);
                      var indicator = "";

                      if (BMI > 25 && BMI < 29) {
                        bgColor = Colors.orange;
                        indicator = "Overweight";
                      } else if (BMI > 29) {
                        bgColor = Colors.red;
                        indicator = "Obese";
                      } else if (BMI < 18) {
                        bgColor = Colors.yellow;
                        indicator = "Underweight";
                      } else {
                        bgColor = Colors.green;
                        indicator = "Fit";
                      }

                      result =
                          "Your BMI is ${BMI.toStringAsFixed(2)}\nYou are $indicator";
                      _showResult = true; // Trigger animation
                    } else {
                      result = "Please fill all fields";
                      _showResult = true; // Ensure text still appears
                    }

                    setState(() {}); // Trigger UI update
                  },
                  child: Text('Calculate'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: _showResult ? 1.0 : 0.0, // Fade in/out
                  child: Text(
                    result,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
