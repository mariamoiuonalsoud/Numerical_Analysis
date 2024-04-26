import 'package:flutter/material.dart';
import 'package:numerical_analysis/provider/EquationProvider.dart';
import 'package:numerical_analysis/provider/MatricesProvider.dart';
import 'package:numerical_analysis/screens/HomeScreen.dart';
import 'package:numerical_analysis/screens/MainScreen.dart';
import 'package:numerical_analysis/screens/result/matricesresult.dart';
import 'package:numerical_analysis/screens/result/resultscreen.dart';
import 'package:provider/provider.dart';
import 'calculator/CalcScreenView.dart';
import 'constant/components.dart';
import 'form/FormScreen.dart';
import 'matrix/matrixview.dart';


void main (){
  runApp(MultiProvider(
      providers :[
        ChangeNotifierProvider<EquationsProvider>(create: (context) => EquationsProvider(), ),
        ChangeNotifierProvider<MatricesProvider>(create: (context) => MatricesProvider(),),
      ] ,
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName :(_) => HomeScreen(),
        MainScreen.routeName :(_) => MainScreen(),
        FormScreen.routeName :(_) => FormScreen(),
        CalculatorScreen.routeName :(_) => CalculatorScreen(),
        ResultScreen.routeName : (_) => ResultScreen(),
        MatrixScreen.routeName :(_) => MatrixScreen(),
        MatricesResultScreen.routeName :(_) => MatricesResultScreen(),
      },
      theme: MyTheme.themeData,
      initialRoute: HomeScreen.routeName,

    );

  }
}