//
//  PAViewController.m
//  PhotoAlbum
//
//  Created by Kamil Szwaba on 10.06.2014.
//  Copyright (c) 2014 Kamil Szwaba. All rights reserved.
//

#import "PAViewController.h"
#import <Heatmaps/Heatmaps.h>
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"

@interface PAViewController ()

@end

@implementation PAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [Heatmaps track:self.view withKey:@"5a0a2a984d9a014a-6bf047c2"];
    
    // May return nil if a tracker has not already been initialized with a
    // property ID.
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    // This screen name value will remain set on the tracker and sent with
    // hits until it is set to a new value or to nil.
    [tracker set:kGAIScreenName
           value:@"Home Screen"];
    
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [Heatmaps stopTrackingElementWithKey:@"5a0a2a984d9a014a-6bf047c2"];
}

- (IBAction)loginButtonTapped:(id)sender {
    // May return nil if a tracker has not already been initialized with a property
    // ID.
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                          action:@"button_press"  // Event action (required)
                                                           label:@"login"          // Event label
                                                           value:nil] build]];    // Event value
}
@end
