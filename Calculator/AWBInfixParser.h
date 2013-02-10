//
//  AWBInfixParser.h
//  Calculator
//
//  Created by Andrew Braunstein on 2/5/13.
//  Copyright (c) 2013 Andrew Braunstein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWBExpressionToken.h"
#import "AWBTokenList.h"


@interface AWBInfixParser : NSObject

+ (NSString*) parseExpression:(AWBTokenList*)tokens;
+ (AWBTokenList*) shuntingYard:(AWBTokenList*)tokens;
+ (AWBTokenList*) insertImplicitMultiplication:(AWBTokenList*)tokens;
+ (NSString*) evaluateRPN:(AWBTokenList*)tokens;

@end
