import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/components.dart';
import '../provider/MatricesProvider.dart';
import '../screens/result/matricesresult.dart';
import 'matrixnavigator.dart';
import 'matrixviewmodel.dart';

class MatrixScreen extends StatefulWidget {
  static const String routeName = 'matrix screen ';

  @override
  State<MatrixScreen> createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> implements MatrixNavigator{
  MatriXViewModel viewModel = MatriXViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.provider = Provider.of<MatricesProvider>(context , listen: false);
    viewModel.navigator = this;
  }
  @override
  void dispose() {
    super.dispose();
    viewModel.navigator = null ;
    viewModel.navigator = null ;
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> methods = [
      MatrixButton("assets/images/Gauss.png" , viewModel.gaussElimination),
      MatrixButton("assets/images/GaussJordan.png" , viewModel.calcGaussJordan),
      MatrixButton("assets/images/LU.png" , viewModel.calcMatrixWithLU),
      MatrixButton("assets/images/Cramer.png" , viewModel.calcCramer),
    ];
    List<Widget> partial=[
      MatrixButton("assets/images/GEPartial.png" , viewModel.gaussEliminationPartial),
      MatrixButton("assets/images/gjpartial.png" , viewModel.calcPartialGaussJordan),
      MatrixButton("assets/images/LUPartial.png" , viewModel.calcMatrixWitPartialLU),
    ];
    List<Widget> form = [MyForm(viewModel)];

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        decoration:const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg' ,),
                fit: BoxFit.cover
            )
        ),
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Consumer<MatriXViewModel>(
            builder: (context, value, child) => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 CarouselSlider(
                    items: form,
                    options: CarouselOptions(
                      height: 550,
                      viewportFraction: 0.5,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.4,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  CarouselSlider(
                    items: methods,
                    options: CarouselOptions(
                      height: 400,
                      viewportFraction: 0.5,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.4,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  CarouselSlider(
                    items: partial,
                    options: CarouselOptions(
                      height: 400,
                      viewportFraction: 0.5,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.4,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                 ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void goToResultScreen() {
    Navigator.pushNamed(context, MatricesResultScreen.routeName);
  }

}
