import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handyman/View/handymen.dart';
import 'package:handyman/View/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Ui {
  List data = [
    {
      'name': 'All',
      'color': const Color(0xff18A974),
    },
    {
      'name': 'Mechanic',
      'color': const Color(0xffE3F3FD),
    },
    {
      'name': 'Photographer',
      'color': const Color(0xffFFE7DF),
    },
    {
      'name': 'Mechanic',
      'color': const Color(0xffE3F3FD),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: cStart,
          children: [
            Container(
              height: height(context) / 1.5,
              alignment: center,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/map.png'), fit: BoxFit.cover)),
              child: Column(crossAxisAlignment: cStart, children: [
                Material(
                  elevation: 2,
                  color: white,
                  borderRadius: borderR(20),
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: center,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: SvgPicture.asset('assets/menu.svg'),
                  ),
                ),
                Container(
                  alignment: left,
                  margin: pSymmetric(15, 0),
                  width: width(context),
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(color: Color.fromRGBO(96, 100, 112, 0.10))
                  ], borderRadius: borderR(8), color: white),
                  padding: pSymmetric(14, 16),
                  child: Row(children: [
                    SvgPicture.asset('assets/search.svg'),
                    wspacer(10),
                    input(grey61, 14, 'Search', w400)
                  ]),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  viewAllRow('Categories', ''),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        itemCount: data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: pSymmetric(10, 16),
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                color: data[index]['color'],
                                borderRadius: borderR(16)),
                            child: Row(
                              children: [
                                index == 0
                                    ? wspacer(0)
                                    : Image.asset(
                                        'assets/${data[index]['name']}.png'),
                                wspacer(index == 0 ? 0 : 11),
                                input(
                                    index == 0
                                        ? white
                                        : const Color(0xff3C3C3C),
                                    12,
                                    data[index]['name'],
                                    w500)
                              ],
                            ),
                          );
                        }),
                  ),
                  InkWell(
                    onTap: () {
                      nav(context, const HandyMen());
                    },
                    child: Padding(
                      padding: pSymmetric(10, 0),
                      child: viewAllRow('Handyman near you', ''),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                        itemCount: data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: Material(
                                color: white,
                                elevation: 2,
                                borderRadius: borderR(14),
                                child: Container(
                                  height: 86,
                                  width: width(context) / 1.5,
                                  alignment: center,
                                  padding:
                                      const EdgeInsets.fromLTRB(14, 12, 0, 14),
                                  decoration: BoxDecoration(
                                      color: white, borderRadius: borderR(14)),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/handyman.png',
                                        fit: BoxFit.fitHeight,
                                        height: 64,
                                        width: 64,
                                      ),
                                      wspacer(17),
                                      Column(
                                        crossAxisAlignment: cStart,
                                        children: [
                                          input(const Color(0xff333333), 16,
                                              'Mechanic', w700),
                                          input(const Color(0xff888888), 14,
                                              'Scott Fredrick', w400),
                                          input(const Color(0xffBDBDBD), 12,
                                              'No 2 Victoria', w400),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  hspacer(50),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
