// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: Routes.startupView,
//       onGenerateRoute: StackedRouter().onGenerateRoute,
//       navigatorKey: StackedService.navigatorKey,
//       navigatorObservers: [
//         StackedService.routeObserver,
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:currency_converter/app/app.bottomsheets.dart';
import 'package:currency_converter/app/app.dialogs.dart';
import 'package:currency_converter/app/app.locator.dart';
import 'package:currency_converter/app/app.router.dart';
import 'package:currency_converter/app/views/home_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:currency_converter/app/app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(MainApp());
}

// void main() {
//   setupLocator();
//   runApp(MyApp());
// }

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Moedas',
      theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
      ),
      home: HomeView(),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: (settings) => StackedRouter().onGenerateRoute(settings),
    );
  }
}
