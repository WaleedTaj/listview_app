import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Entry point of the App
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      home: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  // List of the countries to display
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

  // Corresponding colors for each country
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

  // Capitals of each country
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
    // Get the screen dimensions for responsive design
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: FittedBox(
          child: Text(
            "Countries with Capitals",
            style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.03,
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
            itemCount: countries.length, // Number of items in the ListView
            itemBuilder: (context, index) {
              return Card(
                elevation: height * 0.01,
                margin: EdgeInsets.all(height * 0.01),
                color: colors[index], // Background colors of Card
                child: ListTile(
                  leading: const Icon(
                    Icons.flag,
                    color: Colors.white,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.all(
                      height * 0.017), // Padding inside the ListTile
                  title: Text(
                    countries[index], // Display the country name
                    style: TextStyle(
                      fontSize: height * 0.027,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context)
                        .hideCurrentSnackBar(); // Hide any currently visible SnackBar
                    final snackbar = SnackBar(
                        content: Text(
                          "Capital of ${countries[index]} is ${capitals[index]}", // Content of the SnackBar
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: colors[index].withOpacity(0.9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: Radius.circular(height * 0.02),
                        )));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackbar); // Show the SnackBar
                  },
                ),
              );
            }),
      ),
    );
  }
}
