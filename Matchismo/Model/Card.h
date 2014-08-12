//
//  Card.h
//  Matchismo
//
//  Created by Robbie Jerrom on 18/01/2014.
//  Copyright (c) 2014 Robbies App Learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;

@end
