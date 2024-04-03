import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();
  var bgColor = Colors.indigo.shade300;

  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Your BMI"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                      label: Text("Enter Your Weight in KG"),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: feetController,
                  decoration: InputDecoration(
                      label: Text("Enter Your Height in Feet's"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                      label: Text("Enter Your Height in inchs"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      var weight = weightController.text.toString();
                      var feet = feetController.text.toString();
                      var inch = inchController.text.toString();

                      if (weight != "" && feet != "" && inch != "") {
                        // BMI
                        var iweight = int.parse(weight);
                        var ifeet = int.parse(feet);
                        var iInch = int.parse(inch);
                        var totalInch = (ifeet * 12) + iInch;
                        var totalCM = totalInch * 2.54;

                        var totalMeter = totalCM / 100;
                        var bmi = iweight / (totalMeter * totalMeter);

                        if (bmi > 25) {
                          bgColor = Colors.orange.shade200;
                        } else if (bmi < 25) {
                          bgColor = Colors.red.shade200;
                        } else {
                          bgColor = Colors.green.shade200;
                        }

                        setState(() {
                          result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the required values";
                        });
                      }
                    },
                    child: Text("Calculate")),
                Text(
                  result,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
