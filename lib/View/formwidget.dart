import 'package:flutter/material.dart';
import 'package:handyman/View/style.dart';

class FormWidget with Ui {
  String? inputText;
  String? text;
  BuildContext? context;
  TextInputType? keyboard;
  Widget? suffix;

  FormWidget({
    required this.inputText,
    required this.text,
    required this.context,
  });

  Widget inputName() {
    return input(grey61, 12, text!, w700);
  }

  Widget textField() {
    return Padding(
      padding: pSymmetric(10, 0),
      child: Column(
        crossAxisAlignment: cStart,
        children: [
          inputName(),
          hspacer(5),
          Container(
            width: width(context),
            height: 54,
            alignment: left,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: borderR(8),
                border: Border.all(
                  color: const Color(0xffD5D5D5),
                  width: 1,
                )),
            child: TextField(
              onChanged: (val) {
                inputText = val;
              },
              keyboardType: keyboard ?? TextInputType.name,
              decoration: const InputDecoration(
                // suffix: Icon(Icons.remove_red_eye),
                // labelText: 'Email address',
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.grey),
                // errorText: validmail(email),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget dropdown(context) {
  //   return Padding(
  //     padding: pSymmetric(10, 0),
  //     child: Column(
  //       crossAxisAlignment: cStart,
  //       children: [
  //         inputName(),
  //         hspacer(5),
  //         Container(
  //           width: width(context),
  //           height: 48,
  //           alignment: left,
  //           padding: const EdgeInsets.all(12),
  //           decoration: BoxDecoration(
  //               borderRadius: borderR(8),
  //               border: Border.all(
  //                 color: greyCE,
  //                 width: 1,
  //               )),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               input(black83, 14, inputText!, w500),
  //               SvgPicture.asset('assets/dropdown.svg')
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Future<String> chooseModel(
  //   BuildContext context,
  //   List<String> data,
  // ) async {
  //   await showModalBottomSheet(
  //       context: context,
  //       isScrollControlled: true,
  //       useSafeArea: true,
  //       builder: (context) {
  //         return Builder(builder: (context) {
  //           return SafeArea(
  //             child: SingleChildScrollView(
  //               child: Column(
  //                 crossAxisAlignment: cStart,
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.all(16.0),
  //                     child: Row(
  //                       children: [
  //                         input(black20, 16, 'Select $text', w700),
  //                         const Spacer(),
  //                         GestureDetector(
  //                           onTap: () {
  //                             popBack(context);
  //                           },
  //                           child: Icon(
  //                             Icons.close,
  //                             size: 14,
  //                             color: black2,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Column(
  //                     crossAxisAlignment: cStart,
  //                     children: List.generate(
  //                         data.length,
  //                         (index) => GestureDetector(
  //                             onTap: () {
  //                               inputText = data[index];
  //                               //   updateText(data[index]);
  //                               popBack(context);
  //                             },
  //                             child: Container(
  //                                 decoration: const BoxDecoration(
  //                                     border: Border.symmetric(
  //                                   horizontal: BorderSide(
  //                                       width: 1, color: Color(0xfff3f3f3)),
  //                                   vertical: BorderSide.none,
  //                                 )),
  //                                 margin: pSymmetric(0, 0),
  //                                 padding: pSymmetric(15, 16),
  //                                 width: width(context),
  //                                 child: commonText(data[index], black2)))),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           );
  //         });
  //       });
  //   return inputText!;
  // }
}
