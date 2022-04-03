import 'package:flutter/material.dart';
import 'package:portfolio/sections/homepage/homepagedesktop.dart';
import 'package:portfolio/sections/homepage/homepagemobile.dart';
import 'package:portfolio/sections/homepage/homepagetab.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const HomePageMobile(),
      tablet: const HomePageTab(),
      desktop: const HomePageDesktop(),
    );
  }
}