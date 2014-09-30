//
//  I3LTMasterViewController.m
//  Lowla Obj-C Test
//
//  Created by Stephen Fortune on 24/09/2014.
//  Copyright (c) 2014 IceCube Software Ltd. All rights reserved.
//

#import "I3LTMasterViewController.h"
#import "I3LTDetailViewController.h"
#import <LDBObjectBuilder.h>
#import <LDBCursor.h>


@interface I3LTMasterViewController (){


}
@end


@implementation I3LTMasterViewController

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (I3LTDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

-(void) didReceiveMemoryWarning{
    
    [super didReceiveMemoryWarning];

}

-(void) insertNewObject:(id)sender{
    
    LDBObjectBuilder *contactBuilder = [[LDBObjectBuilder builder] appendString:@"steve.fortune@icecb.com" forField:@"email"];
    [contactBuilder appendString:@"Steve" forField:@"first_name"];
    [contactBuilder appendString:@"Fortune" forField:@"last_name"];
    
    LDBObject *contact = [contactBuilder finish];
    
    LDBObjectBuilder *todoBuilder = [[LDBObjectBuilder builder] appendString:@"New TODO" forField:@"title"];
    [todoBuilder appendString:@"Make some toast" forField:@"body"];
    [todoBuilder appendObject:contact forField:@"contact"];
    
    LDBObject *todo = [todoBuilder finish];

    [self.todoCollection insert:todo];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section{

    return [[self.todoCollection find] ];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    /// @todo Populate
    return cell;
}

-(BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(editingStyle == UITableViewCellEditingStyleDelete){
        /// @todo Remove collection object
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if(editingStyle == UITableViewCellEditingStyleInsert){
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /// @todo Find the object in the collection and populate the detail controller with it
}

@end
