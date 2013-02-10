//
//  AWBTokenList.m
//  Calculator
//
//  Created by Andrew Braunstein on 2/10/13.
//  Copyright (c) 2013 Andrew Braunstein. All rights reserved.
//

#import "AWBTokenList.h"

@implementation AWBTokenList

- (id) init {
  self = [super init];
  if (self != nil) {
    self.toks = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void) pushFront:(AWBExpressionToken*)token {
  [self.toks insertObject:token atIndex:0];
}
- (void) pushBack:(AWBExpressionToken*)token {
  [self.toks addObject:token];
}

- (AWBExpressionToken*) peekFront {
  if ([self isEmpty]) {
    return nil;
  }
  return [self.toks objectAtIndex:0];
}
- (AWBExpressionToken*) peekBack {
  if ([self isEmpty]) {
    return nil;
  }
  return [self.toks objectAtIndex:[self.toks count] - 1];
}

- (AWBExpressionToken*) popFront {
  if ([self isEmpty]) {
    return nil;
  }
  AWBExpressionToken * tok = [self.toks objectAtIndex:0];
  [self.toks removeObjectAtIndex:0];
  return tok;
}
- (AWBExpressionToken*) popBack {
  if ([self isEmpty]) {
    return nil;
  }
  AWBExpressionToken * tok = [self.toks objectAtIndex:[self.toks count] - 1];
  [self.toks removeObjectAtIndex:[self.toks count] - 1];
  return tok;
}

- (BOOL) isEmpty {
  if ([self.toks count] > 0) {
    return NO;
  }
  return YES;
}

- (NSUInteger) count {
  return [self.toks count];
}

- (void) removeAllObjects {
  [self.toks removeAllObjects];
}

@end
