//
//  Deck.m
//  Deck_Shuffling
//
//  Created by Hari Palempati on 6/22/16.
//  Copyright © 2016 Hari Palempati. All rights reserved.
//

#import "Deck.h"

@implementation Deck

- (instancetype)init {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    [self initializeCards];
    [self shuffleCards];
    __unused Card *card = [self deal];
    
    return self;
}

- (void)initializeCards {
    
    self.dealHistory = @[];
    NSInteger cardCount = 52;
    NSMutableArray *objects = [NSMutableArray arrayWithCapacity:cardCount];
    for (NSInteger count = 0; count < 52; count++) {
        
        Card *card = [[Card alloc] init];
        [objects addObject:card];
    }
    self.cards = [objects copy];
}

- (void)shuffleCards {
    
    [self initializeCards];
    
    NSMutableArray *shuffledCards = [NSMutableArray arrayWithArray:self.cards];
    
    for (NSInteger index = 0; index < shuffledCards.count; index++) {
        
        NSInteger randomNumber = arc4random()%52;
        [shuffledCards exchangeObjectAtIndex:index withObjectAtIndex:randomNumber];
    }
    self.cards = [shuffledCards copy];
}

- (Card *)deal {
    
    Card *card = [self.cards firstObject];
    
    NSMutableArray *mutableDealHistory = [NSMutableArray arrayWithArray:self.dealHistory];
    [mutableDealHistory addObject:card];
    self.dealHistory = [mutableDealHistory copy];
    
    NSMutableArray *mutableDeck = [NSMutableArray arrayWithArray:self.cards];
    [mutableDeck removeObject:card];
    self.cards = [mutableDeck copy];
    
    return card;
}

@end
