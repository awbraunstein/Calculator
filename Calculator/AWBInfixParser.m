//
//  AWBInfixParser.m
//  Calculator
//
//  Created by Andrew Braunstein on 2/5/13.
//  Copyright (c) 2013 Andrew Braunstein. All rights reserved.
//

#import "AWBInfixParser.h"

@implementation AWBInfixParser

+ (NSString*) parseExpression:(NSMutableArray*)tokens {
  return [self evaluateRPN:[self shuntingYard:tokens]];
}

+ (NSMutableArray*) shuntingYard:(NSMutableArray*)tokens {
  
  NSMutableArray *outQ = [[NSMutableArray alloc] init];
  NSMutableArray *stack = [[NSMutableArray alloc] init];
  
  while ([tokens count] > 0) {
    // Read a token
    AWBExpressionToken *tok = [tokens objectAtIndex:0];
    [tokens removeObjectAtIndex:0];
    
    if ([tok isValue]) {
      [outQ addObject:tok];
    } else if ([tok isOperator]) {
      while ([stack count] > 0) {
        AWBExpressionToken *op2 = [stack objectAtIndex:[stack count] - 1];
        
        if ([tok opPrecedence] <= [op2 opPrecedence]) {
          [stack removeObjectAtIndex:[stack count] - 1];
          [outQ addObject:op2];
        }
        else {
          break;
        }
      }
      [stack addObject:tok];
    } else if (tok.type == LPAREN) {
      [stack addObject:tok];
    } else if (tok.type == RPAREN) {
      
      BOOL rp = NO;
      
      while ([stack count] > 0) {
        AWBExpressionToken * t = [stack objectAtIndex:[stack count] - 1];
        [stack removeObjectAtIndex:[stack count] - 1];
      
        if (t.type == LPAREN) {
          rp = YES;
          break;
        } else {
          [outQ addObject:t];
        }
      }
      
      if (!rp) {
        NSLog(@"Error: Mismatched parentheses");
        AWBExpressionToken * et = [[AWBExpressionToken alloc] initWithError:@"Error: Mismatched parentheses"];
        [outQ insertObject:et atIndex:0];
        return outQ;
      }
      
    } else {
      NSLog(@"Error: Unknown token type");
      AWBExpressionToken * et = [[AWBExpressionToken alloc] initWithError:@"Error: Unknown token type"];
      [outQ insertObject:et atIndex:0];
      return outQ;
    }
  }
  
  while ([stack count] > 0) {
    AWBExpressionToken * t = [stack objectAtIndex:[stack count] - 1];
    [stack removeObjectAtIndex:[stack count] - 1];
    if (t.type == LPAREN || t.type == RPAREN) {
      NSLog(@"Error: Mismatched parentheses");
      AWBExpressionToken * et = [[AWBExpressionToken alloc] initWithError:@"Error: Mismatched parentheses"];
      [outQ insertObject:et atIndex:0];
      return outQ;
    }
    [outQ addObject:t];
  }
  
  return outQ;

}


+ (NSString*) evaluateRPN:(NSMutableArray*)tokens {
  
  // Check for an error token
  if ([tokens count] > 0) {
    AWBExpressionToken *t = [tokens objectAtIndex:0];
    if (t.type == ERROR) {
      return t.error;
    }
  }
  
  NSMutableArray *stack = [[NSMutableArray alloc] init];
  
  while ([tokens count] > 0) {
    AWBExpressionToken * tok = [tokens objectAtIndex:0];
    [tokens removeObjectAtIndex:0];
    
    if ([tok isValue]) {
      [stack addObject:tok];
    } else if([tok isOperator]) {
      if ([stack count] < 2) {
        NSLog(@"Error: Incorrect number of arguments to this operator.");
        return @"Error: Incorrect number of arguments to this operator.";
      }
      AWBExpressionToken * left = [stack objectAtIndex:[stack count] - 1];
      [stack removeObjectAtIndex:[stack count] - 1];
      
      AWBExpressionToken * right = [stack objectAtIndex:[stack count] - 1];
      [stack removeObjectAtIndex:[stack count] - 1];
      
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
      
      [stack addObject:newTok];
  
    } else {
      NSLog(@"Error: Unkown operator");
      return @"Error: Unkown operator";
    }
    
  }
  
  if ([stack count] == 1){
    AWBExpressionToken * ans = [stack objectAtIndex:0];
    return [ans.val stringValue];
  } else {
    NSLog(@"Error: %d values left on the stack", [stack count]);
    return @"Error: Values left on the stack";
  }
  
}


@end
