//
//  AWBInfixParser.h
//  Calculator
//
//  Created by Andrew Braunstein on 2/5/13.
//  Copyright (c) 2013 Andrew Braunstein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBExpressionToken.h"


@interface AWBInfixParser : NSObject

+ (NSString*) parseExpression:(NSMutableArray*)tokens;
+ (NSMutableArray*) shuntingYard:(NSMutableArray*)tokens;
+ (NSNumber*) evaluateRPN:(NSMutableArray*)tokens;

@end
