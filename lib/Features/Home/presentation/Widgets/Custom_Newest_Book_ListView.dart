import 'package:bookly_app/Components/custom_err_msg_snakbar.dart';
import 'package:bookly_app/Components/custom_loading_indicator.dart';
import 'package:bookly_app/Features/Home/Manager/NewestBooks_cubit/NewestBooks_cubit.dart';
import 'package:bookly_app/Features/Home/Manager/NewestBooks_cubit/NewestBooks_states.dart';
import 'package:bookly_app/Features/Home/presentation/Widgets/Custom_Newest_Book_ListView_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNewestBookListView extends StatelessWidget {
  const CustomNewestBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is SuccessNewestBooksState) {
          return ListView.builder(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CustomNewestBookListViewItem(bookModel: state.booksList[index],),
              itemCount: state.booksList.length
          );
        }
        else if (state is FailureNewestBooksState) {
          return ShowSnackbar(errMsg: state.errMsg);
        }
        else {
          return  const CustomLoadingIndicator();
        }
      },
    );
  }
}
