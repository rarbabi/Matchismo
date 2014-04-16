//
//  Card.h
//  Matchismo
//
//  Created by Arbabi, Reza X. -ND on 3/2/14.
//  Copyright (c) 2014 Arbabi, Reza X. -ND. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;
@end
