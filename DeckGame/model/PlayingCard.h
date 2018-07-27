//
//  PlayingCard.h
//  DeckGame
//
//  Created by zhangchaoming on 2018/7/19.
//  Copyright © 2018 zhangchaoming. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;

@property (nonatomic) NSUInteger rank;

+(NSArray *) validSuits;

+(NSUInteger)maxRank;

@end
