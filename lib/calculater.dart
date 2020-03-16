import 'package:flutter/material.dart';

class Calculater extends StatefulWidget {
  @override
  _CalculaterState createState() => _CalculaterState();
}

class _CalculaterState extends State<Calculater> {

  //TextEditingController output = new TextEditingController();
  String result = "0";
  String output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = " ";

  buttonpressed(String text){

      

      if(text == "CLEAR")
    {
      output = "0";
       num1 = 0.0;
       num2 = 0.0;
       operand = " ";
       result = "0";
    }
    else
    if(text == "/" || text== "X" || text == "+" || text == "-"){
      
      num1 = double.parse(result);
      operand = text;
      result = num2.toString() ;
      
    }
    else if(text == "DEL")
    {

    }
    else if(text == "."){

      if(result.contains(".")){
        print("Already conatains a decimals");
        return;

      } else {
        result = result + text;
      }
    }
    else if(text == "="){
      
      
      if(operand == "+"){
        result = (num1 + num2).toString();
      }
      else if(operand == "-"){
        result = (num1 - num2).toString();
      }
      else if(operand == "/"){
        result = (num1 / num2).toString();
      }
      else if(operand == "X"){
        result = (num1 * num2).toString();
      }
      num2 = 0.0;
      operand = " ";
    }
    else{
      
        result = text;
        num2 = double.parse(result);
      
      
    }
    
    

    setState(() {
      output = double.parse(result).toStringAsFixed(2);
    });

  }

  Widget buildButton(String buttonText){
    return RaisedButton(
      onPressed: (){
        buttonpressed(buttonText);
      },
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20.0,color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(12.0),
          side: BorderSide(color: Colors.black) ),
        color: Colors.grey[700],
        elevation: 2.0,
        padding: EdgeInsets.all(20.0),
        
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Container(
                  color:Colors.black ,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(vertical:35.0),
                    child: Text(
                      output,
                      style: TextStyle(fontSize: 40.0,color: Colors.white),),
                  ),
                  
                ),
                // Container(
                //   alignment: Alignment.centerRight,
                //     child: Text(
                //       result,
                //       style: TextStyle(fontSize: 30.0,color: Colors.white),),
                  

                // ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.black,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child:Container(
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(flex:1,child:buildButton('7')),
                          Expanded(flex:1,child:buildButton('8')),
                          Expanded(flex:1,child:buildButton('9')),
                          Expanded(flex:1,child:buildButton('DEL')),

                        ],
                      )
                    ),
                    ),
                    Expanded(
                    flex: 1,
                    child:Container(
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(flex:1,child:buildButton('4')),
                          Expanded(flex:1,child:buildButton('5')),
                          Expanded(flex:1,child:buildButton('6')),
                          Expanded(flex:1,child:buildButton('X')),

                        ],
                      )
                    ),
                    ),
                    Expanded(
                    flex: 1,
                    child:Container(
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(flex:1,child:buildButton('1')),
                          Expanded(flex:1,child:buildButton('2')),
                          Expanded(flex:1,child:buildButton('3')),
                          Expanded(flex:1,child:buildButton('-')),

                        ],
                      )
                    ),
                    ),
                    Expanded(
                    flex: 1,
                    child:Container(
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(flex:1,child:buildButton('.')),
                          Expanded(flex:1,child:buildButton('0')),
                          Expanded(flex:1,child:buildButton('/')),
                          Expanded(flex:1,child:buildButton('+')),

                        ],
                      )
                    ),
                    ),
                    Expanded(
                    flex: 1,
                    child:Container(
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(flex:1,child:buildButton('CLEAR')),
                          Expanded(flex:1,child:buildButton('=')),
                         

                        ],
                      )
                    ),
                    )
                ],
              ),
          ),
         )
        ],
      ),
    );
  }
}