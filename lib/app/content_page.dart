import 'package:educar/models/content.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  ContentPageState createState() {
    return ContentPageState();
  }
}

class ContentPageState extends State<ContentPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late List<Topic> topics;

  @override
  void initState() {
    super.initState();
    topics = generateContent().topics;
  }

  void nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void previousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10 ,),
          SmoothPageIndicator(
            controller: _pageController,
            count: topics.length,
            effect: const WormEffect(
              dotHeight: 12,
              dotWidth: 12,
              activeDotColor: Colors.blue,
              dotColor: Colors.grey,
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: topics.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        topics[index].title ?? "Título do Tópico",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      if(topics[index].introduction != null)
                        Text(
                          topics[index].introduction!,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ...topics[index].sections.map((section) =>
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                if(section.subtitle != null)
                                  Text(
                                    section.subtitle!,
                                    style: const TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ...section.contentItems.map((item) =>
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(item),
                                    )),
                                ...section.bulletPoints
                                    .map((point) =>
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text("• $point"),
                                    )),
                              ],
                            ),
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:
      BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          ElevatedButton(
          onPressed: _currentPage > 0 ? previousPage : null,
            child: const Text('Anterior'),
          ),
          _currentPage < topics.length - 1 ?
          ElevatedButton(
            onPressed:
            _currentPage < topics.length - 1 ? nextPage : null,
            child: const Text('Próximo'),
          )
              : ElevatedButton(
            onPressed: () {
              Routefly.push('/quiz');
            },
            child: const Text('Iniciar Quiz'),
          ),
          ],
                ),
        ),
    )

    );
  }
}
