class NewPasswordModel {
  late String email;
  late String password;
  NewPasswordModel({required this.email, required this.password});
  Map<String, dynamic> tojson() => <String, dynamic>{
        "email": email,
        "password": password,
      };
}
