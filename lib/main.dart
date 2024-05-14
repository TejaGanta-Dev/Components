import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: myHomePage(),
    );
  }
}

class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  int currentVal = 0;
  int? unTitledRadio = 1;
  bool checkboxVal = false;
  List<String> myCList = ['Select Country', "india", 'pak'];
  String? selectedDVal = 'Select Country';
  List<Widget> MyTabList = [
    const Icon(Icons.home),
    const Icon(Icons.store),
    const Icon(Icons.laptop_chromebook)
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: currentVal,
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Camera'),
                leading: const Icon(Icons.camera),
                onTap: () {
                  updateStatePOP(context, 0);
                },
              ),
              ListTile(
                title: const Text('Home'),
                leading: const Icon(Icons.home),
                onTap: () {
                  updateStatePOP(context, 1);
                },
              ),
              ListTile(
                title: const Text('laptop_chromebook'),
                leading: const Icon(Icons.laptop_chromebook),
                onTap: () {
                  updateStatePOP(context, 2);
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Bottom navigation Bar'),
          bottom: TabBar(
              onTap: (index) {
                setState(() {
                  currentVal = index;
                });
              },
              tabs: const [
                Tab(
                  icon: Icon(Icons.camera),
                ),
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.laptop_chromebook),
                )
              ]),
        ),
        body: Column(
          children: <Widget>[
            Image.asset('images/Picture1.png'),
            Text(
              getCurrentStatusText(currentVal),
              style: const TextStyle(fontSize: 40.0),
            ),
            // Radio(
            //     value: 2,
            //     groupValue: unTitledRadio,
            //     onChanged: (onChanged) {
            //       setState(() {
            //         print(onChanged);
            //         unTitledRadio = onChanged;
            //       });
            //     }),
            // Radio(
            //     value: 1,
            //     groupValue: unTitledRadio,
            //     onChanged: (val) {
            //       setState(() {
            //         print(val);

            //         unTitledRadio = val;
            //       });
            //     }),
            // RadioListTile(
            //     value: 2,
            //     title: Text('Male'),
            //     groupValue: unTitledRadio,
            //     onChanged: (onChanged) {
            //       setState(() {
            //         print(onChanged);

            //         unTitledRadio = onChanged;
            //       });
            //     }),
            // RadioListTile(
            // value: 1,
            // title: Text('Female'),
            // groupValue: unTitledRadio,
            // onChanged: (onChanged) {
            //   setState(() {
            //     print(onChanged);

            //     unTitledRadio = onChanged;
            //   });
            // }),
            // CheckboxListTile(
            //   title: Text('I Agree'),
            //   controlAffinity:ListTileControlAffinity.leading,
            //     value: checkboxVal,
            //     onChanged: (onChanged) {
            //       setState(() {
            //         checkboxVal = onChanged;
            //       });
            //     }),
            //     Checkbox(
            //     value: checkboxVal,
            //     onChanged: (onChanged) {
            //       setState(() {
            //         checkboxVal = onChanged;
            //       });
            //     }),
            // DropdownButton(
            //   value:selectedDVal,
            //     items: myCList
            //         .map((e) => DropdownMenuItem(
            //               child: Text(e),
            //               value: e,
            //             ))
            //         .toList(),
            //     onChanged: (val){
            //       setState(() {
            //         selectedDVal=val;
            //       });
            //     })
            // TabBarView(children: MyTabList)
            Switch(
                value: checkboxVal,
                onChanged: (onChanged) {
                  setState(() {
                    checkboxVal = onChanged;
                  });
                }),
            SwitchListTile(
              title: Text('Status'),
              subtitle: Text('Status $checkboxVal'),
                value: checkboxVal,
                onChanged: (onChanged) {
                  setState(() {
                    checkboxVal = onChanged;
                  });
                })
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            currentIndex: currentVal,
            onTap: (index) {
              setState(() {
                currentVal = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.camera),
                label: getCurrentStatusText(0),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: getCurrentStatusText(1),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.laptop_chromebook),
                label: getCurrentStatusText(2),
              ),
            ]),
      ),
    );
  }

  String getCurrentStatusText(int index) {
    List myBottomListVlaues = ['Camera', 'Home', 'Laptop_chromebook'];
    return myBottomListVlaues[index];
  }

  updateStatePOP(context, _currentVal) {
    setState(() {
      currentVal = _currentVal;
    });
    Navigator.pop(context);
  }
}
