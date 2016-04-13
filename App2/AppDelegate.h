//
//  AppDelegate.h
//  App2
//
//  Created by Khiem T. Huynh on 4/10/16.
//  Copyright © 2016 Khiem Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICETutorialController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, ICETutorialControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ICETutorialController *viewController;

@end

