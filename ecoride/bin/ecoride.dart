import 'dart:math';

import 'package:ecoride/models.dart';
import 'package:ecoride/user.dart';

void main() {

  List<Vehicle> flota = [
    Patinet()
      ..id = "P1"
      ..bateriaPercentatge = 85
      ..preuPerMinut = 0.15
      ..velocitatMaxima = 25,
    Patinet()
      ..id = "P2"
      ..bateriaPercentatge = 40
      ..preuPerMinut = 0.15
      ..velocitatMaxima = 20,
    Patinet()
      ..id = "P3"
      ..bateriaPercentatge = 15
      ..preuPerMinut = 0.12
      ..velocitatMaxima = 25,
    Cotxe()
      ..id = "C1"
      ..bateriaPercentatge = 90
      ..preuPerMinut = 0.35
      ..places = 5
      ..requereixLlicencia = true,
    Cotxe()
      ..id = "C2"
      ..bateriaPercentatge = 50
      ..preuPerMinut = 0.30
      ..places = 4
      ..requereixLlicencia = true,
  ];

  //Filtrar y mostrar Vehículo con bateria más alta de la lista
  Vehicle vehicleMaxBateria = flota.reduce((a, b) => 
    b.bateriaPercentatge > a.bateriaPercentatge ? b : a
  );      
    print('Vehicle amb la bateria més alta: $vehicleMaxBateria');

  //Subllista amb els vehicles d'na bateria superior al 20% i no estiguin en ús
  List<Vehicle> vehiclesDisponibles = flota.where((v) => 
    v.bateriaPercentatge > 20 && !v.enUs).toList();
      print('Vehicles disponibles: $vehiclesDisponibles');

  //Simulació d'ús
  User user = User.nou(
    id: "U1",
    nom: "Anna",
    correu: "anna@ecoride.com",
    saldo: 30.0,
  );
  
  //Seleccionamos el primer patinet disponible de la flota
  Patinet patinet = flota.firstWhere((v) => v is Patinet) as Patinet;

  //Calcul del cost
  double cost = patinet.calcularCostReserva(15, user);
    print('Cost de la reserva: $cost €');

  // Actualitzar ubicació 
  patinet.actualitzarUbicacio(41.3851, 2.1734);  

  //Actualizar ubicación y destructuración de Records
  var (lat, lng) = patinet.obtenirCoordenades();
    print('Latitud: $lat, Longitud: $lng');  


   // Maneig d'Errors: Recarga con saldo negativo y bloque try-catch
  try {
    user.recarregarSaldo(-10.0);
  } catch (e) {
    print('Error capturat amb èxit: $e');
  } 
}