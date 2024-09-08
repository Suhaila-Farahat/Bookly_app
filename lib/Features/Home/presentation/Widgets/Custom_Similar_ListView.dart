import 'package:bookly_app/Components/custom_err_msg_snakbar.dart';
import 'package:bookly_app/Components/custom_loading_indicator.dart';
import 'package:bookly_app/Features/Home/Manager/SimilarBooks_cubit/SimilarBooks_cubit.dart';
import 'package:bookly_app/Features/Home/Manager/SimilarBooks_cubit/SimilarBooks_states.dart';
import 'package:bookly_app/Features/Home/presentation/Widgets/Book_Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSimilarListView extends StatelessWidget {
  const CustomSimilarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (BuildContext context, state) {
        if(state is SuccessSimilarBooksState) {
          return SizedBox(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) => BookImage(imageUrl:state.booksList[index].volumeInfo.imageLinks?.thumbnail ?? '',),
                itemCount: state.booksList.length,
            ),
          );
        }
        else if (state is FailureSimilarBooksState){
         return ShowSnackbar(errMsg:state.errMsg);
        }
        else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
