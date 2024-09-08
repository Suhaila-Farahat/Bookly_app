import 'package:bookly_app/Features/Home/Data/Models/Book_Model/BookModel.dart';
import 'package:bookly_app/Features/Home/Data/repo/home_repo_implementation.dart';
import 'package:bookly_app/Features/Home/Manager/SearchBooks_cubit/SearchBooks_cubit.dart';
import 'package:bookly_app/Features/Home/Manager/SimilarBooks_cubit/SimilarBooks_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/Views/book_details_View.dart';
import 'package:bookly_app/Features/Home/presentation/Views/home_View.dart';
import 'package:bookly_app/Features/Search/presentation/Views/search_View.dart';
import 'package:bookly_app/Features/Splash/presentation/Views/splash_View.dart';
import 'package:bookly_app/api_Services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {

 static const kHomeView = '/homeView';
 static const kBookDetailsView = '/bookDetailsView';
 static const kSearchView = '/searchView';

 static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path:kBookDetailsView,
        builder: (context, state) =>  BlocProvider(
            create: (context) => SimilarBooksCubit(HomeRepoImplementation(Api(Dio()))),
            child: BookDetailsView(bookModel: state.extra as BookModel)),
      ) ,
      GoRoute(
        path:kSearchView,
        builder: (context, state) => const SearchView(),
      )
    ],
  );

}
