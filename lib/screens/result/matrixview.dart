import 'package:flutter/material.dart';

import '../../models/matrix.dart';
import 'matrixcontainer.dart';

class MatrixViewWidget extends StatelessWidget {
  Matrix matrix ;
  MatrixViewWidget(this.matrix);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:matrix.rowOne.map((e) => MatrixContainer(e.toStringAsFixed(3))).toList()
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:matrix.rowTwo.map((e) => MatrixContainer(e.toStringAsFixed(3))).toList()
            ),
            Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children:matrix.rowThree.map((e) => MatrixContainer(e.toStringAsFixed(3))).toList()
            ),
          ],
        )
    );
  }
}