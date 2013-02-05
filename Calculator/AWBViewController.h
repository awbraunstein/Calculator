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
- (IBAction)clear:(id)sender;
- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)evaluate:(UIButton *)sender;
- (IBAction)operatorPressed:(UIButton *)sender;

@end
