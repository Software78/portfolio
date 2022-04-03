// ignore_for_file: unused_field, unused_element, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/animations/entranceFader.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/provider/themeProvider.dart';
import 'package:portfolio/sections/about/about.dart';
import 'package:portfolio/sections/footer/footer.dart';
import 'package:portfolio/sections/homepage/homepage.dart';
import 'package:portfolio/sections/navbar/navbar.dart';
import 'package:portfolio/sections/portfolio/portfolio.dart';
import 'package:portfolio/sections/services/services.dart';
import 'dart:html' as html;
import 'contact/contact.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isPressed = false;
  bool _isScrollingDown = false;
  final ScrollController _scrollController = ScrollController();

  final List<String> _sectionsName = [
    "HOME",
    "ABOUT",
    "SERVICES",
    "PROJECTS",
    "CONTACT"
  ];

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.build,
    Icons.article,
    Icons.phone,
  ];

  void _scroll(int i) {
    _scrollController.animateTo(
      i == 0
          ? 0.0
          : i == 1
              ? MediaQuery.of(context).size.height * 1.05
              : i == 2
                  ? MediaQuery.of(context).size.height * 1.98
                  : i == 3
                      ? MediaQuery.of(context).size.height * 2.9
                      : MediaQuery.of(context).size.height * 4,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return const HomePage();
    } else if (i == 1) {
      return const About();
    } else if (i == 2) {
      return const Services();
    } else if (i == 3) {
      return const Portfolio();
    } else if (i == 4) {
      return  const Contact();
    } else if (i == 5) {
      return const Footer();
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    // _scrollController = _themeProviders.scroll;
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          _isScrollingDown = true;
          setState(() {});
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollingDown) {
          _isScrollingDown = false;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const FlutterLogo();
  }


Widget _appBarActions(
      String childText, int index, IconData icon, ThemeProvider themeProvider) {
    return MediaQuery.of(context).size.width > 760
        ? EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 250),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 60.0,
              child: MaterialButton(
                hoverColor: kPrimaryColor,
                onPressed: () => _scroll(index),
                child: Text(
                  childText,
                  style: TextStyle(
                    color:
                        themeProvider.lightTheme ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: kPrimaryColor.withAlpha(70),
              onPressed: () {
                _scroll(index);
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  icon,
                  color: kPrimaryColor,
                ),
                title: Text(childText,
                    style: TextStyle(
                      color: themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                    )),
              ),
            ),
          );
  }

  Widget _appBarTabDesktop(ThemeProvider _themeProv) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: _themeProv.lightTheme ? Colors.white : Colors.black,
      title: MediaQuery.of(context).size.width < 780
          ? const EntranceFader(
              duration: Duration(milliseconds: 250),
              offset: Offset(0, -10),
              delay: Duration(seconds: 3),
              child: NavBarLogo(
                height: 20.0,
              ))
          : EntranceFader(
              offset: const Offset(0, -10),
              duration: const Duration(milliseconds: 250),
              delay: const Duration(milliseconds: 100),
              child: NavBarLogo(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
            ),
      actions: [
        for (int i = 0; i < _sectionsName.length; i++)
          _appBarActions(_sectionsName[i], i, _sectionsIcons[i], _themeProv),
        EntranceFader(
          offset: const Offset(0, -10),
          delay: const Duration(milliseconds: 100),
          duration: const Duration(milliseconds: 250),
          child: Container(
            height: 60.0,
            width: 120.0,
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: kPrimaryColor.withAlpha(150),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(color: kPrimaryColor)),
              onPressed: () {
                html.window.open(
                    'https://drive.google.com/file/d/1GF-wtbu2ob_Uxhw2In2QA8QiYi3XjCj1/view?usp=sharing',
                    "pdf");
              },
              child: Text(
                "RESUME",
                style: GoogleFonts.montserrat(
                  color: _themeProv.lightTheme ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        SizedBox(
          height: 30.0,
          child: Switch(
            inactiveTrackColor: Colors.grey,
            value: !_themeProv.lightTheme,
            onChanged: (value) {
              _themeProv.lightTheme = !value;
            },
            activeColor: kPrimaryColor,
          ),
        ),
        const SizedBox(width: 15.0),
      ],
    );
  }

  Widget _appBarMobile(ThemeProvider theme) {
    return Drawer(
      child: Material(
        color: theme.lightTheme ? Colors.white : Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: NavBarLogo(
                  height: 28,
                ),
              ),
              Divider(
                color: theme.lightTheme ? Colors.grey[200] : Colors.white,
              ),
              ListTile(
                leading: const Icon(
                  Icons.light_mode,
                  color: kPrimaryColor,
                ),
                title: Text("Dark Mode",
                    style: TextStyle(
                        color: theme.lightTheme ? Colors.black : Colors.white)),
                trailing: Switch(
                  inactiveTrackColor: Colors.grey,
                  value: !theme.lightTheme,
                  onChanged: (value) {
                    theme.lightTheme = !value;
                  },
                  activeColor: kPrimaryColor,
                ),
              ),
              Divider(
                color: theme.lightTheme ? Colors.grey[200] : Colors.white,
              ),
              for (int i = 0; i < _sectionsName.length; i++)
                _appBarActions(_sectionsName[i], i, _sectionsIcons[i], theme),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  hoverColor: kPrimaryColor.withAlpha(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(color: kPrimaryColor)),
                  onPressed: () {
                    launchURL(
                        "https://drive.google.com/file/d/1GF-wtbu2ob_Uxhw2In2QA8QiYi3XjCj1/view?usp=sharing");
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.book,
                      color: Colors.red,
                    ),
                    title: Text(
                      "RESUME",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        color: theme.lightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
