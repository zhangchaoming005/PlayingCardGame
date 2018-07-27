//
//  Card.h
//  DeckGame
//
//  Created by zhangchaoming on 2018/7/19.
//  Copyright © 2018 zhangchaoming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic)NSString *content;

@property (nonatomic, getter=isChosen)BOOL chosen;

@property (nonatomic, getter=isMatched)BOOL matched;

-(int) match:(Card *) anotherCard;

@end
