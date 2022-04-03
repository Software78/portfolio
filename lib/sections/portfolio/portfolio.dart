import 'package:flutter/material.dart';
import 'package:portfolio/sections/portfolio/portfoliodesktop.dart';
import 'package:portfolio/sections/portfolio/portfoliomobile.dart';
import 'package:portfolio/sections/portfolio/portfoliotab.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const PortFolioMobile(),
      tablet: const PortFolioTab(),
      desktop: const PortFolioDesktop(),
    );
  }
}