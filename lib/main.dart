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

  final inputControll1=TextEditingController();
  final inputControll2=TextEditingController();
  List<int> input=[];
  int finall= 0;
  List<int> list =[];
   String dum = '';

  void lists(){
    int val = int.parse(inputControll1.text);
    list.add(val);
    input=list;
    // print('${list}');
    for(var i=0; i<list.length;i++)
      {
        print(list.join(' + '));
        // print(list.toString()
        // .replaceAll(',', ' +')
        // .replaceAll('[', '')
        // .replaceAll(']', '')
        // )
      }

  }
    void result(){
      var sum = 0;
      for(var i=0; i<list.length; i++){
        sum=sum-list[i];
      }
      finall=sum;
      print(sum);
    }

     void clearAll(){
    list=[];
    print(list);
     }
     void clear(){
      dum = inputControll1.text;
      dum = dum.substring(0,dum.length-1);
      inputControll1.text=dum;

      print(dum);
     }



  int sum(){
    int num1 = int.parse(inputControll1.text);
    inputControll1.text='';

    return 0;
  }

  int sub(){
    int num1=int.parse(inputControll1.text);
    int num2=int.parse(inputControll2.text);
    return num1 - num2;
  }
  int mul(){
    int num1=int.parse(inputControll1.text);
    int num2=int.parse(inputControll2.text);
    return num1 * num2;
  }
  int div(){
    int num1=int.parse(inputControll1.text);
    int num2=int.parse(inputControll2.text);
    return (num1 ~/ num2).floor();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('calculator'),
          ),
          body:Column(
            children:  [
              Container(
                alignment: Alignment.topRight,
                // width:150 ,
                height: 100,
                child: Text(input.join(' + '),
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                ),

              ), Container(
                alignment: Alignment.topRight,
                // width:150 ,
                height: 100,
                child: Text(finall.toString(),
                  style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                    backgroundColor: Colors.grey,
                ),),

              ),


               Container(
                 padding: const EdgeInsets.all(20),
                 child: TextFormField(
                   controller: inputControll1,
                  keyboardType: TextInputType.none,
                   // decoration: const InputDecoration(
                   //   suffixIcon:Icon(Icons.arrow_back_rounded),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration:  InputDecoration(
                    hintText: 'input field 1',
                    suffixIcon: IconButton(
                      onPressed: () {
                        clear();
                      },
                      alignment: Alignment.topRight,
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),

                  ),
                  // child: Text(input1.toString()),
              ),
               ),

              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                        // inputcontroll1.text='7' ;
                        inputControll1.text = '${inputControll1.text}7' ;
                    });
                  },
                  child: const Text('7'),
              ),
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      inputControll1.text = '${inputControll1.text}8' ;
                    });
                  },
                  child: const Text('8'),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    inputControll1.text= '${inputControll1.text}9';
                  });
                },
                child: const Text('9'),
              ),
                  // FloatingActionButton(
                  //   onPressed: () {
                  //     setState((){
                  //       finall=mul();
                  //     },
                  //     );
                  //   },
                  //   tooltip: 'Multiply',
                  //   child: const Text('X'),// child:Text(),
                  // ),
            ],
          ),
              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        inputControll1.text = '${inputControll1.text}4';
                      });
                    },
                    child: const Text('4'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        inputControll1.text = '${inputControll1.text}5';

                      });
                    },
                    child: const Text('5'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        inputControll1.text = '${inputControll1.text}6';

                      });
                    },
                    child: const Text('6'),
                  ),
                  // FloatingActionButton(
                  //   onPressed: () {
                  //     setState((){
                  //       finall=sub();
                  //     },
                  //     );
                  //   },
                  //   tooltip: 'Subtract',
                  //   child: const Text('-'),// child:Text(),
                  // ),
                ],
              ),
              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        inputControll1.text = '${inputControll1.text}1';

                      });
                    },
                    child: const Text('1'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        inputControll1.text = '${inputControll1.text}2';

                      });
                    },
                    child: const Text('2'),
                  ),OutlinedButton(
                    onPressed: () {
                      setState(() {
                        inputControll1.text = '${inputControll1.text}3';

                      });
                    },
                    child: const Text('3'),
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
                        inputControll1.text = '${inputControll1.text}0';

                      });
                    },
                    child: const Text('0'),
                  ),
                  ],
              ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  ElevatedButton(
                    onPressed: () {
                      setState((){
                        finall=0;
                        inputControll1.text='';
                        clearAll();
                        input=[];
                      },
                      );
                    },
                    child: const Text('Clear All'),// child:Text(),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState((){
                        // finall=sum();
                        lists();
                        inputControll1.text = '';

                      },
                      );
                    },
                    tooltip: 'Add',
                    child: const Icon(Icons.add),// child:Text(),
                  ),
                  // FloatingActionButton(
                  //   onPressed: () {
                  //     setState((){
                  //       finall=div();
                  //     },
                  //     );
                  //   },
                  //   tooltip: 'Divide',
                  //   child: const Text('/'),// child:Text(),
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      setState((){
                          result();
                      },
                      );
                    },
                    child: const Text('Result '),// child:Text(),
                  ),
                ],
              ),

            ],
          ),
        ),
    );
  }



}

