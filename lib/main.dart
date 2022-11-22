import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main()
{
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'calci',
      home: Calci(),
    );
  }
}
class Calci extends StatefulWidget {
  const Calci({Key? key}) : super(key: key);

  @override
  State<Calci> createState() => _CalciState();
}

class _CalciState extends State<Calci> {
  final inputcontroll1=TextEditingController();
  final inputcontroll2=TextEditingController();
  int input1=0;
  int input2=0;
  int finall= 0;
  int sum(){
    int num1=int.parse(inputcontroll1.text);
    int num2=int.parse(inputcontroll2.text);
    return num1 + num2;
  }
  int sub(){
    int num1=int.parse(inputcontroll1.text);
    int num2=int.parse(inputcontroll2.text);
    return num1 - num2;
  }
  int mul(){
    int num1=int.parse(inputcontroll1.text);
    int num2=int.parse(inputcontroll2.text);
    return num1 * num2;
  }
  int div(){
    int num1=int.parse(inputcontroll1.text);
    int num2=int.parse(inputcontroll2.text);
    return (num1 ~/ num2).floor();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('calculator'),
          ),
          body:Column(
            children:  [
              Container(
                alignment: Alignment.topRight,
                // width:150 ,
                height: 100,
                child: Text(finall.toString(), textDirection: TextDirection.rtl),
              ),

               TextFormField(
                controller: inputcontroll1,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  hintText: 'input field 1',
                ),
                // child: Text(input1.toString()),
              ),
              TextFormField(
                controller: inputcontroll2 ,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  hintText: 'input field 2',
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                        input1=7;
                    });
                  },
                  child: const Text('7'),
              ),
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                        input1=8;
                    });
                  },
                  child: const Text('8'),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    input1=9;
                  });
                },
                child: const Text('9'),
              ),
                  FloatingActionButton(
                    onPressed: () {
                      setState((){
                        finall=mul();
                      },
                      );
                    },
                    tooltip: 'Multiply',
                    child: const Text('X'),// child:Text(),
                  ),
            ],
          ),
              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        input1=4;
                      });
                    },
                    child: const Text('4'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        input1=5;
                      });
                    },
                    child: const Text('5'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        input1=6;
                      });
                    },
                    child: const Text('6'),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState((){
                        finall=sub();
                      },
                      );
                    },
                    tooltip: 'Subtract',
                    child: const Text('-'),// child:Text(),
                  ),
                ],
              ),
              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        input1=1;
                      });
                    },
                    child: const Text('1'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        input1=2;
                      });
                    },
                    child: const Text('2'),
                  ),OutlinedButton(
                    onPressed: () {
                      setState(() {
                        input1=3;
                      });
                    },
                    child: const Text('3'),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState((){
                        finall=sum();
                      },
                      );
                    },
                    tooltip: 'Add',
                    child: const Icon(Icons.add),// child:Text(),
                  ),
                ],
              ),
              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        input1=0;
                      });
                    },
                    child: const Text('0'),
                  ),


                  ElevatedButton(
                    onPressed: () {
                      setState((){
                        finall=0;
                      },
                      );
                    },
                    child: const Text('Clear'),// child:Text(),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState((){
                        finall=div();
                      },
                      );
                    },
                    tooltip: 'Divide',
                    child: const Text('/'),// child:Text(),
                  ),
                ],
              ),

            ],
          ),
        ),
    );
  }



}

