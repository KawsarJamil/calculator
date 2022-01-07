import 'package:flutter/material.dart';

void main() {
  runApp(
    Myapp(),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  var output = '0';
  var _output = '0';
  var num1 = 0.0;
  var num2 = 0.0;
  var operand = "";

  void operation(String txt) {
    if (txt == 'C') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (txt == '+' || txt == '-' || txt == '*' || txt == '/') {
      num1 = double.parse(output);
      operand = txt;
      _output = '0';
    } else if (txt == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      } else if (operand == '-') {
        _output = (num1 - num2).toString();
      } else if (operand == '*') {
        _output = (num1 * num2).toString();
      } else if (operand == '/') {
        _output = (num1 / num2).toString();
      }
    } else {
      _output = _output + txt;
    }
    setState(() {
      output = double.parse(_output).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 8),
                child: Text(
                  "$output",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                custombutton('1'),
                SizedBox(width: 5),
                custombutton('2'),
                SizedBox(width: 5),
                custombutton('3'),
                SizedBox(width: 5),
                custombutton('/'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                custombutton('4'),
                SizedBox(width: 5),
                custombutton('5'),
                SizedBox(width: 5),
                custombutton('6'),
                SizedBox(width: 5),
                custombutton('x'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                custombutton('7'),
                SizedBox(width: 5),
                custombutton('8'),
                SizedBox(width: 5),
                custombutton('9'),
                SizedBox(width: 5),
                custombutton('-'),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                custombutton('0'),
                SizedBox(width: 5),
                custombutton('C'),
                SizedBox(width: 5),
                custombutton('='),
                SizedBox(width: 5),
                custombutton('+'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget custombutton(String txt) {
    return Expanded(
      child: RawMaterialButton(
        shape: Border.all(color: Colors.black, width: 2),
        fillColor: Colors.black12,
        onPressed: () {
          setState(() {
            operation(txt);
          });
        },
        padding: EdgeInsets.all(20),
        child: Text(
          "$txt",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900, fontSize: 25),
        ),
      ),
    );
  }
}

// class custombutton extends StatelessWidget {
//   final String txt;
//   final Function(String) operation;
//   const custombutton({Key? key, required this.txt, required this.operation})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: RawMaterialButton(
//         shape: Border.all(color: Colors.black, width: 2),
//         fillColor: Colors.black12,
//         onPressed: () {
//           operation(txt);
//         },
//         padding: EdgeInsets.all(20),
//         child: Text(
//           "$txt",
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.w900, fontSize: 25),
//         ),
//       ),
//     );
//   }
// }
