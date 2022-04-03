import 'package:flutter/material.dart';
import 'package:portfolio/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width < 1100 ? 0.0 : 20.0, 20.0, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "< ",
            style: TextStyle(
              fontSize: height,
              color: _themeProvider.lightTheme ? Colors.black : Colors.white,
            ),
          ),
          Text(
            "Hamza",
            style: TextStyle(
              fontFamily: "Agustina",
              fontSize: height,
              color: _themeProvider.lightTheme ? Colors.black : Colors.white,
            ),
          ),
          Text(
            MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
            style: TextStyle(
              fontSize: height,
              color: _themeProvider.lightTheme ? Colors.black : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
