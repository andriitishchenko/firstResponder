//
//  ViewController.h
//  testFirstResponder
//
//  Created by Andrii Tiischenko on 11/11/16.
//  Copyright © 2016 Andrii Tiischenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSViewHack.h"
#import "NSViewTester.h"

@interface ViewController : NSViewController

    @property (weak) IBOutlet NSView *testView;
    @property (weak) IBOutlet NSViewHack *testHacked;
    @property (weak) IBOutlet NSViewTester *testHackedTester;

@end

