class Story {
  String storyText;
  List<String> choices;

  Story({
    required this.storyText,
    required this.choices,
  });
}

class IStoryData {
  int storyLevel = 0;
  List<Story> storyDB = [
    Story(
        //0
        storyText: 'You see a ship in the ocean',
        choices: [
          'Go aboard the ship',
          'Look for another adventure',
          'Just go home'
        ]),
    Story(
        //1
        storyText: 'It is a pirate ship',
        choices: [
          'Wow, an amazing adventure',
          'Run back home',
          'Call the police'
        ]),
    Story(
        //2
        storyText: 'Enter dark forest',
        choices: ['Yes', 'Run back home', 'Restart']),
    Story(
        //3
        storyText: 'You are adventurous, \n but watch your moral campus',
        choices: ['Restart', '', '']),
    Story(
        //4
        storyText: 'You are so brave',
        choices: ['Search for Magic Tree House', 'Restart', '']),
    Story(
        //5
        storyText: 'This is a great option \n you should never join pirates',
        choices: ['Look for another adventure', 'Restart', '']),
    Story(
        //6
        storyText: 'You need to explore more',
        choices: ['Restart', '', '']),
    Story(
        //7
        storyText: 'Found the Magic tree house, Go Back in time?',
        choices: ['Yes', 'No', '']),
  ];

  List getStory() {
    return [
      storyDB[storyLevel].storyText,
      storyDB[storyLevel].choices[0],
      storyDB[storyLevel].choices[1],
      storyDB[storyLevel].choices[2]
    ];
  }

  void nextStory(int choice) {
    print('choice = $choice, storyLevel=$storyLevel');
    if (choice == 1 && storyLevel == 0) {
      storyLevel = 1;
    } else if (choice == 2 && storyLevel == 0) {
      storyLevel = 2;
    } else if (choice == 3 && storyLevel == 0) {
      storyLevel = 6;
    } else if (choice == 1 && storyLevel == 1) {
      storyLevel = 3;
    } else if (choice == 2 && storyLevel == 1) {
      storyLevel = 6;
    } else if (choice == 3 && storyLevel == 1) {
      storyLevel = 5;
    } else if (choice == 1 && storyLevel == 2) {
      storyLevel = 4;
    } else if (choice == 2 && storyLevel == 2) {
      storyLevel = 6;
    } else if (choice == 1 && storyLevel == 4) {
      storyLevel = 7;
    } else if (choice == 3 && storyLevel == 2) {
      restartGame();
    } else if (storyLevel >= 6) {
      restartGame();
    }
    print('Story Level $storyLevel');
  }

  void restartGame() {
    storyLevel = 0;
  }

  bool isVisible() {
    return !(storyLevel >= 6);
  }
}
