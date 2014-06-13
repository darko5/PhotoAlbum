//
//  PASettingsViewController.h
//  PhotoAlbum
//
//  Created by Kamil Szwaba on 12.06.2014.
//  Copyright (c) 2014 Kamil Szwaba. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PASettingsViewControllerDelegate.h"

@interface PASettingsViewController : UIViewController

@property (weak) id<PASettingsViewControllerDelegate> delegate;

- (IBAction)backButtonTapped:(id)sender;

@end
