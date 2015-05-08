//
//  ViewController.h
//  Threelow
//
//  Created by Cory Alder on 2015-05-08.
//  Copyright (c) 2015 Davander Mobile Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSMutableSet *held;

@property (weak, nonatomic) IBOutlet UIButton *die1;
@property (weak, nonatomic) IBOutlet UIButton *die2;
@property (weak, nonatomic) IBOutlet UIButton *die3;
@property (weak, nonatomic) IBOutlet UIButton *die4;
@property (weak, nonatomic) IBOutlet UIButton *die5;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

- (IBAction)resetDice:(id)sender;
- (IBAction)rollDice:(id)sender;

@end

