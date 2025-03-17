import 'package:flutter/material.dart';
import 'package:mrowid/typography/typography.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<Map<String, String>> _slides = [
    {
      'title': 'Dating App Concept',
      'description':
          'Mrow is a social dating app that let’s you find & interact with people nearby with similar interests using text, voice messages & fun emojis',
    },
    {
      'title': 'Find Your Match',
      'description':
          'Discover new connections and build meaningful relationships with Mrow’s unique matching features',
    },
    {
      'title': 'Stay Connected',
      'description':
          'Chat, share, and stay in touch with your matches anytime, anywhere',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            'assets/images/card.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 22, bottom: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 85, 
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _slides.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _slides[index]['title']!,
                            style: Font.bold.fs16.whiteff(),
                          ),
                          const SizedBox(height: 7),
                          SizedBox(
                            width: 200,
                            child: Text(
                              _slides[index]['description']!,
                              style: Font.medium.fs9.whiteff(),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 25), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(_slides.length, (index) {
                    bool isSelected = index == _currentPage;
                    return Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: isSelected ? 7 : 3,
                        height: 3,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFFFFFFF) 
                              : const Color(0xFF949494), 
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}