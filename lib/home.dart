

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'result.dart';
class HomePage extends StatefulWidget{
  const HomePage({Key?key}):super(key:key);

  @override
  State<StatefulWidget> createState()=>_HomePageState();


}

class _HomePageState extends State<HomePage>{
  bool isMale=false;
  int age=18;
  int weight=55;
  double height=1.66;



  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("BMI"),centerTitle: true,),
        body: SafeArea(
          child:Column( children:[Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
                child:Row(
                  children: [
                    genderWidget(context,"Male"),
                    const SizedBox(width:10,),
                    genderWidget(context,"Female"),
                  ],
                )

            ),
          ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeightWidget(context),
            ))
             ,Expanded(
             child: Padding(
                padding: const EdgeInsets.all(8),
                child:Row(
                  children: [
                    weightAndAge(context,"Age"),
                    const SizedBox(width:10,),
                    weightAndAge(context,"Weight"),
                  ],
                )

              ),
              ),
          Container(
            color: Theme.of(context).primaryColor,
              width: double.infinity,
              height: MediaQuery.of(context).size.height/13,
              child: TextButton(onPressed: gotoResult, child:  Text("Calculate",style:Theme.of(context).textTheme.headline5,),))],
          )
          
        ),
      );
  }
  Expanded genderWidget(BuildContext context,String type)
  {
    return Expanded(
      child: GestureDetector(
        onTap: (){setState(() {
          type=="Male"? isMale=true:isMale=false;
        });}
        ,
        child: Container(
          decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(10),
              color: (isMale&&type=="Male")||(isMale==false&&type=="Female")? Colors.blueAccent:Colors.blueGrey
          ),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Icon(type=="Male"?Icons.male:Icons.female),
              const SizedBox(height: 15,),
              Text(type,style: Theme.of(context).textTheme.headline6,)

            ],
          ),
        ),
      ),
    );
  }

  Expanded weightAndAge(BuildContext context,String AgeOrWeight) {

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(10),
            color: Theme.of(context).primaryColor
        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(AgeOrWeight,style: Theme.of(context).textTheme.headline6,),
            const  SizedBox(height: 10,),
            Text(AgeOrWeight=="Age"?age.toString():weight.toString(),style: Theme.of(context).textTheme.headline6,),
            const  SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(heroTag: null,backgroundColor: Colors.red.shade300,onPressed: (){setState(() {AgeOrWeight=="Age"?age--:weight--;});},child:const Icon(Icons.remove,size: 30)),
                FloatingActionButton( heroTag: null,backgroundColor: Colors.green.shade300,onPressed: (){setState(() {AgeOrWeight=="Age"?age++:weight++;});},child:const Icon(Icons.add,size: 30)),
              ],
            ),

          ],
        ),
      ),
    );

  }
  Container HeightWidget(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(10),
          color: Theme.of(context).primaryColor
      ),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text("Height",style: Theme.of(context).textTheme.headline6,),
          const  SizedBox(height: 10,),
          Text("${height.toStringAsFixed(2)} m",style: Theme.of(context).textTheme.headline6,),
          const  SizedBox(height: 10,),
          Slider(value: height,onChanged: (value) {
              setState(() {
                height=value;
              });
          },min: 0.2,activeColor: Colors.lightBlue
              .shade300,thumbColor: Colors.white,max: 2.5,inactiveColor: Colors.black38,)

        ],
      ),
    );
  }
   void gotoResult()
  {
    double result=weight/pow(height,2);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return TheResult(age: age,genderMale: isMale,result: result,weight: weight);
    }
    ));
  }


}