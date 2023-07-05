import 'package:flutter/material.dart';

class ElevatedButtonEqualWidget extends StatelessWidget {

  final String operador;
  final function;
   
  const ElevatedButtonEqualWidget({Key? key,
      required this.operador,
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
          backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 5, 139, 0)),
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