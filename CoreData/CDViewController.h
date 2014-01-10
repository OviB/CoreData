//
//  CDViewController.h
//  CoreData
//
//  Created by Ovi Bortas on 12/29/13.
//  Copyright (c) 2013 Ovi Bortas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDAppDelegate.h"

@interface CDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UILabel *status;

- (IBAction)saveData:(id)sender;
- (IBAction)findContact:(id)sender;
@end
