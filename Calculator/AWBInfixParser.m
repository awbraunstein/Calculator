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
  return [[self evaluateRPN:[self shuntingYard:tokens]] stringValue];
}

+ (NSMutableArray*) shuntingYard:(NSMutableArray*)tokens {
  
}

+ (NSNumber*) evaluateRPN:(NSMutableArray*)tokens {
  
}


@end
