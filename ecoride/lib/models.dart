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
