import 'package:bookly_app/app_Router.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashBodyView extends StatefulWidget {
  const SplashBodyView({Key? key}) : super(key: key);

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashBodyView> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    fadeTransition();
    navigateToHome();
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FadeTransition(
              opacity: animation,
              child: Image.asset(
                'assets/images/bookly.png',
                width: 240,
                height: 800,
              ),
            ),
          ),
          FadeTransition(
            opacity: animation,
            child: Text(
              'Read Free Books',
              style: TextStyle(
                fontSize: 18,
                fontFamily: AppFont().cairoRegular,
              ),
            ),
          ),
        ],
      ),
    );
  }


  void fadeTransition() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), (){
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
