//
//  PlayingCardView.h
//  Matchismo
//
//  Created by Robbie Jerrom on 26/01/2014.
//  Copyright (c) 2014 Robbies App Learning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;  // why is this one strong ??
@property (nonatomic) BOOL faceUp;

-(void)pinch:(UIPinchGestureRecognizer *)gesture;
//-(void)swipe:(UISwipeGestureRecognizer *)gesture;
@end
