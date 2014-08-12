//
//  SmilieCardDeck.m
//  Matchismo
//
//  Created by Robbie Jerrom on 19/01/2014.
//  Copyright (c) 2014 Robbies App Learning. All rights reserved.
//

#import "SmilieCardDeck.h"
#import "SmilieCard.h"

@implementation SmilieCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [SmilieCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [SmilieCard maxRank]; rank++) {
                SmilieCard *card = [[SmilieCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}
@end
