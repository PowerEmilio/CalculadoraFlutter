import 'package:flutter/material.dart';

class ElevatedButtonEqualWidget extends StatelessWidget {

  final Icon icono;
  final function;
   
  const ElevatedButtonEqualWidget({Key? key,
      required this.icono,
      required this.function,
    }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.14,
      width: size.width * 0.50,
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
        child: icono,
      ),
    );
  }
}