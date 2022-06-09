import 'package:flutter/material.dart';

import './file_list.dart';

// class FileInfo extends StatefulWidget {
//   final File? file;
//   final Function? deleteFunc;
//   const FileInfo({super.key, this.file, this.deleteFunc});

//   @override
//   State<FileInfo> createState() => _FileInfoState();
// }

// class _FileInfoState extends State<FileInfo> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       height: 80,
//       padding: const EdgeInsets.all(15),
//       width: double.infinity,
//       color: const Color(0xFF864921),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             widget.file?.name ?? 'No file found',
//             style: const TextStyle(fontSize: 24),
//           ),
//           IconButton(
//               onPressed: () {
//                 deleteFunc(file: widget.file);
//               },
//               icon: const Icon(
//                 Icons.close,
//                 color: Colors.red,
//               )),
//           // const SizedBox(
//           //   width: 20,
//           // ),
//         ],
//       ),
//     );
//   }
// }

class FileInfo extends StatelessWidget {
  // const FileInfo({super.key});
  final File? file;
  final Function? deleteFunc;
  const FileInfo({super.key, this.file, this.deleteFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      color: const Color(0xFF864921),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            file?.name ?? 'No file found',
            style: const TextStyle(fontSize: 24),
          ),
          IconButton(
              onPressed: () {
                deleteFunc!(file: file);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              )),
          // const SizedBox(
          //   width: 20,
          // ),
        ],
      ),
    );
  }
}
