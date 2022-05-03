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
      home: Splash(),
    );
  }
}

// createList () {
//   symList1 = [];
//
//   for (int i=0; i<100; i++) {
//     symList1.add({"A" + i.toString() : double.parse((Random().nextDouble() * (10.00 - 1.00 + 1.00) + 1.00).toStringAsFixed(2))});
//   }
// }

createList () {
  symList1 = [];

  for (int i = 0; i<1000; i++) {
    symList1.add(DataRow());
  }
}

updateList () {
  if (symList1.isNotEmpty) {
    for (int i=0; i<symList1.length; i++) {
      symList1[i].updateNum();
    }
  } else {
    for (int i = 0; i < 1000; i++) {
      symList1.add(DataRow());
    }
  }
}

List <DataRow> symList1 = [];

class DataRow {

  String symCode = "";
  int num1 = 0;
  int num2 = 0;
  int num3 = 0;
  int num4 = 0;
  var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  DataRow () {
    symCode = generateRandomString();
    num1 = Random().nextInt(900) + 100;
    num2 = Random().nextInt(900) + 100;
    num3 = Random().nextInt(900) + 100;
    num4 = Random().nextInt(900) + 100;
  }

  updateNum () {
    num1 = Random().nextInt(900) + 100;
    num2 = Random().nextInt(900) + 100;
    num3 = Random().nextInt(900) + 100;
    num4 = Random().nextInt(900) + 100;
  }
}

String generateRandomString() {
  int length = 4;
  final _random = Random();
  const _availableChars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final randomString = List.generate(length,
          (index) => _availableChars[_random.nextInt(_availableChars.length)])
      .join();

  return randomString;
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
        updateList();
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
        length: 3,
        child: Scaffold(
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              Container(child: watchList()),
              Container(child: watchList()),
              Container(child: NativeList())
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
        Tab(
          child: Text(
            'Native',
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 26),
      itemBuilder: (BuildContext context, int index) {
        return Flex(
          direction: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 42, 0),
              child: Text(symList1[index].symCode,
                  style: const TextStyle(fontSize: 10)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 42, 0),
              child: Text(symList1[index].num1.toString(),
                  style: TextStyle(fontSize: 10, color: symList1[index].num1 < 500 ? Colors.red : Colors.green)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 42, 0),
              child: Text(symList1[index].num2.toString(),
                  style: TextStyle(fontSize: 10, color: symList1[index].num2 < 500 ? Colors.red : Colors.green)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 42, 0),
              child: Text(symList1[index].num3.toString(),
                  style: TextStyle(fontSize: 10, color: symList1[index].num3 < 500 ? Colors.red : Colors.green)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 42, 0),
              child: Text(symList1[index].num4.toString(),
                  style: TextStyle(fontSize: 10, color: symList1[index].num4 < 500 ? Colors.red : Colors.green)),
            ),
          ],
        );
      },
    );
  }

  // Widget watchList() {
  //   return ListView.builder(
  //     itemCount: 5,
  //     itemBuilder: (BuildContext context, int index) {
  //       return Flex(
  //         direction: Axis.horizontal,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.fromLTRB(8, 8, 30, 8),
  //             child: Text(symList1[index].symCode,
  //                 style: const TextStyle(fontSize: 16)),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.fromLTRB(8, 8, 30, 8),
  //             child: Text(symList1[index].toString(),
  //                 style: const TextStyle(fontSize: 16)),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.fromLTRB(8, 8, 30, 8),
  //             child: Text(symList1[index].toString(),
  //                 style: const TextStyle(fontSize: 16)),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.fromLTRB(8, 8, 30, 8),
  //             child: Text(symList1[index].toString(),
  //                 style: const TextStyle(fontSize: 16)),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.fromLTRB(8, 8, 30, 8),
  //             child: Text(symList1[index].toString(),
  //                 style: const TextStyle(fontSize: 16)),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }


  var dropdownValue = 'One';


  Widget NativeList() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: ListView(
        children: [
          DropdownButton<String>(
            value: dropdownValue,
            // icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['One', 'Two', 'Three', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          MyAlert(),
          DatePickerCustom(),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ],
      ),
    );
  }
}

class MyAlert extends StatelessWidget {

  @override
  Widget build(BuildContext contextFromCall) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        child: Text('Show alert'),
        onPressed: () {
          showAlertDialog(contextFromCall);
        },
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {Navigator.of(context, rootNavigator: true).pop('dialog'); },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Native Alert"),
      content: Text("Native Alert Test"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class DatePickerCustom extends StatelessWidget {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      // setState(() {
        selectedDate = picked;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Text("${selectedDate.toLocal()}".split(' ')[0]),
            // SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),
          ],
        );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState () {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(this.context, MaterialPageRoute(builder: (context)=> MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      )
    );
  }
}
