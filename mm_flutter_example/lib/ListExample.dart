import 'package:flutter/material.dart';

class ListExample extends StatefulWidget {
  const ListExample({Key? key}) : super(key: key);

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index){
        return Container(
          height: 50,
          color: index % 2 == 0 ? Colors.blue : Colors.green,
        );
      },
        itemCount: 1000,
      ),
    );
  }
}
