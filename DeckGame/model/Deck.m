//
//  Deck.m
//  DeckGame
//
//  Created by zhangchaoming on 2018/7/24.
//  Copyright © 2018 zhangchaoming. All rights reserved.
//

#import "Deck.h"

@implementation Deck

-(NSArray *) cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

-(instancetype) init {
    self = [super init];
    
    self.cards = [[NSMutableArray alloc] init];
    
    return self;
}

-(void) addCard:(Card *)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

-(Card *) drawCard {
    if (_cards == nil || [_cards count] == 0) {
        return nil;
    }
    
    NSUInteger len = [self.cards count];
    
    unsigned index = arc4random() % len;
    
    Card * randomCard = self.cards[index];
    
    [self.cards removeObject:randomCard];

    return randomCard;
}

@end
