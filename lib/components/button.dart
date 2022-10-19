import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({ Key? key,
  required this.buttonTap,
  required this.buttonDesc,}
  ) : super(key: key);

  final VoidCallback? buttonTap;
  final String buttonDesc;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                      onPressed: buttonTap,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange[700],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(12.0),
                        //   child: SizedBox(
                        //       height: 35,
                        //       width: 35,
                        //       ),
                        // ),
                        Text(buttonDesc),
                      ]),
                    );
  }
}