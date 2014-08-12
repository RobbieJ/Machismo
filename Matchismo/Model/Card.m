//
//  Card.m
//  Matchismo
//
//  Created by Robbie Jerrom on 18/01/2014.
//  Copyright (c) 2014 Robbies App Learning. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards
{
    int score=0;
    
    for (Card *card in otherCards){
        if ([card.contents isEqualToString:self.contents])
        {score=1;}
    }
    
    return score;
}

@end
