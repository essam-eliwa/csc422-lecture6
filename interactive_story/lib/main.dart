import 'package:flutter/material.dart';
import 'package:interactive_story/story.dart';

void main() => runApp(InteractiveStory());

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
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 240,
                margin: EdgeInsets.all(10.0),
                child: Card(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        appLogic.getStory()[0],
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ),
              choiceButton(context, appLogic.getStory()[1], () {
                setState(() {
                  appLogic.nextStory(1);
                });
              }, Colors.teal, true),
              choiceButton(context, appLogic.getStory()[2], () {
                setState(() {
                  appLogic.nextStory(2);
                });
              }, Colors.blue[500], appLogic.isVisible()),
              choiceButton(context, appLogic.getStory()[3], () {
                setState(() {
                  appLogic.nextStory(3);
                });
              }, Colors.amber, appLogic.isVisible())
            ],
          )),
    );
  }
}

Widget choiceButton(context, title, onpress, color, visibilty) {
  return Container(
      height: 80,
      width: MediaQuery.of(context).size.width / 1.2,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Visibility(
        visible: visibilty,
        child: RaisedButton(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: onpress,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ));
}
