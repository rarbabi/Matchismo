//
//  PlayingCard.h
//  Matchismo
//
//  Created by Arbabi, Reza X. -ND on 3/2/14.
//  Copyright (c) 2014 Arbabi, Reza X. -ND. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suite;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger)maxRank;

@end
