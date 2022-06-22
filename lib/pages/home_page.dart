import 'package:fix_my_english/constants/constants.dart';
import 'package:fix_my_english/widgets/file_list.dart';
import 'package:flutter/material.dart';

import '../widgets/text_field.dart';
import '../widgets/my_button.dart';
import '../widgets/app_bar.dart';
import '../style/colors.dart';
import '../models/controller.dart';

class HomePage extends StatelessWidget {
  static const pageName = '/';

  final myController = MyController(TextEditingController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(children: [
                Container(
                  width: 1000,
                  height: 400,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2EEE1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 250,
                        height: 400,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Container(
                                child: Center(
                                  child: Text(
                                    'Export CSV',
                                    style: TextStyle(
                                        fontFamily: 'Eczar',
                                        color: Colors.white),
                                  ),
                                ),
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: colorSecondaryGreenPlant,
                                )),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset(noPdfPath),
                            Text(
                              'No pdf imported',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Please add pdf for iExtract to check',
                              style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: SizedBox(
                                width: 60,
                                height: 40,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Add pdf',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Image.asset(plus)
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                                width: 64,
                                height: 40,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Delete pdf',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Image.asset(urnaPomoika)
                                    ],
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                    Container(
                        height: 400,
                        child: Expanded(
                          child: FileListView(),
                        )),
                  ],
                )),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
