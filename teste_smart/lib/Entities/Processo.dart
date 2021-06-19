class Processo{

  String _id;
  String _numero;
  String _nomeMarca;
  String _despacho;
  String _palavraChave;
  String _processoCompleto;


  Processo(this._id, this._numero, this._nomeMarca, this._despacho,
      this._palavraChave, this._processoCompleto);

  String get numero => _numero;

  set numero(String value) {
    _numero = value;
  }

  String get processoCompleto => _processoCompleto;

  set processoCompleto(String value) {
    _processoCompleto = value;
  }

  String get palavraChave => _palavraChave;

  set palavraChave(String value) {
    _palavraChave = value;
  }

  String get despacho => _despacho;

  set despacho(String value) {
    _despacho = value;
  }

  String get nomeMarca => _nomeMarca;

  set nomeMarca(String value) {
    _nomeMarca = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}