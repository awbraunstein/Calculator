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
        @"π": [NSNumber numberWithInt:PI]};
    
    self.type = [[lookup valueForKey:symbol] intValue];
    
    if (self.type == PI) {
      self.val = @3.14159265358979323846;
    }
  }
  return self;
}

- (id) initWithError: (NSString*) err {
  self = [super init];
  if (self) {
    self.type = ERROR;
    self.error = err;
  }
  return self;
}

- (id) initWithValString: (NSString*) num {
  self = [super init];
  if (self) {
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * ans = [f numberFromString:num];
    self.type = VAL;
    self.val = ans;
  }
  return self;
}

- (id) initWithVal: (NSNumber*) num {
  self = [super init];
  if (self) {
    self.type = VAL;
    self.val = num;
  }
  return self;
}

- (BOOL) isOperator {
  switch (self.type) {
    case PLUS: case MINUS: case MULT: case DIV: case POW:
      return YES;
    default:
      return NO;
  }
}

- (BOOL) isValue {
  switch (self.type) {
    case VAL: case PI:
      return true;
    default:
      return false;
  }
}


- (int) opPrecedence {
  switch(self.type) {
    case POW:
      return 4;
    case MULT:  case DIV:
      return 3;
    case PLUS: case MINUS:
      return 2;
    default:
      return 0;
  }
  return 0;
}

@end
