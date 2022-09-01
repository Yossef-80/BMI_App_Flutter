import 'package:flutter/material.dart';

class TheResult extends StatelessWidget{
  const TheResult({Key? key, required this.genderMale, required this.age, required this.weight, required this.result}) : super(key: key);
  final bool genderMale;
  final int age;
  final int weight;
  final double result;
  String get resultPhrase{
    String resultText="";
    if(result<=18.5)
      {
        resultText="UnderWeight";
      }
    else if(result<=24.9&&result>18.5)
      {
        resultText="Normal";
      }
    else if(result>=25&&result<=29.9)
      {
        resultText="OverWeight";
      }
    else{
      resultText="Obese";
    }

    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(centerTitle: true,title: const Text("Results",),),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              Text("Gender: ${genderMale?"Male":"Female"}",style: Theme.of(context).textTheme.headline6),
              Text("Weight: $weight",style: Theme.of(context).textTheme.headline6,),
              Text("Age: $age",style: Theme.of(context).textTheme.headline6,),
              Text("Result: ${result.toStringAsFixed(2)}",style: Theme.of(context).textTheme.headline6,),
              Text("Fitness: $resultPhrase",style: Theme.of(context).textTheme.headline6,),

            ],
          ),
        ),
      )
    );
  }

}