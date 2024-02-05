import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:mm_flutter_example/State/picker_widget.dart';

class ListExample extends StatefulWidget {
  const ListExample({Key? key}) : super(key: key);

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {

  ScrollController? _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              ElevatedButton(onPressed: (){
                showPickerDate(context);
      }, child: Text("测试")),
              Container(
                child: showPickerArray(context)
              ),
              Container(
                height: 100,
                  child:
              showCupertinoPicker()),
              TimePickerWidget(onChange: (String change) {
                print('test->$change');
                },)
            ],
          ),
        ),
      ),
    );
  }

  Widget showCupertinoPicker() {
    CupertinoPicker picker = CupertinoPicker(
      backgroundColor: Colors.white,
      itemExtent: 30,
      scrollController: FixedExtentScrollController(initialItem: 1),
      children: const [
        Text('0'),
        Text('1'),
        Text('2'),
        Text('2'),
        Text('2'),
      ],
      onSelectedItemChanged: (value) {
        setState(() {

        });
      },
    );
    return picker;
  }

  showPickerDate(BuildContext context) {
    Picker(
        hideHeader: true,
        adapter: DateTimePickerAdapter(),
        title: Text("Select Data"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print((picker.adapter as DateTimePickerAdapter).value);
        }).showDialog(context);
  }

  showPicker(BuildContext context) async {
    Picker picker = Picker(
        adapter: PickerDataAdapter<String>(
            pickerData: JsonDecoder().convert(PickerData)),
        changeToFirst: false,
        textAlign: TextAlign.left,
        textStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.yellow
                : Colors.blue,
            fontFamily: null),
        selectedTextStyle: TextStyle(color: Colors.red),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        });
    picker.showBottomSheet(context);
  }

  showPickerModal(BuildContext context) async {
    final result = await Picker(
        adapter: PickerDataAdapter<String>(
            pickerData: JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        hideHeader: false,
        selectedTextStyle: TextStyle(color: Colors.blue),
        // builderHeader: (context) {
        //   final picker = PickerWidget.of(context);
        //   return picker?.data?.title ?? Text("xxx");
        // },
        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(background: CupertinoColors.quaternarySystemFill, capEndEdge: false,),
        onConfirm: (picker, value) {
          print(value.toString());
          print(picker.adapter.text);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(title: Text("Hello")),
                    body: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("You click the Confirm button."),
                            SizedBox(height: 32),
                            Text("result: \n ${picker.adapter.text}")
                          ],
                        )),
                  )));
        }).showModal(this.context); //_sca
    print("result: $result"); // ffoldKey.currentState);
  }

  // showPicker(BuildContext context) {
  //   Picker(adapter: PickerDataAdapter())
  //   Picker picker = new Picker(
  //       adapter: PickerDataAdapter<String>(pickerdata: new JsonDecoder().convert(PickerData)),
  //       changeToFirst: true,
  //       textAlign: TextAlign.left,
  //       columnPadding: const EdgeInsets.all(8.0),
  //       onConfirm: (Picker picker, List value) {
  //         print(value.toString());
  //         print(picker.getSelectedValues());
  //       }
  //   );
  //   picker.show(_scaffoldKey.currentState);
  // }
  //
  // showPickerModal(BuildContext context) {
  //   new Picker(
  //       adapter: PickerDataAdapter<String>(pickerdata: new JsonDecoder().convert(PickerData)),
  //       changeToFirst: true,
  //       hideHeader: false,
  //       onConfirm: (Picker picker, List value) {
  //         print(value.toString());
  //         print(picker.adapter.text);
  //       }
  //   ).showModal(this.context); //_scaffoldKey.currentState);
  // }

  // showPickerDialog(BuildContext context) {
  //   new Picker(
  //       adapter: PickerDataAdapter<String>(pickerdata: new JsonDecoder().convert(PickerData)),
  //       hideHeader: true,
  //       title: new Text("Select Data"),
  //       onConfirm: (Picker picker, List value) {
  //         print(value.toString());
  //         print(picker.getSelectedValues());
  //       }
  //   ).showDialog(context);
  // }
  showPickerNumber(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(
              begin: 0,
              end: 999,
              postfix: Text("\$"),
              suffix: Icon(Icons.insert_emoticon)),
          NumberPickerColumn(begin: 200, end: 100, jump: -10),
        ]),
        delimiter: [
          PickerDelimiter(
              child: Container(
                width: 30.0,
                alignment: Alignment.center,
                child: Icon(Icons.more_vert),
              ))
        ],
        hideHeader: true,
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }

  Widget showPickerArray(BuildContext context) {
    Widget picker = new Picker(
        adapter: PickerDataAdapter<String>(pickerData: new JsonDecoder().convert(PickerData2), isArray: true),
        hideHeader: true,
        title: new Text("Please Select"),
        // selecteds: [3, 0, 2],
        // containerColor: Colors.amber,
        changeToFirst: true,
        // selectedIconTheme: IconThemeData(color: Colors.green),
        // textScaleFactor: 1.2,
        // backgroundColor: Colors.green,
        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(background: CupertinoColors.placeholderText, capEndEdge: false, capStartEdge: false,),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }
    ).makePicker(null);
    // ).showDialog(context);
    // ).showDialog(context);
    return picker;
  }

  // showPickerNumber(BuildContext context) {
  //   new Picker(
  //       adapter: NumberPickerAdapter(data: [
  //         NumberPickerColumn(begin: 0, end: 999),
  //         NumberPickerColumn(begin: 100, end: 200),
  //       ]),
  //       delimiter: [
  //         PickerDelimiter(child: Container(
  //           width: 30.0,
  //           alignment: Alignment.center,
  //           child: Icon(Icons.more_vert),
  //         ))
  //       ],
  //       hideHeader: true,
  //       title: new Text("Please Select"),
  //       onConfirm: (Picker picker, List value) {
  //         print(value.toString());
  //         print(picker.getSelectedValues());
  //       }
  //   ).showDialog(context);
  // }

  showPickerDialog(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter<String>(
            pickerData: JsonDecoder().convert(PickerData)),
        hideHeader: true,
        title: Text("Select Data"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }


  static const PickerData2 = '''
[
    [
        1,
        2,
        3,
        4
    ],
    [
        11,
        22,
        33,
        44
    ]
]
    ''';

  static const PickerData = '''
[
    {
        "a": [
            {
                "a1": [
                    1,
                    2,
                    3,
                    4
                ]
            },
            {
                "a2": [
                    5,
                    6,
                    7,
                    8
                ]
            },
            {
                "a3": [
                    9,
                    10,
                    11,
                    12
                ]
            }
        ]
    },
    {
        "b": [
            {
                "b1": [
                    11,
                    22,
                    33,
                    44
                ]
            },
            {
                "b2": [
                    55,
                    66,
                    77,
                    88
                ]
            },
            {
                "b3": [
                    99,
                    1010,
                    1111,
                    1212
                ]
            }
        ]
    },
    {
        "c": [
            {
                "c1": [
                    "a",
                    "b",
                    "c"
                ]
            },
            {
                "c2": [
                    "aa",
                    "bb",
                    "cc"
                ]
            },
            {
                "c3": [
                    "aaa",
                    "bbb",
                    "ccc"
                ]
            }
        ]
    }
]
    ''';
}
