import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home_screen.dart';
import 'my_theme/my_theme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String routeName = "OnboardingScreen";

  @override
  Widget build(BuildContext context) {
    Widget _buildImage(String assetName, [double width = 350]) {
      return Image.asset('assets/images/$assetName', width: width);
    }

    var pageDecoration = PageDecoration(
      titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: MYtheme.secondryColor),
      bodyTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: MYtheme.thirdColor),
      pageColor: MYtheme.primaryColor,
      imagePadding: EdgeInsets.zero,
      imageFlex: 2,
    );
    return IntroductionScreen(
      globalBackgroundColor: MYtheme.primaryColor,
      globalHeader: const Image(
        image: AssetImage("assets/images/Group 4.png"),
      ),
      done: Container(
        width: 37.6,
        height: 37.6,
        decoration: BoxDecoration(
          color: MYtheme.primaryColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: MYtheme.secondryColor),
        ),
        child: Icon(
          Icons.arrow_forward,
          color: MYtheme.secondryColor,
        ),
      ),
      showDoneButton: true,
      onDone: () {
       Navigator.pushNamed(context, HomeScreen.routeName);
      },
      next: Container(
        width: 37.6,
        height: 37.6,
        decoration: BoxDecoration(
          color: MYtheme.primaryColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: MYtheme.secondryColor),
        ),
        child: Icon(
          Icons.arrow_forward,
          color: MYtheme.secondryColor,
        ),
      ),
      showNextButton: true,
      back: Container(
        width: 37.6,
        height: 37.6,
        decoration: BoxDecoration(
          color: MYtheme.primaryColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: MYtheme.secondryColor),
        ),
        child: Icon(
          Icons.arrow_back,
          color: MYtheme.secondryColor,
        ),
      ),
      showBackButton: true,
      dotsFlex: 2,
      dotsDecorator: DotsDecorator(
        color: MYtheme.thirdColor,
        activeColor: MYtheme.secondryColor,
        size: Size(7, 7),
      ),
      pages: [
        PageViewModel(
          title: "Find Events That Inspire You",
          body:
              "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
          image: _buildImage('being-creative(1).png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Effortless Event Planning",
          body:
              "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
          image: _buildImage('being-creative(2).png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Connect with Friends & Share Moments",
          body:
              "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
          image: _buildImage('being-creative(3).png'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
