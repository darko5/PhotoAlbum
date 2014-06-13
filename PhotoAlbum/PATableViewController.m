//
//  PATableViewController.m
//  PhotoAlbum
//
//  Created by Kamil Szwaba on 10.06.2014.
//  Copyright (c) 2014 Kamil Szwaba. All rights reserved.
//

#import "PATableViewController.h"
#import "PADetailsViewController.h"
#import "PASettingsViewController.h"

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
    } else if ([segue.identifier isEqualToString:@"SettingsSegue"]) {
        _settingsViewController = segue.destinationViewController;
        _settingsViewController.delegate = self;
    }
}

#pragma mark - PASettingsViewControllerDelefate

- (void)backButtonTapped
{
    [_settingsViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
