//
//  AppDelegate.m
//  RSSchool_T8
//
//  Created by Dear Friend on 17.07.2021.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *rootVC = storyboard.instantiateInitialViewController;
    [window setRootViewController:rootVC];
    self.window = window;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
