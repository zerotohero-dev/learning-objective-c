/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>

@interface O2JSRecipe : NSObject

@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *directions;
@property (nonatomic, strong) UIImage  *image;
@property (nonatomic, strong) NSNumber *preparationTime;

@end
