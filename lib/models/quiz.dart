import 'dart:math';

class Question {
  String question;
  bool correctAnswer;

  Question({required this.question, required this.correctAnswer});

  static List<Question> generateRandomQuestions() {
    final questions = generateQuestions();
    var random = Random();
    List<Question> selectedQuestions = [];
    var chosenIndices = <int>{};

    while (chosenIndices.length < 10) {
      int index = random.nextInt(questions.length);
      if (!chosenIndices.contains(index)) {
        chosenIndices.add(index);
        selectedQuestions.add(questions[index]);
      }
    }
    return selectedQuestions;
  }

  static generateQuestions() {
    var fullQuiz = [
      Question(
          question:
              "A computação em nuvem permite que recursos de TI sejam acessados e utilizados sob demanda pela internet.",
          correctAnswer: true),
      Question(
          question:
              "IaaS (Infrastructure as a Service) oferece aplicativos de software prontos para uso acessíveis pela internet.",
          correctAnswer: false),
      Question(
          question:
              "PaaS (Platform as a Service) fornece infraestrutura virtualizada, incluindo servidores, armazenamento e redes.",
          correctAnswer: true),
      Question(
          question:
              "SaaS (Software as a Service) permite aos desenvolvedores criar, gerenciar e implantar aplicativos sem gerenciar a infraestrutura subjacente.",
          correctAnswer: false),
      Question(
          question:
              "A nuvem pública é uma infraestrutura de nuvem operada exclusivamente para uma organização específica.",
          correctAnswer: false),
      Question(
          question:
              "A nuvem híbrida combina nuvens públicas e privadas, permitindo que dados e aplicativos sejam compartilhados entre elas.",
          correctAnswer: true),
      Question(
          question:
              "Edge Computing refere-se ao processamento de dados mais próximo da fonte para reduzir a latência.",
          correctAnswer: true),
      Question(
          question:
              "GDPR é um regulamento da União Europeia que impõe regras de privacidade e segurança.",
          correctAnswer: true),
      Question(
          question:
              "Autenticação Multifatorial (MFA) adiciona camadas extras de segurança além da senha.",
          correctAnswer: true),
      Question(
          question:
              "AIaaS (Artificial Intelligence as a Service) oferece capacidades de IA e ML na nuvem.",
          correctAnswer: true),
      Question(
          question:
              "Containers, como Docker, garantem consistência e portabilidade de aplicações.",
          correctAnswer: true),
      Question(
          question:
              """Serverless Computing exige que os desenvolvedores gerenciem a infraestrutura
          subjacente.""",
          correctAnswer: false),
      Question(
          question: "Um exemplo de SaaS é o Microsoft Office 365.",
          correctAnswer: true),
      Question(
          question:
              """A criptografia em trânsito protege dados enquanto são transferidos entre seu
          dispositivo e a nuvem""",
          correctAnswer: true),
      Question(
          question:
              """As instâncias reservadas oferecem descontos para compromissos de longo prazo
com provedores de nuvem.""",
          correctAnswer: true),
      Question(
          question:
              """A nuvem comunitária é compartilhada por várias organizações com interesses
comuns.""",
          correctAnswer: true),
      Question(
          question:
              """Os provedores de nuvem geralmente não oferecem medidas de segurança robustas""",
          correctAnswer: false),
      Question(
          question:
              """Google Drive é um exemplo de serviço de armazenamento em nuvem.""",
          correctAnswer: true),
      Question(
          question:
              """HIPAA é uma lei dos EUA que exige a proteção de informações de saúde.""",
          correctAnswer: true),
      Question(
          question:
              """A escalabilidade é a capacidade de aumentar ou diminuir recursos de acordo com a
demanda na nuvem.""",
          correctAnswer: true),
      Question(
          question:
              """AWS Lambda é um exemplo de serviço de computação serverless.""",
          correctAnswer: true),
      Question(
          question:
              """O uso de serviços gratuitos na nuvem nunca é permitido pelos provedores de nuvem""",
          correctAnswer: false),
      Question(
          question:
              """Telemedicina é um exemplo de aplicação da computação em nuvem no setor de
saúde""",
          correctAnswer: true),
      Question(
          question:
              """O modelo pay-as-you-go permite pagar apenas pelos recursos de nuvem utilizados.""",
          correctAnswer: true),
      Question(
          question:
              """Gerenciamento de Identidade e Acesso (IAM) ajuda a definir e gerenciar permissões
na nuvem.""",
          correctAnswer: true),
      Question(
          question:
              """Edge Computing não é relevante para aplicações de Internet das Coisas (IoT).""",
          correctAnswer: false),
      Question(
          question:
              """Kubernetes é uma plataforma de orquestração de containers.""",
          correctAnswer: true),
      Question(
          question:
              """As políticas de uso da nuvem devem incluir gerenciamento de custos e segurança.""",
          correctAnswer: true),
      Question(
          question: """E-learning não se beneficia dos serviços de nuvem.""",
          correctAnswer: false),
      Question(
          question:
              """A criptografia em repouso protege dados armazenados na nuvem.""",
          correctAnswer: true),
    ];

    return fullQuiz;
  }
}
