import 'package:flutter/material.dart';
import 'package:interactive_story/story.dart';

void main() {
  runApp(InteractiveStory());
}

class InteractiveStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final IStoryData appLogic = IStoryData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interactive Story'),
      ),
      body: Container(),
    );
  }
}

Widget choiceButton(context, title, onpress, color, visibilty) {
  return Container();
}
