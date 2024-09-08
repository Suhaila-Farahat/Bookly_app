import 'package:bookly_app/Components/custom_err_msg_snakbar.dart';
import 'package:bookly_app/Components/custom_loading_indicator.dart';
import 'package:bookly_app/Features/Home/Manager/SearchBooks_cubit/SearchBooks_cubit.dart';
import 'package:bookly_app/Features/Home/Manager/SearchBooks_cubit/SearchBooks_states.dart';
import 'package:bookly_app/Features/Search/presentation/Widgets/Search_Result_ListView_Item.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit,SearchBooksState>(
      builder: (BuildContext context, state) {
        if (state is SuccessSearchBooksState) {
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics:const BouncingScrollPhysics(),
              itemBuilder: (context, index) => SearchResultListViewItem(bookModel: state.booksList[index]),
              itemCount: state.booksList.length,
            ),
          );
        }
        else if (state is FailureSearchBooksState) {
          return ShowSnackbar(errMsg: state.errMsg);
        }
        else if (state is LoadingSearchBooksState) {
          return  const Expanded(
            child: CustomLoadingIndicator(),
          ) ;
        }
        else {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 270,
                horizontal: 15

              ),
              child: Text(
                'Enjoy Searching about Free Books',
                style: TextStyle(
                    fontSize: 18 ,
                    fontFamily: AppFont().cairoRegular
                ),
              ),
            ),
          );
        }
      }
    );
  }
}
