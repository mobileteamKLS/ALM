import 'package:alm/screens/sign_in.dart';
import 'package:alm/theme/app_colors.dart';
import 'package:alm/widgest/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/dimensions.dart';
import '../core/img_assets.dart';
import '../utils/media_query.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});
  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenDimension().init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(loginBgImage), fit: BoxFit.cover),
        ),
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 70,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenDimension.onePercentOfScreenWidth*AppDimensions.headingTextHorizontalPadding,
                ),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Let's Get Started, \n",
                        style:TextStyle(
                            fontSize: ScreenDimension.textSize * AppDimensions.headingText,
                            color: AppColors.white,
                            fontWeight: FontWeight.w300,
                          ),

                      ),
                      TextSpan(
                        text: "Choose Sign In Method",
                        style: TextStyle(
                            fontSize: ScreenDimension.textSize * AppDimensions.headingText,
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),

                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
             Positioned(
               bottom: 0,
                right: 10,
                left: 10,
                child: Column(
              children: [
                    Container(
                      padding: EdgeInsets.all(
                          ScreenDimension.onePercentOfScreenHight * AppDimensions.cardPadding),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:BorderRadius.circular(ScreenDimension.onePercentOfScreenWidth * AppDimensions.cardBorderRadiusCurve)
                      ),
                      child:Column(
                    children: [
                      // SizedBox(
                      //   height: ScreenDimension.onePercentOfScreenHight*3,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        const Icon(Icons.language_outlined,color: AppColors.primary,),
                        Text(
                          " LANG(EN)",
                          style: TextStyle(
                              color: AppColors.textColorPrimary,
                              letterSpacing: 0.8,
                              fontSize: ScreenDimension.textSize * AppDimensions.titleText,
                              fontWeight: FontWeight.w700)),

                      ],),
                      SizedBox(
                        height: ScreenDimension.onePercentOfScreenHight,
                      ),
                      ButtonWidgets.buildRoundedGradientButton(text: "SIGN IN WITH USER ID", press: (){
                        print("Sign In");
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignInScreen(),),(route) => false,);
                      }),
                      SizedBox(height: ScreenDimension.onePercentOfScreenHight * 2,),
                      Text(
                        "Don\'t have an account yet?",
                        style: TextStyle(
                            color: AppColors.textColorSecondary,
                            letterSpacing: 0.8,
                            fontSize: ScreenDimension.textSize * AppDimensions.bodyTextMedium,
                            fontWeight: FontWeight.w400)),

                      SizedBox(height: ScreenDimension.onePercentOfScreenHight * 0.5,),
                      Text(
                        "Sign Up Now",
                        style:TextStyle(
                            color: AppColors.primary,
                            letterSpacing: 0.8,
                            fontSize: ScreenDimension.textSize * AppDimensions.titleText,
                            fontWeight: FontWeight.w700),

                      ),

                    ],
                  ) ,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: ScreenDimension.onePercentOfScreenHight * 2),
                  child: Text("Kale Logistics Solution", style: TextStyle(
                    color: AppColors.textColorPrimary, fontSize: ScreenDimension.textSize * AppDimensions.bodyTextMedium, fontWeight: FontWeight.w400,
                  ),),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
