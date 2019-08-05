//
//  main.m
//  Snap
//
//  Created by 张俊涛 on 2019/8/2.
//  Copyright © 2019 张俊涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        @try {
            return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));

        } @catch (NSException *exception) {
            NSLog(@"%@", exception);
        } @finally {
            
        }
    }
}
