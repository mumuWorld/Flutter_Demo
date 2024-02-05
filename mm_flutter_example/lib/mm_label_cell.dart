
import 'package:flutter/material.dart';

class MMMainLabelCell extends StatelessWidget {

  final VoidCallback? callback;

  final String? title;

  const MMMainLabelCell({Key? key, this.title, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: callback,
      child: Text(
        title ?? "",
      ),
    );
  }
}
