import 'package:cupertino/option1.dart';
import 'package:cupertino/option2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Opt { Option1, Option2 }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Segment Control',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Opt _SegmentedSegment = Opt.Option1;

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: Colors.grey,
        navigationBar: CupertinoNavigationBar(
          middle: CupertinoSegmentedControl<Opt>(
            selectedColor: Colors.lightBlue,
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            groupValue: _SegmentedSegment,
            onValueChanged: (Opt value) {
              setState(() {
                _SegmentedSegment = value;
              });
            },
            children: <Opt, Widget>{
              Opt.Option1: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 11),
                child: Text(
                  "Option1",
                  style: TextStyle(
                      color: _SegmentedSegment == Opt.Option1
                          ? Colors.white
                          : Colors.black,
                      fontSize: 13),
                ),
              ),
              Opt.Option2: Text(
                "Option2",
                style: TextStyle(
                    color: _SegmentedSegment == Opt.Option2
                        ? Colors.white
                        : Colors.black,
                    fontSize: 13),
              ),
            },
          ),
        ),
        child: _SegmentedSegment == Opt.Option1
            ? const Option1()
            : const Option2());
  }
}
