//
//  NSViewTester.m
//  testFirstResponder
//
//  Created by Andrii Tiischenko on 11/11/16.
//  Copyright © 2016 Andrii Tiischenko. All rights reserved.
//

#import "NSViewTester.h"

@implementation NSViewTester

- (void)drawRect:(NSRect)dirtyRect {
    [[NSColor blueColor] setFill];
    NSRectFill(dirtyRect);
    [super drawRect:dirtyRect];
}

- (NSView *)hitTest:(NSPoint)aPoint{
    NSLog(@"hitTest NSViewTester");
    return [super hitTest:aPoint];
}

//- (BOOL)acceptsFirstResponder {
//    NSLog(@"acceptsFirstResponder");
//    return NO;
//}
//
//- (BOOL)becomeFirstResponder {
//    NSLog(@"becomeFirstResponder");
//    return NO;
//}
//
//- (BOOL)resignFirstResponder {
//    NSLog(@"resignFirstResponder");
//    return YES;
//}

- (void)mouseDown:(NSEvent *)theEvent {
    
    NSLog(@"mouseDown NSViewTester");
    // determine if I handle theEvent
    // if not...
    //[[self nextResponder] mouseDown:theEvent];
}

@end
