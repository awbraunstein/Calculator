//
//  AWBExpressionToken.h
//  Calculator
//
//  Created by Andrew Braunstein on 2/5/13.
//  Copyright (c) 2013 Andrew Braunstein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>

enum tokType {PLUS,
  MINUS,
  MULT,
  DIV,
  POW,
  LPAREN,
  RPAREN,
  PI,
  E,
  VAL,
  ERROR};

@interface AWBExpressionToken : NSObject

@property enum tokType type;
@property NSNumber * val;
@property NSString * error;

- (id) initWithSymbol: (NSString*) symbol;

- (id) initWithError: (NSString*) err;

@end
