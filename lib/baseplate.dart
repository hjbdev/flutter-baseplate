library baseplate;

import 'package:flutter/material.dart';

/// Senses Baseplate
/// ----------------------------------------------------------
/// A responsive frontend framework for creating rich flutter
/// user interfaces with a more web-oriented syntax. Influenced
/// by the likes of Bootstrap and Materialize

class bpCol extends StatelessWidget {

  int w360;
  int w540;
  int w720;
  int w1024;
  int w1200;
  int w1500;
  int w2000;
  int w2500;
  Widget child;
  int colCount;
  double gutter = 0.0;
  int colWidth = 0;

  bpCol({this.w360, this.w540, this.w720, this.w1024, this.w1200, this.w1500, this.w2000, this.w2500, this.child});

  @override build(BuildContext context){
    // calculate col width based on screen width
    colWidth = Baseplate.calculateColWidth(context, w360, w540, w720, w1024, w1200, w1500, w2000, w2500);

    // calculate padding
    int gutterCount = 2 + (colCount - 1);
    double totalGutter = gutterCount * gutter;
    double width = Baseplate.calculateWidth(context, colWidth, totalGutter);

    return Container(
        width: width,
        child: child
    );
  }

  setColCount(int count) {
    colCount = count;
  }

  getColWidth(context) {
    return Baseplate.calculateColWidth(context, w360, w540, w720, w1024, w1200, w1500, w2000, w2500);
  }

  setGutter(double theGutter) {
    gutter = theGutter;
  }
}

class bpRow extends StatelessWidget {

  double gutter;
  double runSpacing;
  List<bpCol> children;

  bpRow({this.gutter = 0, this.runSpacing = 0, @required this.children});

  @override build(BuildContext context) {
    int colCount = 0;
    // what row am I on?
    // (tempColCount / 12).floor()
    //
    Map<int, int> rowColCounts = new Map<int, int>();

    for(var i = 0; i < children.length; i++) {
      var col = children[i];
      colCount += col.getColWidth(context);

      // the row it's on
      int whatRow = (colCount / 12).floor();

      // if it's a number with no remainder, then it's on the row below
      if(colCount % 12 == 0) {
        whatRow = whatRow - 1;
      }

      // build up the column counts per row
      if (rowColCounts[whatRow] == null) {
        rowColCounts[whatRow] = 1;
      } else {
        rowColCounts[whatRow]++;
      }


      // what do I need?
      // an array of the column counts per row
      // how am I getting it?
      // loop through all the children /
      // work out which row they are on /
      // count how many are on each row /
    }

    colCount = 0;
    for(var i = 0; i < children.length; i++) {
      var col = children[i];
      colCount += col.getColWidth(context);

      int whatRow = (colCount / 12).floor();

      if(colCount % 12 == 0) {
        whatRow = whatRow - 1;
      }

      col.setColCount(rowColCounts[whatRow]);
      col.setGutter(gutter);
    }




    return Container(
        padding: EdgeInsets.symmetric(horizontal: gutter),
        width: MediaQuery.of(context).size.width,
        child: Wrap(
          spacing: gutter,
          runSpacing: runSpacing,
          children: children,
        )
    );
  }
}

class Baseplate {

  static calculateColWidth(context, w360, w540, w720, w1024, w1200, w1500, w2000, w2500) {
    if (w360 != null && MediaQuery.of(context).size.width <= 360) {
      return w360;
    } else if (w540 != null && MediaQuery.of(context).size.width <= 540) {
      return w540;
    } else if (w720 != null && MediaQuery.of(context).size.width <= 720) {
      return w720;
    } else if (w1024 != null && MediaQuery.of(context).size.width <= 1024) {
      return w1024;
    } else if (w1200 != null && MediaQuery.of(context).size.width <= 1200) {
      return w1200;
    } else if (w1500 != null && MediaQuery.of(context).size.width <= 1500) {
      return w1500;
    } else if (w2000 != null && MediaQuery.of(context).size.width <= 2000) {
      return w2000;
    } else if (w2500 != null && MediaQuery.of(context).size.width <= 2500) {
      return w2500;
    } else {
      return 12;
    }
  }

  static calculateWidth(BuildContext context, int colWidth, [padding = 0]) {
    var screenWidth = MediaQuery.of(context).size.width;
    var fraction = colWidth / 12;
    return (screenWidth - padding) * fraction;
  }

  static Widget col({w360, w540, w720, w1024, w1200, w1500, w2000, w2500, Widget child, padding: 0}) {
    return bpCol(
        w360: w360,
        w540: w540,
        w720: w720,
        w1024: w1024,
        w1200: w1200,
        w1500: w1500,
        w2000: w2000,
        w2500: w2500,
        child: child,
    );
  }

  static Widget row({double gutter = 0, double runSpacing = 0, @required List<bpCol> children}){
    return bpRow(children: children, gutter: gutter, runSpacing: runSpacing);
  }
}
