//
//  Deck.h
//  DeckGame
//
//  Created by zhangchaoming on 2018/7/24.
//  Copyright © 2018 zhangchaoming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

@property (nonatomic, strong) NSMutableArray * cards;

-(void) addCard:(Card *)card atTop:(BOOL)atTop;

-(Card *) drawCard;

@end
