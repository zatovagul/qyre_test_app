import 'package:flutter/material.dart';

mixin ThemeMixin<T extends StatefulWidget> on State<T>{
  ThemeData get theme => Theme.of(context);
}