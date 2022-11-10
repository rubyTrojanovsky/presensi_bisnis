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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
                        onPressed: buttonTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 29, 133, 69),
                        ),
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 10),
                            child: Center(child: Text(buttonDesc)),
                          ),
                        ),
                      ),
    );
  }
}