// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF35D46A);
const Color secondaryColor = Color.fromARGB(255, 255, 251, 0);
const Color contentBackgroundColor = Color(0XFFE5E5E5);
const Color allGameCardColor = Color.fromRGBO(230, 230, 230, 1);

const double paddingSize = 13;

const EdgeInsets pagePadding =
    EdgeInsets.symmetric(horizontal: paddingSize, vertical: 0);

Size deviceSize(context) => MediaQuery.of(context).size;
double deviceHeight(context) => MediaQuery.of(context).size.height;
double deviceWidth(context) => MediaQuery.of(context).size.width;

/// input background color
Color inputBackgroundColor = Colors.grey.withOpacity(0.1);
