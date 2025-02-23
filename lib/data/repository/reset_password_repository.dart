import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordRepository {
  Future<Either<String, void>> sentResetPasswordLink(
      {required String email}) async {
    try {
      final _ =
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right(null); // Success case
    } on FirebaseFunctionsException catch (e) {
      // Catch specific Firebase Functions errors
      return Left('Firebase Function error: ${e.message}');
    } on FirebaseException catch (e) {
      // Catch Firebase related exceptions
      return Left('Firebase Exception: ${e.message}');
    } catch (e) {
      return Left('Unknown error: $e');
    }
  }
}
