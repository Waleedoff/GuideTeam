import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_team/Features/chatFeature/chat/view/screen/chat_screen.dart';
import 'package:guide_team/HomeScreen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );

  @override
  Widget build(BuildContext context) {
    var title1 = Padding(
        padding: const EdgeInsets.all(58.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 66),
            // child: Image. asset('assets/images/page1.png')),
          ),
        ));

    //********* PAGE 2
    var body2 = Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: Column(children: [
          Image.asset(
            'assets/images/page1.png',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38.0, left: 49),
            child: Container(
              // width: 48,
              child: Text(
                'أهلا أنا مساعد ',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(1, 89, 39, 1)),
              ),
            ),
          )
        ]),
      ),
    );

    var title2 = Container(
      child: Padding(
          padding: const EdgeInsets.only(top: 6, left: 220),
          child: Image.asset('assets/images/headerSplash.png')),
    );

    //********* PAGE 2
    var body3 = Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: Column(children: [
          Image.asset(
            'assets/images/page1.png',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38.0, left: 49),
            child: Container(
              // width: 48,

              child: Text(
                textAlign: TextAlign.end,
                'كل أجوبتك المختصه في الجهات الحكوميه ماراح تحصلها عندي',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(1, 89, 39, 1)),
              ),
            ),
          )
        ]),
      ),
    );

    var title3 = Container(
      child: Padding(
          padding: const EdgeInsets.only(top: 6, left: 220),
          child: Image.asset('assets/images/headerSplash.png')),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: IntroductionScreen(
          pages: [
            // PageViewModel(
            //   titleWidget: title1,
            //   bodyWidget: body1,
            //   decoration: getPageDecoration(),
            // ),
            PageViewModel(
              titleWidget: title2,
              bodyWidget: body2,
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              titleWidget: title3,
              bodyWidget: body3,
              footer: Container(
                // height: 1,
                // color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ButtonWidget(
                      text: 'ابدا',
                      onClicked: () => Get.to(ChatScreen()),
                      // key: key!,
                    ),
                  ],
                ),
              ),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('', style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          // showSkipButton: true,
          // skip: Padding(
          //   padding: const EdgeInsets.all(18.0),
          //   child: Text(
          //     'تخطى',
          //     style: TextStyle(color: Colors.black),
          //   ),
          // ),
          onSkip: () => goToHome(context),
          // next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).bottomAppBarColor,
          skipFlex: 10,
          nextFlex: 60,
          dotsFlex: 20

          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDurfluation: 1000,
          ),
    );
  }

  // void goToHome(context) => Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (_) => HomePage()),
  //     );

  Widget buildImage(String path) => Center();

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        activeColor: Color(0xff4C7360),
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 49, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 02),
        imagePadding: EdgeInsets.all(44),
        pageColor: Colors.white,
      );
}

// TextStyle(fontSize: 40, fontWeight: FontWeight.bold)
class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    // required Key key,
    required this.text,
    required this.onClicked,
  }) : super(key: null);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
            // side: BorderSide(color: Colors.red)
          )),
          backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff4C7360)),
        ),
        onPressed: onClicked,
        // color: Theme.of(context).primaryColor,
        // shape: StadiumBorder(),
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Container(
          margin: EdgeInsets.fromLTRB(74, 12, 74, 12),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
