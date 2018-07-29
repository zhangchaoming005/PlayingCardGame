//
//  ViewController.m
//  DeckGame
//
//  Created by zhangchaoming on 2018/7/19.
//  Copyright © 2018 zhangchaoming. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) NSUInteger flipsCount;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;



@end

@implementation ViewController

-(CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[_cardButtons count]
                                                           withDeck:[self createDeck]];
    
    return _game;
}

-(Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setFlipsCount:(NSUInteger)flipsCount {
    _flipsCount = flipsCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"flips : %lu", (unsigned long)_flipsCount];
    [self.flipsLabel sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touchCardButton:(id)sender {
    NSUInteger cardIndex = [_cardButtons indexOfObject:sender];
    
    [self.game chooseCarAtIndex:cardIndex];
    
    [self updateUI];
    
}

-(void)updateUI {
    for (UIButton * cardButton in _cardButtons) {
        NSUInteger cardIndex = [_cardButtons indexOfObject:cardButton];
        
        Card * card = [_game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCardButton:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.matched;
    }
}

-(NSString *) titleForCard:(Card *)card {
    return card.isChosen ? card.content : @"";
}

-(UIImage *) backgroundImageForCardButton:(Card *)card {
    return card.isChosen ? [UIImage  imageNamed:@"front"] : [UIImage imageNamed:@"back"];
}

@end
