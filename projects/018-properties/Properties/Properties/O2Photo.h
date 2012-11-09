/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>

@interface O2Photo : NSObject {
//    NSString* name;
//    NSString* caption;
//    NSString* photographer;

    NSString* storedName;
}
+ (O2Photo*) photo;

//@property (retain) NSString* dynamicVariable;

@property (
    // retain, assign, copy
    retain,
    // atomic is "Thread Safe"
    // if you are not using Threads, you can specify
    // nonatomic for better performance
    // if you are using garbage-collection, there is no overhad
    // for using atomic properties; the performance cost is
    // only for non-garbage-collected environments.
    atomic,
    // readonly / readwrite
    readwrite,
    getter=getFirstName,
    setter=setFistName:
) NSString* name;

@property (retain) NSString* caption;
@property (retain) NSString* photographer;

@end
