//
//  CardMatchingGame.h
//  DeckGame
//
//  Created by zhangchaoming on 2018/7/26.
//  Copyright © 2018 zhangchaoming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
-(instancetype)initWithCardCount:(NSUInteger)cardCount withDeck:(Deck *)deck;

-(void)chooseCarAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly)NSInteger score;

@end
