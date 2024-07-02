import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introdução à Computação em Nuvem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Text(
              'O que é Computação em Nuvem?',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'A computação em nuvem é a entrega de diferentes serviços através da internet, incluindo armazenamento de dados, servidores, bancos de dados, redes e software.',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Vantagens da Computação em Nuvem:',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '• Acesso Remoto\n• Redução de Custos\n• Escalabilidade\n• Flexibilidade\n• Segurança de Dados\n• Atualizações Automáticas',
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Routefly.push('/content');
                },
                child: const Text('Iniciar Estudo'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conteúdo do Estudo'),
      ),
      body: const Center(
        child: Text(
          'Aqui começa o conteúdo do estudo sobre Computação em Nuvem.',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
