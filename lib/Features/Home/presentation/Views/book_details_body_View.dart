import 'package:bookly_app/Features/Home/Data/Models/Book_Model/BookModel.dart';
import 'package:bookly_app/Features/Home/presentation/Widgets/Book_Rating.dart';
import 'package:bookly_app/Features/Home/presentation/Widgets/Book_Image.dart';
import 'package:bookly_app/Features/Home/presentation/Widgets/Custom_Button.dart';
import 'package:bookly_app/Features/Home/presentation/Widgets/Custom_Similar_ListView.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsBodyView extends StatelessWidget {
  const BookDetailsBodyView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            size: 35,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          BookDetailsSection( bookModel: bookModel ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10,
                horizontal: 5
              ),
              child: Text(
                'You can Also like',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: AppFont().cairoRegular,
                ),
              ),
            ),
          ),
          const Expanded(child: CustomSimilarListView()),
        ],
      ),
    );
  }
}

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.27),
            child: BookImage( imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '')
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontFamily: AppFont().instrumentSerifRegular,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          bookModel.volumeInfo.authors![0],
          style: TextStyle(
            color: Colors.white70,
            fontSize: 20,
            fontFamily: AppFont().cairoRegular,
          ),

        ),
        BookRating(rating: bookModel.volumeInfo.averageRating ?? 0),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10
          ),
          child: Row(
            children: [
              CustomButton(
                onPressed: () async{
                  Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  }
                },
                text: getText(bookModel),
                textColor: Colors.black,
                backgroundColor: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)
                ),
              ),
              const CustomButton(
                text: 'Free',
                textColor: Colors.white,
                backgroundColor: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)

                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  String getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink == null) {
      return 'Not Available' ;
    }
    else {
      return 'Preview';
    }
  }
}