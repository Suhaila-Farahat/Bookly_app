import 'package:bookly_app/Features/Home/Data/repo/home_repo_implementation.dart';
import 'package:bookly_app/Features/Home/Manager/Books_cubit/Books_cubit.dart';
import 'package:bookly_app/Features/Home/Manager/NewestBooks_cubit/NewestBooks_cubit.dart';
import 'package:bookly_app/app_Router.dart';
import 'package:bookly_app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_Services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BooksCubit(HomeRepoImplementation(
          Api(
              Dio()
          ),
        ))..fetchingBooks()),
        BlocProvider(create: (context) => NewestBooksCubit(HomeRepoImplementation(
          Api(
              Dio()
          ),
        ))..fetchingNewestBooks()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: appColor,
        ),
      ),
    );
  }
}