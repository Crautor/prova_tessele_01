import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilmesListPage extends StatefulWidget {
  const FilmesListPage({super.key});

  @override
  State<FilmesListPage> createState() => _FilmesListPageState();
}

class _FilmesListPageState extends State<FilmesListPage> {
  List<Map<String, dynamic>> _filmes = [];
  final Completer<void> _preferencesReady = Completer<void>();

  Future<void> _carregarFilmes() async {
    final prefs = await SharedPreferences.getInstance();
    final String? json = prefs.getString('filmesAssistidos');
    if (json != null) {
      final List decoded = jsonDecode(json);
      _filmes = List<Map<String, dynamic>>.from(decoded);
    }
  }

  Future<void> _removerFilme(int index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _filmes.removeAt(index);
    });
    await prefs.setString('filmesAssistidos', jsonEncode(_filmes));
  }

  @override
  void initState() {
    super.initState();
    _carregarFilmes().then((_) {
      _preferencesReady.complete();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Filmes Assistidos'),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Tela Principal', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add, color: Colors.white),
              title: const Text('Adicionar Filme', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/cadastro');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text('Créditos', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/creditos');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cadastro').then(
          (_) => setState(() {
            _carregarFilmes();
          }),
        ),
        child: const Icon(Icons.add),
        tooltip: 'Adicionar Filme',
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder(
        future: _preferencesReady.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          return _filmes.isEmpty
              ? const Center(child: Text('Nenhum filme adicionado ainda.', style: TextStyle(color: Colors.white)))
              : ListView.builder(
                  itemCount: _filmes.length,
                  itemBuilder: (context, index) {
                    final filme = _filmes[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      color: const Color(0xFF1E1E1E),
                      child: ListTile(
                        leading: const Icon(Icons.movie, color: Colors.white70),
                        title: Text(filme['titulo'], style: const TextStyle(color: Colors.white)),
                        subtitle: Text('Assistido em: ${filme['data']}', style: const TextStyle(color: Colors.white70)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removerFilme(index),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
