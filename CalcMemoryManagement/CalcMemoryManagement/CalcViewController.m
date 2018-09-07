//
//  ViewController.m
//  CalcMemoryManagement
//
//  Created by Vova on 9/6/18.
//  Copyright © 2018 Vova. All rights reserved.
//

#import "CalcViewController.h"

@implementation CalcViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)numberPressed:(UIButton *)sender {
    
    NSString *number = [[NSString alloc] initWithString:sender.currentTitle];
    if (self.isNumber) {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:number];
    } else {
        self.displayLabel.text = number;
        self.isNumber = true;
    }
    
    [number release];
}


- (IBAction)actionPressed:(id)sender {
    
    self.isNumber = false;
    self.firstNumber = [self.displayLabel.text intValue];
    self.operation = [sender currentTitle];
}

- (IBAction)equalPressed:(id)sender {
    
    self.isNumber = false;
    self.secondNumber = [self.displayLabel.text intValue];
    
    int result = 0;
    BOOL noError = true;
    
    if ([self.operation isEqualToString:@"+"]) {
        result = self.firstNumber + self.secondNumber;
    }
    else if ([self.operation isEqualToString:@"-"]) {
        result = self.firstNumber - self.secondNumber;
    }
    else if ([self.operation isEqualToString:@"*"]) {
        result = self.firstNumber * self.secondNumber;
    }
    else if ([self.operation isEqualToString:@"/"]) {
        if (self.secondNumber != 0) {
            result = self.firstNumber / self.secondNumber;
        } else {
            self.displayLabel.text = [NSString stringWithFormat:@"ERROR"];
            noError = false;
        }
    }
    
    if (noError) {
        self.displayLabel.text = [NSString stringWithFormat:@"%d", result];
    }
}

- (IBAction)clearPressed:(id)sender {
    
    self.firstNumber = 0;
    self.secondNumber = 0;
    self.displayLabel.text = @" ";
    self.isNumber = true;
}

- (void)dealloc
{
    [_operation release];
    [_displayLabel release];
    [super dealloc];
}

@end
