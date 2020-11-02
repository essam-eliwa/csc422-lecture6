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
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              margin: EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FittedBox(
                    child: Text(appLogic.getStory()[0],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                ),
              ),
            ),
            choiceButton(context, appLogic.getStory()[1], () {
              setState(() {
                appLogic.nextStory(1);
              });
            }, Colors.green, true),
            choiceButton(context, appLogic.getStory()[2], () {
              setState(() {
                appLogic.nextStory(2);
              });
            }, Colors.teal, appLogic.isVisible()),
            choiceButton(context, appLogic.getStory()[3], () {
              setState(() {
                appLogic.nextStory(3);
              });
            }, Colors.lightBlue, appLogic.isVisible())
          ],
        ),
      ),
    );
  }
}

Widget choiceButton(context, title, onpress, color, visibilty) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.1,
    height: 60.0,
    margin: EdgeInsets.symmetric(vertical: 4.0),
    padding: EdgeInsets.all(8.0),
    child: Visibility(
        visible: visibilty,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: onpress,
          color: color,
          child: Text(
            title,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        )),
  );
}
