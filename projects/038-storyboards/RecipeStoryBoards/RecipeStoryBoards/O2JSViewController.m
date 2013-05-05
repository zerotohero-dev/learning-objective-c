/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2JSViewController.h"

@interface O2JSViewController ()

@end

@implementation O2JSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.formatter = [[NSNumberFormatter alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}   

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.title = self.recipe.title;

//    self.recipeTitle.text    = self.recipe.title;
    self.directionsView.text = self.recipe.directions;

    if (self.recipe.image) {
        self.imageView.image = self.recipe.image;
    }

    self.preparationTime.text = [self.formatter stringFromNumber:self.recipe.preparationTime];
}

//- (IBAction)dismiss:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
//}



@end
