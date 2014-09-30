//
//  I3LTAppDelegate.h
//  Lowla Obj-C Test
//
//  Created by Stephen Fortune on 24/09/2014.
//  Copyright (c) 2014 IceCube Software Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LDBClient.h>
#import <LDBDb.h>


@interface I3LTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LDBClient *client;

@end
