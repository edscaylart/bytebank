import 'package:flutter/material.dart';

mixin NamedRoute implements Widget {
  String get routeName;
}

Future pushWithSettings(
  BuildContext context,
  NamedRoute newPage,
) {
  return Navigator.of(context).push(
    MaterialPageRoute(
      settings: RouteSettings(
        name: newPage.routeName,
      ),
      builder: (_) => newPage,
    ),
  );
}
