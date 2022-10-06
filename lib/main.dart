import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screen.dart';
import 'package:flutter_application_1/screens/onboarding_screen.dart';
// import 'package:flutter_application_1/widgets/ninja_home.dart';
import "./screens/login_screen.dart";

//Importing the model calsses.
import "quote.dart";
import 'widgets/quote_card.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/home': (context) => const MainScreen(),
      },
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Sandbox'), //Text is a widget and need to display strings
          centerTitle: true, //Not a Widget
          backgroundColor: Colors.teal[700],
        ),
        // body: Center(
        //   //This is the Body and the Text inside this is Centered using the Center Widget. Which makes the  Text widget a chil of Center Widget. Only one child is
        //   // available. If need more has to have Rows or Columns Widget as parents

        //   //Text Widget
        //   // child: Text(
        //   //   'Sandbox Body',
        //   //   style: TextStyle(
        //   //     fontSize: 22,
        //   //     fontWeight: FontWeight.bold,
        //   //     fontFamily: "FiraSans",
        //   //   ),
        //   // ),

        //   //Image Widget
        //   // child: Image(
        //   //   image: AssetImage("asset/images/background1.jpg"),
        //   // ),

        //   //Icon Widget
        //   // child: Icon(
        //   //   Icons.airplane_ticket_rounded,
        //   //   color: Colors.orange[200],
        //   //   size: 50.0,
        //   // ),

        //   //Button Widget
        //   // child: ElevatedButton(
        //   //   onPressed: () {
        //   //     print('Button Cliked');
        //   //   },
        //   //   style: ElevatedButton.styleFrom(
        //   //     backgroundColor: Colors.amber,
        //   //   ),
        //   //   child: const Text('New Button'),
        //   // ),

        //   //Button with Icon Widget
        // child: ElevatedButton.icon(
        //   onPressed: () {},
        //   icon: const Icon(Icons.mail),
        //   label: const Text('Send Mail'),
        // ),

        //   //Icon Button
        // child: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.playlist_play_rounded),
        //   color: const Color.fromARGB(255, 18, 128, 218),
        // ),
        // ),
        //Layout Widgets

        //Layouts

        //Container Widget
        // body: Container(
        //   padding: const EdgeInsets.fromLTRB(10, 20, 30, 40),
        //   margin: const EdgeInsets.all(40),
        //   color: Colors.grey,
        //   child: const Text("Hello World"),
        // ),

        //Padding Widget :- can use when we only need the padding and the child. without margin,colors etc.
        // body: const Padding(
        //   padding: EdgeInsets.all(20),
        //   child: Text('Padding Widgest'),
        // ),

        //Row Widgets :- can have multiple widgets inside this. When there are multiple widgets child becomes children
        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     const Text('First Widget Man'),
        //     ElevatedButton(
        //       onPressed: () {},
        //       child: const Text('Second Widget'),
        //     ),
        //     Container(
        //       color: Colors.grey,
        //       padding: const EdgeInsets.all(10),
        //       child: const Text("3rd Widget"),
        //     ),
        //   ],
        // ),

        //Column Widgets :- can have multiple widgets inside this. When there are multiple widgets child becomes children
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.end,
        // children: [
        //   Container(
        //     color: Colors.yellowAccent,
        //     padding: const EdgeInsets.all(30),
        //     child: const Text("Second"),
        //   ),
        //   Container(
        //     color: Colors.blueAccent,
        //     padding: const EdgeInsets.all(50),
        //     child: const Text("Third"),
        //   ),
        //   Container(
        //     color: Colors.grey,
        //     padding: const EdgeInsets.all(10),
        //     child: const Text("First"),
        //     ),
        //   ],
        // ),

        //Expanded Widgets
        // body: Row(
        //   children: [
        //     Expanded(
        //       flex: 3,
        //       child: Image.asset('asset/images/background1.jpg'),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Container(
        //         color: Colors.yellowAccent,
        //         padding: const EdgeInsets.all(30),
        //         child: const Text("1"),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Container(
        //         color: Colors.blueAccent,
        //         padding: const EdgeInsets.all(30),
        //         child: const Text("2"),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Container(
        //         color: Colors.orangeAccent,
        //         padding: const EdgeInsets.all(30),
        //         child: const Text("3"),
        //       ),
        //     )
        //   ],
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: (null),
          backgroundColor: Colors.teal[700],
          child: const Icon(Icons.home),
        ),
      ),
    );
  }
}

//List of Data and iterating through it.
class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> lQuotes = [
    Quote(
        text: 'List One with different values Which I do not know',
        author: "player 1"),
    Quote(text: 'This is fun and it is okay to learn', author: "player 2"),
    Quote(text: 'Best way to learn the Stuff is Internet', author: "player 3"),
  ];

  // Widget quoteTemplate(quote) {
  //   return QuoteCard(quote: quote);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("List of Datas")),
        backgroundColor: Colors.blue[600],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: lQuotes
            .map((e) => QuoteCard(
                quote: e,
                delete: () {
                  setState(() {
                    lQuotes.remove(e);
                  });
                }))
            .toList(), //convert the iterable to list of values using toList() method.
      ),
    );
  }
}
