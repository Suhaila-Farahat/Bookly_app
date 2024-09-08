import 'package:bookly_app/Features/Home/Data/Models/Book_Model/BookModel.dart';
import 'package:bookly_app/Features/Home/Manager/SimilarBooks_cubit/SimilarBooks_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/Views/book_details_body_View.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel, });

  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchingSimilarBooks(category: widget.bookModel.volumeInfo.categories![0]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsBodyView(bookModel: widget.bookModel,),
    );
  }
}
