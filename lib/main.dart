import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/data/repository/reset_password_repository.dart';
import 'package:quiz_app/data/repository/user_auth_repository.dart';
import 'package:quiz_app/firebase_options.dart';
import 'package:quiz_app/pages/login/bloc/auth_bloc.dart';
import 'package:quiz_app/pages/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserAuthRepository(),
        ),
         RepositoryProvider(
          create: (context) => ResetPasswordRepository(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz App',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white)),
        home: BlocProvider(
          create: (context) =>
              AuthBloc(userAuthRepository: context.read<UserAuthRepository>()),
          child: const LoginScreen(),
        ),
      ),
    );
  }
}

// class DataEntry extends StatelessWidget {
//   const DataEntry({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () {
//               uploadQuestionsToFirebase();
//             },
//             child: const Text("CLick")),
//       ),
//     );
//   }
// }
