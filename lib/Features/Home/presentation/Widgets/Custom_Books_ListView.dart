import 'package:bookly_app/Components/custom_loading_indicator.dart';
import 'package:bookly_app/Features/Home/Manager/Books_cubit/Books_cubit.dart';
import 'package:bookly_app/Features/Home/Manager/Books_cubit/Books_states.dart';
import 'package:bookly_app/Features/Home/presentation/Widgets/Book_Image.dart';
import 'package:bookly_app/Components/custom_err_msg_snakbar.dart';
import 'package:bookly_app/app_Router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBooksListView extends StatelessWidget {
  const CustomBooksListView({super.key,});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit,BooksState>(
      builder: (context, state) {
        if(state is SuccessBooksState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) => GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kBookDetailsView , extra: state.booksList[index]);

                  },
                  child: BookImage(
                    imageUrl: state.booksList[index].volumeInfo.imageLinks?.thumbnail ?? '',

                  ),
                ),
                itemCount:state.booksList.length ,
            ),
          );
        }
        else if(state is FailureBooksState) {
          return ShowSnackbar(errMsg: state.errMsg);
        }
        else {
          return const CustomLoadingIndicator();
        }
      },

    );
  }
}



