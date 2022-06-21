import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/simple_dialog.dart';
import '../constants/constants.dart';
import '../models/sentence.dart';

Future<List<Sentence>> postText({text = '', context}) async {
  if (text == null || text.isEmpty) {
    return [];
  }
  showMyNotification(
    text: 'Trying to connect to API to fix given text',
    context: context,
  );

  List<Sentence> sentenceList = [];
  await http
      .post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'text': text,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
      )
      .then((r) => acceptHandler(r, context, sentenceList))
      .catchError((e) => errorHandler(e, context));
  return sentenceList;
}

void acceptHandler(
  http.Response response,
  BuildContext? context,
  List sentenceList,
) {
  if (response.statusCode == 200) {
    // success
    final body = jsonDecode(response.body) as List;
    body.forEach((e) {
      sentenceList.add(Sentence(
        text: e['sentence'] as String,
        suggestion: e['description'] as String,
        error: e['match'] as String,
      ));
    });
  } else {
    if (context != null) {
      showMyNotification(
        error: 'Error: ${response.statusCode}',
        text: response.body,
        context: context,
      );
    } else {
      print('Error: ${response.statusCode}');
    }
  }
  if (context != null && sentenceList.isEmpty) {
    showMyNotification(context: context, text: 'No mistakes found!');
  }
}

void errorHandler(onError, BuildContext? context) {
  if (context != null) {
    showMyNotification(
      error: 'Error!',
      text: onError.toString(),
      context: context,
    );
  } else {
    print('Error: $onError');
  }
}

Future<List<Sentence>> postTextSample({text = '', context}) async {
  if (text == null || text.isEmpty) {
    return [];
  }
  showMyNotification(
    text: 'Trying to connect to API to fix given text[Sample]',
    context: context,
  );

  var statusCode = 200;
  var bodySample = resSample;

  List<Sentence> sentenceList = [];
  if (statusCode == 200) {
    // success
    final body = jsonDecode(bodySample) as List;
    body.forEach((e) {
      sentenceList.add(Sentence(
        text: e['sentence'] as String,
        suggestion: e['description'] as String,
        error: e['match'] as String,
      ));
    });
  } else {
    if (context != null) {
      showMyNotification(
        error: 'Error: $statusCode',
        text: bodySample,
        context: context,
      );
    }
  }
  return sentenceList;
}

const textSample =
    '\nThis solution isn\'t the most effective one.\nthis is good.\nthis is bad.\nThere are three ways to solve this problem.\n\nThe probability of generating the next decoder step can be formulated like this:\n\nFood is destroyed by rodents like rats, mice, and hamsters.\n\nReact Native provides complete access to the device hardware, such as the camera, file system, Bluetooth, and so on.\n\nWe will consider two products about which you can find enough information on the Internet.\n\nYou should be aware of the drawbacks of the system.\n\nAs a result, I get a huge amount of unneeded connections that I could not filter out.\n\nThere are three ways to solve this problem.\n\nThe process of data generation is explained with the following plan\n\nIn this section, I explain the software tools, libraries, and frameworks used for model development.\n\nOR-Tools model utilize only the CPU\n\nIn order to protect the system, a developer must provide a different solution.\n\nThis problem has a number of solutions.\n\nReact Native provides complete access to the device hardware, such as the camera, file system, Bluetooth, and so on.\nTo reach these goals, I decided to analyze the solutions available on the market to highlight the functionality that I want to see in my product, that functionality that can be adapted to my product, and functionality that looks ineffective and it is worth coming up with another solution.\n\n\nWe will consider two products about which you can find enough information on the Internet.\n\nWe will consider two products about which you can find enough information on the Internet.\n\nYou should be aware of the drawbacks of the system.\n\nWe will consider two products about which you can find enough information on the Internet.\n\nYou should be aware of the drawbacks of the system.\n\nThe necessary data are difficult to obtain.\n\nAs a result, I get a huge amount of unneeded connections that I could not filter out.\n\nReact is a very lightweight library.\n\nThe device performance is bad.\n\nThis design is good.\nAlso, React Native provides complete access to the device hardware, such as the camera, file system, Bluetooth, etc.\n\n\n4 of them work in a company for more than a year.\n\nThis approach has 3 techniques.\n\nThis design was 10 times more efficient.\n\nThe student has collected about 100 examples.\n\nThe student has collected about [1]\n\n\n\n\n\n';

const resSample =
    '[{"match":"n\'t","sentence":"This solution isn\'t the most effective one.","label":"SPOKN1","description":"Using contractions"},{"match":"There are","sentence":"There are three ways to solve this problem.","label":"SPOKN1","description":"Using forms of there is/are"},{"match":"There are","sentence":"There are three ways to solve this problem.","label":"SPOKN1","description":"Using forms of there is/are"},{"match":"good","sentence":"this is good.","label":"VOCAB5","description":"using a forbidden words"},{"match":"bad","sentence":"this is bad.","label":"VOCAB5","description":"using a forbidden words"},{"match":"like","sentence":"The probability of generating the next decoder step can be formulated like this:Food is destroyed by rodents like rats, mice, and hamsters.","label":"VOCAB5","description":"using a forbidden words"},{"match":"like","sentence":"The probability of generating the next decoder step can be formulated like this:Food is destroyed by rodents like rats, mice, and hamsters.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"VOCAB5","description":"using a forbidden words"},{"match":"You","sentence":"You should be aware of the drawbacks of the system.","label":"VOCAB5","description":"using a forbidden words"},{"match":"huge","sentence":"As a result, I get a huge amount of unneeded connections that I could not filter out.","label":"VOCAB5","description":"using a forbidden words"},{"match":"process","sentence":"The process of data generation is explained with the following planIn this section, I explain the software tools, libraries, and frameworks used for model development.","label":"VOCAB5","description":"using a forbidden words"},{"match":"utilize","sentence":"OR-Tools model utilize only the CPU","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"VOCAB5","description":"using a forbidden words"},{"match":"You","sentence":"You should be aware of the drawbacks of the system.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"VOCAB5","description":"using a forbidden words"},{"match":"You","sentence":"You should be aware of the drawbacks of the system.","label":"VOCAB5","description":"using a forbidden words"},{"match":"necessary","sentence":"The necessary data are difficult to obtain.","label":"VOCAB5","description":"using a forbidden words"},{"match":"huge","sentence":"As a result, I get a huge amount of unneeded connections that I could not filter out.","label":"VOCAB5","description":"using a forbidden words"},{"match":"very","sentence":"React is a very lightweight library.","label":"VOCAB5","description":"using a forbidden words"},{"match":"bad","sentence":"The device performance is bad.","label":"VOCAB5","description":"using a forbidden words"},{"match":"good","sentence":"This design is good.","label":"VOCAB5","description":"using a forbidden words"},{"match":"Also","sentence":"Also, React Native provides complete access to the device hardware, such as the camera, file system, Bluetooth, etc.","label":"VOCAB5","description":"using a forbidden words"},{"match":"and so on","sentence":"React Native provides complete access to the device hardware, such as the camera, file system, Bluetooth, and so on.","label":"SPOKN1","description":"Preferring and so on to etc."},{"match":"and so on","sentence":"React Native provides complete access to the device hardware, such as the camera, file system, Bluetooth, and so on.","label":"SPOKN1","description":"Preferring and so on to etc."},{"match":"for model","sentence":"The process of data generation is explained with the following planIn this section, I explain the software tools, libraries, and frameworks used for model development.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"In order to","sentence":"In order to protect the system, a developer must provide a different solution.","label":"WORDNES3","description":"Using in order to"},{"match":"a number of","sentence":"This problem has a number of solutions.","label":"WORDNES3","description":"Using a number of"},{"match":"We","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"You","sentence":"You should be aware of the drawbacks of the system.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"As a result, I get a huge amount of unneeded connections that I could not filter out.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"As a result, I get a huge amount of unneeded connections that I could not filter out.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"The process of data generation is explained with the following planIn this section, I explain the software tools, libraries, and frameworks used for model development.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"To reach these goals, I decided to analyze the solutions available on the market to highlight the functionality that I want to see in my product, that functionality that can be adapted to my product, and functionality that looks ineffective and it is worth coming up with another solution.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"To reach these goals, I decided to analyze the solutions available on the market to highlight the functionality that I want to see in my product, that functionality that can be adapted to my product, and functionality that looks ineffective and it is worth coming up with another solution.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"We","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"We","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"You","sentence":"You should be aware of the drawbacks of the system.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"We","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"You","sentence":"You should be aware of the drawbacks of the system.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"As a result, I get a huge amount of unneeded connections that I could not filter out.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"As a result, I get a huge amount of unneeded connections that I could not filter out.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"about 100","sentence":"The student has collected about 100 examples.","label":"DIGIT8","description":"Providing tentative facts and figures"},{"match":"4","sentence":"4 of them work in a company for more than a year.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"4 of","sentence":"4 of them work in a company for more than a year.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"3","sentence":"This approach has 3 techniques.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"3 techniques","sentence":"This approach has 3 techniques.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"10","sentence":"This design was 10 times more efficient.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"10 times","sentence":"This design was 10 times more efficient.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1","sentence":"The student has collected about [1]","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"","sentence":"To reach these goals, I decided to analyze the solutions available on the market to highlight the functionality that I want to see in my product, that functionality that can be adapted to my product, and functionality that looks ineffective and it is worth coming up with another solution.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"}]';
