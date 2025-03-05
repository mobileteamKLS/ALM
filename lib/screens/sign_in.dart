import 'package:alm/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/dimensions.dart';
import '../core/img_assets.dart';
import '../theme/app_colors.dart';
import '../utils/media_query.dart';
import '../widgest/common_widgests.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Container(
          width: double.infinity,

          decoration:  BoxDecoration(
            gradient: const LinearGradient(colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,),
              borderRadius:BorderRadius.only(
                  bottomLeft: Radius.circular(ScreenDimension.onePercentOfScreenWidth * 6)
              )
            // image: DecorationImage(
            //     image: AssetImage(loginBgImage), fit: BoxFit.cover),
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
                          text: "ALM \n",
                          style:TextStyle(
                              fontSize: ScreenDimension.textSize * AppDimensions.headingText,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),

                        ),
                        TextSpan(
                          text: "Anchorage Logistics Marketplace",
                          style:  TextStyle(
                              fontSize: ScreenDimension.textSize * AppDimensions.headingText,
                              color: AppColors.white,
                              fontWeight: FontWeight.w300,

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
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Container(
                        height:ScreenDimension.onePercentOfScreenHight*75,
                        padding: EdgeInsets.all(
                            ScreenDimension.onePercentOfScreenHight * AppDimensions.cardPadding),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:BorderRadius.only(
                              topRight: Radius.circular(ScreenDimension.onePercentOfScreenWidth * AppDimensions.cardBorderRadiusCurve),
                              topLeft: Radius.circular(ScreenDimension.onePercentOfScreenWidth * AppDimensions.cardBorderRadiusCurve),
                            )

                        ),
                        child:Column(
                          children: [
                            // SizedBox(
                            //   height: ScreenDimension.onePercentOfScreenHight*3,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sign In",
                                  style:  TextStyle(
                                      color: AppColors.textColorPrimary,
                                      letterSpacing: 0.8,
                                      fontSize: ScreenDimension.textSize * AppDimensions.headingText,
                                      fontWeight: FontWeight.w900)),

                              ],),
                            SizedBox(
                              height: ScreenDimension.onePercentOfScreenHight*2,
                            ),
                            TextFormField(
                              controller: usernameController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  labelText: 'User Id',
                                  contentPadding: EdgeInsets.only(left:8 ),
                                  suffixIcon: Icon(Icons.person_2_outlined),
                                  suffixIconColor: AppColors.primary),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username Required.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: ScreenDimension.onePercentOfScreenHight*1.5,
                            ),
                            TextFormField(
                              controller: passwordController,
                              obscureText: isPasswordVisible,
                              decoration:  InputDecoration(
                                  labelText: 'Password',
                                  contentPadding: EdgeInsets.only(left:8 ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      isPasswordVisible
                                          ? Icons.visibility_off_outlined
                                          :Icons.visibility_outlined ,
                                      color: AppColors.primary,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                  ),
                                  suffixIconColor: AppColors.primary),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password Required.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: ScreenDimension.onePercentOfScreenHight*2.5,
                            ),
                            RoundedGradientButton(text: "SIGN IN", press: (){
                              print("Sign In");
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                              );
                            }),
                            SizedBox(height: ScreenDimension.onePercentOfScreenHight * 2,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.arrow_back_ios_rounded,color: AppColors.textColorPrimary,),
                                    Text(
                                      "Back",
                                      style:  TextStyle(
                                          color: AppColors.primary,
                                          letterSpacing: 0.8,
                                          fontSize: ScreenDimension.textSize * AppDimensions.titleText,
                                          fontWeight: FontWeight.w700)),

                                  ],
                                ),
                                Text(
                                  "Recover Forgot Password",
                                  style: TextStyle(
                                      color: AppColors.primary,
                                      letterSpacing: 0.8,
                                      fontSize: ScreenDimension.textSize * AppDimensions.titleText,
                                      fontWeight: FontWeight.w700)),

                              ],
                            ),
                            Spacer(),
                            SizedBox(height: ScreenDimension.onePercentOfScreenHight * 0.5,),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Read ",
                                    style:  TextStyle(
                                        fontSize: ScreenDimension.textSize * AppDimensions.bodyTextMedium,
                                        color: AppColors.textColorPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),

                                  ),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(
                                        fontSize: ScreenDimension.textSize *AppDimensions.bodyTextMedium,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w500,
                                      ),

                                  ),
                                  TextSpan(
                                    text: " and ",
                                    style: TextStyle(
                                        fontSize: ScreenDimension.textSize * AppDimensions.bodyTextMedium,
                                        color: AppColors.textColorPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),

                                  ),
                                  TextSpan(
                                    text: "Terms & Conditions",
                                    style: TextStyle(
                                        fontSize: ScreenDimension.textSize *  AppDimensions.bodyTextMedium,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w500,
                                      ),

                                  ),

                                ],
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: ScreenDimension.onePercentOfScreenHight * 2),
                              child: Text("Kale Logistics Solution", style: TextStyle(
                                color: AppColors.textColorSecondary, fontSize: ScreenDimension.textSize * AppDimensions.bodyTextMedium, fontWeight: FontWeight.w400,
                              ),),
                            ),

                          ],
                        ) ,
                      ),

                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
