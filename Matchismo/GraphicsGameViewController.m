//
//  GraphicsGameViewController.m
//  Matchismo
//
//  Created by Robbie Jerrom on 25/01/2014.
//  Copyright (c) 2014 Robbies App Learning. All rights reserved.
//

#import "GraphicsGameViewController.h"
#import "GameScoreViewController.h"
#import "CardMatchingGame.h"
#import "PlayingCardView.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface GraphicsGameViewController ()

@property (strong, nonatomic) CardMatchingGame *game;

//Collection of Playingcard Views
@property (strong, nonatomic) IBOutletCollection(PlayingCardView) NSArray *playingCards;


@end



@implementation GraphicsGameViewController

-(CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.playingCards count]
                                                          usingDeck:[self createDeck]];
    return _game;
    
}


-(Deck *)createDeck
{   return [[PlayingCardDeck alloc] init]; }



// this is 'touching' a card logic.
-(void)swipe:(UISwipeGestureRecognizer *)gesture
{
    UIView *cardView=gesture.view;      // get the view that was touched.
    NSUInteger chosenViewIndex = [self.playingCards indexOfObject:cardView];
 
    [self.game chooseCardAtIndex:chosenViewIndex];            // Play the game with the card (do the match and score)
      
    PlayingCardView *acardView=(PlayingCardView*)cardView;          // Need to Tidy this.
    acardView.faceUp=!acardView.faceUp;
   
    [self updateUI];
    [cardView setNeedsDisplay];

}

// this is 'touching' a card logic.
-(void)touch:(UISwipeGestureRecognizer *)gesture
{
    UIView *cardView=gesture.view;      // get the view that was touched.
    NSUInteger chosenViewIndex = [self.playingCards indexOfObject:cardView];
    
    [self.game chooseCardAtIndex:chosenViewIndex];            // Play the game with the card (do the match and score)
    
    PlayingCardView *acardView=(PlayingCardView*)cardView;          // Need to Tidy this.


    [UIView transitionWithView:acardView
                          duration:0.3f
                       options:UIViewAnimationOptionTransitionCurlUp
                           //options:UIViewAnimationOptionTransitionFlipFromRight|UIViewAnimationOptionCurveEaseInOut
                        animations:^{
                                acardView.faceUp=!acardView.faceUp;
                            }
                        completion:NULL];
    
    [self updateUI];
    [cardView setNeedsDisplay];
    
}


-(void)updateUI
{
    for (PlayingCardView *cardView in self.playingCards) {
        
        NSUInteger cardViewIndex = [self.playingCards indexOfObject:cardView];
        Card *card = [self.game cardAtIndex:cardViewIndex];     // Get a reference to the card.
        
        cardView.userInteractionEnabled=!card.isMatched;
        cardView.faceUp=card.chosen;
        
        if (card.isMatched)
        {
            //cardView.alpha=0.5; // transpatent it
//            cardView.userInteractionEnabled=!card.isMatched;
            
            // lets fade it out.
            
            [UIView animateWithDuration:3.0
                                  delay:0.0
                                options:UIViewAnimationOptionBeginFromCurrentState
                             animations:^{ cardView.alpha = 0.5; }
                             completion:nil];
            
        } else
        {
            //cardView.faceUp=!cardView.faceUp;
        }

        
    }
}



// Setup the score on the Segue..
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"GraphicsCardScoreSeg"]) {
        if ([segue.destinationViewController isKindOfClass:[GameScoreViewController class]]) {
            // Fill out the score label.
            GameScoreViewController *gameScoreVC = (GameScoreViewController *)segue.destinationViewController;
            NSLog(@"Game Score is: %ld",(long)self.game.score);     // cast to long as this is a NSUinteger
            gameScoreVC.score=self.game.score;
            
        }
    }
    
}




//-(void)drawRandomCard
//{
//    Card *card=[self.deck drawRandomCard];
//    if ([card isKindOfClass:[PlayingCard class]])
//    {
//        PlayingCard *playingCard=(PlayingCard *)card;
//        self.playingCardView.rank=playingCard.rank;
//        self.playingCardView.suit=playingCard.suit;
//        
//    }
//}

// When we swipe we don't want to draw a random card we want the card associated with the view the have swiped over.
//- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
//    
//    //if (!self.playingCardView.faceUp) [self drawRandomCard];            //flipping the card picks a new one.
//    //self.playingCardView.faceUp = !self.playingCardView.faceUp;
//    
//}

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
  
    for (PlayingCardView *playingCardView in self.playingCards) {
   
        [playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc]
                                            initWithTarget:playingCardView
                                            action:@selector(pinch:)]];                 //how do you pick the class this calls ?? By choosing the initwithTarget.
        
//        [playingCardView addGestureRecognizer:[[UISwipeGestureRecognizer alloc]
//                                               initWithTarget:playingCardView
//                                               action:@selector(swipe:)]];
        
        
        [playingCardView addGestureRecognizer:[[UISwipeGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(swipe:)]];
        
        [playingCardView addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(touch:)]];
        
        NSUInteger playingCardIndex = [self.playingCards indexOfObject:playingCardView];       //was an int
        Card *card = [self.game cardAtIndex:playingCardIndex];
        PlayingCard *playingCard = (PlayingCard*)card;
        
        [playingCardView setRank:playingCard.rank];
        [playingCardView setSuit:playingCard.suit];
        [playingCardView setFaceUp:NO];

    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
