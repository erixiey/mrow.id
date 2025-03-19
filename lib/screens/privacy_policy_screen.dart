import 'package:flutter/material.dart';
import 'package:get/Get.dart';
import 'package:mrowid/colors/color.dart';
import 'package:mrowid/typography/typography.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteff,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.whiteff,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Image.asset(
                        'assets/icons/back.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Privacy Policy',
                          style: Font.bold.fs14.black2b(),
                        ),
                        Text(
                          'please read carefully',
                          style: Font.medium.fs10.black2b(),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/notifikasi.png',
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to mrow.id!',
                      style: Font.semiBold.fs12.black2b(),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      'These terms and conditions outline the rules and regulations for the use of MROW\'s Website, located at mrow.id.\n\n'
                      'By accessing this website we assume you accept these terms and conditions. Do not continue to use mrow.id if you do not agree to take all of the terms and conditions stated on this page.\n\n'
                      'The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client", "You" and "Your" refers to you, the person log on this website and compliant to the Company\'s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client\'s needs in respect of provision of the Company\'s stated services, in accordance with and subject to, prevailing law of id. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.',
                      style: Font.regular.fs10.black2b(),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      'Cookies',
                      style: Font.semiBold.fs10.black2b(),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      'We employ the use of cookies. By accessing mrow.id, you agreed to use cookies in agreement with the MROW\'s Privacy Policy.\n\n'
                      'Most interactive websites use cookies to let us retrieve the user\'s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.',
                      style: Font.regular.fs10.black2b(),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      'License',
                      style: Font.semiBold.fs10.black2b(),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      'Unless otherwise stated, MROW and/or its licensors own the intellectual property rights for all material on mrow.id. All intellectual property rights are reserved. You may access this from mrow.id for your own personal use subjected to restrictions set in these terms and conditions.\n\n'
                      'You must not:\n'
                      '- Republish material from mrow.id\n'
                      '- Sell, rent or sub-license material from mrow.id\n'
                      '- Reproduce, duplicate or copy material from mrow.id\n'
                      '- Redistribute content from mrow.id\n\n'
                      'This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the Free Terms and Conditions Generator.\n\n'
                      'Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website.',
                      style: Font.regular.fs10.black2b(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}