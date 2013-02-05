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

- (IBAction)clear:(id)sender {
  NSLog(@"CLEAR");
  [self clearEchoArea];
}


- (IBAction)digitPressed:(UIButton *)sender {
  NSString * digit = [sender currentTitle];
  NSLog(digit);
  [self appendToEchoArea:digit];
}

- (IBAction)evaluate:(UIButton *)sender {
  NSLog(@"EVALUATE");
}

- (IBAction)operatorPressed:(UIButton *)sender {
  NSString * op = [sender currentTitle];
  NSLog(op);
  [self appendToEchoArea:op];
}

@end
