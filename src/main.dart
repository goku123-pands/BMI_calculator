import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(new HomeScreen());



}
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()
  {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {

  String disp="0.0", fin =" ";
  double bmi=0.0;



  @override
  Widget build(BuildContext context) {
    TextEditingController weight = new TextEditingController();
    final textField1 =
    TextField(controller: weight,
      decoration: InputDecoration(
          labelText: "Enter weight in Kg",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),

      keyboardType: TextInputType.number,
    );

    TextEditingController height = new TextEditingController();
    final textField2 =
    TextField(controller: height,

      decoration: InputDecoration(
          labelText: "Enter height in meters",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      keyboardType: TextInputType.number,


    );


    TextEditingController gender =new TextEditingController();
    final textField3 = TextField(
      controller: gender,
      decoration: InputDecoration(
        labelText: "Enter your age",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    keyboardType: TextInputType.text,
      );


    String _bmi(){
      setState(() {



     double w = double.parse(weight.text);
    double h = double.parse(height.text);



    if
        ((weight.text.isNotEmpty || w > 0) &&
            (height.text.isNotEmpty || h > 0))
    {
      bmi = w/(h*h);
    }
    else
      {
      disp= "Error";
    }

    if(gender.text=="male" || gender.text=="Male") {
      if (double.parse(bmi.toStringAsFixed(1)) >= 30) {
        disp = "obese";
      }
      else if (double.parse(bmi.toStringAsFixed(1)) >= 25 &&
          double.parse(bmi.toStringAsFixed(1)) <= 29.9) {
        disp = "overweight";
      }

      else if (double.parse(bmi.toStringAsFixed(1)) >= 18 &&
          double.parse(bmi.toStringAsFixed(1)) <= 24.9) {
        disp = "normal";
      }
      else {
        disp = "underweight";
      }
    }

    else if(gender.text=="female" || gender.text== "Female") {
      if (double.parse(bmi.toStringAsFixed(1)) >= 30) {
        disp = "obese";
      }
      else if (double.parse(bmi.toStringAsFixed(1)) >= 24 &&
          double.parse(bmi.toStringAsFixed(1)) <= 29.9) {
        disp = "overweight";
      }

      else if (double.parse(bmi.toStringAsFixed(1)) >= 18.5 &&
          double.parse(bmi.toStringAsFixed(1)) <= 23.9) {
        disp = "normal";
      }
      else if  (double.parse(bmi.toStringAsFixed(1)) >= 16 &&
          double.parse(bmi.toStringAsFixed(1)) < 18.5) {
        disp = "having body mass deficit!!";
      }
      else{
        disp = "Malnutrinioned!!";
      }

    }

    });
      disp = "YOU ARE $disp";
          }



          void clear(){
      setState(() {

                  weight.clear();
                  height.clear();
                  disp="";
                  bmi=0.0;
      });}


    final button1 = RaisedButton(
        child: Text("ENTER"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blueAccent,
        splashColor: Colors.cyan,

        onPressed:(){
            _bmi();



        }
    );

    final button2 = RaisedButton(
        child: Text("CLEAR"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blueAccent,
        splashColor: Colors.cyan,

        onPressed:(){
          clear();



        }
    );






    return MaterialApp(
      home: Scaffold(body: Center(
        child: Container(padding: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              
                SizedBox(height: 30), textField3,

                SizedBox(height: 30), textField1,
                SizedBox(height: 30), textField2,
                Row(mainAxisAlignment:MainAxisAlignment.center,
                children:<Widget>[
                SizedBox(height: 30), button1,
                    SizedBox(height: 30), button2,
                ]),
                    SizedBox(height: 30), Text("YOUR BMI IS: "+ "$bmi"),
                //SizedBox(height: 30), Text( "$disp"),

      ]

          ),
        ),

      ),
        

        appBar: AppBar(
          title: Center(
              child: Text("BMI Calculator", textAlign: TextAlign.center)),
          backgroundColor: Colors.cyan, elevation: 10,
        ),
        backgroundColor: Colors.white,

        resizeToAvoidBottomPadding: false,

      ),

    );
  }

}








