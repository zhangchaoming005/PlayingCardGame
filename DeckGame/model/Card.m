//
//  Card.m
//  DeckGame
//
//  Created by zhangchaoming on 2018/7/19.
//  Copyright © 2018 zhangchaoming. All rights reserved.
//

#import "Card.h"

@implementation Card

@synthesize chosen = _chosen;

@synthesize matched = _matched;

-(BOOL)chosen {
    return _chosen;
}

-(void)setChosen:(BOOL)chosen {
    _chosen = chosen;
}

-(BOOL)matched {
    return _matched;
}

-(void)setMatched:(BOOL)matched {
    _matched = matched;
}

-(int)match:(Card *)anotherCard {
    int score = 0;
    
    if ([self.content isEqualToString:anotherCard.content]) {
        score  = 1;
    }
    return score;
}

@end
