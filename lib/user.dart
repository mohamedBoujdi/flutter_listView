class User {
  String _gender;
  String _name;
  String _email;
  String _phone;
  String _picSmall;
  String _picLarge;

  User(this._gender, this._name, this._email, this._phone, this._picSmall,this._picLarge);

  String get picLarge => _picLarge;

  set picLarge(String value) {
    _picLarge = value;
  }

  String get picSmall => _picSmall;

  set picSmall(String value) {
    _picSmall = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }
}
