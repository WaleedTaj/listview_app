import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  final List<String> countries = [
    'Pakistan', // Dark Green
    'Saudi Arabia', // Green
    'India', // Saffron/Orange
    'America', // Blue
    'Turkey', // Dark Red
    'Russia', // Deep Purple
    'Japan', // Purple
    'Germany', // Amber
    'Mexico', // Pink
    'China', // Brown
  ];

  final List<Color> colors = [
    Colors.green[600]!, // Pakistan
    Colors.greenAccent, // Saudi Arabia
    Colors.orange, // India
    Colors.lightBlue, // America
    Colors.red[600]!, // Turkey
    Colors.purple[300]!, // Russia
    Colors.purpleAccent, // Japan
    Colors.amberAccent, // Germany
    Colors.pinkAccent, // Mexico
    Colors.brown[300]!, // China
  ];

  final List<String> capitals = [
    'Islamabad',
    'Riyadh',
    'New Delhi',
    'Washington D.C.',
    'Ankara',
    'Moscow',
    'Tokyo',
    'Berlin',
    'Mexico City',
    'Beijing',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: FittedBox(
          child: Text(
            "Popular Countries",
            style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.033,
                fontWeight: FontWeight.bold,
                letterSpacing: width * 0.004),
          ),
        ),
        toolbarHeight: height * 0.1,
        elevation: height * 0.01,
        shadowColor: Colors.black,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(height * 0.02),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.02),
        child: ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: height * 0.01,
                margin: EdgeInsets.all(height * 0.01),
                color: colors[index],
                child: ListTile(
                  leading: const Icon(
                    Icons.flag,
                    color: Colors.white,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.all(height * 0.017),
                  title: Text(
                    countries[index],
                    style: TextStyle(
                      fontSize: height * 0.027,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    final snackbar = SnackBar(
                        content: Text(
                          "Capital of ${countries[index]} is ${capitals[index]}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: colors[index].withOpacity(0.9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: Radius.circular(height * 0.02),
                        )));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },
                ),
              );
            }),
      ),
    );
  }
}
