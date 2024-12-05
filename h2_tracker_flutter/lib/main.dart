import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:flutter/material.dart';
import 'package:h2_tracker_flutter/views/home_view.dart';
import 'package:h2_tracker_flutter/views/login_view.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return GlobalLoaderOverlay(
      child: MaterialApp(
        title: 'Healthy Habits Tracker',
        routes: {
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomeView(),
        },
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.blue,
              onPrimary: Colors.white,
              secondary: Colors.blue,
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
              surface: Colors.white,
              onSurface: Colors.blue),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
            titleMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            titleSmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            labelMedium: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          primarySwatch: Colors.blue,
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Colors.blue),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            filled: true,
            fillColor: Colors.lightBlueAccent[100]?.withOpacity(0.1),
            hintStyle: TextStyle(
              fontSize: 13,
              color: Colors.blueAccent[100],
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            toolbarHeight: size.height * .1,
            iconTheme: IconThemeData(
              size: (size.height * .64 < 32) ? 32 : size.height * .64,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
              iconSize: WidgetStatePropertyAll(32),
              iconColor: WidgetStatePropertyAll(Colors.white),
              textStyle: WidgetStatePropertyAll(
                TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey.withOpacity(
                  .2,
                ),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
