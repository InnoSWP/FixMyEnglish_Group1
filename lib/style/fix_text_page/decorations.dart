import 'package:flutter/material.dart';

import './colors.dart';

final BoxDecoration decorationBlocks = BoxDecoration(
  boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
  color: backgroundBlocks,
  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
  border: Border.all(color: Colors.black38),
);
