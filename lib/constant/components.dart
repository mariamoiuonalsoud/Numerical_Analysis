import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../matrix/matrixviewmodel.dart';

Widget defualtFromField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  bool isClickable = true,
  ValueChanged<String>? onSumbit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  required String lable,
})=>
    TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      keyboardType: keyboardType,
      enabled: isClickable,
      onFieldSubmitted: onSumbit,
      onChanged: onChange,
      onTap: onTap,
      decoration:
      InputDecoration(
        labelText: lable,
        labelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          )
        ),
      ),
    );

class MyButton extends StatelessWidget {
  String title;
  String type;
  int flex;
  Function changeTitleOnScreen;

  MyButton({
    required this.title,
    required this.type,
    required this.changeTitleOnScreen,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
            onPressed: (){
              changeTitleOnScreen(title);
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(5),
              backgroundColor: type == "num" ? MaterialStateProperty.all(Colors.grey)
                  : type == "op" ? MaterialStateProperty.all(Colors.blueGrey) : MaterialStateProperty.all(Colors.green),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              shadowColor: MaterialStateProperty.all( Colors.black.withOpacity(0.8)),
            ),
            child: Text(
              title,
              style:const  TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            )
        ),
      ),
    );
  }
}

class MyTheme {
  static const Color backGround = Colors.grey;
  static const Color white = Color(0xfff2f3f8);
  static const Color black = Color(0xff1e1e2d);
  static const Color green = Color(0xffc4e5c6);
  static const Color grey = Color(0xff83819a);
  static const Color purple = Color(0xff9297d7);
  static const Color red = Color(0xfff37b83);

  static ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: backGround,
      appBarTheme:const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      )
  );
}

class MatrixButton extends StatelessWidget {
  String image ;
  Function onButtonPress;
  MatrixButton(this.image,this.onButtonPress);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onButtonPress();
      },
      child:Center(child: Image.asset(image , height:500,)),
    );
  }
}

class MatrixTextField extends StatelessWidget {
  TextEditingController controller ;
  Function validationFunction;
  String title ;

  MatrixTextField({
    required this.controller,
    required this.title,
    required this.validationFunction
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
      child: TextFormField(
        validator: (value) => validationFunction(value),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9,.,-]+')),],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        cursorColor: MyTheme.black,
        style:const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: MyTheme.black
        ),
        decoration: InputDecoration(
          contentPadding:const EdgeInsets.all(30),
          filled: true,
          fillColor: MyTheme.purple,
          hintText: title,
          hintStyle: const TextStyle(
            color: MyTheme.grey,
            fontSize: 24,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:const BorderSide(
                  width: 2,
                  color: MyTheme.white
              )
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:const BorderSide(
                  width: 2,
                  color: MyTheme.red
              )
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:const BorderSide(
                  width: 2,
                  color: MyTheme.white
              )
          ),
          errorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:const BorderSide(
                  width: 2,
                  color:MyTheme.red
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:const BorderSide(
                  width: 2,
                  color: MyTheme.white
              )
          ),

        ),

      ),
    );
  }
}

class MyForm extends StatefulWidget {
  MatriXViewModel viewModel ;
  MyForm(this.viewModel);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  void dispose() {
    super.dispose();
    widget.viewModel.readInputs();
  }
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: widget.viewModel.formKey,
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowOneControllers[0], title: "X11" , validationFunction:widget.viewModel.validationFunction,)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowOneControllers[1], title: "X12" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowOneControllers[2], title: "X13" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowOneControllers[3], title: "X14" , validationFunction:widget.viewModel.validationFunction)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowTwoControllers[0], title: "X21" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowTwoControllers[1], title: "X22" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowTwoControllers[2], title: "X23" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowTwoControllers[3], title: "X24" , validationFunction:widget.viewModel.validationFunction)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowThreeControllers[0], title: "X31" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowThreeControllers[1], title: "X32" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowThreeControllers[2], title: "X33" , validationFunction:widget.viewModel.validationFunction)),
                      Expanded(child: MatrixTextField(controller: widget.viewModel.rowThreeControllers[3], title: "X34" , validationFunction:widget.viewModel.validationFunction)),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}