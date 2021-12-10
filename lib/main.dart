import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        appBarTheme: AppBarTheme(color: Colors.blue[900]),
        cardColor: Colors.blue[900],
        cardTheme: CardTheme(
          elevation: 25,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
      // routes: {
      //   ExtractArgumentsScreen.routeName: (context) =>
      //       const ExtractArgumentsScreen(),
      // },
      // Provide a function to handle named routes.
      // Use this function to identify the named
      // route being pushed, and create the correct
      // Screen.
      // onGenerateRoute: (settings) {
      //   // If you push the PassArguments route
      //   if (settings.name == PassArgumentsScreen.routeName) {
      //     // Cast the arguments to the correct
      //     // type: ScreenArguments.
      //     final args = settings.arguments as ScreenArguments;
      //
      //     // Then, extract the required data from
      //     // the arguments and pass the data to the
      //     // correct screen.
      //     return MaterialPageRoute(
      //       builder: (context) {
      //         return PassArgumentsScreen(
      //           title: args.title,
      //           message: args.message,
      //         );
      //       },
      //     );
      //   }
      //   // The code only supports
      //   // PassArgumentsScreen.routeName right now.
      //   // Other values need to be implemented if we
      //   // add them. The assertion here will help remind
      //   // us of that higher up in the call stack, since
      //   // this assertion would otherwise fire somewhere
      //   // in the framework.
      //   assert(false, 'Need to implement ${settings.name}');
      //   return null;
      // },
      // title: 'Navigation with Arguments',
      home: const HomeScreen(title: 'KCh FM NewsApp'),
    );
  }
}
