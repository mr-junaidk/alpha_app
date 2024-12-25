import 'package:flutter/material.dart';
import 'package:alpha_app/screens/calendar_screen.dart';
import 'package:alpha_app/custom_widgets/custom_widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _advancedDrawerController = AdvancedDrawerController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdvancedDrawer(
        controller: _advancedDrawerController,
        animationCurve: Curves.linear,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: false,
        rtlOpening: false,
        openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.zero,
        ),
        drawer: const MyCustomDrawer(),
        child: const CalendarScreen(),
      ),
    );
  }
}







