//
//  PAViewController.h
//  PhotoAlbum
//
//  Created by Kamil Szwaba on 10.06.2014.
//  Copyright (c) 2014 Kamil Szwaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PAViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)loginButtonTapped:(id)sender;

@end
