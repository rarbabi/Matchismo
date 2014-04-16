//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Arbabi, Reza X. -ND on 3/2/14.
//  Copyright (c) 2014 Arbabi, Reza X. -ND. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) CardMatchingGame *game;
@property (nonatomic)Deck* deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISwitch *gameModeSwitch;
@end

@implementation CardGameViewController

-(Deck *)deck
{
    if(!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

-(CardMatchingGame *)game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    
    return _game;
    
}

- (Deck *) createDeck{
    return [[PlayingCardDeck alloc] init ];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];

}
- (IBAction)resetGameButton:(UIButton *)sender {
    // set the score value and label to zero
    // set the deck to nil for reseting the random cards
    // set all the cards back grounds to back
    [self.game resetGame];
    self.scoreLabel.text = @"Score: 0";
    for(UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        card.chosen = NO;
        card.matched = NO;
        [cardButton setTitle:[self titeForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage: [self imageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = YES;
        
    }
    _game = nil;
    _deck = nil;
    
}

- (void)updateUI
{
    for(UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titeForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage: [self imageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
    
}

- (NSString *)titeForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)imageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}


@end
