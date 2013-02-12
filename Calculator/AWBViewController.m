//
//  AWBViewController.m
//  Calculator
//
//  Created by Andrew Braunstein on 1/14/13.
//  Copyright (c) 2013 Andrew Braunstein. All rights reserved.
//

#import "AWBViewController.h"

@interface AWBViewController ()

@end

@implementation AWBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
  // Setup the background image
  
  UIImage * patternImage = [UIImage imageNamed:@"use_your_illusion.png"];
  self.view.backgroundColor = [UIColor colorWithPatternImage:patternImage];
  
  self.inNumber = NO;
  self.readyToClear = YES;
  self.tokenList = [[AWBTokenList alloc] init];
  self.currentNumber = [[NSString alloc] init];
  self.ans = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)appendToEchoArea:(NSString*)string {
  if (self.readyToClear) {
    [self clearEchoArea];
    self.readyToClear = NO;
  }
  [self.echoArea setText:[self.echoArea.text stringByAppendingString:string]];
}

- (void)clearEchoArea {
  [self.echoArea setText:@""];
}

- (IBAction)clear:(id)sender {
  NSLog(@"CLEAR");
  [self clearEchoArea];
  [self.tokenList removeAllObjects];
  self.currentNumber = [[NSString alloc] init];
  self.inNumber = NO;
}

- (IBAction)digitPressed:(UIButton *)sender {
  NSString * digit = [sender currentTitle];
  NSLog(@"%@", digit);
  if ([digit isEqualToString:@"(-)"]) {
    digit = @"-";
  }
  [self appendToEchoArea:digit];
  if (! self.inNumber) {
    self.currentNumber = [[NSString alloc] init];
  }
  self.inNumber = YES;
  self.currentNumber = [self.currentNumber stringByAppendingString:digit];
}

- (IBAction)evaluate:(UIButton *)sender {
  NSLog(@"EVALUATE");
  [self clearEchoArea];
  if (self.inNumber) {
    AWBExpressionToken * tok = [[AWBExpressionToken alloc] initWithValString:self.currentNumber];
    if (tok.val == nil) {
      [self.echoArea setText:@"Error: Illegal number"];
      [self.tokenList removeAllObjects];
      self.readyToClear = YES;
      self.inNumber = NO;
      return;
    }
    [self.tokenList pushBack:tok];
  }
  
  NSString * answer = [AWBInfixParser parseExpression:self.tokenList];
  NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
  [f setNumberStyle:NSNumberFormatterDecimalStyle];
  NSNumber * ans = [f numberFromString:answer];
  if (ans == nil) {
    self.ans = 0;
  } else {
    self.ans = ans;
  }
  [self.echoArea setText:answer];
  self.readyToClear = YES;
  self.inNumber = NO;
  [self.tokenList removeAllObjects];
}

- (IBAction)symbolPressed:(UIButton *)sender {
  NSString * sym = [sender currentTitle];
  NSLog(@"%@", sym);
  AWBExpressionToken * tok = [[AWBExpressionToken alloc] initWithSymbol:sym];
  if (tok.isOperator && [self.tokenList isEmpty] && self.inNumber == NO) {
    [self appendToEchoArea:@"Ans"];
    [self.tokenList pushBack: [[AWBExpressionToken alloc] initWithVal:self.ans]];
  }
  [self appendToEchoArea:sym];
  if (self.inNumber) {
    [self.tokenList pushBack:[[AWBExpressionToken alloc] initWithValString:self.currentNumber]];
    self.inNumber = NO;
  }
  [self.tokenList pushBack: tok];

}

@end
