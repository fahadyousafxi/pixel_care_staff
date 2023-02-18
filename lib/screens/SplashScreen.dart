import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixel_app/screens/SignUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/AuthController.dart';
import '../widgets/bottomNavigationBar/BottomNavigation.dart';
import 'Register.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        lowerBound: 0.8,
        upperBound: 1.2,
        duration: Duration(seconds: 1));

    controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 10.h),
          AnimatedBuilder(
            animation: controller!,
            child: Icon(
              Icons.notifications,
              size: 35,
              color: Colors.white,
            ),
            builder: (context, widget) => Transform.scale(
              scale: controller!.value,
              child: Container(
                height: 200.h,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/images/splashlogo.svg",
                  //fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
            child: InkWell(
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                token = await pref.getString('token');
                if (pref.getBool('Logined') == true) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => bottomNavigationBar()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                }
              },
              child: Container(
                height: 60.h,
                width: 600.w,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
