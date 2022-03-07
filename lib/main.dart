import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rousheta/controller.dart';

import 'drawer.dart';

void main() {
  runApp(const RoushettaApp());
}

class RoushettaApp extends StatelessWidget {
  const RoushettaApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              elevation: 0,
              color: Color.fromRGBO(255, 255, 255, 1),
              iconTheme: IconThemeData(color: Colors.black54))),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (val) {
              value = val;
              setState(() {});
            },
            currentIndex: value,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.wysiwyg), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.alarm), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: '')
            ]),
        body: value == 0
            ? MainScreen()
            : value == 2
            ? ClockScreen()
            : null);
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isShown=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.notifications_none_sharp), onPressed: () {}),
          IconButton(icon: Icon(Icons.search_sharp), onPressed: () {isShown=false;setState(() {

          });}),
          CircleAvatar(

            backgroundImage: AssetImage('images/unsplash_v2aKnjMbP_k.png'),

          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(255, 255, 255, 1),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             isShown?Container(): TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_sharp),
                      hintText: 'Search',
                      filled: true,
                      fillColor: Color.fromRGBO(248, 248, 246, 1),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)))),
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                  'Hello,\nAhmed',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Track Your pills',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text('13% than weak ago'),
                            Container(
                              padding: EdgeInsets.only(top: 8),
                              child: CircularPercentIndicator(
                                  center: Text(
                                    '55%',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  backgroundColor: Colors.blue,
                                  progressColor: Color.fromRGBO(200, 200, 200, 1),
                                  percent: 0.35,
                                  radius: 30),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(248, 248, 246, 1),
                        ),
                        height: 200,
                      )),
                  SizedBox(
                    width: 18,
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '       New\nPrescription',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Image.asset('images/Frame.png', width: 60),
                            MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (c) {
                                        return NewPrescriptionScreen();
                                      }));
                                },
                                child: Text(
                                  'Add',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(248, 248, 246, 1),
                        ),
                        height: 200,
                      )),
                ],
              ),
              Text(
                'Daily Reviews',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                height: 160,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (c, i) {
                      return InkWell(
                        onTap: () {
                          i == 0
                              ? Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Indication();
                              }))
                              : Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                                return Indication2();
                              }));
                        },
                        child: Container(
                          margin: EdgeInsets.all(2),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(248, 248, 246, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            leading: Image.asset('images/5.png'),
                            title: Text(Controller().dailyReview[i]),
                            subtitle: Text(Controller().dailyReview2[i]),
                            trailing: Icon(Icons.arrow_forward_ios_sharp),
                          ),
                        ),
                      );
                    }),
              ),
              ListTile(
                title: Text(
                  'Feature Doctor',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: Text('See all >'),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (c, i) {
                      return Container(
                        margin: EdgeInsets.all(2),
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(248, 248, 246, 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                              AssetImage(Controller().doctorImages[i]),
                            ),
                            Text(
                              'Dr.Crick',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              '\$22.00/hours',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlarmScreen extends StatefulWidget {
  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  var controller=Controller();
  int val = 0;
  int val2 = 0;
  List<bool> values = [false, false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text(
              'Done',
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (c){return Home();}));
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              NumberPicker(
                itemWidth: 120,
                itemHeight: 80,
                value: val,
                minValue: 0,
                maxValue: 12,
                onChanged: (int value) {
                  val = value;
                  setState(() {});
                },
              ),
              Text(
                ':',
                style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
              NumberPicker(
                itemWidth: 120,
                itemHeight: 80,
                value: val2,
                minValue: 0,
                maxValue: 100,
                onChanged: (int value) {
                  val2 = value;
                  setState(() {});
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                width: 100,
                height: 100,
                child: CupertinoPicker(
                  itemExtent: 30,
                  children: [
                    Text(
                      'am',
                      style: TextStyle(fontSize: 25, color: Colors.blue),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('pm'),
                  ],
                  onSelectedItemChanged: (value) {
                    setState(() {
                      val2 = value;
                    });
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('Alarm name'),
          ),
          Divider(),
          ListView.separated(
              separatorBuilder: (c, i) {
                return Divider();
              },
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (c, i) {
                return ListTile(
                  title: Text(controller.alarm0[i]),
                  subtitle: Text(
                    controller.alarm1[i],
                    style: TextStyle(color: Colors.blue),
                  ),
                  trailing:  Switch(
                    value: values[i],
                    onChanged: (bool value) {
                      setState(() {
                        values[i] = value;
                      });
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}

class ClockScreen extends StatefulWidget {
  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  List<bool> _values = [true, false, true, false, false];

  bool v1=true;
var controller=Controller();
  @override
  Widget build(BuildContext context) {
    final int count = 4;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){  Navigator.push(context, MaterialPageRoute(builder: (c) {
          return Home();
        }));},),
        title: Text('Alarm',style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18),),
        centerTitle: true,
        actions: [IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (c) {
          return AlarmScreen();
        }));}, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [
          ListView.separated(
            separatorBuilder: (c,i){return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(height: 100,),
            );},
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (c, i) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: <Widget>[
                      for (int i = 0; i < count; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:35.0),
                          child: ListTile(
                            title: Text(
                              '6:00 am',
                              style: TextStyle(fontSize: 25)
                            ),
                            trailing: Switch(
                              value: _values[i],
                              onChanged: i == count
                                  ? null
                                  : (bool value) {
                                setState(() {
                                  _values[i] = value;
                                });
                              },
                            ),
                            subtitle: Text(controller.alarm[i]),
                          ),
                        ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}

class NewPrescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Prescription'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Search drugs'),
            ),
            TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_sharp),
                    hintText: 'Search',
                    filled: true,
                    fillColor: Color.fromRGBO(248, 248, 246, 1),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)))),
            ListTile(
                title: Text('latest Searches'),
                trailing:
                TextButton(onPressed: () {}, child: Text('Clear All'))),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (c, i) {
                  return InkWell(
                    child: ListTile(
                      leading: Image.asset('images/Vector1.png'),
                      title: Text('Advil'),
                      subtitle: Text('ibuprotion,Toblets 200 mg'),
                      trailing:
                      TextButton(onPressed: () {}, child: Text('Add')),
                    ),
                  );
                }),
            Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (c) {
                      return NewPrescriptionScreen2();
                    }));
                  },
                  child: Text('Next'),
                ))
          ],
        ),
      ),
    );
  }
}

class NewPrescriptionScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Prescription'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined))
        ],
      ),
      body: Column(
        children: [
          Divider(height: 20),
          TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_sharp),
                  hintText: 'doctor name',
                  filled: true,
                  fillColor: Color.fromRGBO(248, 248, 246, 1),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)))),
          ListTile(
              title: Text('latest Searches'),
              trailing: TextButton(onPressed: () {}, child: Text('Clear All'))),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (c, i) {
                return InkWell(
                  child: ListTile(
                    leading: Image.asset('images/Vector1.png'),
                    title: Text('Advil'),
                    subtitle: Text('ibuprotion,Toblets 200 mg'),
                  ),
                );
              }),
          Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) {
                    return NewPrescriptionScreen3();
                  }));
                },
                child: Text('Add Prescription'),
              ))
        ],
      ),
    );
  }
}

class NewPrescriptionScreen3 extends StatefulWidget {
  @override
  _NewPrescriptionScreen3State createState() => _NewPrescriptionScreen3State();
}

class _NewPrescriptionScreen3State extends State<NewPrescriptionScreen3> {

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Home();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Prescription',style:TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18)),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('images/check.png'),
              Text('Your Prescription is Saved in Your Profile')
            ],
          ),
        ),
      ),
    );
  }
}

class Indication extends StatelessWidget {
  const Indication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indication for use & diagnosis'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Text('Panadol',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),
              Text(
                'Therapeutic indications ',
                style: TextStyle(
                    color: Colors.blue[700], fontWeight: FontWeight.bold),
              ),
              Text(
                  'Panadol Advance 500 mg Tablets are a mild analgesic and antipyretic, and are recommended for the treatment of most painful and febrile conditions, for example, headache including migraine and tension headaches, toothache, backache, rheumatic and muscle pains, dysmenorrhoea, sore throat, and for relieving the fever, aches and pains of colds and flu. Also recommended for the symptomatic relief of pain due to non-serious arthritis.\n'),
              Text(' Posology and method of administration',
                  style: TextStyle(
                      color: Colors.blue[700], fontWeight: FontWeight.bold)),
              Text(
                  "Adults, including the elderly, and children aged 16 years and over: One or two tablets up to four times daily as required.\n\nChildren:\n10-15 years: One tablet up to four times daily as required. Not suitable for children under 10 years of age.Children should not be given Panadol Advance 500 mg Tablets for more than 3 days without consulting a doctor.These doses should not be repeated more frequently than every four hours nor should more than four doses be given in any 24 hour period.Oral administration only.\n\n"),
              Text(' Pregnancy and lactation',
                  style: TextStyle(
                      color: Colors.blue[700], fontWeight: FontWeight.bold)),
              Text(
                  'Panadol Advance 500 mg Tablets are a mild analgesic and antipyretic, and are recommended for the treatment of most painful and febrile conditions, for example, headache including migraine and tension headaches, toothache, backache, rheumatic and muscle pains, dysmenorrhoea, sore throat, and for relieving the fever, aches and pains of colds and flu. Also recommended for the symptomatic relief of pain due to non-serious arthritis.'),
            ],
          ),
        ),
      ),
    );
  }
}

class Indication2 extends StatelessWidget {
  const Indication2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Alarm'),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20,bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pills name',style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(248, 248, 246, 1),
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: Image.asset('images/5.png'),
                  title: Text('Panadol',style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Text('Amount & How long ?',style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(248, 248, 246, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        leading: Image.asset('images/6.png'),
                        title: Text('2',style: TextStyle(fontWeight: FontWeight.bold)),
                        trailing: Text('Pills',style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(248, 248, 246, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        leading: Image.asset('images/7.png'),
                        title: Text('30 days',style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
              Text('Food & Pills',style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(23),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Image.asset('images/8.png'),
                  ),
                  Container(
                    padding: EdgeInsets.all(23),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(112, 112, 112, 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Image.asset('images/8.png'),
                  ),
                  Container(
                    padding: EdgeInsets.all(23),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Image.asset('images/8.png'),
                  ),
                ],
              ),
              Text('Notification',style: TextStyle(fontWeight: FontWeight.bold,),),
              Row(children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(248, 248, 246, 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: Image.asset('images/9.png'),
                      title: Text('10:00',style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Expanded(child: IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.blue,)))
              ],),
              MaterialButton(minWidth: MediaQuery.of(context).size.width/1.2,color:Colors.blue,onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){return Home();}));},child: Text('Done',style: TextStyle(color:Colors.white),),)
            ],
          ),
        ));
  }
}
