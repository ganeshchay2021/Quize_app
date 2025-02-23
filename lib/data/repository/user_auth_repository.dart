import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/data/database/database_method.dart';

class UserAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Method for user registration
  Future<Either<String, void>> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      String id = userCredential.user!.uid;
      Map<String, dynamic> userInfo = {
        "uid": id,
        "score": 0,
        "name": name,
        "email": email,
      };

      await DatabaseMethod().addUser(userInfo: userInfo, id: id);
      return const Right(null);
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        return const Left("Password provided is weak");
      } else if (e.code == 'email-already-in-use') {
        return const Left("Email is already exist");
      } else {
        return Left(e.toString());
      }
    }
  }

  //Method for user login
  Future<Either<String, void>> login(
      {required String email, required String password}) async {
    try {
      UserCredential _ = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return const Right(null);
    } on FirebaseAuthException catch (_) {
      return const Left("Invalid email and password");
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return const Right(null);
    } on FirebaseAuthException catch (_) {
      return const Left("Invalid email and password");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
