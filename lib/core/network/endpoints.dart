enum EndPoints {
  register,
  detail,
  refreshToken,
  logout,
  getDirection,
  sms,
}

extension Url on EndPoints {
  static String? baseUrl = "https://6137-41-81-129-65.ngrok-free.app/api/v1/";

  String get url {
    switch (this) {
      case EndPoints.register:
        return "$baseUrl/patients/add-patient/";
      case EndPoints.detail:
        return "$baseUrl/patients/patient-detail/";
      case EndPoints.logout:
        return "$baseUrl/auth/logout/";

      default:
        throw Exception('Url not set');
    }
  }
}
