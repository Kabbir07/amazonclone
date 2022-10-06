import 'package:amazon_clone_app/constants/golbal_variables.dart';
import 'package:amazon_clone_app/features/auth/screen/auth_screen.dart';
import 'package:amazon_clone_app/features/auth/services/auth_services.dart';
import 'package:amazon_clone_app/providers/user_provider.dart';
import 'package:amazon_clone_app/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authServices = AuthServices();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon clone',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
      onGenerateRoute: (setting) => generateRoute(setting),
      home: AuthScreen(),
    );
  }
}
