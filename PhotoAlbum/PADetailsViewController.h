//
//  PADetailsViewController.h
//  PhotoAlbum
//
//  Created by Kamil Szwaba on 11.06.2014.
//  Copyright (c) 2014 Kamil Szwaba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PADetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (copy) NSString *imageName;

@end
