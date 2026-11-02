class User {
  late String _id;
  late String _nomComplet;
  late String correu;
  late double _saldo;
  bool esVIP = false;

  //Constructor nombrat
  User.nou({
    required String id,
    required String nom,
    required this.correu,
    double saldo = 0.0,
  }) {
    _id = id;
    _nomComplet = nom;
    correu = correu;
    _saldo = saldo;
  }

  //Constructor complet
  User(this._id, this._nomComplet, this._saldo, this.correu, this.esVIP);

  //Getter per a saldo i id
  String get id => _id;
  double get saldo => _saldo;
  String get nomComplet => _nomComplet;

  //Mètode recarregarSaldo(double quantitat) amb un ArgumentError
  double recarregarSaldo(double quantitat) {
    if (quantitat <= 0) {
      throw ArgumentError('No permet quantitats negatives o zero');
    }
    _saldo += quantitat;
    return _saldo;
  }
}
