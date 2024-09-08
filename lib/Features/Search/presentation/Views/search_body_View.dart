import 'package:bookly_app/Features/Home/Data/repo/home_repo_implementation.dart';
import 'package:bookly_app/Features/Home/Manager/SearchBooks_cubit/SearchBooks_cubit.dart';
import 'package:bookly_app/Features/Search/presentation/Widgets/Custom_Search_TextField.dart';
import 'package:bookly_app/Features/Search/presentation/Widgets/Search_Result_ListView.dart';
import 'package:bookly_app/api_Services.dart';
import 'package:bookly_app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchBooksCubit(HomeRepoImplementation(Api(Dio())), ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchTextField(),
            SearchResultListView(),
          ],
        ),
      ),
    );
  }
}
