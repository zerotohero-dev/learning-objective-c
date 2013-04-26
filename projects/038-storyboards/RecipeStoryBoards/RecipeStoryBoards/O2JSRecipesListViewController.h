/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <UIKit/UIKit.h>

#import "O2JSRecipesListDataSource.h"

@interface O2JSRecipesListViewController : UITableViewController

//@property (nonatomic, strong) NSArray* recipes;

@property (nonatomic, strong) id <O2JSRecipesListDataSource> dataSource;

@end
