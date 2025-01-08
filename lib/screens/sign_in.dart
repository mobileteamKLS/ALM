import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/dimensions.dart';
import '../core/img_assets.dart';
import '../theme/app_colors.dart';
import '../utils/media_query.dart';
import '../widgest/common_widgests.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                top: 50,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenDimension.onePercentOfScreenWidth*headingTextPadding,
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "ALM \n",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: ScreenDimension.textSize * headingText,
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: "Anchorage Logistics Marketplace",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: ScreenDimension.textSize * headingText,
                              color: AppColors.white,
                              fontWeight: FontWeight.w300,
                            ),
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
                            ScreenDimension.onePercentOfScreenHight * 3),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:BorderRadius.only(
                              topRight: Radius.circular(ScreenDimension.onePercentOfScreenWidth * 6),
                              topLeft: Radius.circular(ScreenDimension.onePercentOfScreenWidth * 6),
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
                                  style: GoogleFonts.roboto(textStyle: TextStyle(
                                      color: AppColors.textColorPrimary,
                                      letterSpacing: 0.8,
                                      fontSize: ScreenDimension.textSize * 2.5,
                                      fontWeight: FontWeight.w900)),
                                ),
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
                            }),
                            SizedBox(height: ScreenDimension.onePercentOfScreenHight * 2,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.arrow_back_ios_rounded,color: AppColors.textColorPrimary,),
                                    Text(
                                      "Back",
                                      style: GoogleFonts.roboto(textStyle: TextStyle(
                                          color: AppColors.primary,
                                          letterSpacing: 0.8,
                                          fontSize: ScreenDimension.textSize * 1.7,
                                          fontWeight: FontWeight.w700)),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Recover Forgot Password",
                                  style: GoogleFonts.roboto(textStyle: TextStyle(
                                      color: AppColors.primary,
                                      letterSpacing: 0.8,
                                      fontSize: ScreenDimension.textSize * 1.7,
                                      fontWeight: FontWeight.w700)),
                                ),
                              ],
                            ),
                            Spacer(),
                            SizedBox(height: ScreenDimension.onePercentOfScreenHight * 0.5,),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Read ",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: ScreenDimension.textSize * 1.5,
                                        color: AppColors.textColorPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: ScreenDimension.textSize *1.5,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: " and ",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: ScreenDimension.textSize *1.5,
                                        color: AppColors.textColorPrimary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Terms & Conditions",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        fontSize: ScreenDimension.textSize *  1.5,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: ScreenDimension.onePercentOfScreenHight * 2),
                              child: Text("Kale Logistics Solution", style: TextStyle(
                                color: AppColors.textColorSecondary, fontSize: ScreenDimension.textSize * 1.5, fontWeight: FontWeight.w400,
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
