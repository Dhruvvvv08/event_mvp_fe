import 'package:event_demo_mac/core/constants/shared_pref.dart';
import 'package:event_demo_mac/features/auth/data/models/email_login.dart';
import 'package:event_demo_mac/features/auth/data/repo/login_repo.dart';
import 'package:event_demo_mac/features/auth/presentation/controller/bloc/auth_bloc.dart';
import 'package:event_demo_mac/features/profile/data/repo/updateprofilerepo.dart';
import 'package:event_demo_mac/features/profile/presentation/controller/bloc/profile_bloc.dart';
import 'package:event_demo_mac/features/splashscreen/presentation/controller/bloc/splash_bloc.dart';
import 'package:event_demo_mac/features/splashscreen/presentation/screens/splashscreen.dart';
import 'package:event_demo_mac/features/user/botoomnavbar/presentation/controller/bloc/bottom_navigation_bar_bloc.dart';
import 'package:event_demo_mac/features/user/botoomnavbar/presentation/screens/bottomNavbar.dart';
import 'package:event_demo_mac/features/user/home/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()),
        BlocProvider(create: (context) => AuthBloc(loginrepo: LoginRepo())),
        BlocProvider(create: (context) => ProfileBloc(Updateprofilerepo())),
        BlocProvider(create: (context) => BottomNavigationBarBloc()),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomNavBar(),
    );
  }
}
