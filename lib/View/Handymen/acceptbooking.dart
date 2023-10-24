import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:handyman/View/alert.dart';
import 'package:handyman/View/style.dart';

class AcceptBooking extends StatefulWidget {
  const AcceptBooking({super.key});

  @override
  State<AcceptBooking> createState() => _AcceptBookingState();
}

class _AcceptBookingState extends State<AcceptBooking> with Ui {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: cStart,
          children: [
            header('Booking details', context),
            hspacer(33),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/3.svg',
                  width: 44,
                  height: 44,
                ),
                wspacer(5),
                input(black, 16, 'Jonathan Parker', w700),
                const Spacer(),
                Builder(builder: (context) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          2,
                          (index) => Padding(
                                padding: pSymmetric(0, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    // chat(context);
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 44,
                                        height: 44,
                                        margin: const EdgeInsets.only(left: 15),
                                        alignment: center,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xffF3F3F5)),
                                        child: SvgPicture.asset(index == 0
                                            ? 'assets/message.svg'
                                            : 'assets/call.svg'),
                                      ),
                                      input(black, 14,
                                          index == 0 ? "Chat" : 'Call', w500)
                                    ],
                                  ),
                                ),
                              )));
                }),
              ],
            ),
            hspacer(34),
            Row(
              children: [
                smallText('Service status'),
                wspacer(18),
                button(
                    commonText(tab > 0 ? 'Ongoing' : 'Not yet arrived', black),
                    const Color(0xffFAE9B7))
              ],
            ),
            Builder(builder: (context) {
              List data = [
                {'text': 'Location', 'sub': 'Adeyemi Adeboye'},
                {'text': 'Service required', 'sub': 'Electrical services'},
                {'text': 'Agreed price', 'sub': '10000'},
              ];
              return Column(
                crossAxisAlignment: cStart,
                children: List.generate(
                    data.length,
                    (index) => Padding(
                          padding: pSymmetric(16, 0),
                          child: Row(
                            children: [
                              smallText(data[index]['text']),
                              const Spacer(),
                              input(black, 14, data[index]['sub'], w700)
                            ],
                          ),
                        )),
              );
            }),
            hspacer(40),
            input(const Color(0xff7A7878), 14, "Handyman's account details",
                w700),
            Builder(builder: (context) {
              List data = [
                {'text': 'Account Number', 'sub': '123456777'},
                {'text': 'Bank', 'sub': 'Ade Bank'},
                {'text': 'Account Name', 'sub': 'Jonathan Parker'},
              ];
              return Column(
                crossAxisAlignment: cStart,
                children: List.generate(
                    data.length,
                    (index) => Padding(
                          padding: pSymmetric(16, 0),
                          child: Row(
                            children: [
                              smallText(data[index]['text']),
                              const Spacer(),
                              input(black, 14, data[index]['sub'], w700)
                            ],
                          ),
                        )),
              );
            }),
            hspacer(35),
            GestureDetector(
                onTap: () {
                  setState(() {
                    tab = 1;
                  });
                  if (tab == 1) {
                    setState(() {
                      tab = 2;
                    });
                  }
                  if (tab == 2) {
                    AlertWidget().endBooking(context);
                  }
                },
                child: button(
                    commonText(
                        tab == 2
                            ? 'End Booking'
                            : tab == 1
                                ? 'Send Invoice'
                                : 'Send Service',
                        white),
                    green)),
            Padding(
              padding: pSymmetric(30, 0),
              child: Center(
                  child: input(
                      const Color(0xffEB5757), 14, 'Cancel booking', w700)),
            )
          ],
        ),
      )),
    );
  }
}
