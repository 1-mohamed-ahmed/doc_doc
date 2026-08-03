import 'package:firebase_core/firebase_core.dart';
import 'package:doc_doc/core/networking/error_model.dart';

class FirebaseErrorHandler {
  static ErrorModel handle(FirebaseException error) {
    switch (error.code) {
      // Auth Errors
      case "user-not-found":
        return ErrorModel(
          code: 404,
          message: "No user found with this email address.",
        );
      case "wrong-password":
        return ErrorModel(
          code: 400,
          message: "Incorrect password. Please try again.",
        );
      case "invalid-credential":
        return ErrorModel(
          code: 400,
          message: "Invalid email or password. Please check your credentials.",
        );
      case "email-already-in-use":
        return ErrorModel(
          code: 409,
          message: "An account already exists with this email address.",
        );
      case "invalid-email":
        return ErrorModel(
          code: 400,
          message: "Please enter a valid email address.",
        );
      case "user-disabled":
        return ErrorModel(
          code: 403,
          message: "This account has been disabled. Please contact support.",
        );
      case "too-many-requests":
        return ErrorModel(
          code: 429,
          message: "Too many failed attempts. Please try again later.",
        );
      case "network-request-failed":
        return ErrorModel(
          code: -6,
          message: "Network error. Please check your internet connection.",
        );
      case "requires-recent-login":
        return ErrorModel(
          code: 403,
          message:
              "This action requires you to log in again for security reasons.",
        );
      case "weak-password":
        return ErrorModel(message: "The password provided is too weak.");

      // Database / Firestore Errors
      case "permission-denied":
        return ErrorModel(
          message: "You do not have permission to perform this action.",
        );
      case "not-found":
        return ErrorModel(
          code: 404,
          message: "The requested item could not be found.",
        );
      case "already-exists":
        return ErrorModel(code: 409, message: "This entry already exists.");
      case "unavailable":
        return ErrorModel(
          code: 503,
          message:
              "Service is temporarily unavailable. Please try again later.",
        );

      default:
        return ErrorModel(
          code: -7,
          message: "An unexpected error occurred. Please try again.",
        );
    }
  }
}
