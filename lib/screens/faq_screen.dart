import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrowid/colors/color.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  List<bool> _isExpandedList = List.generate(6, (_) => false);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqData = [
      {
        'title': 'What is an application?',
        'content': 'An application, often shortened to \'app,\' is a software program designed to perform a specific task or set of tasks for end users. It can range from simple tools like calculators to complex systems like word processors or video games.',
      },
      {
        'title': 'What are the key components of an application?',
        'content': 'Key components of an application typically include the user interface (UI), business logic, data storage, and sometimes networking capabilities. These components work together to deliver functionality to the end user.',
      },
      {
        'title': 'What are the different ways to develop an application?',
        'content': 'Applications can be developed using various approaches including native development (platform-specific), cross-platform frameworks like Flutter or React Native, progressive web apps (PWAs), or hybrid approaches combining multiple technologies.',
      },
      {
        'title': 'How do applications work?',
        'content': 'Applications work by executing code that manipulates data and interacts with device hardware and operating systems. They receive input from users, process that input according to programmed logic, and produce output in the form of visual elements, sounds, or other interactions.',
      },
      {
        'title': 'What makes a good application?',
        'content': 'A good application typically has an intuitive user interface, performs reliably, responds quickly to user actions, solves a specific problem efficiently, and provides a seamless user experience across different devices and screen sizes.',
      },
      {
        'title': 'What are the different types of applications?',
        'content': 'Applications can be categorized into various types including mobile apps, desktop applications, web applications, system utilities, games, productivity tools, social media platforms, and enterprise software, each serving different purposes and user needs.',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteff,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 55,
              color: AppColors.whiteff,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Image.asset(
                        'assets/icons/back.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'FAQ',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black2b,
                        ),
                      ),
                      Text(
                        'Please read for more information',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray94,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset(
                      'assets/icons/notifikasi.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 26, 16, 0),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: faqData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _isExpandedList[index] = !_isExpandedList[index];
                                });
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                height: 40,
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                decoration: BoxDecoration(
                                  color: _isExpandedList[index] ? AppColors.black2b : AppColors.grayf6,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        faqData[index]['title']!,
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: _isExpandedList[index] ? AppColors.whiteff : AppColors.gray94,
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      _isExpandedList[index] 
                                        ? 'assets/icons/arrow_up.png' 
                                        : 'assets/icons/arrow_down_gray.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild: Container(),
                            secondChild: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
                              decoration: BoxDecoration(
                                color: AppColors.whiteff,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    faqData[index]['content']!,
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300, // light
                                      color: AppColors.gray94,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Divider(
                                    color: AppColors.grayd9,
                                    thickness: 1,
                                    height: 0,
                                  ),
                                ],
                              ),
                            ),
                            crossFadeState: _isExpandedList[index] 
                                ? CrossFadeState.showSecond 
                                : CrossFadeState.showFirst,
                            duration: Duration(milliseconds: 300),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}