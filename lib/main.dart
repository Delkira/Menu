import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú de Opciones',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Menu(),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú de Opciones'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Verificar si un Texto es un Palíndromo'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Palindromo()),
              );
            },
          ),
          ListTile(
            title: const Text('Identificar si Números Amigos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NumeroAmigo()),
              );
            },
          ),
          ListTile(
            title: const Text('Convertidor de Número a Binario'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Binario()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Palindromo extends StatefulWidget {
  const Palindromo({super.key});

  @override
  State<Palindromo> createState() => _PalindromoState();
}

class _PalindromoState extends State<Palindromo> {
  final TextEditingController _controlador = TextEditingController();
  String _result = '';

  void _checkPalindromo() {
    String text =
        _controlador.text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    String reversedText = text.split('').reversed.join('');
    setState(() {
      _result =
          (text == reversedText) ? 'Es un palíndromo' : 'No es un palíndromo';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificar Palíndromo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controlador,
              decoration:
                  const InputDecoration(labelText: 'Ingresa una oración'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkPalindromo,
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 20),
            Text(_result, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class NumeroAmigo extends StatefulWidget {
  const NumeroAmigo({super.key});

  @override
  State<NumeroAmigo> createState() => _NumeroAmigoState();
}

class _NumeroAmigoState extends State<NumeroAmigo> {
  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();
  String _result = '';

  int _sumaDivisores(int number) {
    int sum = 0;
    for (int i = 1; i <= number / 2; i++) {
      if (number % i == 0) {
        sum += i;
      }
    }
    return sum;
  }

  void _checkNumeroAmigo() {
    int num1 = int.tryParse(_num1.text) ?? 0;
    int num2 = int.tryParse(_num2.text) ?? 0;
    bool areFriendly =
        (_sumaDivisores(num1) == num2) && (_sumaDivisores(num2) == num1);
    setState(() {
      _result = areFriendly ? 'Son números amigos' : 'No son números amigos';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identificar Números Amigos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1,
              decoration:
                  const InputDecoration(labelText: 'Ingresa el primer número'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _num2,
              decoration:
                  const InputDecoration(labelText: 'Ingresa el segundo número'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkNumeroAmigo,
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 20),
            Text(_result, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class Binario extends StatefulWidget {
  const Binario({super.key});

  @override
  State<Binario> createState() => _BinarioState();
}

class _BinarioState extends State<Binario> {
  final TextEditingController _controlador = TextEditingController();
  String _result = '';

  void _convertirBinario() {
    int number = int.tryParse(_controlador.text) ?? 0;
    setState(() {
      _result = 'Binario: ${number.toRadixString(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convertidor a Binario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controlador,
              decoration:
                  const InputDecoration(labelText: 'Ingresa un número entero'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertirBinario,
              child: const Text('Convertir'),
            ),
            const SizedBox(height: 20),
            Text(_result, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
