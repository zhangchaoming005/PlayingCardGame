//
//  PlayingCardGameViewController.m
//  DeckGame
//
//  Created by zhangchaoming on 2018/8/2.
//  Copyright © 2018 zhangchaoming. All rights reserved.
//

#import "PlayingCardGameViewController.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

-(Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

@end
