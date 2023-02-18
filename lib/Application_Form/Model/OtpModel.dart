class Otp {
  late String email;
  late String otp;
  Otp({required this.email, required this.otp});
  Map<String, dynamic> tojson() => <String, dynamic>{
        "email": email,
        "otp": otp,
      };
}
