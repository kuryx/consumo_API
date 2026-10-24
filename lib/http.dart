import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> main() async {
  final url =
      "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,precipitation,rain,wind_speed_10m&relative_humidity_2m,wind_speed_10m";

  final response = await http.get(Uri.parse(url));

  //print(response.body);
  //print('tipo de Body: ${response.body.runtimeType}');

  //final datos = jsonDecode(response.body);
  //print(datos);
  //print('tipo de datos: ${datos.runtimeType}');

  //final temperatura = datos['current']['temperature_2m'];
  //print('Temperatura actual: $temperatura °C');

  //final velocidadViento = datos['current']['wind_speed_10m'];
  //print('Velocidad del viento: $velocidadViento m/s');

  final datos = jsonDecode(response.body);

  final clima = Clima.fromJson(datos);
  
  clima.ImprimirClima();
}

class Clima {
  final fecha;
  final temperatura;
  final velocidadViento;
  final precipitacion;
  final lluvia;

  Clima({
    required this.fecha,
    required this.temperatura,
    required this.velocidadViento,
    required this.precipitacion,
    required this.lluvia,
  });

  factory Clima.fromJson(Map<String, dynamic> json) {
    final dato = json['current'];
    return Clima(
      fecha: dato['time'],
      temperatura: dato['temperature_2m'],
      velocidadViento: dato['wind_speed_10m'],
      precipitacion: dato['precipitation'],
      lluvia: dato['rain'],
    );
  }

  void ImprimirClima() {
    print('------Información del clima:-----');
    print('Fecha: $fecha');
    print('Temperatura actual: $temperatura °C');
    print('Velocidad del viento: $velocidadViento m/s');
    print('Precipitación: $precipitacion mm');
    print('Lluvia: $lluvia mm');
    print('----------------------------------');
  }
}
