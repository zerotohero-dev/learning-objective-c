//
//  O2JSViewController.m
//  Recipes
//
//  Created by Volkan Ozcelik on 4/20/13.
//  Copyright (c) 2013 Volkan Ozcelik. All rights reserved.
//

#import "O2JSViewController.h"

@interface O2JSViewController ()

@end

@implementation O2JSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}   

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.recipeTitle.text    = self.recipe.title;
    self.directionsView.text = self.recipe.directions;

    if (self.recipe.image) {
        self.imageView.image = self.recipe.image;
    }
}

@end
