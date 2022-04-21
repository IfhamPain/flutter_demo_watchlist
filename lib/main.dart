import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAMOB Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

createList () {
  symList1 = [];

  for (int i=0; i<1000; i++) {
    symList1.add({"AAA" + i.toString() : double.parse((Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00).toStringAsFixed(2))});
  }
}

List <Map<String, double>> symList1 = [];

class Symbol {
  String symCode;
  double price;

  Symbol({required this.symCode, required this.price});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);

    _controller.addListener(() {
      setState(() {});
      // Do whatever you want based on the tab index
    });
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setState(() {
        createList();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFFFFFFF),
            title: const Center(
              child: Text(
                "UA MOB Flutter",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              Container(child: watchList()),
              Container(child: watchList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return const TabBar(
      tabs: [
        Tab(
          child: Text(
            'Watch 1',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Tab(
          child: Text(
            'Watch 2',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget watchList() {
    return GridView.builder(
      itemCount: symList1.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.5),
      itemBuilder: (BuildContext context, int index) {
        return GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 1.5,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
              child: Column(
                children: [
                  Text(symList1[index].keys.first),
                  Text(symList1[index].values.first.toStringAsFixed(2)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
