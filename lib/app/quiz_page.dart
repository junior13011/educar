import 'package:educar/models/quiz.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  final PageController _pageController = PageController();
  int _currentQuestionIndex = 0;
  int _score = 0;
  final List<Question> _questions = Question.generateRandomQuestions();
  bool? _answerStatus;

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deseja sair do Quiz?'),
        content: const Text('Se sair, todo o seu progresso será perdido.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Sim'),
          ),
        ],
      ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
          // automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            SmoothPageIndicator(
              controller: _pageController,
              count: _questions.length,
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: Colors.blue,
                dotColor: Colors.grey,
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return _buildQuestionCard(_questions[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionCard(Question question, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            question.question,
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => _answerQuestion(true, question.correctAnswer),
          style: ElevatedButton.styleFrom(
            backgroundColor: _answerStatus == true ? Colors.green : null,
          ),
          child: const Text('Verdadeiro'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _answerQuestion(false, question.correctAnswer),
          style: ElevatedButton.styleFrom(
            backgroundColor: _answerStatus == false ? Colors.red : null,
          ),
          child: const Text('Falso'),
        ),
      ],
    );
  }

  void _answerQuestion(bool userAnswer, bool correctAnswer) {
    setState(() {
      _answerStatus = userAnswer == correctAnswer;
      if (_answerStatus == true) {
        _score++;
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _answerStatus = null;
        });
        _pageController.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      } else {
        _showFinalScore();
      }
    });
  }

  void _showFinalScore() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Quiz finalizado!"),
          content: Text("Sua pontuação final é: $_score/${_questions.length}"),
          actions: <Widget>[
            TextButton(
              child: const Text('Refazer Quiz'),
              onPressed: () {
                setState(() {
                  _score = 0;
                  _currentQuestionIndex = 0;
                  _questions.shuffle(); // Optional: Shuffle the questions for a new order
                  _pageController.jumpToPage(0);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Voltar para Home'),
              onPressed: () {
                Navigator.of(context)..pop()..pop()..pop();
              },
            ),
          ],
        );
      },
    );
  }
}
