import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'screens/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String routeName = "OnboardingScreen";

  @override
  Widget build(BuildContext context) {
    Widget _buildImage(String assetName, [double width = 350]) {
      return Image.asset('assets/images/$assetName', width: width);
    }

    var pageDecoration = PageDecoration(
      titleTextStyle: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: Theme.of(context).primaryColor),
      bodyTextStyle: Theme.of(context).textTheme.titleSmall!,
      pageColor: Theme.of(context).scaffoldBackgroundColor,
      imagePadding: EdgeInsets.zero,
      imageFlex: 2,
    );
    return IntroductionScreen(
      globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      globalHeader: const Image(
        image: AssetImage("assets/images/Group 4.png"),
      ),
      done: Container(
        width: 37.6,
        height: 37.6,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Icon(
          Icons.arrow_forward,
          color: Theme.of(context).primaryColor,
        ),
      ),
      showDoneButton: true,
      onDone: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      next: Container(
        width: 37.6,
        height: 37.6,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Icon(
          Icons.arrow_forward,
          color: Theme.of(context).primaryColor,
        ),
      ),
      showNextButton: true,
      back: Container(
        width: 37.6,
        height: 37.6,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColor,
        ),
      ),
      showBackButton: true,
      dotsFlex: 2,
      dotsDecorator: DotsDecorator(
        color: Colors.black,
        activeColor: Theme.of(context).primaryColor,
        size: Size(7, 7),
      ),
      pages: [
        PageViewModel(
          title: "onboarding1_title".tr(),
          body: "onboarding1_body".tr(),
          image: _buildImage('being-creative(1).png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "onboarding2_title".tr(),
          body: "onboarding2_body".tr(),
          image: _buildImage('being-creative(2).png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "onboarding3_title".tr(),
          body: "onboarding3_body".tr(),
          image: _buildImage('being-creative(3).png'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
