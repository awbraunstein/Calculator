//
//  AWBInfixParser.m
//  Calculator
//
//  Created by Andrew Braunstein on 2/5/13.
//  Copyright (c) 2013 Andrew Braunstein. All rights reserved.
//

#import "AWBInfixParser.h"

@implementation AWBInfixParser

+ (NSString*) parseExpression:(AWBTokenList*)tokens {
  if ([tokens isEmpty]) {
    return @"";
  }
  return [self evaluateRPN:[self shuntingYard:[self insertImplicitMultiplication:tokens]]];
}

+ (AWBTokenList*) insertImplicitMultiplication:(AWBTokenList*)tokens {
  AWBTokenList *outQ = [[AWBTokenList alloc] init];
  
  AWBExpressionToken * lastToken = [tokens popFront];
  [outQ pushBack:lastToken];
  while (![tokens isEmpty]) {
    AWBExpressionToken *tok = [tokens popFront];
    if (([lastToken isValue] && ([tok isValue] || tok.type == LPAREN))|| (
        lastToken.type == RPAREN && [tok isValue])) {
      AWBExpressionToken *multTok = [[AWBExpressionToken alloc] init];
      multTok.type = MULT;
      [outQ pushBack:multTok];
    }
    lastToken = tok;
    [outQ pushBack:tok];
  }
  return outQ;
}

+ (AWBTokenList*) shuntingYard:(AWBTokenList*)tokens {
  
  AWBTokenList *outQ = [[AWBTokenList alloc] init];
  AWBTokenList *stack = [[AWBTokenList alloc] init];
  
  while (![tokens isEmpty]) {
    // Read a token
    AWBExpressionToken *tok = [tokens popFront];
    
    if ([tok isValue]) {
      [outQ pushBack:tok];
    } else if ([tok isOperator]) {
      while (![stack isEmpty]) {
        AWBExpressionToken *op2 = [stack peekBack];
        
        if ([tok opPrecedence] <= [op2 opPrecedence]) {
          [stack popBack];
          [outQ pushBack:op2];
        }
        else {
          break;
        }
      }
      [stack pushBack:tok];
    } else if (tok.type == LPAREN) {
      [stack pushBack:tok];
    } else if (tok.type == RPAREN) {
      
      BOOL rp = NO;
      
      while (![stack isEmpty]) {
        AWBExpressionToken * t = [stack popBack];
      
        if (t.type == LPAREN) {
          rp = YES;
          break;
        } else {
          [outQ pushBack:t];
        }
      }
      
      if (!rp) {
        NSLog(@"Error: Mismatched parentheses");
        AWBExpressionToken * et = [[AWBExpressionToken alloc] initWithError:@"Error: Mismatched parentheses"];
        [outQ pushFront:et];
        return outQ;
      }
      
    } else {
      NSLog(@"Error: Unknown token type");
      AWBExpressionToken * et = [[AWBExpressionToken alloc] initWithError:@"Error: Unknown token type"];
      [outQ pushFront:et];
      return outQ;
    }
  }
  
  while (![stack isEmpty]) {
    AWBExpressionToken * t = [stack popBack];
    if (t.type == LPAREN || t.type == RPAREN) {
      NSLog(@"Error: Mismatched parentheses");
      AWBExpressionToken * et = [[AWBExpressionToken alloc] initWithError:@"Error: Mismatched parentheses"];
      [outQ pushFront:et];
      return outQ;
    }
    [outQ pushBack:t];
  }
  
  return outQ;

}


+ (NSString*) evaluateRPN:(AWBTokenList*)tokens {
  
  // Check for an error token
  if (![tokens isEmpty]) {
    AWBExpressionToken *t = [tokens peekFront];
    if (t.type == ERROR) {
      return t.error;
    }
  }
  
  AWBTokenList *stack = [[AWBTokenList alloc] init];
  
  while (![tokens isEmpty]) {
    AWBExpressionToken * tok = [tokens popFront];
    
    if ([tok isValue]) {
      [stack pushBack:tok];
    } else if([tok isOperator]) {
      if ([stack count] < 2) {
        NSLog(@"Error: Incorrect number of arguments to this operator.");
        return @"Error: Incorrect number of arguments to this operator.";
      }
      AWBExpressionToken * left = [stack popBack];
      AWBExpressionToken * right = [stack popBack];
      
      NSNumber * result;
      
      switch (tok.type) {
        case MINUS:
          result = [NSNumber numberWithDouble:[right.val doubleValue] - [left.val doubleValue]];
          break;
        case PLUS:
          result = [NSNumber numberWithDouble:[right.val doubleValue] + [left.val doubleValue]];
          break;
        case MULT:
          result = [NSNumber numberWithDouble:[right.val doubleValue] * [left.val doubleValue]];
          break;
        case DIV:
          result = [NSNumber numberWithDouble:[right.val doubleValue] / [left.val doubleValue]];
          break;
        case POW:
          result = [NSNumber numberWithDouble:pow([right.val doubleValue],[left.val doubleValue])];
          break;
        default:
          NSLog(@"Error: Unknown operand");
          return @"Error: Unknown operand";
      }
      
      AWBExpressionToken * newTok = [[AWBExpressionToken alloc] init];
      
      newTok.type = VAL;
      newTok.val = result;
      
      [stack pushBack:newTok];
  
    } else {
      NSLog(@"Error: Unkown operator");
      return @"Error: Unkown operator";
    }
    
  }
  
  if ([stack count] == 1){
    AWBExpressionToken * ans = [stack popFront];
    return [ans.val stringValue];
  } else {
    NSLog(@"Error: %d values left on the stack", [stack count]);
    return @"Error: Values left on the stack";
  }
  
}


@end
