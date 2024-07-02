class Content {
  String? documentTitle;
  List<Topic> topics;

  // Construtor para a classe Content
  Content({this.documentTitle, List<Topic>? topics})
      : this.topics = topics ?? [];
}

class Topic {
  String? title;
  String? introduction;
  List<Section> sections;
  String? conclusion;

  // Construtor para a classe Topic
  Topic(
      {this.title, this.introduction, List<Section>? sections, this.conclusion})
      : this.sections = sections ?? [];
}

class Section {
  String? subtitle;
  List<String> contentItems;
  List<String> bulletPoints;

  // Construtor para a classe Section
  Section(
      {this.subtitle, List<String>? contentItems, List<String>? bulletPoints})
      : this.contentItems = contentItems ?? [],
        this.bulletPoints = bulletPoints ?? [];
}

Content generateContent() {
  var content = Content();
  content.documentTitle =
      "Material Para Desenvolvimento das Telas do Aplicativo EDUCAR";

  content.topics = [
    Topic(
      title: "Definição Básica",
      introduction:
          """Computação em nuvem, ou cloud computing, refere-se ao uso de servidores remotos hospedados na internet para armazenar, gerenciar e processar dados, em vez de usar um servidor local ou um computador pessoal. Os serviços em nuvem permitem que empresas e indivíduos acessem e utilizem recursos de TI de maneira mais flexível e escalável.""",
    ),
    Topic(
        title: "Modelos de Serviço",
        introduction:
            "Existem três principais modelos de serviço na computação em nuvem:",
        sections: [
          Section(
              subtitle: " IaaS (Infrastructure as a Service)",
              bulletPoints: [
                "Infraestrutura como Serviço fornece recursos de computação virtualizados pela internet. Isso inclui servidores, armazenamento, redes e sistemas operacionais.",
                "Exemplos: Amazon Web Services (AWS), Microsoft Azure, Google Cloud Platform (GCP)."
              ]),
          Section(subtitle: "PaaS (Platform as a Service)", bulletPoints: [
            """ Plataforma como Serviço oferece uma plataforma que permite aos desenvolvedores
              criar, gerenciar e implantar aplicativos sem se preocupar com a infraestrutura
          subjacente.""",
            "Exemplos: Google App Engine, Microsoft Azure App Service, Heroku."
          ]),
          Section(subtitle: "SaaS (Software as a Service)", bulletPoints: [
            """Software como Serviço fornece aplicativos de software prontos para uso, acessíveis
          pela internet. Usuários podem utilizar o software sem se preocupar com a instalação,
              manutenção ou gerenciamento do mesmo.""",
            "Exemplos: Gmail, Google Docs, Salesforce, Office 365."
          ]),
        ]),
    Topic(
        title: "Modelos de Implantação",
        introduction:
            "Existem quatro principais modelos de implantação para a computação em nuvem:",
        sections: [
          Section(subtitle: "Nuvem Pública", bulletPoints: [
            """Infraestrutura de nuvem é disponibilizada ao público geral por um provedor de
        serviços. Exemplo: AWS, GCP.""",
          ]),
          Section(subtitle: "Nuvem Privada", bulletPoints: [
            """ Infraestrutura de nuvem é operada exclusivamente para uma organização específica.
Pode ser gerida internamente ou por terceiros e pode estar localizada dentro das
instalações da empresa.""",
          ]),
          Section(subtitle: "Nuvem Híbrida", bulletPoints: [
            """ Combinação de nuvens públicas e privadas, permitindo que dados e aplicativos sejam
compartilhados entre elas. Proporciona maior flexibilidade e mais opções de
implantação.""",
          ]),
          Section(subtitle: "Nuvem Comunitária", bulletPoints: [
            """Infraestrutura compartilhada por várias organizações com interesses comuns, como
missões, requisitos de segurança, políticas e considerações de conformidade.""",
          ])
        ]),
    Topic(title: "Vantagens da Computação em Nuvem", sections: [
      Section(bulletPoints: [
        """Custo-efetividade: Reduz a necessidade de grandes investimentos em hardware e
            manutenção.""",
        """Escalabilidade: Permite aumentar ou diminuir recursos de acordo com a demanda.""",
        """Acessibilidade: Facilita o acesso aos dados e aplicativos de qualquer lugar com
            internet.""",
        """Desempenho: Grandes provedores de nuvem oferecem infraestrutura de alta
            performance e disponibilidade.""",
        """Segurança: Muitas vezes, os provedores de nuvem oferecem medidas de segurança
            robustas e conformidade com regulamentos."""
      ])
    ]),
    Topic(title: "Desvantagens e Desafios", sections: [
      Section(bulletPoints: [
        """Privacidade e Segurança: A transferência de dados para a nuvem pode levantar
      preocupações de segurança.""",
        """Dependência do Provedor: A empresa fica dependente da infraestrutura e das
          políticas do provedor de serviços.""",
        """Interrupções de Serviço: Falhas ou interrupções nos serviços de nuvem podem afetar
          a disponibilidade de aplicativos e dados."""
      ]),
    ]),
    Topic(title: " Exemplos de Uso", sections: [
      Section(bulletPoints: [
        "Armazenamento de Dados: Google Drive, Dropbox.",
        "Hospedagem de Sites: Amazon Web Services, Microsoft Azure.",
        "Computação e Análise de Dados: Google BigQuery, AWS Lambda.",
        "Desenvolvimento de Aplicações: Heroku, Microsoft Azure App Service.",
      ])
    ]),
    Topic(
        title: "Segurança na Computação em Nuvem",
        introduction:
            """A segurança é uma preocupação primordial na computação em nuvem. Aqui estão alguns
  aspectos importantes:""",
        sections: [
          Section(subtitle: "Controle de Acesso", bulletPoints: [
            """Autenticação Multifatorial (MFA): Adicionar camadas extras de segurança além da
  senha, como códigos enviados por SMS ou apps de autenticaçã""",
            """Gerenciamento de Identidade e Acesso (IAM): Ferramentas que ajudam a definir e
  gerenciar as permissões dos usuários e recursos na nuvem."""
          ]),
          Section(subtitle: "Criptografia", bulletPoints: [
            """Criptografia em Trânsito: Protege dados enquanto são transferidos entre seu
  dispositivo e a nuvem.""",
            "Criptografia em Repouso: Protege dados armazenados na nuvem."
          ]),
          Section(subtitle: "Conformidade e Regulamentação", bulletPoints: [
            """● GDPR: Regulamento Geral sobre a Proteção de Dados da União Europeia que impõe
  rigorosas regras de privacidade e segurança.""",
            """● HIPAA: Lei de Portabilidade e Responsabilidade de Seguros de Saúde nos EUA que
  exige a proteção de informações de saúde."""
          ])
        ]),
    Topic(
        title: "Tendências Futuras na Computação em Nuvem",
        introduction:
            "A computação em nuvem está em constante evolução. Algumas tendências futuras incluem:",
        sections: [
          Section(subtitle: "Edge Computing", bulletPoints: [
            """Processamento de dados mais próximo da fonte, reduzindo a latência e melhorando
  o desempenho. Isso é crucial para aplicações de IoT (Internet das Coisas)."""
          ]),
          Section(
              subtitle: "Inteligência Artificial e Machine Learning",
              bulletPoints: [
                """AIaaS (Artificial Intelligence as a Service): Serviços que oferecem capacidades de IA e ML
  na nuvem, facilitando a integração dessas tecnologias em aplicações.""",
                "Exemplos: AWS SageMaker, Google AI Platform."
              ]),
          Section(subtitle: "Containers e Orquestração", bulletPoints: [
            """Docker: Tecnologia que permite empacotar e distribuir aplicações em containers,
  garantindo consistência e portabilidade.""",
            "Kubernetes: Plataforma de orquestração que gerencia containers em larga escala."
          ]),
          Section(subtitle: "Serverless Computing", bulletPoints: [
            """Modelo de execução onde o provedor de nuvem gerencia a infraestrutura,
  permitindo que os desenvolvedores se concentrem apenas no código.""",
            "Exemplos: AWS Lambda, Azure Functions."
          ])
        ]),
    Topic(
        title: "Casos de Uso Práticos",
        introduction:
            """Aqui estão alguns exemplos práticos de como a computação em nuvem é utilizada em
  diferentes setores:""",
        sections: [
          Section(subtitle: "E-commerce", bulletPoints: [
            """Elasticidade: A capacidade de aumentar ou diminuir a infraestrutura de TI
  rapidamente durante picos de vendas, como na Black Friday.""",
            """Análise de Dados: Utilização de serviços de Big Data para analisar padrões de compra
  e comportamento do cliente."""
          ]),
          Section(subtitle: "Educação", bulletPoints: [
            """E-learning: Plataformas como Google Classroom e Microsoft Teams permitem aulas
  online e gestão de cursos."""
                """Laboratórios Virtuais: Estudantes podem acessar laboratórios e softwares complexos,
  via nuvem, reduzindo custos de equipamentos."""
          ]),
          Section(subtitle: "Saúde", bulletPoints: [
            """Telemedicina: Videoconferências, consultas e monitoramento remoto de pacientes
  utilizando serviços de nuvem.""",
            """Gestão de Dados Clínicos: Armazenamento e análise segura de registros médicos
  eletrônicos."""
          ]),
          Section(subtitle: "Finanças", bulletPoints: [
            """Trading e Análise de Risco: Utilização de computação de alta performance (HPC) na
  nuvem para analisar grandes volumes de dados financeiros em tempo real.""",
            """Compliance: Serviços de nuvem ajudam a garantir conformidade regulatória com
  normas financeiras rigorosas."""
          ]),
        ]),
    Topic(
        title: "Melhores Práticas na Adoção da Computação em Nuvem",
        introduction:
            """Para maximizar os benefícios da computação em nuvem, as empresas devem seguir algumas
  melhores práticas:""",
        sections: [
          Section(subtitle: "Planejamento e Avaliação", bulletPoints: [
            "Avaliação de Riscos: Analisar os riscos potenciais associados à migração para a nuvem."
                """Planejamento de Capacidade: Determinar os requisitos de capacidade atuais e
  futuros."""
          ]),
          Section(subtitle: "Governança e Gestão", bulletPoints: [
            """Políticas de Uso: Estabelecer políticas claras sobre o uso da nuvem, incluindo
  gerenciamento de custos e segurança."""
                """Monitoramento e Auditoria: Utilizar ferramentas para monitorar e auditar o uso da
  nuvem, garantindo conformidade e eficiência."""
          ]),
          Section(subtitle: "Treinamento e Suporte", bulletPoints: [
            """Capacitação: Treinar a equipe em novas ferramentas e serviços de nuvem."""
                """Suporte Contínuo: Garantir que haja suporte contínuo e recursos disponíveis para
  resolver problemas rapidamente."""
          ])
        ]),
    Topic(
        title: "Exemplos de Provedores de Nuvem",
        introduction:
            """Além dos mais conhecidos (AWS, Azure, GCP), existem outros provedores e serviços
  específicos para diferentes necessidades:""",
        sections: [
          Section(bulletPoints: [
            "IBM Cloud: Conhecida por suas soluções de IA e blockchain."
                "Oracle Cloud: Focada em soluções empresariais e banco de dados."
                "Alibaba Cloud: Forte presença na Ásia, oferecendo uma vasta gama de serviços."
          ])
        ]),
    Topic(
        title: "Economia da Computação em Nuvem",
        introduction:
            "A economia da computação em nuvem envolve vários aspectos:",
        sections: [
          Section(subtitle: "Modelos de Preço", bulletPoints: [
            "Pay-as-you-go: Pague apenas pelo que usar",
            "Assinatura: Pagamento mensal ou anual por um pacote de serviços",
            "Reserved Instances: Descontos para compromissos de longo prazo."
          ]),
          Section(subtitle: "Otimização de Custos", bulletPoints: [
            "Auto-scaling: Ajuste automático de recursos com base na demanda.",
            """Uso de Serviços Gratuitos: Muitos provedores oferecem níveis gratuitos de uso
  limitado para serviços básicos.
  Compreender a computação em nuvem em profundidade pode ajudar a maximizar suas
  vantagens e minimizar os riscos, proporcionando uma infraestrutura de TI mais eficiente,
  flexível e segura."""
          ])
        ])
  ];

  return content;
}
