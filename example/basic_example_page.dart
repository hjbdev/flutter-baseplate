import 'package:flutter/material.dart';
import 'package:baseplate/baseplate.dart';

class BasicExamplePage extends StatelessWidget {
  BasicExamplePage();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Baseplate.row(
            gutter: 8,
            runSpacing: 8,
            children: [
              Baseplate.col(
                w360: 4,
                child: Container(color: Colors.red, height: 100),
              ),
              Baseplate.col(
                w360: 4,
                child: Container(color: Colors.red, height: 100),
              ),
              Baseplate.col(
                w360: 4,
                child: Container(color: Colors.red, height: 100),
              ),
            ]
        )
    );
  }
}
