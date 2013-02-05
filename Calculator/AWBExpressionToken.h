//
//  AWBExpressionToken.h
//  Calculator
//
//  Created by Andrew Braunstein on 2/5/13.
//  Copyright (c) 2013 Andrew Braunstein. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AWBExpressionToken : NSObject

enum tokType {PLUS,
      MINUS,
      MULT,
      DIV,
      SQRT,
      LPAREN,
      RPAREN,
      PI,
      E,
      VAL};

@property enum tokType * type;
@property NSNumber * val;

@end
