import 'package:flutter/material.dart';
import 'package:all_sensors/all_sensors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: changuito(),
  ));
}

class changuito extends StatefulWidget {
  @override
  _ChanguitoState createState() => _ChanguitoState();
}

class _ChanguitoState extends State<changuito> {
  String chango =
      "https://www.gifsanimados.org/data/media/180/mono-imagen-animada-0286.gif";
  List<double> posicion = [0.0, 0.0, 0.0];
  double opacity_chango = 1.0;
  double X = 100, Y = 100;
  var coordenadas = [0, 0];
  bool changoSet = false;
  bool inicio = false;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      setState(() {
        posicion = [event.x, event.y, event.z];
        if (event.y > .5 && Y < 700) {
          Y += 6;
        } else if (event.y < -.5 && Y > 70) {
          Y -= 6;
        }
        if (event.x < -.5 && X < 320) {
          X += 6;
        } else if (event.x > .5 && X > 10) {
          X -= 6;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: 800,
          height: 800,
          child: const DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://image.winudf.com/v2/image/Y29tLkp1bmdsZVdMUFBfc2NyZWVuXzJfMTUxMjAxODYwN18wMzk/screen-2.jpg?fakeurl=1&type=.jpg")),
            ),
          ),
        ),
        Positioned(
          left: X,
          //top: Y, //Para que se mueva por toda la pantalla utiliza esta opcíon
          top: 100,  //solo se mueve de derecha a izquierda
          child: Opacity(
            opacity: opacity_chango,
            child: ClipOval(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(chango),
                )),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
