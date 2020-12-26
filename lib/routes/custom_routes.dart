import 'package:flutter/material.dart';
import 'package:lancelot/routes/routes_name.dart';
import 'package:lancelot/views/authentications/info_screen.dart';
import 'package:lancelot/views/authentications/security_info.dart';
import 'package:lancelot/views/authentications/security_info_bussiness.dart';
import 'package:lancelot/views/authentications/signup_login_screen.dart';
import 'package:lancelot/views/condition_user.dart';
import 'package:lancelot/views/condtition_screen.dart';
import 'package:lancelot/views/guard_side_app/sign_up.dart';
import 'package:lancelot/views/guard_side_app/views/guard_address.dart';
import 'package:lancelot/views/guard_side_app/views/guard_home.dart';
import 'package:lancelot/views/guard_side_app/views/guard_security_signup.dart';
import 'package:lancelot/views/home_page.dart';
import 'package:lancelot/views/not_found_page.dart';
import 'package:lancelot/views/splash_screen.dart';
import 'package:lancelot/views/up_coming.dart';
import 'package:lancelot/views/map_screen.dart';
import 'package:lancelot/views/feedback.dart';

class CustomRoutes {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => SignUpLoginScreen());
      case signupInfoRoute:
        return MaterialPageRoute(builder: (_) => InfoLoginScreen());
      case signupSecurityInfo:
        return MaterialPageRoute(builder: (_) => SecurityInfo());
      case signupSecurityInfoBusiness:
        return MaterialPageRoute(builder: (_) => SecurityInfoBusiness());
      case upComingRoute:
        return MaterialPageRoute(builder: (_) => UpComing());
      case conditionScreen:
        return MaterialPageRoute(builder: (_) => ConditionScreen());
      case guardHome:
        return MaterialPageRoute(builder: (_) => GuardHome());
      case guardSignUp:
        return MaterialPageRoute(builder: (_) => GuardSideSignUp());
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case guardSecurity:
        return MaterialPageRoute(builder: (_) => GuardSecuritySign());
      case guardAddress:
        return MaterialPageRoute(builder: (_) => GuardAddress());
      case mapScreen:
        return MaterialPageRoute(builder: (_) => MapScreen());
      case feedBack:
        return MaterialPageRoute(builder: (_) => FeedBack());
      case conditionUser:
        return MaterialPageRoute(builder: (_) => ConditionUser());
    }
    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}
