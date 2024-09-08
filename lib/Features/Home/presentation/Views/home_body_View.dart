import 'package:bookly_app/Features/Home/presentation/Widgets/Custom_AppBar.dart';
import 'package:bookly_app/Features/Home/presentation/Widgets/Custom_Newest_Book_ListView.dart';
import 'package:bookly_app/Features/Home/presentation/Widgets/Custom_Books_ListView.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(),
                  const CustomBooksListView(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 5
                ),
                    child: Text(
                      'Best Seller',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: AppFont().cairoRegular,
                          fontWeight: FontWeight.bold
                      ),
                ),
              ),
            ],
          ),
        )),
        const SliverToBoxAdapter(
             child: CustomNewestBookListView()
         ),
      ],
    );
  }
}
