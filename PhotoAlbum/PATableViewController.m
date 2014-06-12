//
//  PATableViewController.m
//  PhotoAlbum
//
//  Created by Kamil Szwaba on 10.06.2014.
//  Copyright (c) 2014 Kamil Szwaba. All rights reserved.
//

#import "PATableViewController.h"
#import "PADetailsViewController.h"
#import <Heatmaps/Heatmaps.h>
#import "GAI.h"
#import "GAIFields.h"
#import "GAIDictionaryBuilder.h"

@interface PATableViewController ()
{
    NSArray *_words;
}

@end

@implementation PATableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view. .
    _words = @[@"one", @"two", @"three", @"four", @"five"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [Heatmaps track:self.view withKey:@"5a0a2a984d9a014a-144ad2db"];
    
    // May return nil if a tracker has not already been initialized with a
    // property ID.
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    // This screen name value will remain set on the tracker and sent with
    // hits until it is set to a new value or to nil.
    [tracker set:kGAIScreenName
           value:@"Table Screen"];
    
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [Heatmaps stopTrackingElementWithKey:@"5a0a2a984d9a014a-144ad2db"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_words count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [_words objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PADetailsViewController *detailsViewController = segue.destinationViewController;
        NSString *imageName = [NSString stringWithFormat:@"%@.png", [_words objectAtIndex:indexPath.row]];
        detailsViewController.imageName = imageName;
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                              action:@"table_row_select"  // Event action (required)
                                                               label:[_words objectAtIndex:indexPath.row]   // Event label
                                                               value:[NSNumber numberWithInteger:indexPath.row]] build]];    // Event value
    }
}

@end
