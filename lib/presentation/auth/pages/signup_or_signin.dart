import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterspotifycloneapp/common/helpers/is_dark_mode.dart';
import 'package:flutterspotifycloneapp/common/widgets/appBar/app_bar.dart';
import 'package:flutterspotifycloneapp/common/widgets/button/basic_app_button.dart';
import 'package:flutterspotifycloneapp/core/configs/assets/app_images.dart';
import 'package:flutterspotifycloneapp/core/configs/assets/app_vectors.dart';
import 'package:flutterspotifycloneapp/core/configs/theme/app_colors.dart';
import 'package:flutterspotifycloneapp/presentation/auth/pages/signin.dart';
import 'package:flutterspotifycloneapp/presentation/auth/pages/signup.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern,
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVectors.bottomPattern,
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.authBG,
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppVectors.logo,
                  ),

                  SizedBox(height: 55,),

                  Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 21,),

                  Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 21,),

                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicAppButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => SignupPage()
                                )
                            );
                          },
                          title: 'Register',
                        )
                      ),

                      SizedBox(width: 20,),

                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => SigninPage()
                                )
                            );
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: context.isDarkMode? Colors.white : Colors.black,
                            ),
                          )
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
