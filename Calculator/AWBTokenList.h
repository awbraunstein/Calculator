//
//  AWBTokenList.h
//  Calculator
//
//  Created by Andrew Braunstein on 2/10/13.
//  Copyright (c) 2013 Andrew Braunstein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBExpressionToken.h"

@interface AWBTokenList : NSObject 

@property NSMutableArray * toks;

- (id) init;

- (void) pushFront:(AWBExpressionToken*)token;
- (void) pushBack:(AWBExpressionToken*)token;

- (AWBExpressionToken*) peekFront;
- (AWBExpressionToken*) peekBack;

- (AWBExpressionToken*) popFront;
- (AWBExpressionToken*) popBack;

- (BOOL) isEmpty;

- (NSUInteger) count;

- (void) removeAllObjects;

@end
