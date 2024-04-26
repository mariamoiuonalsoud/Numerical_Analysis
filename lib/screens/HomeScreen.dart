import 'package:flutter/material.dart';
import '../matrix/matrixview.dart';
import 'MainScreen.dart';
//Home screen to choose matrix or methods
class HomeScreen extends StatelessWidget {
  static const String routeName = " home screen ";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg' ,),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, MatrixScreen.routeName);
                      },
                      child: Image.asset("assets/images/Matrices.png")
                  ),
                ),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, MainScreen.routeName);
                        },
                        child: Image.asset("assets/images/NonLinerEquation.png")
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}