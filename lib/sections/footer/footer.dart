import 'package:flutter/material.dart';
import 'package:portfolio/sections/footer/footerdesktop.dart';
import 'package:portfolio/sections/footer/footermobile.dart';
import 'package:portfolio/sections/footer/footertab.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const FooterMobile(),
      desktop: const FooterDesktop(),
      tablet: const FooterTab(),
    );
  }
}
