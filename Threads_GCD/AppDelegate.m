//
//  AppDelegate.m
//  Threads_GCD
//
//  Created by Vova on 8/31/18.
//  Copyright © 2018 Vova. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"START!");
    // UNCOMMENT FOR SPECIFIC TASK:
    
//    [self syncWithAsyncQueue];
//    [self concurrentThreads];
    [self onMainThread];
//    [self onMainThreadWithDelay];
//    [self serialQueueMethod];
//    [self concurrentQueueMethod];

    return YES;
}

- (NSArray *) generateNumbers {
    
    @autoreleasepool {
        
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
        return arrayWithNumbers;
    }
}

- (void) syncWithAsyncQueue{
    
    double startTime = CACurrentMediaTime();
    
    dispatch_queue_t taskQueue = dispatch_queue_create("com.vovan.tutorial.queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(taskQueue, ^{
        NSLog(@"async: started");
        [self generateNumbers];
        NSLog(@"async: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
    dispatch_sync(taskQueue, ^{
        NSLog(@"sync: started");
        [self generateNumbers];
         NSLog(@"sync: finished in: %f", CACurrentMediaTime()-startTime);
    });
}

- (void) concurrentThreads {
    
    double startTime = CACurrentMediaTime();
    
    dispatch_queue_t queueHighPriority = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t queueDefaultPriority = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t queueLowPriority = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_queue_t queueBackgroundPriority = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);

    dispatch_async(queueLowPriority, ^{
        NSLog(@"queueLowPriority: started");
        [self generateNumbers];
        NSLog(@"queueLowPriority: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
    dispatch_async(queueBackgroundPriority, ^{
        NSLog(@"queueBackgroundPriority: started");
        [self generateNumbers];
        NSLog(@"queueBackgroundPriority: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
    dispatch_async(queueHighPriority, ^{
        NSLog(@"queueHighPriority: started");
        [self generateNumbers];
        NSLog(@"queueHighPriority: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
    dispatch_async(queueDefaultPriority, ^{
        NSLog(@"queueDefaultPriority: started");
        [self generateNumbers];
        NSLog(@"queueDefaultPriority: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
}

- (void) onMainThread {
    
    double startTime = CACurrentMediaTime();
    
    dispatch_queue_t main = dispatch_get_main_queue();
    
    dispatch_async(main, ^{
        NSLog(@"onMainThread: started");
        [self generateNumbers];
        NSLog(@"onMainThread: finished in: %f", CACurrentMediaTime()-startTime);
    });
}

- (void) onMainThreadWithDelay {
    
    double startTime = CACurrentMediaTime();
    
    dispatch_queue_t main = dispatch_get_main_queue();
    
    int64_t delay = 5.0;
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    
    dispatch_after(time, main, ^{
        NSLog(@"onMainThreadWithDelay: started");
        [self generateNumbers];
        NSLog(@"onMainThreadWithDelay: finished in: %f", CACurrentMediaTime()-startTime);
    });
}


- (void) serialQueueMethod {
    
    double startTime = CACurrentMediaTime();
    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.vovan.tutorial.serialQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(serialQueue, ^{
        NSLog(@"first block: started");
        [self generateNumbers];
        NSLog(@"first block: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"second block: started");
        [self generateNumbers];
        NSLog(@"second block: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"third block: started");
        [self generateNumbers];
        NSLog(@"third block: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"fourth block: started");
        [self generateNumbers];
        NSLog(@"fourth block: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"fifth block: started");
        [self generateNumbers];
        NSLog(@"fifth block: finished in: %f", CACurrentMediaTime()-startTime);
    });
}


- (void) concurrentQueueMethod {
    
    double startTime = CACurrentMediaTime();
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.vovan.tutorial.serialQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"first block: started");
        [self generateNumbers];
        NSLog(@"first block: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"second block: started");
        [self generateNumbers];
        NSLog(@"second block: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"third block: started");
        [self generateNumbers];
        NSLog(@"third block: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"fourth block: started");
        [self generateNumbers];
        NSLog(@"fourth block: finished in: %f", CACurrentMediaTime()-startTime);
    });
    
    dispatch_async(concurrentQueue, ^{
        NSLog(@"fifth block: started");
        [self generateNumbers];
        NSLog(@"fifth block: finished in: %f", CACurrentMediaTime()-startTime);
    });
}

@end
