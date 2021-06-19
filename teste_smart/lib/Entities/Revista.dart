class Revista{

  String _id;
  String _number;
  String _idEmpresa;

  Revista(this._id, this._number, this._idEmpresa);

  String get idEmpresa => _idEmpresa;

  set idEmpresa(String value) {
    _idEmpresa = value;
  }

  String get number => _number;

  set number(String value) {
    _number = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}