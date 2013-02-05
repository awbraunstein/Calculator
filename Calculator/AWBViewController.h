//
//  AWBViewController.h
//  Calculator
//
//  Created by Andrew Braunstein on 1/14/13.
//  Copyright (c) 2013 Andrew Braunstein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AWBViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *echoArea;
- (IBAction)openParen:(id)sender;
- (IBAction)closeParen:(id)sender;
- (IBAction)pi:(id)sender;
- (IBAction)euler:(id)sender;
- (IBAction)clear:(id)sender;
- (IBAction)sqrt:(id)sender;
- (IBAction)divide:(id)sender;
- (IBAction)times:(id)sender;
- (IBAction)minus:(id)sender;
- (IBAction)plus:(id)sender;
- (IBAction)equals:(id)sender;
- (IBAction)dot:(id)sender;
- (IBAction)zero:(id)sender;
- (IBAction)one:(id)sender;
- (IBAction)two:(id)sender;
- (IBAction)three:(id)sender;
- (IBAction)four:(id)sender;
- (IBAction)five:(id)sender;
- (IBAction)six:(id)sender;
- (IBAction)seven:(id)sender;
- (IBAction)eight:(id)sender;
- (IBAction)nine:(id)sender;


@end
