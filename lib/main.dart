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
                return SecondPage(animation: animation);
              },
              transitionDuration: Duration(seconds: 2),
              reverseTransitionDuration: Duration(seconds: 2),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return FadeTransition(opacity: animation, child: child);
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
  final Animation<double> animation;
  const SecondPage({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: const Text('Second Page')),
      body: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Center(
            child: Transform.translate(
              offset: Offset(0, 100 * animation.value),
              child: Text('Fatores'),
            ),
          );
        },
      ),
    );
  }
}
