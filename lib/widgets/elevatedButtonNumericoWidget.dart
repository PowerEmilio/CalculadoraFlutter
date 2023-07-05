import 'package:flutter/material.dart';

class ElevatedButtonNumerico extends StatelessWidget {

   
  final String numero;
  final function;


  const ElevatedButtonNumerico({Key? key,
    required this.numero,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return SizedBox(
      height: size.height * 0.14,
      width: size.width * 0.25,
      child: ElevatedButton(
        onPressed: function,
        style: const ButtonStyle(
          shape: MaterialStatePropertyAll(
            BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)
            )
          ),
          backgroundColor: MaterialStatePropertyAll(Color(0xFF111111)),
        ),
        child: Text(numero, style: const TextStyle(fontSize: 30),),
      ),
    );
  }
}