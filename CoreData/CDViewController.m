//
//  CDViewController.m
//  CoreData
//
//  Created by Ovi Bortas on 12/29/13.
//  Copyright (c) 2013 Ovi Bortas. All rights reserved.
//

#import "CDViewController.h"

@interface CDViewController ()

@end

@implementation CDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveData:(id)sender
{
    CDAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSManagedObject *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contacts"
                                                                inManagedObjectContext:context];
    [newContact setValue:self.name.text forKey:@"name"];
    [newContact setValue:self.address.text forKey:@"address"];
    [newContact setValue:self.phone.text forKey:@"phone"];
    
    self.name.text = @"";
    self.address.text = @"";
    self.phone.text = @"";
    
    NSError *error;
    [context save:&error];
    
    self.status.text = @"Contact Saved";
    
    [self.view endEditing:YES];
}

- (IBAction)findContact:(id)sender
{
    CDAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Contacts" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    request.entity = entityDesc;
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)", self.name.text];
    request.predicate = pred;
    NSManagedObject *matches = nil;
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if (objects.count == 0) {
        self.status.text = @"No Matches";
    } else {
        matches = objects[0];
        self.address.text = [matches valueForKey:@"address"];
        self.phone.text = [matches valueForKey:@"phone"];
        self.status.text = [NSString stringWithFormat:@"%lu matches found", (unsigned long)objects.count];
    }
}

@end











