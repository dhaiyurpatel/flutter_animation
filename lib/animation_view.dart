import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:show_up_animation/show_up_animation.dart';

class AnimationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationState();
  }
}

class AnimationState extends State<AnimationView> {
  bool _visible = true;
  bool _visiblePerson = false;
  bool _visibleStar = false;
  bool _isBuddyAdded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2200), () {
      if (mounted) {
        setState(() {
          _visible = false;
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 2600), () {
      if (mounted) {
        setState(() {
          _visiblePerson = true;
          _visibleStar = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned.fill(
          top: 180,
          child: ShowUpAnimation(
            delayStart: const Duration(milliseconds: 200),
            animationDuration: const Duration(seconds: 1),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xffFD3C7D),
                    Color(0xffFE9358),
                  ],
                ),
              ),
              child: _isBuddyAdded
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.clear,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(13),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle),
                            child: const AnimatedEmoji(
                              AnimatedEmojis.partyingFace,
                              size: 70,
                              repeat: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Your Referral Code Accepted',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  : Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/background.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: AnimatedOpacity(
                        opacity: _visiblePerson ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 900),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Enter \nReferral code".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Image.asset(
                              'assets/images/box.png',
                              width: 220,
                            ),
                            const Text(
                              "Enter code",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 7, bottom: 15),
                              padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 5,
                                  bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                border: Border.all(
                                  color:
                                      Colors.white.withOpacity(0.5),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Text(
                                '0000  0000  0000',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _visiblePerson = false;
                                  _isBuddyAdded = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xff7B61FF),
                                elevation: 3,
                                minimumSize: const Size(200, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      11), // <-- Radius
                                ),
                              ),
                              child: const Text('Add Your Buddy'),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ),
        ShowUpAnimation(
          delayStart: const Duration(milliseconds: 700),
          animationDuration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          direction: Direction.vertical,
          offset: 0.5,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/cloud.png',
            ),
          ),
        ),
        Positioned.fill(
          bottom: 20,
          child: ShowUpAnimation(
            delayStart: const Duration(milliseconds: 1200),
            animationDuration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/box_bottom.png',
                width: 350,
              ),
            ),
          ),
        ),
        Positioned.fill(
          bottom: 85,
          right: 10,
          child: Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: _visible,
            child: ShowUpAnimation(
              delayStart: const Duration(milliseconds: 1200),
              animationDuration: const Duration(seconds: 1),
              curve: Curves.easeIn,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/box_top.png',
                  fit: BoxFit.fill,
                  width: 350,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          child: ShowUpAnimation(
            delayStart: const Duration(milliseconds: 1500),
            animationDuration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            offset: 4.5,
            child: Image.asset(
              'assets/images/box_top.png',
              fit: BoxFit.fill,
              width: 350,
            ),
          ),
        ),
        Positioned(
          top: 200,
          left: 30,
          child: Visibility(
            visible: _visibleStar,
            child: Lottie.asset('assets/lottie/star_1.json',
                width: 60, height: 60),
          ),
        ),
        Positioned(
          top: 280,
          left: 70,
          child: Visibility(
            visible: _visibleStar,
            child: Lottie.asset('assets/lottie/star_1.json',
                width: 50, height: 50),
          ),
        ),
        Positioned(
          top: 210,
          right: 40,
          child: Visibility(
            visible: _visibleStar,
            child: Lottie.asset('assets/lottie/star_1.json',
                width: 50, height: 50),
          ),
        ),
        Positioned(
          top: 410,
          right: 40,
          child: Visibility(
            visible: _visibleStar,
            child: Lottie.asset('assets/lottie/star_1.json',
                width: 20, height: 20),
          ),
        ),
        Positioned(
          top: 430,
          right: 20,
          child: Visibility(
            visible: _visibleStar,
            child: Lottie.asset('assets/lottie/star_1.json',
                width: 20, height: 20),
          ),
        ),
        Positioned(
          top: 370,
          left: 60,
          child: Visibility(
            visible: _visibleStar,
            child: Lottie.asset('assets/lottie/star_1.json',
                width: 20, height: 20),
          ),
        ),
        Positioned(
          top: 470,
          left: 10,
          child: Visibility(
            visible: _visibleStar,
            child: Lottie.asset('assets/lottie/star_1.json',
                width: 40, height: 40),
          ),
        ),
        Positioned(
          top: 57,
          left: 122,
          child: AnimatedOpacity(
            opacity: _visiblePerson ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 900),
            child: Image.asset(
              'assets/images/person.png',
              fit: BoxFit.fill,
              height: 150,
            ),
          ),
        ),
      ]),
    );
  }
}
