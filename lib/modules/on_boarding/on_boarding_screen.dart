import 'package:flutter/material.dart';
import 'package:shop_app/shared/componentes/componentes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/style/colors.dart';
import '../login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> board = [
    BoardingModel(
      image: 'assets/images/onboard_1.jpg',
      title: 'On Board 1 Title',
      body: 'On Bord 1 Body',
    ),
    BoardingModel(
        image: 'assets/images/onboard_1.jpg',
        title: 'On Board 2 Title',
        body: 'On Bord 2 Body'),
    BoardingModel(
        image: 'assets/images/onboard_1.jpg',
        title: 'On Board 3 Title',
        body: 'On Bord 3 Body'),
  ];

  var boardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              navigateAndFinish(context, LoginScreen(),);
            },
            child: Text(
              'SKIP',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            //Board
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => buildBoardItem(board[index]),
                physics: BouncingScrollPhysics(),
                itemCount: board.length,
                onPageChanged: (index)
                {
                  if(index == (board.length) - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else{
                    setState(() {
                      isLast = false;
                    });
                  }

                },
                controller: boardController,
              ),
            ),

            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: board.length,
                  effect: JumpingDotEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    dotHeight: 20.0,
                    spacing: 10.0,
                    dotWidth: 10.0,
                    paintStyle: PaintingStyle.fill,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(isLast == true)
                      {
                        navigateAndFinish(context, LoginScreen(),);
                      } else{
                      boardController.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastOutSlowIn,
                      );
                    }

                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      );
}

class BoardingModel {
  final String title;
  final String body;
  final String image;

  BoardingModel({
    @required this.title,
    @required this.body,
    @required this.image,
  });
}
