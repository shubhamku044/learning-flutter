import '../widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My First App',
        ),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
      drawer: MyDrawer(),
    );
  }
}
