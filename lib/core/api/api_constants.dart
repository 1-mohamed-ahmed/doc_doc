class ApiConstants {
  // here are all endPoints and base url
  static const String baseUrl = "https://vcare.integration25.com/api/";
  // Authantication endPoint
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String logout = "auth/logout";

  // Home endPoint
  static const String getHomeDoctors = "home/index"; // the doctors in home page
  static const String getAllDoctors = "doctor/index"; // all doctors in api
  static const String getAllSpecialization =
      "specialization/index"; // all specialization
  static const String filterDoctorsById = "specialization/show/";

  // user endPoint
  static const String getProfile = "user/profile";
  static const String updateProfile = "user/update";
}

class ApiErrors {
  static const String badRequestError = "badRequest Error";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbidden Error";
  static const String unauthorizedError = "unauthorized User";
  static const String notFoundError = "User not Found";
  static const String conflictError = "conflict Error";
  static const String internalServerError = "internal Server Error";
  static const String unknownError = "unknown Error";
  static const String timeoutError = "timeout Error";
  static const String defaultError = "No internet connection";
  static const String cacheError = "cache Error";
  static const String noInternetError = "NoInternet Error";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
