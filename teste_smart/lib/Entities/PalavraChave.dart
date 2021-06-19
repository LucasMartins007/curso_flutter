class PalavraChave{

  String _id;
  String _palavraChav;
  String _idUsuario;

  PalavraChave(this._id, this._palavraChav, this._idUsuario);

  String get idUsuario => _idUsuario;

  set idUsuario(String value) {
    _idUsuario = value;
  }

  String get palavraChav => _palavraChav;

  set palavraChav(String value) {
    _palavraChav = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}