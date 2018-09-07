//
//  ViewController.h
//  CalcMemoryManagement
//
//  Created by Vova on 9/6/18.
//  Copyright © 2018 Vova. All rights reserved.
//

// My comments for future: MMR - Manual Retain-Release
// Build -> Build Setting -> Objective-C Automatic Reference count : NO
// Check for memory issues: Shift + Ctrl + B

#import <UIKit/UIKit.h>

@interface CalcViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *displayLabel;
@property (nonatomic) BOOL isNumber;
@property (nonatomic) int firstNumber;
@property (nonatomic) int secondNumber;
@property (nonatomic, copy) NSString *operation;

- (IBAction)numberPressed:(UIButton *)sender;
- (IBAction)actionPressed:(id)sender;
- (IBAction)equalPressed:(id)sender;
- (IBAction)clearPressed:(id)sender;

- (void)dealloc;

@end

