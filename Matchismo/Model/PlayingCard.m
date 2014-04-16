//
//  PlayingCard.m
//  Matchismo
//
//  Created by Arbabi, Reza X. -ND on 3/2/14.
//  Copyright (c) 2014 Arbabi, Reza X. -ND. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suite];
}

@synthesize suite = _suite;

+ (NSArray *) validSuits
{
    return @[@"♣︎",@"♥︎",@"♦︎",@"♠︎"];
}

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1){
        PlayingCard *otherCard = [otherCards firstObject];
        if(self.rank == otherCard.rank){
            score = 4;
        } else if([otherCard.suite isEqualToString:self.suite]){
            score = 1;
            }
        
    }
    else if ([otherCards count] == 2) {
        
        for(PlayingCard *otherCard in otherCards) {
            if(self.rank == otherCard.rank){
                score += 4;
            } else if([otherCard.suite isEqualToString:self.suite]){
                score += 1;
            }
        }
    }
    
    
    return score;
    
}

- (void) setSuite:(NSString *)suite
{
    if([[PlayingCard validSuits] containsObject:suite]){
        _suite = suite;
    }
}

- (NSString *) suite
{
    return _suite ? _suite : @"?";
}

+ (NSUInteger) maxRank
{
    return [[self rankStrings] count]-1;
}
+ (NSArray *) rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",
             @"Q",@"K"];
}
@end
