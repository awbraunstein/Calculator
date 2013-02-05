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
  
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)appendToEchoArea:(NSString*)string {
  [self.echoArea setText:[self.echoArea.text stringByAppendingString:string]];
}

- (void)clearEchoArea {
  [self.echoArea setText:@""];
}

- (IBAction)openParen:(id)sender {
  NSLog(@"(");
  [self appendToEchoArea:@"("];
}

- (IBAction)closeParen:(id)sender {
  NSLog(@")");
  [self appendToEchoArea:@")"];
}

- (IBAction)pi:(id)sender {
  NSLog(@"π");
  [self appendToEchoArea:@"π"];
}

- (IBAction)euler:(id)sender {
  NSLog(@"e");
  [self appendToEchoArea:@"e"];
}

- (IBAction)clear:(id)sender {
  NSLog(@"CLEAR");
  [self clearEchoArea];
}

- (IBAction)sqrt:(id)sender {
  NSLog(@"√");
  [self appendToEchoArea:@"√"];
}

- (IBAction)divide:(id)sender {
  NSLog(@"÷");
  [self appendToEchoArea:@"÷"];
  
}

- (IBAction)times:(id)sender {
  NSLog(@"×");
  [self appendToEchoArea:@"×"];
}

- (IBAction)minus:(id)sender {
  NSLog(@"-");
  [self appendToEchoArea:@"-"];
}

- (IBAction)plus:(id)sender {
  NSLog(@"+");
  [self appendToEchoArea:@"+"];
}

- (IBAction)equals:(id)sender {
  NSLog(@"EVALUATE");
}

- (IBAction)dot:(id)sender {
  NSLog(@".");
  [self appendToEchoArea:@"."];
}

- (IBAction)zero:(id)sender {
  NSLog(@"0");
  [self appendToEchoArea:@"0"];
}

- (IBAction)one:(id)sender {
  NSLog(@"1");
  [self appendToEchoArea:@"1"];
}

- (IBAction)two:(id)sender {
  NSLog(@"2");
  [self appendToEchoArea:@"2"];
}

- (IBAction)three:(id)sender {
  NSLog(@"3");
  [self appendToEchoArea:@"3"];
}

- (IBAction)four:(id)sender {
  NSLog(@"4");
  [self appendToEchoArea:@"4"];
}

- (IBAction)five:(id)sender {
  NSLog(@"5");
  [self appendToEchoArea:@"5"];
}

- (IBAction)six:(id)sender {
  NSLog(@"6");
  [self appendToEchoArea:@"6"];
}

- (IBAction)seven:(id)sender {
  NSLog(@"7");
  [self appendToEchoArea:@"7"];
}

- (IBAction)eight:(id)sender {
  NSLog(@"8");
  [self appendToEchoArea:@"8"];
}

- (IBAction)nine:(id)sender {
  NSLog(@"9");
  [self appendToEchoArea:@"9"];
}
@end
