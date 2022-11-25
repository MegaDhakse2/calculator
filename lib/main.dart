import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
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
  final inputControll1 = TextEditingController();

  String? pendingOperation;
  String? previousValue;
  int? resultValue;
  bool pressed = false;

  int totalValue = 0;
  List<int> inputList = [];

  void onNumberPress(String numberString) {
    setState(() {
      if (pressed == true) {
        inputControll1.text = '';
        pressed = false;
      }
      inputControll1.text = '${inputControll1.text}$numberString';
    });
  }

  void onOperationPress(String currentOperation) {

    pressed = true;

    if (pendingOperation == null) {
      pendingOperation = currentOperation;
      previousValue = inputControll1.text;
    } else {
      if (pendingOperation == "add") {
        resultValue =
            int.parse(previousValue ?? "") + int.parse(inputControll1.text);
        print("result: $resultValue");
      } else if (pendingOperation == "minus") {
        resultValue =
            int.parse(previousValue ?? "") - int.parse(inputControll1.text);
      } else if (pendingOperation == "multiply") {
        resultValue =
            int.parse(previousValue ?? "") * int.parse(inputControll1.text);
      } else if (pendingOperation == "devide") {
        resultValue =
            int.parse(previousValue ?? "") ~/ int.parse(inputControll1.text);
      }

      previousValue = "$resultValue";
      pendingOperation = currentOperation;

      inputControll1.text = previousValue??"";
    }
  }

  void clearAll() {
    inputList.clear();
    previousValue = '';
    pendingOperation = null;

    print(inputList);
  }

  void clearLast() {
    inputControll1.text =
        inputControll1.text.substring(0, inputControll1.text.length - 1);

    print(inputControll1.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.all(20),
              alignment: Alignment.topRight,
              // width:150 ,
              height: 100,
              child: SingleChildScrollView(
                child: Text(
                  inputList.join(' + '),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(end: 30),
              alignment: Alignment.topRight,
              // width:150 ,
              height: 100,
              child: Text(
                totalValue.toString(),
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: inputControll1,
                keyboardType: TextInputType.none,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: "Enter No.'s  here",
                  suffixIcon: IconButton(
                    onPressed: () {
                      clearLast();
                    },
                    alignment: Alignment.topRight,
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    onNumberPress('7');
                  },
                  child: const Text('7'),
                ),
                OutlinedButton(
                  onPressed: () {
                    onNumberPress('8');
                  },
                  child: const Text('8'),
                ),
                OutlinedButton(
                  onPressed: () {
                    onNumberPress('9');
                  },
                  child: const Text('9'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    onNumberPress('4');
                  },
                  child: const Text('4'),
                ),
                OutlinedButton(
                  onPressed: () {
                    onNumberPress('5');
                  },
                  child: const Text('5'),
                ),
                OutlinedButton(
                  onPressed: () {
                    onNumberPress('6');
                  },
                  child: const Text('6'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    onNumberPress('1');
                  },
                  child: const Text('1'),
                ),
                OutlinedButton(
                  onPressed: () {
                    onNumberPress('2');
                  },
                  child: const Text('2'),
                ),
                OutlinedButton(
                  onPressed: () {
                    onNumberPress('3');
                  },
                  child: const Text('3'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    onNumberPress('0');
                  },
                  child: const Text('0'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        totalValue = 0;
                        inputControll1.text = '';
                        clearAll();
                        inputList.clear();
                      },
                    );
                  },
                  child: const Text('Clear All'),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(
                      () {
                        // finall=sum();
                        onOperationPress("add");
                      },
                    );
                  },
                  tooltip: 'Add',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(
                      () {
                        onOperationPress("minus");
                      },
                    );
                  },
                  tooltip: 'minus',
                  child: const Text('-'),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     setState(
                //       () {
                //         resultAdd();
                //       },
                //     );
                //   },
                //   child: const Text('Result '),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
