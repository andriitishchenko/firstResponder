//
//  NSViewHack.m
//  testFirstResponder
//
//  Created by Andrii Tiischenko on 11/11/16.
//  Copyright © 2016 Andrii Tiischenko. All rights reserved.
//

#import "NSViewHack.h"

@implementation NSViewHack

- (void)drawRect:(NSRect)dirtyRect {
    [[NSColor redColor] setFill];
    NSRectFill(dirtyRect);
    [super drawRect:dirtyRect];
}

- (BOOL)acceptsFirstResponder {
    NSLog(@"acceptsFirstResponder");
    return NO;
}

- (BOOL)becomeFirstResponder {
    NSLog(@"becomeFirstResponder");
    return NO;
}

- (BOOL)resignFirstResponder {
    NSLog(@"resignFirstResponder");
    return YES;
}

- (void)mouseDown:(NSEvent *)theEvent {
    
    NSLog(@"mouseDown");
    // determine if I handle theEvent
    // if not...
    //[[self nextResponder] mouseDown:theEvent];
}

- (NSView *)hitTest:(NSPoint)aPoint{
    NSLog(@"hitTest NSViewHack");
    return [super hitTest:aPoint];
}


//- (void)mouseDown:(NSEvent *)theEvent {
//    // determine if I handle theEvent
//    // if not...
//    [super mouseDown:theEvent];
//}


//- (BOOL)becomeFirstResponder {
//    BOOL okToChange = [super becomeFirstResponder];
//    if (okToChange) [self setKeyboardFocusRingNeedsDisplayInRect: [self bounds]];
//    return okToChange;
//}
//
//- (BOOL)resignFirstResponder {
//    BOOL okToChange = [super resignFirstResponder];
//    if (okToChange) [self setKeyboardFocusRingNeedsDisplayInRect: [self bounds]];
//    return okToChange;
//}


@end
