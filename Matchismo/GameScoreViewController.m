//
//  GameScoreViewController.m
//  Matchismo
//
//  Created by Robbie Jerrom on 19/01/2014.
//  Copyright (c) 2014 Robbies App Learning. All rights reserved.
//

#import "GameScoreViewController.h"

@interface GameScoreViewController ()

@property (weak, nonatomic) IBOutlet UILabel *GameScore;

@end

@implementation GameScoreViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void)updateUI
{
    // Update the UI with the Score and any other stuff.
    _GameScore.text = [NSString stringWithFormat:@"Score is : %ld", (long)_score];     // Not the right score.      //was an int.
    
    
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
