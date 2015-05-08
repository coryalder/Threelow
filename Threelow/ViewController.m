//
//  ViewController.m
//  Threelow
//
//  Created by Cory Alder on 2015-05-08.
//  Copyright (c) 2015 Davander Mobile Corporation. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.held = [NSMutableSet setWithCapacity:5];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetDice:(id)sender {
    [self.held removeAllObjects];
    
    self.die1.backgroundColor = [UIColor clearColor];
    self.die2.backgroundColor = [UIColor clearColor];
    self.die3.backgroundColor = [UIColor clearColor];
    self.die4.backgroundColor = [UIColor clearColor];
    self.die5.backgroundColor = [UIColor clearColor];
    
    [self rollDice:nil];
}

- (IBAction)rollDice:(id)sender {
    [self rollDie:self.die1];
    [self rollDie:self.die2];
    [self rollDie:self.die3];
    [self rollDie:self.die4];
    [self rollDie:self.die5];
}

-(void)rollDie:(UIButton *)dieButton {
    
    if ([self.held containsObject:dieButton]) {
        return;
    }
    
    [UIView transitionWithView:dieButton duration:0.3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        [dieButton setTitle:[self randomDiceString] forState:UIControlStateNormal];
    } completion:^(BOOL finished) {
        
    }];
}

-(NSString *)randomDiceString {
    int result = arc4random_uniform(6) + 1;
    
    NSArray *diceLabels = @[@"⚀",@"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
    
    NSString *one = [diceLabels objectAtIndex:result-1];
    
    return one;
}

- (IBAction)diceButton:(UIButton *)sender {
    if ([self.held containsObject:sender]) {
        sender.backgroundColor = [UIColor clearColor];
        [self.held removeObject:sender];
    } else {
        sender.backgroundColor = [UIColor whiteColor];
        [self.held addObject:sender];
    }
    
    [self calculateScore];
}

-(void)calculateScore {
    NSArray *diceLabels = @[@"⚀",@"⚁", @"⚂", @"⚃", @"⚄", @"⚅"];
    
    int score = 0;
    
    for (UIButton *button in [self.held allObjects]) {
        int index = [diceLabels indexOfObject:[button titleForState:(UIControlStateNormal)]] + 1;
        
        if (index != 3) {
            score += index;
        }
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", score];
}

@end
