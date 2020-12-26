import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lancelot/models/signup_provider_model.dart';
import 'package:lancelot/routes/custom_routes.dart';
import 'package:lancelot/routes/routes_name.dart';
import 'package:lancelot/services/signup_user.dart';
import 'package:lancelot/views/guard_side_app/models/guard_signup_model.dart';
import 'package:provider/provider.dart';
import 'package:lancelot/services/customer_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpProvider>(
          create: (context) => SignUpProvider(),
        ),
        ChangeNotifierProvider<GuardSignUpProvider>(
          create: (context) => GuardSignUpProvider(),
        ),
        ChangeNotifierProvider<SignUpUsers>(
          create: (context) => SignUpUsers(),
        ),
        ChangeNotifierProvider<CustomerService>(
          create: (context) => CustomerService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lancelot',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: Colors.black,
            centerTitle: true,
          ),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: CustomRoutes.allRoutes,
        initialRoute: splashScreen,
      ),
    );
  }
}
