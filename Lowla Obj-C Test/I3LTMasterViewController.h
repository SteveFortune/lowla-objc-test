//
//  I3LTMasterViewController.h
//  Lowla Obj-C Test
//
//  Created by Stephen Fortune on 24/09/2014.
//  Copyright (c) 2014 IceCube Software Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LDBCollection.h>


@class I3LTDetailViewController;

@interface I3LTMasterViewController : UITableViewController

@property (strong, nonatomic) LDBCollection *todoCollection;

@property (strong, nonatomic) I3LTDetailViewController *detailViewController;

@end
