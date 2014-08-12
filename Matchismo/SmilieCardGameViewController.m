//
//  SmilieCardGameViewController.m
//  Matchismo
//
//  Created by Robbie Jerrom on 19/01/2014.
//  Copyright (c) 2014 Robbies App Learning. All rights reserved.
//

#import "SmilieCardGameViewController.h"
#import "SmilieCardDeck.h"
#import "GameScoreViewController.h"

@interface SmilieCardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation SmilieCardGameViewController


// Setup the score on the Segue..
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SmilieCardScoreSeg"]) {
        if ([segue.destinationViewController isKindOfClass:[GameScoreViewController class]]) {
            // Fill out the score label.
            GameScoreViewController *gameScoreVC = (GameScoreViewController *)segue.destinationViewController;
            NSLog(@"Game Score is: %ld",(long)self.game.score);     // cast to long as this is a NSUinteger 
            gameScoreVC.score=self.game.score;       
            
        }
    }
    
}

-(Deck *)createDeck
{   return [[SmilieCardDeck alloc] init]; }

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
