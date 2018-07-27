//
//  PlayingCardDeck.m
//  DeckGame
//
//  Created by zhangchaoming on 2018/7/25.
//  Copyright © 2018 zhangchaoming. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(instancetype)init {
    self = [super init];
    
    if (self) {
        for (NSString * suit in PlayingCard.validSuits) {
            for (NSUInteger rank=1; rank<=PlayingCard.maxRank; rank++) {
                PlayingCard * playingCard = [[PlayingCard alloc] init];
                playingCard.suit = suit;
                playingCard.rank = rank;
                [self addCard:playingCard atTop:TRUE];
            }
        }
    }
    
    return self;
}

@end
