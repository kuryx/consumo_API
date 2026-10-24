import 'package:consumo_api/consulda_api.dart';
import 'package:flutter/material.dart';

class DashboardApi extends StatefulWidget {
  const DashboardApi({super.key});

  @override
  State<DashboardApi> createState() => _DashboardApiState();
}

class _DashboardApiState extends State<DashboardApi> {
  Clima? clima;

  @override
  void initState() {
    super.initState();
    actualizarClima();
  }

  Future<void> actualizarClima() async {
    final resultado = await getClima();
    if (!mounted) return;
    setState(() => clima = resultado);
  }

  @override
  Widget build(BuildContext context) {
    if (clima == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Temperatura: ${clima!.temperatura} °C'),
          Text('Viento: ${clima!.velocidadViento} km/h'),
          Text('Precipitación: ${clima!.precipitacion} mm'),
          Text('Lluvia: ${clima!.lluvia} mm'),
          Text('Fecha: ${clima!.fecha}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: actualizarClima,
            child: const Text('Actualizar clima'),
          ),
        ],
      ),
    );
  }
}
