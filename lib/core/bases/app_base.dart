import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';


abstract class AppBase<C extends Cubit> extends StatelessWidget {
    C get cubit=>locator<C>();
  final Key? key;

  AppBase({  this.key}) : super(key: key);

  @override
  Widget build(BuildContext context);
}


