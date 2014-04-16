//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Arbabi, Reza X. -ND on 3/4/14.
//  Copyright (c) 2014 Arbabi, Reza X. -ND. All rights reserved.
//

#import "CardMatchingGame.h"

// defining class extention which is the
// place for private properties
@interface CardMatchingGame()
@property (nonatomic, readwrite) NSUInteger score;
@property (nonatomic, strong)NSMutableArray *cards; // of Card
@property (nonatomic) BOOL isTwoCardMatching;

@end
@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0;i<count;i++) {
            Card *card = [deck drawRandomCard];
            if(card){
            [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if(card.isChosen) {
            card.chosen = NO;
        }else{
            // matach against other chosen card
            NSArray *otherCards;
            for(Card *otherCard in self.cards) {
                //if the card is chosen and it's not matched yet
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break; // can only choose two cards for now
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    if(index < [self.cards count]) {
    return [self.cards objectAtIndex:index];
    } else{
        return nil;
    }
    
}

- (void) resetGame
{
    self.score = 0;
}



@end
