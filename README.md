## Learning Objectives

Today we're going to build a simple Dice game using `UIView` elements, Foundation collection objects (e.g. `NSArray`), and some basic MVC structure.

## Introduction

The game we're going to make is called 'Threelow'. It's similar to Yahtzee, but with much simpler scoring. To play, a player rolls five dice. The goal is to get the lowest score possible. Each roll they must choose to hold at least one of the dice, but they can choose to hold as many as five dice. If they have un-held dice, they re-roll until all five dice are held. Threes are worth 0 points (hence the name of the game), every other roll is worth it's face value. Whoever has the lowest score after everyone has had a turn wins the game (note: gambling is illegal).

## Setup

- Create a new iOS project named: `Threelow`
- Use the Single View template

**Source Control:** Remember to create and push your project to github.

## MVP User Stories

Below are some user stories that outline the functionality of this app. We've also outlined a list of some of the tasks you'll need to do for each story.

### As a user, I want to play Threelow but I don't have physical dice.
- Add five `UIButton`s to your main view, one for each die.
- You can use the following unicode symbols: ⚀ ⚁ ⚂ ⚃ ⚄ ⚅, or search google for a set of dice images
- Add a "Roll" button, and a new `IBAction` method called `rollDice:` that is connected to it.
- Add a "Reset" button, and a new `IBAction` method called `resetDice:` that is connected to it.

### As a user, I want to be able to roll the dice.
- Add five `IBOutlet`s, one for each of the dice. Connect those outlets to your die buttons.
- Make the `rollDice:` method generate 5 random numbers between 1 and 6, and set the image or text of your dice accordingly.

### As a user, I want to be able to "hold" one or more of the dice and re-roll the rest.
- Add a property to your view controller to store which die buttons have been "held". You should consider which of the Foundation collection types (`NSMutableArray`, `NSMutableDictionary`, or `NSMutableSet`) is best for this task. This is your data model.
- Add an `IBAction` method to your view controller called `holdDie:`, that "holds" the sender. Connect all of your dice buttons to this method.
- You will need to visually indicate which dice have been "held". One way to show this is by using the `backgroundColor` property of your ` for this.

### As a user, I want to be able to un-"hold" a die if I tap one by mistake.
- use your `holdDie:` method to toggle buttons between the "held" and "un-held" state, visually and in your data model.

### As a user, I want to reset all "held" dice quickly.
- Use the `resetDice:` method to change all the buttons to the un-held state both visually and in the data model.

### As a user, I want to see my score as I play.
- Add a UILabel to your view to display the score.
- Add an IBOutlet for that label, so you can change the text displayed by it.
- Add a method that calculates the score based on the dice that have been held, and updates the UI.
- Consider the best place to trigger the score calculation method. It should always be displaying the correct score.

### As an app developer, I want my app to have cool animations so it can be competitive in the app store.
- Animate the dice roll using UIView animations (hint: there are a few ways to do this. One is by using `transitionWithView:duration:options:animations:completion:` and `UIViewAnimationOptionTransitionFlipFromLeft`).
- Have fun with this part! Flashing colours, rotation, transparency, even sound effects are appreciated.

## Resources

* [`UIButton` Reference](https://developer.apple.com/library/ios/documentation/uikit/reference/UIButton_Class/UIButton/UIButton.html)
* [`UIView` Animations Tutorial](http://www.raywenderlich.com/2454/uiview-tutorial-for-ios-how-to-use-uiview-animation)

## Stretch Goals

- Display the number of rolls each player has taken.
- Don't let the player roll unless they've selected at least one die each turn.
- Don't let the player roll more than 5 times without resetting.
- Display a "score to beat", so you can track what the lowest score so far has been. Allow users to reset this, when every player has had a turn. Consider changing the "Reset" button to a "Next Turn" button, and making an "New game" button that clears the play history.
- Make the dice roll animation flash a random series of dice values before showing the final value ( try using a [UIView Keyframe Animation](http://iphonedevsdk.com/forum/iphone-sdk-tutorials/117345-uiview-keyframe-animation-creating-multi-step-animations-without-having-to-use-core-animation.html)).
- Publish your app on the app store and donate all earnings to your favourite TA.


