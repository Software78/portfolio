import 'package:flutter/material.dart';
import 'package:portfolio/sections/services/servicesdesktop.dart';
import 'package:portfolio/sections/services/servicesmobile.dart';
import 'package:portfolio/sections/services/servicestab.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Services extends StatelessWidget {
  const Services({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const ServicesMobile()
      ,
      tablet: const ServicesTab(),
      desktop: const ServicesDesktop(),
    );
  }
}