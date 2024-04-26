import 'package:math_expressions/math_expressions.dart';

class Bisection{
/*------------variables-------------*/
  late double xlI ;
  late double xuI ;
  late double eps ;
  String equation = '';
  int? iterationLimit ;
  String? errorMessage;

/*-----------Lists to store all values---------------*/
  List<double> xl = [];
  List<double> fxl = [];
  List<double> xu = [];
  List<double> fxu = [];
  List<double> xr = [];
  List<double> fxr = [];
  List<double> error = [] ;
  List<int> iterations = [];
/*---------Constructor---------------*/
  Bisection({required this.xlI , required this.xuI , required this.eps , this.iterationLimit = 0});

/*-----------Built in function to evaluate the expression---------------*/
  double calcFunction(double xValue){
    Variable x = Variable('x');
    Parser p  = Parser();//for function analysis
    Expression exp = p.parse(equation);//analysing F(X)
    ContextModel cm = ContextModel();
    cm.bindVariable(x, Number(xValue));//bind variables
    return exp.evaluate(EvaluationType.REAL, cm);//evaluating F(X)
  }

/*------------Bisection Method Calculator---------------*/
  void calcBisection(){
    if(calcFunction(xuI) * calcFunction(xlI) < 0){
      if (iterationLimit != 0){
        for(int i = 0 ; i< iterationLimit! ; i++ ){
          xl.add(xlI);
          fxl.add(calcFunction(xl[i]));
          xu.add(xuI);
          fxu.add(calcFunction(xu[i]));
          xr.add((xl[i] + xu[i])/2);
          fxr.add(calcFunction(xr[i]));

          if(i == 0 ){
            error.add(100);
          }else {
            error.add(((xr[i] - xr[i-1]) / xr[i]).abs() * 100);
          }

          iterations.add(i);
          if (fxl[i]*fxr[i]>0){
            xlI = xr[i];
          } else if (fxl[i]*fxr[i]<0){
            xuI = xr[i];
          }else {
            return;
          }
        }
      }else {
        int i = -1;
        do {
          i++;
          xl.add(xlI);
          fxl.add(calcFunction(xl[i]));
          xu.add(xuI);
          fxu.add(calcFunction(xu[i]));
          xr.add((xl[i] + xu[i])/2);
          fxr.add(calcFunction(xr[i]));

          if(i == 0 ){
            error.add(100);
          }else {
            error.add(((xr[i] - xr[i-1]) / xr[i]).abs() * 100);
          }

          iterations.add(i);
          if (fxl[i]*fxr[i]>0){
            xlI = xr[i];
          } else if (fxl[i]*fxr[i]<0){
            xuI = xr[i];
          }else {
            return;
          }

        }while(error[i] >= eps);
      }
    }else {
      errorMessage = 'invalid xl or xu';
    }
  }
}