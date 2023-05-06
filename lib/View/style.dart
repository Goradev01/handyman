import 'package:flutter/material.dart';

class Ui {
  Color bg = const Color(0xffF5F5F5);
  Color green = const Color(0xff18A975);
  Color black30 = const Color(0xff303030);
  Color blackc1 = const Color(0xff1C1C1C);
  Color black1f = const Color(0xff1C1B1F);
  Color white = const Color(0xffffffff);
  Color greyEF = const Color(0xffEFF5F3);
  Color grey66 = const Color(0xff666766);
  Color grey61 = const Color(0xff616161);
  Color black47 = const Color(0xff434B47);

  double width(context) {
    return MediaQuery.of(context).size.width;
  }

  double height(context) {
    return MediaQuery.of(context).size.height - 65;
  }

  Widget backNav(context) {
    return GestureDetector(
      onTap: () {
        popBack(context);
      },
      child: Container(
        height: 32,
        width: 32,
        alignment: center,
        decoration: BoxDecoration(color: greyEF, borderRadius: borderR(8)),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 12,
        ),
      ),
    );
  }

  BorderRadius borderR(double r) => BorderRadius.circular(r);
  BorderRadius borderUpper(double r) =>
      BorderRadius.vertical(top: Radius.circular(r));

  Widget button(Widget text, Color color) {
    return Container(
      height: 48,
      padding: pSymmetric(10, 20),
      alignment: center,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(24)),
      child: text,
    );
  }

  Future nav(BuildContext context, Widget widget) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  Future navW(BuildContext context, Widget widget) {
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  void popBack(context) {
    return Navigator.of(context).pop();
  }

  Widget buttonContainer(void tap, Widget child) {
    return GestureDetector(
      onTap: () {
        return tap;
      },
      child: child,
    );
  }

  CrossAxisAlignment cStart = CrossAxisAlignment.start;
  MainAxisAlignment mEnd = MainAxisAlignment.end;
  MainAxisAlignment mBtw = MainAxisAlignment.spaceBetween;
  Alignment center = Alignment.center;
  Alignment left = Alignment.centerLeft;
  Alignment topLeft = Alignment.topLeft;
  Alignment topRight = Alignment.topRight;
  Alignment right = Alignment.centerRight;
  FontWeight w500 = FontWeight.w500;
  FontWeight w400 = FontWeight.w400;
  FontWeight w700 = FontWeight.w700;

  EdgeInsets pSymmetric(double v, double h) {
    return EdgeInsets.symmetric(vertical: v, horizontal: h);
  }

  Widget naira(color, size) {
    return Text('N',
        style: TextStyle(
            fontSize: size,
            color: color,
            decorationStyle: TextDecorationStyle.double,
            decorationColor: color,
            decoration: TextDecoration.lineThrough));
  }

  Widget amount(color, double size, text, weight) {
    return Row(
      children: [
        Text('NGN',
            style: TextStyle(
              fontSize: size,
              color: color,
              decorationStyle: TextDecorationStyle.double,
              decorationColor: color,
              // decoration: TextDecoration.lineThrough
            )),
        Text(text,
            style: TextStyle(
              fontSize: size,
              color: color,
              fontWeight: weight,
              decorationColor: color,
            ))
      ],
    );
  }

  Widget innnerLayout(Widget body) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: bg,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: body,
          ),
        ),
      ),
    );
  }

  Widget commonText(String text, Color color) => input(color, 14, text, w500);

  Widget input(color, double size, text, weight) {
    return Text(text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: weight,
          decorationColor: color,
        ));
  }

  Widget inputCenter(color, double size, text, weight) {
    return Text(text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: weight,
          decorationColor: color,
        ));
  }

  Future loadingCircle(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: Alignment.center,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              content: const SizedBox());
        });
  }

  Future errorMessage(BuildContext context, String text) async {
    final snackBar = SnackBar(
      // backgroundColor: Color(0xff3A0CA3),
      backgroundColor: Colors.grey,
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget ptext(text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: Color(0xff2E2E2E)),
    );
  }

  Widget layout(context, widgets) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          child: widgets,
        ));
  }

  Widget hspacer(double num) {
    return SizedBox(height: num);
  }

  Widget wspacer(double num) {
    return SizedBox(width: num);
  }
}
