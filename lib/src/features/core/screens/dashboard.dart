import 'package:firebase_setu_original/src/data/repository/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: Icon(Icons.abc))
        ],
      ),
      body: const Center(child: Text("HI")),
    );
  }
}
