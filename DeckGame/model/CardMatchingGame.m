//
//  CardMatchingGame.m
//  DeckGame
//
//  Created by zhangchaoming on 2018/7/26.
//  Copyright © 2018 zhangchaoming. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite)NSInteger score;
@property (nonatomic, strong) NSMutableArray * cards;
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)cardCount withDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        for (NSUInteger i=0; i<cardCount; i++) {
            Card *card = [deck drawCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index {
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

-(void)chooseCarAtIndex:(NSUInteger)index {
    Card * card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card * otherCard in _cards) {
                if (card != otherCard && otherCard.isChosen) {
                    NSUInteger matchedScore = [card match:otherCard];
                    if (matchedScore) {
                        card.matched = YES;
                        otherCard.matched = YES;
                        self.score += matchedScore;
                        break;
                    } else {
                        otherCard.chosen = NO;
                    }
                }
            }
        }
        
        card.chosen = YES;
    }
}


@end
