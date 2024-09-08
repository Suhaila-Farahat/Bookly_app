import 'package:bookly_app/Features/Home/Data/Models/Book_Model/BookModel.dart';
import 'package:bookly_app/Features/Home/presentation/Widgets/Book_Image.dart';
import 'package:bookly_app/Features/Home/presentation/Widgets/Book_Rating.dart';
import 'package:bookly_app/app_Router.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomNewestBookListViewItem extends StatelessWidget {
  const CustomNewestBookListViewItem({super.key, required this.bookModel});

  final BookModel bookModel ;

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 25,
        bottom: 10,
        top: 10
      ),
      child: GestureDetector(
        onTap: (){
          GoRouter.of(context).push(AppRouter.kBookDetailsView ,extra: bookModel);
        },
        child: Row(
          children: [
            SizedBox(
              width: 110,
                child: BookImage(
                    imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookModel.volumeInfo.title!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: AppFont().instrumentSerifRegular,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      bookModel.volumeInfo.authors![0],
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFont().instrumentSerifRegular
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Free',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: AppFont().cairoRegular

                          ),
                        ),
                        BookRating( rating: bookModel.volumeInfo.averageRating ?? 0,)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
