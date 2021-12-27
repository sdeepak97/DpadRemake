import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class Contents extends StatefulWidget {
  const Contents({Key? key}) : super(key: key);

  @override
  _ContentsState createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 5,
        childAspectRatio: 1.5,
        crossAxisCount: 4,
      ),
      children: [
        InkWell(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();

            if (result == null) return;

            // final file = result.files.first;
            // openFile(file);

            // print('name:${file.name}');
            // print('size:${file.size}');
            // print('extension:${file.extension}');
            // print('PAth:${file.path}');
            // final newFile = await savefile(file);
            // print('from path:${file.path}');
            // print('from path:${newFile.path}');
          },
          child: const Card(
            color: Colors.grey,
            elevation: 2.0,
            child: Center(child: Text('Offline Data')),
          ),
        ),
        const Card(
          color: Colors.grey,
          elevation: 2.0,
          child: Center(child: Text('Reports')),
        ),
        const Card(
          color: Colors.grey,
          elevation: 2.0,
          child: Center(child: Text('Upload')),
        ),
        const InkWell(
          child: Card(
            color: Colors.grey,
            elevation: 2.0,
            child: Center(child: Text('Settings')),
          ),
        ),
        const Card(
          color: Colors.grey,
          elevation: 2.0,
          child: Center(child: Text('Machine Data')),
        ),
        const Card(
          color: Colors.grey,
          elevation: 2.0,
          child: Center(child: Text('Saved Analysis')),
        ),
        const Card(
          color: Colors.grey,
          elevation: 2.0,
          child: Center(child: Text('Approve')),
        ),
        const Card(
          color: Colors.grey,
          elevation: 2.0,
          child: Center(child: Text('Stability Data')),
        )
      ],
    );
  }
}

Future<File> savefile(PlatformFile file) async {
  final appstorage = await getApplicationDocumentsDirectory();
  final newFile = File('${appstorage.path}/${file.name}');
  return File(file.path!).copy(newFile.path);
}

void openFile(PlatformFile file) {
  OpenFile.open(file.path!);
}
