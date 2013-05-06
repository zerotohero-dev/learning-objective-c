/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2JSRecipeEditorViewController.h"

@interface O2JSRecipeEditorViewController ()

@end

@implementation O2JSRecipeEditorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.formatter = [[NSNumberFormatter alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
[   super viewWillAppear:animated];

    self.titleField.text       = self.recipe.title;
    self.directionsText.text   = self.recipe.directions;
    self.prepTimeLabel.text    = [self.formatter stringFromNumber:self.recipe.preparationTime];
    self.prepTimeStepper.value = [self.recipe.preparationTime doubleValue];

    if (self.recipe.image != nil) {
        self.recipeImage.image = self.recipe.image;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changePreparationTime:(UIStepper *)sender {
  NSInteger value = (NSInteger)[sender value];
  self.recipe.preparationTime = [NSNumber numberWithInteger:value];
  self.prepTimeLabel.text =
  [self.formatter stringFromNumber:self.recipe.preparationTime];
}

#pragma mark - Text Field Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField*)textField{
    [textField resignFirstResponder];

    return YES;
}

- (void)textFieldDidEndEditing:(UITextField*)textField{
    self.recipe.title = textField.text;
}

@end
