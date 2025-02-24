import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(TransitionPage());
}

class TransitionPage extends StatelessWidget {
  const TransitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final route = PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return SecondPage();
              },
            );

            Navigator.push(context, route);
          },

          child: Text('Ir para a Próxima Página.'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Container(),
    );
  }
}
