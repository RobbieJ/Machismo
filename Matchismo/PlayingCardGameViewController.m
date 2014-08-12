//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Robbie Jerrom on 19/01/2014.
//  Copyright (c) 2014 Robbies App Learning. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "GameScoreViewController.h"

@interface PlayingCardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation PlayingCardGameViewController

// Setup the score on the Segue..
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PlayingCardScoreSeg"]) {
        if ([segue.destinationViewController isKindOfClass:[GameScoreViewController class]]) {
            // Fill out the score label.
            GameScoreViewController *gameScoreVC = (GameScoreViewController *)segue.destinationViewController;
            //gameScoreVC.score=[[self game]score];       // this isn't the correct score.
            NSLog(@"Game Score is: %d",(int)self.game.score);
            gameScoreVC.score=self.game.score;       // this isn't the correct score.
            
            
        }
    }
    
}

-(void)UpdateUI
{
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", (int)self.game.score];      //cast to int to stop compiler bitching 

}

-(Deck *)createDeck
{   return [[PlayingCardDeck alloc] init]; }


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
