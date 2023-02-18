import 'package:bank/shared/theme.dart';
// import 'package:bank/ui/pages/sign_in_page.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together',
  ];

  List<String> subtitles = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                items: [
                  Image.asset(
                    'assets/img_onboarding1.png',
                    height: 500,
                    width: 500,
                  ),
                  Image.asset(
                    'assets/img_onboarding2.png',
                    height: 500,
                    width: 500,
                  ),
                  Image.asset(
                    'assets/img_onboarding3.png',
                    height: 500,
                    width: 500,
                  ),
                ],
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                carouselController: carouselController,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: background2,
                  borderRadius: BorderRadius.circular(20),
                  // boxShadow: const [
                  //   BoxShadow(
                  //     color: Color(0xffDDDDDD),
                  //     blurRadius: 6.0,
                  //     spreadRadius: 2.0,
                  //     offset: Offset(0.0, 0.0),
                  //   )
                  // ],
                ),
                child: Column(
                  children: [
                    Text(titles[currentIndex],
                        style: whiteTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 26),
                    Text(subtitles[currentIndex],
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center),
                    SizedBox(height: currentIndex == 2 ? 38 : 50),
                    currentIndex == 2
                        ? Column(
                            children: [
                              CustomFilledButton(
                                title: 'Get Started',
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/sign-up', (route) => false);
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextButton(
                                title: 'Sign in',
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/sign-in', (route) => false);
                                },
                              )
                            ],
                          )
                        : Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == 0
                                        ? purpleColor
                                        : greyColor4),
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == 1
                                        ? purpleColor
                                        : greyColor4),
                              ),
                              Container(
                                width: 12,
                                height: 12,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == 2
                                        ? purpleColor
                                        : greyColor4),
                              ),
                              const Spacer(),
                              CustomFilledButton(
                                width: 150,
                                title: 'Continue',
                                onPressed: () {
                                  carouselController.nextPage();
                                },
                              ),
                            ],
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
