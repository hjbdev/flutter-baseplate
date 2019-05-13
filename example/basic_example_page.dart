import 'package:flutter/material.dart';
import 'package:baseplate/baseplate.dart';

class BasicExamplePage extends StatelessWidget {
  BasicExamplePage();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraints) => Scaffold(
            appBar: AppBar(
              title: Text('flutter-baseplate Example'),
            ),
            body: Container(
                child: bpRow(
              runSpacing: 8,
              padding: 8,
              gutter: 8,
              constraints: constraints,
              children: [
                bpCol(
                  w1200: 6,
                  constraints: constraints,
                  child: Container(
                    color: Colors.red,
                    height: 100,
                  ),
                ),
                bpCol(
                    w1200: 6,
                    constraints: constraints,
                    child: bpRow(
                      children: [
                        bpCol(
                          w1200: 6,
                          constraints: constraints,
                          child: Container(
                            color: Colors.pink,
                            height: 100,
                          ),
                        ),
                        bpCol(
                          w1200: 6,
                          constraints: constraints,
                          child: Container(
                            color: Colors.blue,
                            height: 100,
                          ),
                        )
                      ],
                    )),
                bpCol(
                    w1200: 6,
                    constraints: constraints,
                    child: Container(
                      color: Colors.yellow,
                      height: 100,
                    ))
              ],
            ))));
  }
}
