import 'package:bookly_app/Features/Home/Manager/SearchBooks_cubit/SearchBooks_cubit.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, });


  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) async {
       SearchBooksCubit.get(context).searchingBooks(category: value); // trigger
      },
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
              Icons.search,
              color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 2,
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            )
        ),
      ),
      
    );
  }
}
