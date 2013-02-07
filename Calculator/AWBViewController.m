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
  self.tokenList = [[NSMutableArray alloc] init];
  self.currentNumber = [[NSString alloc] init];
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
  [self appendToEchoArea:digit];
  if (! self.inNumber) {
    self.currentNumber = [[NSString alloc] init];
  }
  self.inNumber = YES;
  self.currentNumber = [self.currentNumber stringByAppendingString:digit];
}

- (AWBExpressionToken*)tokenFromCurrentNumberString {
  AWBExpressionToken * tok = [AWBExpressionToken alloc];
  tok.type = VAL;
  NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
  [f setNumberStyle:NSNumberFormatterDecimalStyle];
  NSLog(@"Current number: %@", self.currentNumber);
  tok.val = [f numberFromString:self.currentNumber];
  return tok;
}

- (IBAction)evaluate:(UIButton *)sender {
  NSLog(@"EVALUATE");
  [self clearEchoArea];
  if (self.inNumber) {
    [self.tokenList addObject:[self tokenFromCurrentNumberString]];
  }
  for (AWBExpressionToken* tok in self.tokenList) {
    if (tok.type == VAL) {
      NSLog(@"val: %@", tok.val);
    } else {
      NSLog(@"%d", tok.type);
    }
  }
  //[self.echoArea setText:[AWBInfixParser parseExpression:self.tokenList]];
  self.readyToClear = YES;
  self.inNumber = NO;
}

- (IBAction)symbolPressed:(UIButton *)sender {
  NSString * sym = [sender currentTitle];
  NSLog(@"%@", sym);
  [self appendToEchoArea:sym];
  if (self.inNumber) {
    [self.tokenList addObject:[self tokenFromCurrentNumberString]];
    self.inNumber = NO;
  }
  [self.tokenList addObject:[[AWBExpressionToken alloc] initWithSymbol:sym]];

}

@end
