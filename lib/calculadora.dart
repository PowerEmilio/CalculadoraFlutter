import 'package:flutter/material.dart';

import 'widgets/widgets.dart';



class CalculadoraScreen extends StatefulWidget {


  const CalculadoraScreen({Key? key,
  
  
  }) : super(key: key);

  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {

  List<dynamic> primerNumero = [''];
  List<dynamic> segundoNumero = [''];
  List<dynamic> operador = ['+', '+', '+'];
  bool operadorPuesto = false;
  bool primerPuntoPuesto = false;
  bool segundoPuntoPuesto = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _pantalla(context),
          _teclado(context),
        ],
      )
    );
  }

  Widget _pantalla (BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.30,
      decoration: const BoxDecoration(
        color: Color(0xFF111111),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(primerNumero.join(), style: const TextStyle(fontSize: 30, color: Colors.white),),
            Text(operador.last.toString(), style: const TextStyle(fontSize: 30, color: Colors.white),),
            Text(segundoNumero.join(), style: const TextStyle(fontSize: 30, color: Colors.white),)
          ]
        ),
      ),
    );
  }

  Widget _teclado (BuildContext context){

    final size = MediaQuery.of(context).size;

    return Container(
      color: const Color.fromARGB(255, 66, 66, 66),
      height: size.height * 0.70,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButtonDeleteWidget(
                icono: const Icon(Icons.close), 
                function: (){
                  setState(() {
                    borrarTodo();
                  });
                },
              ),
              
              ElevatedButtonOperador(
                operador: '%',
                function: (){
                  setState(() {
                    ponerOperador('%');
                  });
                }
              ),
              ElevatedButtonOperador(
                operador: '+',
                function: (){
                  setState(() {
                    ponerOperador('+');
                  });
                }
              ),

              
                
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
      
            children: [
              ElevatedButtonNumerico(
                numero: '1',
                function: (){
                  setState(() {
                  ponerNumero('1');
                });
                },
              ),

              ElevatedButtonNumerico(
                numero: '2',
                function: (){
                  setState(() {
                  ponerNumero('2');
                });
                },
              ),

              ElevatedButtonNumerico(
                numero: '3',
                function: (){
                  setState(() {
                  ponerNumero('3');
                });
                },
              ),

              ElevatedButtonOperador(
                operador: '-',
                function: (){
                  setState(() {
                    ponerOperador('-');
                  });
                }
              ),

              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
      
            children: [
              ElevatedButtonNumerico(
                numero: '4',
                function: (){
                  setState(() {
                  ponerNumero('4');
                });
                },
              ),

              ElevatedButtonNumerico(
                numero: '5',
                function: (){
                  setState(() {
                  ponerNumero('5');
                });
                },
              ),

              ElevatedButtonNumerico(
                numero: '6',
                function: (){
                  setState(() {
                  ponerNumero('6');
                });
                },
              ),

              ElevatedButtonOperador(
                operador: '*',
                function: (){
                  setState(() {
                    ponerOperador('*');
                  });
                }
              ),
              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
      
            children: [
              
              ElevatedButtonNumerico(
                numero: '7',
                function: (){
                  setState(() {
                  ponerNumero('7');
                });
                },
              ),

              ElevatedButtonNumerico(
                numero: '8',
                function: (){
                  setState(() {
                  ponerNumero('8');
                });
                },
              ),

              ElevatedButtonNumerico(
                numero: '9',
                function: (){
                  setState(() {
                  ponerNumero('9');
                });
                },
              ),

              ElevatedButtonOperador(
                operador: '/',
                function: (){
                  setState(() {
                    ponerOperador('/');
                  });
                }
              ),
              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
      
            children: [
              ElevatedButtonNumerico(
                numero: '.',
                function: (){
                  setState(() {
                  ponerPunto('.');
                });
                },
              ),

              ElevatedButtonNumerico(
                numero: '0',
                function: (){
                  setState(() {
                  ponerNumero('0');
                });
                },
              ),

              ElevatedButtonDeleteOneWidget(
                icono: const Icon(Icons.backspace_rounded),
                function: (){
                    setState(() {
                        teclaBorrar();
                      });
                  },
              ),

              ElevatedButtonEqualWidget(
                operador: '=',
                function: (){
                  setState(() {
                    calcularResultado();
                  });
                }
              )
            ],
          ),
        ],
      ),
    );
  }

  
  dynamic ponerNumero(String numero){

    if(operadorPuesto){ //Si el operador es true, el primer numero ya fue ingresado
      return segundoNumero.add(numero);
    } else{
      primerNumero.add(numero);
      return primerNumero;
    }

  }

  dynamic ponerOperador(String operadorIngresado){
    operadorPuesto = true;
    return operador.add(operadorIngresado);
  }

  dynamic ponerPunto(String punto){
    if (operadorPuesto) {
      if(!segundoPuntoPuesto){ //Si el operador es true, el primer numero ya fue ingresado
        segundoPuntoPuesto = true;
        segundoNumero.add(punto);
        return segundoNumero;
        
      } 
    } else{
      if(!primerPuntoPuesto){ //Si el operador es true, el primer numero ya fue ingresado
        primerPuntoPuesto = true;
        primerNumero.add(punto);
        return primerNumero;
      } 
    }
  }

  dynamic calcularResultado(){

    double primerNumeroResultado = 0;
    double segundoNumeroResultado = 0;

    if (operador.last == '+') {
      primerNumeroResultado = double.parse(primerNumero.join());
      segundoNumeroResultado = double.parse(segundoNumero.join());
      primerNumero.clear();
      segundoNumero.clear();
      primerNumero.add(primerNumeroResultado + segundoNumeroResultado);
      operadorPuesto = false;
      primerPuntoPuesto = false;
      segundoPuntoPuesto = false;
      return primerNumero.toString().split('');

    } else if (operador.last == '-') {
      primerNumeroResultado = double.parse(primerNumero.join());
      segundoNumeroResultado = double.parse(segundoNumero.join());
      primerNumero.clear();
      segundoNumero.clear();
      primerNumero.add(primerNumeroResultado - segundoNumeroResultado);
      operadorPuesto = false;
      primerPuntoPuesto = false;
      segundoPuntoPuesto = false;
      return primerNumero.toString().split('');

    } else if (operador.last == '*') {
      primerNumeroResultado = double.parse(primerNumero.join());
      segundoNumeroResultado = double.parse(segundoNumero.join());
      primerNumero.clear();
      segundoNumero.clear();
      primerNumero.add(primerNumeroResultado * segundoNumeroResultado);
      operadorPuesto = false;
      primerPuntoPuesto = false;
      segundoPuntoPuesto = false;
      return primerNumero.toString().split('');

    } else if (operador.last == '/') {
      primerNumeroResultado = double.parse(primerNumero.join());
      segundoNumeroResultado = double.parse(segundoNumero.join());
      primerNumero.clear();
      segundoNumero.clear();
      primerNumero.add(primerNumeroResultado / segundoNumeroResultado);
      operadorPuesto = false;
      primerPuntoPuesto = false;
      segundoPuntoPuesto = false;
      return primerNumero.toString().split('');

    } else if (operador.last == '%') {
      primerNumeroResultado = double.parse(primerNumero.join());
      segundoNumeroResultado = double.parse(segundoNumero.join());
      primerNumero.clear();
      segundoNumero.clear();
      primerNumero.add((primerNumeroResultado * segundoNumeroResultado) / 100 );
      operadorPuesto = false;
      primerPuntoPuesto = false;
      segundoPuntoPuesto = false;
      return primerNumero.toString().split('');
    }
  }

  dynamic borrarTodo(){
    primerNumero.clear();
    segundoNumero.clear();
    operador.clear();
    primerPuntoPuesto = false;
    segundoPuntoPuesto = false;
    operador.add('+');
  }

  dynamic teclaBorrar(){

    if (operadorPuesto) {
      return segundoNumero.remove(segundoNumero.last);
    } else{
      return primerNumero.remove(primerNumero.last);
    }

  }

  
}