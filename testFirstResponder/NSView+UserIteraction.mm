//
//  NSView+UserIteraction.m
//  sources_for_indexing
//
//  Created by Andrii Tiischenko on 11/9/16.
//
//

#import "NSView+UserIteraction.h"

#include <objc/runtime.h>
#include <objc/message.h>
#include <objc/objc.h>

@implementation NSView (UserIteraction)
static char UIB_PROPERTY_KEY;
static char UIB_IS_X_HITTEST_KEY;

- (void)setUserInteractionDisabled:(BOOL)status
{
    NSNumber*num = [NSNumber numberWithBool:status];
    objc_setAssociatedObject(self, &UIB_PROPERTY_KEY, num, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setEnabledStatus:!status];
    
    @synchronized(self){
        if(objc_getAssociatedObject(self, &UIB_IS_X_HITTEST_KEY) == nil){
            objc_setAssociatedObject(self, &UIB_IS_X_HITTEST_KEY, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            
            SEL originalSelector = @selector(hitTest:);
            SEL swizzledSelector = @selector(x_hitTest:);
            
            Method originalMethod = class_getInstanceMethod([self class], originalSelector);
            Method swizzledMethod = class_getInstanceMethod([self class], swizzledSelector);
            
            
            SEL originalRenamedSelector = @selector(hitTest_original:);
            class_replaceMethod([self class],
                                originalRenamedSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
            
            
            BOOL didAddMethod =
            class_addMethod([self class],
                            originalSelector,
                            method_getImplementation(swizzledMethod),
                            method_getTypeEncoding(swizzledMethod));
            
            if (didAddMethod) {
                class_replaceMethod([self class],
                                    swizzledSelector,
                                    method_getImplementation(originalMethod),
                                    method_getTypeEncoding(originalMethod));
            } else {
                
                method_exchangeImplementations(originalMethod, swizzledMethod);
            }
        }
    }
}
// Enable/disable child controls. mostly needs for visual effects.
- (void)setEnabledStatus:(BOOL)enabled
{
    NSView* view = NULL;
    NSEnumerator* viewEnumerator = [[self subviews] objectEnumerator];
    while( view = [viewEnumerator nextObject] )
    {
        if( [view respondsToSelector:@selector(setEnabled:)] )
        {
            [(NSControl*)view setEnabled:enabled];
        }
        [view setEnabledStatus:enabled];
        [view setNeedsDisplay:YES];
    }
}
// new implementation for runtime
- (NSView *)x_hitTest:(NSPoint)aPoint
{
    NSNumber*val = (NSNumber*)objc_getAssociatedObject(self, &UIB_PROPERTY_KEY);
    BOOL active = [val boolValue];
    if (active) // skip mouse
    {
        return nil;
    }
    return [self hitTest_original:aPoint];
}

// Helper. Will be reimplemented in runtime
- (NSView *)hitTest_original:(NSPoint)aPoint
{
    return nil;
}

@end
