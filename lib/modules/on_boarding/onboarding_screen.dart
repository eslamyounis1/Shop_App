import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/components.dart';

import '../login/login_screen.dart';

class BoardingModel {
  late final String title;
  late final String body;
  late final String image;

  BoardingModel({
    required this.title,
    required this.body,
    required this.image,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

bool isLastPage = false;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var boardingPageController = PageController();
    List<BoardingModel> boardingPages = [
      BoardingModel(
        title: 'Screen Title1',
        body: 'Screen Body1',
        image: 'assets/images/boarding.png',
      ),
      BoardingModel(
        title: 'Screen Title2',
        body: 'Screen Body2',
        image: 'assets/images/boarding.png',
      ),
      BoardingModel(
        title: 'Screen Title3',
        body: 'Screen Body3',
        image: 'assets/images/boarding.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              navigateAndFinish(context,  LoginScreen());
            },
            child:Text(
              'Skip',
              style: TextStyle(
                color: HexColor('#DB3022'),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == boardingPages.length - 1;
                  });
                },
                controller: boardingPageController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildBoardingItem(boardingPages[index]),
                itemCount: boardingPages.length,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: boardingPageController,
                  count: boardingPages.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: HexColor('#DB3022'),
                    dotColor: Colors.grey,
                    expansionFactor: 4,
                    dotWidth: 10.0,
                    spacing: 5.0,
                  ),
                  onDotClicked: (index) {
                    boardingPageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                isLastPage
                    ? Container(
                        decoration: BoxDecoration(
                          color: HexColor('#DB3022'),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            navigateAndFinish(context,  LoginScreen());
                          },
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : FloatingActionButton(
                  backgroundColor: HexColor('#DB3022'),
                        onPressed: () {
                          boardingPageController.nextPage(
                            duration: const Duration(
                              milliseconds: 400,
                            ),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Icon(
                          Icons.navigate_next,
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            model.body,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      );
}
