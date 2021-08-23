import 'package:flutter/material.dart';
import 'package:interactive_story/story.dart';

void main() => runApp(InteractiveStory());

class InteractiveStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainView(),
      debugShowCheckedModeBanner: false,
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
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          appLogic.getStory()[0],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ),
              ),
              ChoiceButton(
                title: appLogic.getStory()[1],
                onpress: () {
                  setState(() {
                    appLogic.nextStory(1);
                  });
                },
                color: Colors.teal,
                visibilty: true,
              ),
              ChoiceButton(
                title: appLogic.getStory()[2],
                onpress: () {
                  setState(() {
                    appLogic.nextStory(2);
                  });
                },
                color: Colors.blue[500],
                visibilty: appLogic.isVisible() && appLogic.getStory()[2] != '',
              ),
              ChoiceButton(
                title: appLogic.getStory()[3],
                onpress: () {
                  setState(() {
                    appLogic.nextStory(3);
                  });
                },
                color: Colors.amber,
                visibilty: appLogic.isVisible() && appLogic.getStory()[3] != '',
              )
            ],
          )),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final title;
  final onpress;
  final color;
  final visibilty;

  const ChoiceButton(
      {Key? key, this.title, this.onpress, this.color, this.visibilty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: MediaQuery.of(context).size.width * 0.75,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Visibility(
          visible: visibilty,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: color,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22), // <-- Radius
                ),
                textStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
}
