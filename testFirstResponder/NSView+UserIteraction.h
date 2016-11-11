//
//  NSView+UserIteraction.h
//  sources_for_indexing
//
//  Created by Andrii Tiischenko on 11/9/16.
//
//

#import <Cocoa/Cocoa.h>
//@brief category for disabling user interaction
@interface NSView (UserIteraction)

/*
 @brief recursively changes "Enable" property for all child controls.
 Override - (NSView *)hitTest:(NSPoint)aPoint return to nil.
 */
    - (void)setUserInteractionDisabled:(BOOL)status;
@end
