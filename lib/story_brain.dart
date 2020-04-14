import 'story.dart';

class StoryBrain {
  int index = 0;
  List<Story> _storyData = [
    Story(
        question:
            'People are not abiding by the rules, can we use force to make them follow?',
        choice1: 'Yes',
        choice2: 'No',
        characterName: 'General',
        characterImg: 'images/General.png',
        factorChoice1: [0, -5, 0, 0],
        factorChoice2: [-5, 2, 0, -5]),
    Story(
        question:
            'Putting the country in lockdown will damage the economy, should we still proceed with it?',
        choice1: 'Yes',
        choice2: 'No',
        characterName: 'Economic Advisor',
        characterImg: 'images/Economic Advisor.png',
        factorChoice1: [-5, 2, -5, 2],
        factorChoice2: [2, -5, -5, -5]),
    Story(
        question: '',
        choice1: '',
        choice2: '',
        characterName: 'Stay at Home',
        characterImg: 'images/stayhome.png',
        factorChoice1: [0, 0, 0, 0],
        factorChoice2: [0, 0, 0, 0]),
    Story(
        question:
            'Should we distribute food and other necessities to people that can’t reach their home and are stuck in the lockdown?',
        choice1: 'Yes',
        choice2: 'No',
        characterName: 'Economic Advisor',
        characterImg: 'images/Economic Advisor.png',
        factorChoice1: [0, 5, -3, 0],
        factorChoice2: [0, -3, 0, 0]),
    Story(
        question: 'We need to increase taxes to raise funds for the cure',
        choice1: 'Yes',
        choice2: 'No',
        characterName: 'Economic Advisor',
        characterImg: 'images/Economic Advisor.png',
        factorChoice1: [-3, 0, 0, 5],
        factorChoice2: [3, 0, 0, -5]),
    Story(
        question: '',
        choice1: '',
        choice2: '',
        characterName: 'Wash your Hands',
        characterImg: 'images/wash.png',
        factorChoice1: [0, 0, 0, 0],
        factorChoice2: [0, 0, 0, 0]),
    Story(
        question:
            'One of your lead researchers suggests going with human experimentation to improve your chances to combat the pandemic',
        choice1: 'Yes',
        choice2: 'No',
        characterName: 'Health Advisor',
        characterImg: 'images/Healthcare 1.png',
        factorChoice1: [0, -5, 0, 5],
        factorChoice2: [-3, 2, 0, -5]),
  ];
  void updateIndex(int newIndex) {
    if (newIndex < getLength()) index = newIndex;
  }

  bool cardsOver(int ind) => (ind + 1 >= getLength());

  String getQuestion() => _storyData[index].question;
  String getName() => _storyData[index].characterName;
  String getImg() => _storyData[index].characterImg;
  int getLength() => _storyData.length;

  String getChoice1() => _storyData[index].choice1;
  String getChoice2() => _storyData[index].choice2;

  int updateMoneyLeft() => _storyData[index - 1].factorChoice1[0];
  int updatePersonLeft() => _storyData[index - 1].factorChoice1[1];
  int updateFoodLeft() => _storyData[index - 1].factorChoice1[2];
  int updateHealthLeft() => _storyData[index - 1].factorChoice1[3];

  int updateMoneyRight() => _storyData[index - 1].factorChoice2[0];
  int updatePersonRight() => _storyData[index - 1].factorChoice2[1];
  int updateFoodRight() => _storyData[index - 1].factorChoice2[2];
  int updateHealthRight() => _storyData[index - 1].factorChoice2[3];
}
