import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordRepository {
  Future<Either<String, void>> sentOtp({required String email}) async {
    try {
      final _ = await FirebaseFunctions.instance
          .httpsCallable('sendOTP')
          .call({'email': email});
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(e.toString());
    }
  }
}
