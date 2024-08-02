import 'package:dragonball_app/models/character_model.dart';
import 'package:dragonball_app/providers/api_provider.dart';
import 'package:dragonball_app/screens/character_screen.dart';
import 'package:dragonball_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'character',
          builder: (context, state){
            final character = state.extra as Character;
            return CharacterScreen(
              character: character
              );

          },
        )
       ]
    )


  ]
  );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiProvider(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true
        ),
        title: 'Dragon ball APP',
        routerConfig: _router,
      ),
    );
  }
}