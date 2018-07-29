//
//  PlayingCard.m
//  DeckGame
//
//  Created by zhangchaoming on 2018/7/19.
//  Copyright © 2018 zhangchaoming. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()

@end

static NSArray * suitTypes;

@implementation PlayingCard

+(NSArray *)validSuits {
    return @[@"♠", @"♥", @"♦", @"♣"];
}

+(NSArray *)rankStrings {
    return @[@"?", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+(NSUInteger) maxRank {
    return [[PlayingCard rankStrings] count] - 1;
}

-(instancetype) init {
    self = [super init];

    return self;
}

-(void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString *) getSuit {
    return _suit;
}

-(void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

-(NSString *) content {
    NSArray * allRank = [PlayingCard rankStrings];
    
    return [allRank[self.rank] stringByAppendingString:self.suit];
}

-(int)match:(PlayingCard *)anotherCard {
    int score = 0;
    if (self.rank == anotherCard.rank) {
        score  = 4;
    } else if(self.suit == anotherCard.suit) {
        score = 1;
    }
    
    return score;
}

@end
