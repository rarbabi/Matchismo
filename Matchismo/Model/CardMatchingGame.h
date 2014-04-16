//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Arbabi, Reza X. -ND on 3/4/14.
//  Copyright (c) 2014 Arbabi, Reza X. -ND. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
-(void)resetGame;

@property (nonatomic, readonly) NSUInteger score;


@end
