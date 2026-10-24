import 'package:flutter/material.dart';

class Contador1 extends StatelessWidget {
  const Contador1({super.key});

  @override
  Widget build(BuildContext context) {
    int contador = 0;

    return StatefulBuilder(
      builder: (context, actualizar) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Contador'),
            Text('$contador'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    actualizar(() {
                      contador--;
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    actualizar(() {
                      contador++;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContadorState();
  }
}

class _ContadorState extends State<Contador> {
  var contador = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Contador'),
        Text('$contador'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  contador--;
                  print('Contador: $contador');
                });
              },
              icon: const Icon(Icons.remove),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  contador++;
                  print('Contador: $contador');
                });
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
