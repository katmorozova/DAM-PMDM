class User {
  late String _id, _nomComplet, correu;
  late double _saldo;
  bool esVIP = false;

  //Constructor nombrat
  User.nou({
    required String id,
    required String nom,
    required String correu,
    double saldo = 0.0,
  }) {
    this._id = id;
    this._nomComplet = nom;
    this.correu = correu;
    this._saldo = saldo;
  }

  //Constructor complet
  User(this._id, this._nomComplet, this._saldo, this.correu, this.esVIP);

  //Getter per a saldo i id
  String get id => _id;
  double get saldo => _saldo;

  //Mètode recarregarSaldo(double quantitat) amb un ArgumentError
  double recarregarSaldo(double quantitat) {
    if (quantitat <= 0) {
      throw ArgumentError('No permet quantitats negatives o zero');  
    } 
    _saldo += quantitat;
    return _saldo;
  }
}
