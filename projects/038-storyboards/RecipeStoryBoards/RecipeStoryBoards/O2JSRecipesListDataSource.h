/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Foundation/Foundation.h>
#import "O2JSRecipe.h"

@protocol O2JSRecipesListDataSource <NSObject>
- (NSInteger)   recipeCount;
- (O2JSRecipe*) recipeAtIndex:(NSInteger)index;
- (void)        deleteRecipeAtIndex:(NSInteger)index;
- (O2JSRecipe *)createNewRecipe;
@end
