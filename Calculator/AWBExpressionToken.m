//
//  AWBExpressionToken.m
//  Calculator
//
//  Created by Andrew Braunstein on 2/5/13.
//  Copyright (c) 2013 Andrew Braunstein. All rights reserved.
//

#import "AWBExpressionToken.h"

@implementation AWBExpressionToken

- (id) initWithSymbol: (NSString*) symbol {
  self = [super init];
  if (self) {
    NSDictionary * lookup =
      @{@"+": [NSNumber numberWithInt:PLUS],
        @"-": [NSNumber numberWithInt:MINUS],
        @"×": [NSNumber numberWithInt:MULT],
        @"÷": [NSNumber numberWithInt:DIV],
        @"^": [NSNumber numberWithInt:POW],
        @"(": [NSNumber numberWithInt:LPAREN],
        @")": [NSNumber numberWithInt:RPAREN],
        @"π": [NSNumber numberWithInt:PI],
        @"e": [NSNumber numberWithInt:E]};
    
    self.type = [[lookup valueForKey:symbol] intValue];
    
    if (self.type == PI) {
      self.val = @3.14159265358979323846;
    } else if (self.type == E) {
      self.val = @2.7182818284590452353602874;
    }
  }
  return self;
}

@end
