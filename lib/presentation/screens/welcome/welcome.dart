import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning/presentation/route/app_routes.dart';
import 'package:elearning/presentation/screens/welcome/bloc/welcome_bloc.dart';
import 'package:elearning/presentation/screens/welcome/bloc/welcome_event.dart';
import 'package:elearning/presentation/screens/welcome/bloc/welcome_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection.dart';

//// Created by PhucPT on 17/06/2023

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final WelcomeBloc _bloc = getIt();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<WelcomeBloc, WelcomeState>(
          bloc: _bloc,
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      _bloc.state.page = index;
                      _bloc.add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        context,
                        1,
                        "Next",
                        "First See Learning",
                        "Forget about a for of paper all knowledge in one learning",
                        "assets/images/reading.png",
                      ),
                      _page(
                        context,
                        2,
                        "Next",
                        "Connect With Everyone",
                        "Always keep in touch with your tutor and friends. Let's get connected!",
                        "assets/images/man.png",
                      ),
                      _page(
                        context,
                        3,
                        "Get Started",
                        "Always Fascinated Learning",
                        "Anywhere, anytime. The time is at your discretion so study whenever you want",
                        "assets/images/boy.png",
                      ),
                    ],
                  ),
                ),
                DotsIndicator(
                  position: state.page,
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    size: const Size.square(8.0),
                    activeSize: const Size(16.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Widget _page(
    BuildContext context,
    int index,
    String buttonText,
    String title,
    String subTitle,
    String imagePath,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                  height: 350,
                  child: Image.asset(imagePath),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (index < 3) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.signIn,
                  (route) => false,
                );
              }
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
