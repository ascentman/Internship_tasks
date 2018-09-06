//
//  ViewController.m
//  Threads_GCD_2
//
//  Created by Vova on 8/31/18.
//  Copyright © 2018 Vova. All rights reserved.
//

/**
 
                                   GCD QUEUES

 +-------------------------+--------------------------------------------------------------------+
 | TYPE                    | GENERAL                                                            |
 |-------------------------+--------------------------------------------------------------------+
 | GCDTypeMainQueue        | all tasks execute on main thread only                              |
 |                         | serial FIFO queue                                                  |
 |                         | + good for small sequent tasks (always for update UI)              |
 |                         | - for huge tasks                                                   |
 +-------------------------+--------------------------------------------------------------------+
 |                         | execute tasks concurrently with FIFO order on different threads.   |
 | GCDTypeGlobalHigh       | number of taks depends of system                                   |
 | GCDTypeGlobalDefault    | + good to execute huge tasks on background                         |
 | GCDTypeGlobalLow        | - increasingly high consumption of system resources for huge tasks |
 | GCDTypeGlobalBackground | - not for UI updates                                               |
 |                         | - finish in any order                                              |
 +-------------------------+--------------------------------------------------------------------+
 | GCDTypeCustomQueue      | user can create serial or concurrent queue                         |
 |                         | requests finish in one of the global queue                         |
 +-------------------------+--------------------------------------------------------------------+
 | GCDTypeSerialQueue      | only 1 task runs at any time                                       |
 |                         | + thread safe                                                      |
 |                         | - slow execution                                                   |
 +-------------------------+--------------------------------------------------------------------+
 | GCDTypeConcurentQueue   | allow multiple tasks run at the same time                          |
 |                         | FIFO order                                                         |
 |                         | + good to execute huge tasks on background                         |
 |                         | - tasks finishes in any order                                      |
 |                         | - not thread safe (as a result semaphores, mutexes needed)         |
 +-------------------------+--------------------------------------------------------------------+
 
 */


#import "MainViewController.h"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.processIndicator.hidesWhenStopped = true;
    self.imagesArray = [[NSArray alloc] initWithObjects:@"image", @"image2", @"image3", nil];
}

- (IBAction)buttonClicked:(id)sender {
    
    [self.processIndicator startAnimating];
    
    // UNCOMMENT PROPER FUNCTION TO TEST SPECIFIC QUEUE
    
    [self onMainThread];
//    [self globalHigh];
//    [self globalDefault];
//    [self globalLow];
//    [self globalBackground];
//    [self serialQueueMethod];
//    [self concurrentQueueMethod];
//    [self customQueueMethod];
}

- (void) onMainThread {

    dispatch_queue_t main = dispatch_get_main_queue();

    dispatch_async(main, ^{
        [self generateNumbers];
    });

    dispatch_async(main, ^{
        [self showImage];
    });
}


- (void) globalHigh {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self generateNumbers];
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showImage];
    });
}

- (void) globalDefault {

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self generateNumbers];
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self showImage];
    });
}

- (void) globalLow {

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [self generateNumbers];
    });

    dispatch_async(dispatch_get_main_queue(), ^{
        [self showImage];
    });
}

- (void) globalBackground {

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        // on background
        [self generateNumbers];
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // update UI on main
        [self showImage];
    });
}

- (void) serialQueueMethod {

    dispatch_queue_t serialQueue = dispatch_queue_create("com.vovan.tutorial.serialQueue", DISPATCH_QUEUE_SERIAL);

    dispatch_async(serialQueue, ^{
        [self generateNumbers];
    });

    dispatch_async(serialQueue, ^{
        [self showImage];
    });
}

- (void) concurrentQueueMethod {

    dispatch_queue_t cuncurrentQueue = dispatch_queue_create("com.vovan.tutorial.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(cuncurrentQueue, ^{
        [self generateNumbers];
    });

    dispatch_async(cuncurrentQueue, ^{
        [self showImage];
    });
}

- (void) customQueueMethod {

    dispatch_queue_t customQueue = dispatch_queue_create("com.vovan.tutorial.customQueue", NULL);

    dispatch_async(customQueue, ^{
        [self generateNumbers];
    });

    dispatch_async(customQueue, ^{
        [self showImage];
    });
}

- (IBAction)showImageConcurrentlyClicked:(id)sender {
    
    dispatch_queue_t cuncurrentQueue = dispatch_queue_create("com.vovan.tutorial.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(cuncurrentQueue, ^{
        NSLog(@"1");
        dispatch_async(dispatch_get_main_queue(), ^{
        self.PresentingImageView.image = [UIImage imageNamed:[self.imagesArray objectAtIndex:0]];
        });
    });
    
    dispatch_async(cuncurrentQueue, ^{
        NSLog(@"2");
        dispatch_async(dispatch_get_main_queue(), ^{
            self.PresentingImageView.image = [UIImage imageNamed:[self.imagesArray objectAtIndex:1]];
        });
    });
    
    dispatch_async(cuncurrentQueue, ^{
        NSLog(@"3");
        dispatch_async(dispatch_get_main_queue(), ^{
            self.PresentingImageView.image = [UIImage imageNamed:[self.imagesArray objectAtIndex:2]];
        });
    });
}


- (void) showImage {
    
    NSUInteger count = [self.imagesArray count];
    static NSUInteger index = 0;
    NSLog(@"START: ADDING IMAGE!");
    self.PresentingImageView.image = [UIImage imageNamed:[self.imagesArray objectAtIndex:index % count]];
    NSLog(@"FINISHED: IMAGE ADDED!");
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.processIndicator stopAnimating];
    });
    
    index += 1;
}

- (NSArray *) generateNumbers {
    
    @autoreleasepool {
        NSLog(@"START: SORTING ARRAY!");
        
        NSMutableArray *arrayWithNumbers = [[NSMutableArray alloc] initWithCapacity:10000];
        for (int i=0; i < 10000; i++) {
            [arrayWithNumbers addObject:[NSNumber numberWithInteger:i]];
        }
        
        long count = arrayWithNumbers.count;
        int i;
        bool swapped = true;
        while (swapped) {
            swapped = false;
            for (i=1; i<count; i++) {
                if ([arrayWithNumbers objectAtIndex:(i-1)] < [arrayWithNumbers objectAtIndex:i]) {
                    [arrayWithNumbers exchangeObjectAtIndex:(i-1) withObjectAtIndex:i];
                    swapped = true;
                }
            }
        }
        NSLog(@"FINISH: SORTING ARRAY!");
        return arrayWithNumbers;
    }
}

@end
