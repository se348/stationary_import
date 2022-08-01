import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:stationary_import/presentation/widget/pending_order.dart';
import 'package:stationary_import/presentation/screen/confirm_registration.dart';
import 'package:stationary_import/presentation/screen/edit_profile.dart';
import 'package:stationary_import/presentation/screen/whole.dart';
import 'package:stationary_import/presentation/widget/order_form.dart';
import 'package:stationary_import/presentation/screen/password_change.dart';
import 'package:stationary_import/presentation/screen/recent_activity.dart';
import 'package:stationary_import/presentation/screen/store_form.dart';
import 'package:stationary_import/presentation/screen/sub_catagory.dart';
import 'package:stationary_import/provider/login_prov.dart';
import 'package:stationary_import/provider/logs.dart';
import 'package:stationary_import/provider/order_prov.dart';
import 'package:stationary_import/provider/product_prov.dart';
import 'package:stationary_import/provider/profile_pov.dart';
import 'package:stationary_import/provider/signing_prov.dart';
import 'package:stationary_import/provider/unconfirmed_users.dart';

import 'presentation/screen/login_page.dart';
import 'presentation/screen/shop.dart';
import 'presentation/screen/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SigningUp()),
        ChangeNotifierProvider(create: (context) => LoginProv()),
        ChangeNotifierProvider(create: (context) => UnconfirmedUsers()),
        ChangeNotifierProvider(create: ((context) => ProfileProv())),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => OrderProv()),
        ChangeNotifierProvider(create: ((context) => LogsProv()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.blueGrey,
            onPrimary: Colors.white,
            secondary: Colors.blueAccent,
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.white,
            onBackground: Colors.blueAccent,
            surface: Colors.lightGreen,
            onSurface: Colors.blueGrey,
          ),
          textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              titleMedium: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey)),
        ),
        //initialRoute:"/recent-activity" ,
        routes: {
          "/recent-activity": (context) => RecentActivity(),
          "/confirm-registration": (context) => ConfirmRegistration(),
          "/change-password": (context) => const PassworsChange(),
          "/edit-profile": ((context) => EditProfile()),
          "/": (context) => LoginPage(),
          "/sign-up": ((context) => SignUpPage()),
          "/whole": (context) => Whole(),
          '/products': (context) => SubCategory(),
          "/store-form": (context) => StoreForm(),
        },
      ),
    );
  }
}
