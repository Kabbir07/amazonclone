import 'package:amazon_clone_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Text(user.toJson()),
          Text(
            "Name : ${user.name}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Email : ${user.email}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Token : ${user.token}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ],
      )),
    );
  }
}
