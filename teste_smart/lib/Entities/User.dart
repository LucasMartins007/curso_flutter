class User {
  int _id;
  String _name;
  String _email;
  String _password;
  String _empresa;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get empresa => _empresa;

  set empresa(String value) {
    _empresa = value;
  }

  String get email => _email;

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  set email(String value) {
    _email = value;
  }
}
