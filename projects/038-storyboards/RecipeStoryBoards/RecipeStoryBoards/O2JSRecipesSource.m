/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2JSRecipesSource.h"

// class extension.
@interface O2JSRecipesSource()
@property(nonatomic, strong) NSMutableArray* recipes;
@end

@implementation O2JSRecipesSource

- (NSMutableArray*) recipes {
    if (!_recipes) {
        NSMutableArray *localRecipes = [NSMutableArray array];

        for (int i = 0; i < 5000; i++) {
            O2JSRecipe *recipe = [[O2JSRecipe alloc] init];

            recipe.directions = [NSString stringWithFormat:
                    @"%i medium dry vodka martini shaken, but not stirred", i
            ];

            recipe.title = [NSString stringWithFormat:@"Martini %i", i];
            recipe.image = (i%2 == 0)?
                    [UIImage imageNamed:@"martini.jpg"]:
                    [UIImage imageNamed:@"begendi.jpg"];

            recipe.preparationTime = [NSNumber numberWithInt:(i*10)];

            [localRecipes addObject:recipe];
        }

        _recipes = localRecipes;
    }

    return _recipes;
}

#pragma mark Recipe List Data Source Methods

- (NSInteger)  recipeCount                          {return [self.recipes count];                          }
- (O2JSRecipe*)recipeAtIndex:(NSInteger)index       {return [self.recipes objectAtIndex:(NSUInteger)index];}
- (void)       deleteRecipeAtIndex:(NSInteger)index {[self.recipes removeObjectAtIndex:(NSUInteger)index]; }

- (O2JSRecipe*)createNewRecipe {
    O2JSRecipe *recipe = [[O2JSRecipe alloc] init];

    [self.recipes addObject:recipe];

    return recipe;
}

@end
