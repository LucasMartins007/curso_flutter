class ProcessoVerificado{

  String _id;
  String _DataVerificacao;
  String _numero_processo;
  String _idUsuario;

  ProcessoVerificado(
      this._id, this._DataVerificacao, this._numero_processo, this._idUsuario);

  String get idUsuario => _idUsuario;

  set idUsuario(String value) {
    _idUsuario = value;
  }

  String get numero_processo => _numero_processo;

  set numero_processo(String value) {
    _numero_processo = value;
  }

  String get DataVerificacao => _DataVerificacao;

  set DataVerificacao(String value) {
    _DataVerificacao = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}