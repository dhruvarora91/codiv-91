import 'story.dart';

class StoryBrain {
  int index = 0;
  List<Story> _storyData = [
    Story(
        question:
            'People are not abiding by the rules, can we use force to make them follow?',
        choice1: 'Yes',
        choice2: 'NO',
        characterName: 'General',
        characterImg: 'images/General.png',
        factorChoice1: [0, -5, 0, 0],
        factorChoice2: [-5, 2, 0, -5]),
    Story(
        question:
            'Putting the country in lockdown will damage the economy, should we still proceed with it?',
        choice1: 'Yes',
        choice2: 'NO',
        characterName: 'Economic Advisor',
        characterImg: 'images/Economic Advisor.png',
        factorChoice1: [-5, 2, -5, 2],
        factorChoice2: [2, -5, -5, -5]),
    Story(
        question:
            'People are not abiding by the rules, can we use force to make them follow?',
        choice1: 'Yes',
        choice2: 'NO',
        characterName: 'General',
        characterImg: 'images/General.png',
        factorChoice1: [0, -5, 0, 0],
        factorChoice2: [-5, 2, 0, -5]),
    Story(
        question:
            'People are not abiding by the rules, can we use force to make them follow?',
        choice1: 'Yes',
        choice2: 'NO',
        characterName: 'General',
        characterImg: 'images/General.png',
        factorChoice1: [0, -5, 0, 0],
        factorChoice2: [-5, 2, 0, -5]),
  ];
  void updateIndex(int newIndex) {
    if (newIndex < getLength()) index = newIndex;
  }

  String getQuestion() => _storyData[index].question;
  String getName() => _storyData[index].characterName;
  String getImg() => _storyData[index].characterImg;
  int getLength() => _storyData.length;
}
