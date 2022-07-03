import 'package:fix_my_english/widgets/hoverable_widget.dart';
import 'package:flutter/material.dart';

import '../style/fix_text_page/text_style.dart';

class BulkUploadButton extends StatelessWidget {
  const BulkUploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 20,
        top: 10,
        bottom: 10,
      ),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/upload_file',
          );
        },
        child: Row(
          children: [
            Image.asset(
              "assets/icons/pdf_button.png",
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('Bulk Upload', style: uploadButton),
          ],
        ),
      ),
    );
  }
}
