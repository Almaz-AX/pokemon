import 'package:flutter/material.dart';

import '../../navigation/main_navigation.dart';

class App extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.amber,),
        primarySwatch: Colors.amber,
        brightness: Brightness.dark,
        
      ),
        
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.main,
    );
  }
}
