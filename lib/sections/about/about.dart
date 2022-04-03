import 'package:flutter/material.dart';
import 'package:portfolio/sections/about/aboutdesktop.dart';
import 'package:portfolio/sections/about/aboutmobile.dart';
import 'package:portfolio/sections/about/abouttab.dart';
import 'package:responsive_builder/responsive_builder.dart';


class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const AboutMobile(),
      tablet: const AboutTab(),
      desktop: const AboutDesktop(),
    );
  }
}