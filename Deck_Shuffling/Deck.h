//
//  Deck.h
//  Deck_Shuffling
//
//  Created by Hari Palempati on 6/22/16.
//  Copyright © 2016 Hari Palempati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

@property (nonatomic, copy) NSArray<Card *> *dealHistory;
@property (nonatomic, copy) NSArray<Card *> *cards;

@end
