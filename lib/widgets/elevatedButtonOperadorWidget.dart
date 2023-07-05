import 'package:flutter/material.dart';

class ElevatedButtonOperador extends StatelessWidget {

  final String operador;
  final function;
   
  const ElevatedButtonOperador({Key? key,
      required this.operador,
      required this.function
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
          backgroundColor: MaterialStatePropertyAll(Color.fromARGB(100, 255, 115, 0)),
          shape: MaterialStatePropertyAll(
            BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)
            )
          ),
        ),
        child: Text(operador, style: const TextStyle(fontSize: 30),),
      ),
    );
  }
  }
