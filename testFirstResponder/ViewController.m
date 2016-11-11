//
//  ViewController.m
//  testFirstResponder
//
//  Created by Andrii Tiischenko on 11/11/16.
//  Copyright © 2016 Andrii Tiischenko. All rights reserved.
//

#import "ViewController.h"
#import "NSView+UserIteraction.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.testView setWantsLayer:YES];
    [self.testView.layer setBackgroundColor:[[NSColor greenColor] CGColor]];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(IBAction)Click:(id)sender{
    NSLog(@"Click");
    [self.testHacked setUserInteractionDisabled:NO];
}

-(IBAction)Click2:(id)sender{
    NSLog(@"Click in HACKED");
    [self.testHacked setUserInteractionDisabled:YES];
}

@end
