import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formatação de data
import 'package:shared_preferences/shared_preferences.dart'; // Para persistência local

class CadastroFilmePage extends StatefulWidget {
  const CadastroFilmePage({super.key});

  @override
  State<CadastroFilmePage> createState() => _CadastroFilmePageState();
}

class _CadastroFilmePageState extends State<CadastroFilmePage> {
  final _tituloController = TextEditingController();
  final _dataController = TextEditingController();

  void _preencherDataHoje() {
    final hoje = DateFormat('dd/MM/yyyy').format(DateTime.now());
    _dataController.text = hoje;
  }

  Future<void> _adicionarFilme() async {
    final titulo = _tituloController.text;
    final data = _dataController.text;
    if (titulo.isEmpty || data.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    final String? json = prefs.getString('filmesAssistidos');
    final List<Map<String, dynamic>> filmes = json != null
        ? List<Map<String, dynamic>>.from(jsonDecode(json))
        : [];

    filmes.add({'titulo': titulo, 'data': data});
    await prefs.setString('filmesAssistidos', jsonEncode(filmes));

    Navigator.pop(context); // volta para a tela principal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212), // Fundo escuro
      appBar: AppBar(
        title: const Text('Adicionar Filme'),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                labelText: 'Título do Filme',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white38),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _dataController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Data (dd/MM/yyyy)',
                      labelStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white38),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        _dataController.text =
                            DateFormat('dd/MM/yyyy').format(picked);
                      }
                    },
                  ),
                ),
                IconButton(
                  onPressed: _preencherDataHoje,
                  icon: Icon(Icons.today, color: Colors.teal),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _adicionarFilme,
              icon: const Icon(Icons.save),
              label: const Text('Salvar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Cor de fundo do botão
                foregroundColor: Colors.white, // Cor do texto do botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}
