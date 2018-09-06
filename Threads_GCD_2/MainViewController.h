//
//  ViewController.h
//  Threads_GCD_2
//
//  Created by Vova on 8/31/18.
//  Copyright © 2018 Vova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *PresentingImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *processIndicator;
@property (strong, nonatomic) NSArray *imagesArray;
- (IBAction)buttonClicked:(id)sender;
- (IBAction)showImageConcurrentlyClicked:(id)sender;

@end

