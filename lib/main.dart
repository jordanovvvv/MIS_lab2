import 'package:flutter/material.dart';
import './clothing_answer.dart';
import './clothing_question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Laboratory Exercise 2',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Simeon Jordanov - 192015'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void TappedButton() {
    setState(() {
      _questionIndex += 1;
    });
    print('Button was pressed!');

  }

  var questions = [
    {
      'question':'Select clothing for upper body',
      'answer':['Hoodie','T-Shirt', 'Sweatshirt']
    },
    {
      'question':'Select clothing for lower body',
      'answer':['Pants','Trousers', 'Shorts']
    },
    {
      'question':'Select shoes',
      'answer':['Sneakers','Hikers', 'Boots']
    }
  ];
  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(


          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: const Text(
                'Welcome to your clothing shop!',
                style: TextStyle(fontSize: 20, fontFamily: 'Arial'),
              ),
            ),

            ClothingQuestion(questions[_questionIndex]['question'] as String),
            ...(questions[_questionIndex]['answer'] as List<String>).map((answer) {
              return ClothingAnswer(TappedButton, answer);
            })
          ],
        ),
      ),
    );
  }
}