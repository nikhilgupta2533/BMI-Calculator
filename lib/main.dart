import 'package:bmi/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
var Bgcolor;


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI (Body mass index)',
      // color: Bgcolor,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black12),
        useMaterial3: true,
      ),
      home: Splashscreen(),
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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFDEBBDE),
      appBar: AppBar(

        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        color: Bgcolor,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 16.0),
              // width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("BMI", style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700
                  )),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      label: Text('Enter your weight in kgs'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 21,),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      label: Text('Enter your height in feet'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 21,),

                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      label: Text('Enter your height in inch'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16,),

                  ElevatedButton(onPressed: (){
                    var wt = wtController.text.toString();
                    var inch = inController.text.toString();
                    var feet = ftController.text.toString();

                    if(wt!="" && inch!="" && feet!="")
                      {
                        //BMI Calculation
                        var iWt = int.parse(wt);
                        var iFt = int.parse(feet);
                        var iInch = int.parse(inch);
                        var totalHeight = (iFt*12)+iInch;
                        var heightInCm = totalHeight * 2.24;
                        var heightInM = heightInCm/100;
                        var bmi = iWt/(heightInM+heightInM);

                        var message = "";

                        if(bmi>25)
                          {
                            message = "You are OverWeight";
                            Bgcolor = Colors.orange;
                          }
                        else if(bmi<18)
                          {
                            message = "You are UnderWeight";
                            Bgcolor = Colors.red;
                          }
                        else
                          {
                            message = "You are Healthy";
                            Bgcolor = Colors.green;

                          }

                        setState(() {
                          result = "$message \n Your BMI is ${bmi.toStringAsFixed(3)}";

                        });

                      }
                    else
                      {
                        setState(() {
                          result = 'Please fill all the required lines';
                        });
                      }
                  }, child: Text('Calculate')),
                  SizedBox(height: 11,),
                  Text(result, style: TextStyle(fontSize: 19),),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}