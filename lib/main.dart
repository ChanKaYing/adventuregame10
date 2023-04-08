import 'package:flutter/material.dart';
import 'story_brain.dart';

//Step 15 - Run the app and see if you can see the screen update with the first story. Delete this pTODO if it looks as you expected.

void main() => runApp(AdventureGame());

class AdventureGame extends StatelessWidget {
  const AdventureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // we are using the dark theme
      home: StoryPage(),
    );
  }
}

//Step 9 - Create a new storyBrain object from the StoryBrain class.
 StoryBrain storyBrain = StoryBrain();


class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Center(child: Text('Adventure Game')),
        backgroundColor: Colors.blueGrey,),

      body: Container(
        //Step 1 - Find a background image, add the background image into the images directory, then add the background image to this Container.
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/galaxy1.jpg'),
            fit: BoxFit.cover,

          ),
        ),

        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                    storyBrain.getStory(),//'Story text will go here',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    // Choice 1 made by user
                    //Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                    setState(() {
                    storyBrain.nextStory(1);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.red),
                    foregroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                    shape: MaterialStateProperty.resolveWith(
                            (states) => BeveledRectangleBorder()),
                  ),
                  child: Text(
                    //Step 13 - Use the storyBrain to get the text for choice 1.
                    storyBrain.getChoice1(),//'Choice 1',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  //Step 26 - Use a Flutter Visibility Widget to wrap this TextButton.
                  visible: storyBrain.buttonShouldBeVisible(),
                  //Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                  child: TextButton(
                    onPressed: () {
                      // Choice 2 made by user
                      setState(() {
                      //Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                      storyBrain.nextStory(2);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.blue),
                      foregroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                      shape: MaterialStateProperty.resolveWith(
                              (states) => BeveledRectangleBorder()),
                    ),
                    child: Text(
                      //Step 14 - Use the storyBrain to get the text for choice 2.
                      storyBrain.getChoice2(),//'Choice 2',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps.
