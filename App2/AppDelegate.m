//
//  AppDelegate.m
//  App2
//
//  Created by Khiem T. Huynh on 4/10/16.
//  Copyright © 2016 Khiem Huynh. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ICETutorialPage *layer1 = [[ICETutorialPage alloc] initWithTitle:@"Theodore Roosevelt"
                                                            subTitle:@"Trong lịch sử nhân loại, chẳng ai buồn nhớ tên những người đã từng trải qua một cuộc đời nhạt nhẽo"
                                                         pictureName:@"dragon.png"
                                                            duration:3.0];
    ICETutorialPage *layer2 = [[ICETutorialPage alloc] initWithTitle:@"Oscar Wilde"
                                                            subTitle:@"Thượng đế chọn cách trừng phạt chúng ta đơn giản là vì đó là cách Người đáp lại những lời thỉnh cầu"
                                                         pictureName:@"dragon2.png"
                                                            duration:3.0];
    ICETutorialPage *layer3 = [[ICETutorialPage alloc] initWithTitle:@"Abraham Lincoln"
                                                            subTitle:@"Giữ nguyên tình trạng hiện nay của tôi là điều không thể, tôi phải chết hoặc trở nên tốt hơn"
                                                         pictureName:@"dragon1.png"
                                                            duration:3.0];
    ICETutorialPage *layer4 = [[ICETutorialPage alloc] initWithTitle:@"Steve Jobs"
                                                            subTitle:@"Hãy khát khao, dám dại khờ! Nếu bạn sống như thể mỗi ngày là ngày cuối cùng của bạn, hãy làm mọi điều mình cho là đúng và cần làm"
                                                         pictureName:@"dragon3.png"
                                                            duration:3.0];
    
    NSArray *tutorialLayers = @[layer1,layer2,layer3,layer4];
    
    // Set the common style for the title.
    ICETutorialLabelStyle *titleStyle = [[ICETutorialLabelStyle alloc] init];
    [titleStyle setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17.0f]];
    [titleStyle setTextColor:[UIColor whiteColor]];
    [titleStyle setLinesNumber:1];
    [titleStyle setOffset:180];
    [[ICETutorialStyle sharedInstance] setTitleStyle:titleStyle];
    
    // Set the subTitles style with few properties and let the others by default.
    [[ICETutorialStyle sharedInstance] setSubTitleColor:[UIColor whiteColor]];
    [[ICETutorialStyle sharedInstance] setSubTitleOffset:150];
    
    // Init tutorial.
    self.viewController = [[ICETutorialController alloc] initWithPages:tutorialLayers
                                                              delegate:self];
    
    // Run it.
    [self.viewController startScrolling];
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void) tutorialController:(ICETutorialController *)tutorialController scrollingFromPageIndex:(NSUInteger)fromIndex toPageIndex:(NSUInteger)toIndex {
    
}

- (void) tutorialControllerDidReachLastPage:(ICETutorialController *)tutorialController {
    
}

- (void) tutorialController:(ICETutorialController *)tutorialController didClickOnLeftButton:(UIButton *)sender {
    NSLog(@" SKIP pressed");
}





- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
