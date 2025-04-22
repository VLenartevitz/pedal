import '../widgets/app_header.dart';
import '../widgets/app_tabNavigation.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(),
      bottomNavigationBar: TabNavigation(),
    );
  }
}
