import 'package:ecoride/user.dart';

mixin GPSLocation {
  double latitud = 0.0;
  double longitud = 0.0;

  // Método que actualiza ubicación
  void actualitzarUbicacio(double lat, double lng) {
    latitud = lat;
    longitud = lng;
  }

  // Método que obtiene coordinadas y devuelve Record
  (double, double) obtenirCoordenades() {
    return (latitud, longitud);
  }
}

abstract class Vehicle with GPSLocation {
  late String id;
  late int bateriaPercentatge;
  bool enUs = false;
  late double preuPerMinut;

  //Método que devuelve estado de bateria
  String estatBateria() {
    late String estat;

    switch (bateriaPercentatge) {
      case >= 80:
        estat = "Alta";
        break;
      case >= 20:
        estat = "Mitjana";
        break;
      case < 20:
        estat = "Crítica (Requereix càrrega)";
        break;
      default:
        estat = "Desconegut";
    }
    return estat;
  }

  //Método abstracto
  double calcularCostReserva(int minuts, User user);
}

class Patinet extends Vehicle {
  late int velocitatMaxima;

  @override
  double calcularCostReserva(int minuts, User user) {
    late double preu;
    double preuBase = minuts * preuPerMinut;
    bool esVIP = false;

    if (user.esVIP) {
      double descompte = preuBase * 10 / 100;
      preu = preuBase - descompte;
    } else if (!user.esVIP) {
      preu = preuBase;
    }
    return preu;
  }
}
