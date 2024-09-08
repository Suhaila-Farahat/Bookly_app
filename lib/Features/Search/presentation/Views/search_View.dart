import 'package:bookly_app/Features/Search/presentation/Views/search_body_View.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SearchBodyView()),
    );
  }
}