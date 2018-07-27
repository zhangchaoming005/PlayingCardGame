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
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;



@end

@implementation ViewController

-(Deck *)deck {
    if (!_deck) {
        _deck = [self createDeck];
    }
    
    return _deck;
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
    if ([[sender currentTitle] length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        Card * card = [self.deck drawCard];
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"front"] forState:UIControlStateNormal];
            [sender setTitle:[card content] forState:UIControlStateNormal];
            self.flipsCount++;
        }
    }
}

@end
