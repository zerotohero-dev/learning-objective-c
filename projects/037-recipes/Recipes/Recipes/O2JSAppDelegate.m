//
//  O2JSAppDelegate.m
//  Recipes
//
//  Created by Volkan Ozcelik on 4/20/13.
//  Copyright (c) 2013 Volkan Ozcelik. All rights reserved.
//

#import "O2JSAppDelegate.h"
#import "O2JSViewController.h"
#import "O2JSRecipe.h"

@implementation O2JSAppDelegate

//TODO: read more about ARC

- (NSArray*) recipes {
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

            [localRecipes addObject:recipe];
        }

        _recipes = localRecipes;
    }

    return _recipes;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{


//Reference:
//http://bou.io/IBOutletsIn2013.html#fn:2
//https://developer.apple.com/library/ios/#documentation/Cocoa/Conceptual/LoadingResources/CocoaNibs/CocoaNibs.html#//apple_ref/doc/uid/10000051i-CH4-SW6
//http://developer.apple.com/library/ios/#documentation/Performance/Reference/GCD_libdispatch_Ref/Reference/reference.html
//
//http://nsscreencast.com/episodes/27-new-objective-c-syntax
//
//Tutorials:
//http://www.cocoawithlove.com/2008/10/debugging-tips-for-objective-c.html
//http://www.raywenderlich.com/4295/multithreading-and-grand-central-dispatch-on-ios-for-beginners-tutorial
//http://blog.austinlouden.com/post/47644085183/your-first-ios-app-100-programmatically?utm_source=statuscode&utm_medium=email




//    NSString *directions = @"Tencereye etleri alıp, etler bıraktığı suyu \
//çekene dek kavurun. Ardından tereyağını, küçük kesilmiş soğanları \
//ekleyin. 3 dakika daha kavurun. 1 çorba kaşığı sirkeyi ilave edin. \
//Rendelenmiş domatesleri, kekiği, sıcak suyu ve en son tuzu ekleyerek, \
//etler yumuşayana dek pişirin.\
//\n\n\n\
//Patlıcanları ateşte közleyin. Kabuklarını soyduktan sonra limonlu suda \
//5 dakika bekletin. Suyunu iyice süzün. Keskin bir bıçak yardımıyle çok \
//ince kıyın.\
//\n\n\n\
//Tereyağını bir tavada eritin. 1. 5 çorba kaşığı unu ekleyin. Sararana dek \
//kavurun. Sürekli karıştırarak soğuk sütü ilave edin. Karışım koyulaştığında \
//ateşten alın. İnce kıyılmış patlıcanları, tuzu, rendelenmiş kaşar peynirini \
//ekleyin. Hızla karıştırıp, servis tabağına alın. Üzerine eti koyarak, servis \
//yapın.";

//    O2JSRecipe *recipe = [[O2JSRecipe alloc] init];
//
//    recipe.title      = @"Hünkâr Beğendi";
//    recipe.directions = directions;
//    recipe.image      = [UIImage imageNamed:@"begendi.jpg"];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.viewController = [[O2JSRecipesListViewController alloc] initWithNibName:@"O2JSRecipesListViewController" bundle:nil];

 //   self.viewController.recipe = recipe;

    self.window.rootViewController = self.viewController;

    self.viewController.recipes = self.recipes;

    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
