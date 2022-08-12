import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/components/components.dart';

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

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    PageController boardingPageController = PageController();
    List<BoardingModel> boardingPages = [
      BoardingModel(
        title: 'Screen Title1',
        body: 'Screen Body1',
        image: 'assets/images/onboarding.jpg',
      ),
      BoardingModel(
        title: 'Screen Title2',
        body: 'Screen Body2',
        image: 'assets/images/onboarding.jpg',
      ),
      BoardingModel(
        title: 'Screen Title3',
        body: 'Screen Body3',
        image: 'assets/images/onboarding.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardingPageController,
                physics: BouncingScrollPhysics(),
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
                const Text(
                  'Indicator',
                ),
                FloatingActionButton(
                  onPressed: () {
                    boardingPageController.nextPage(
                      duration: const Duration(milliseconds: 400,),
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
