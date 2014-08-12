//
//  Deck.h
//  Matchismo
//
//  Created by Robbie Jerrom on 18/01/2014.
//  Copyright (c) 2014 Robbies App Learning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
