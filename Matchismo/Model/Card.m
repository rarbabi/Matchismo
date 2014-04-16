//
//  Card.m
//  Matchismo
//
//  Created by Arbabi, Reza X. -ND on 3/2/14.
//  Copyright (c) 2014 Arbabi, Reza X. -ND. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for(Card *card in otherCards) {
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}
@end
