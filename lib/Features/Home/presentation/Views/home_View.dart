import 'package:bookly_app/Features/Home/presentation/Views/home_body_View.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: HomeBodyView()),
    );
  }
}
