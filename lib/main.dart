import 'package:flutter/material.dart';
import 'pages/FilmesListPage.dart';
import 'pages/CadastroFilmePage.dart';
import 'pages/Creditos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filmes Assistidos',
      theme: ThemeData(
        brightness: Brightness.dark, // Para um tema escuro
        primaryColor: Colors.indigo, // Cor principal
        colorScheme: ColorScheme.dark(
          primary: Colors.indigo, // Cor principal
          secondary: Colors.amber, // Cor secundária (anteriormente accentColor)
        ),
        scaffoldBackgroundColor: const Color(0xFF121212), // Cor de fundo
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // Antigo bodyText1
          bodyMedium: TextStyle(color: Colors.white70), // Antigo bodyText2
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FilmesListPage(),
        '/cadastro': (context) => const CadastroFilmePage(),
        '/creditos': (context) => const CreditosPage(),
      },
    );
  }
}
