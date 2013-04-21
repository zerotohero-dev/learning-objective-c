//
//  O2JSViewController.h
//  Recipes
//
//  Created by Volkan Ozcelik on 4/20/13.
//  Copyright (c) 2013 Volkan Ozcelik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "O2JSRecipe.h"

@interface O2JSViewController : UIViewController

/*
 * Views
 */
@property(nonatomic, strong) IBOutlet UILabel     *recipeTitle;
@property(nonatomic, strong) IBOutlet UITextView  *directionsView;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;

/*
 * Models
 */
@property(nonatomic, strong) O2JSRecipe *recipe;

@end
