
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onBtnPressed;

  const Button({Key? key,required this.onBtnPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Color(0xff00acee),
      child: MaterialButton(
        onPressed:onBtnPressed(),
        minWidth: 200,
        height: 20,
        child: Text(
          'Tweet',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
