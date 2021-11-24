import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/Data/Cash/cashHelper.dart';
import 'package:shopapp/Modules/Login/login.dart';
import 'package:shopapp/Shared/componants/reusable/reusable%20components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardModel {
  final String? path;
  final String? title;
  final String? subtitle;

  OnBoardModel({this.path, this.title, this.subtitle});
}

class OnBoarding extends StatelessWidget {
  var pagViewControlar = PageController();
  List<OnBoardModel> items = [
    OnBoardModel(
        path: 'assets/images/on_1.jpg',
        title: 'Title 1',
        subtitle: 'Sub Title 1'),
    OnBoardModel(
        path: 'assets/images/on_2.jpg',
        title: 'Title 2',
        subtitle: 'Sub Title 2'),
    OnBoardModel(
        path: 'assets/images/on_3.jpg',
        title: 'Title 3',
        subtitle: 'Sub Title 3'),
  ];
  bool isEnd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                submit(context);
              },
              child: Text('SKIP'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == items.length - 1) {
                    isEnd = true;
                  } else {
                    isEnd = false;
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: pagViewControlar,
                itemBuilder: (context, index) => PageViewItem(items, index),
                itemCount: items.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: pagViewControlar,
                    count: items.length,
                    effect: WormEffect(
                        activeDotColor: Colors.indigo,
                        dotColor: Colors.grey,
                        dotHeight: 15,
                        spacing: 10,
                        dotWidth: 15,
                        radius: 7.5)),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isEnd) {
                      submit(context);
                    } else {}
                    pagViewControlar.animateToPage(
                      5,
                      duration: Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                  child: Icon(Icons.chevron_right_rounded),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void submit(context) => CashHelper.saveData(key: 'isBoarding', value: true)
      .then((value) => NavtoAndFinsh(context, Login()));
  Widget PageViewItem(items, index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.asset('${items[index].path}')),
        SizedBox(
          height: 20,
        ),
        Text(
          '${items[index].title}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '${items[index].subtitle}',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
