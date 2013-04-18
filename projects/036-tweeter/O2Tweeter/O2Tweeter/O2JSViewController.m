/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2JSViewController.h"
#import <Social/Social.h>

@interface O2JSViewController ()
- (void) reloadTweets;
@property (nonatomic, strong) IBOutlet UIWebView *twitterWebView;
@end


// class extensions versus categories

// goes to NSArray+MySafeMethods.h (by convention) where implementaiton goes
// to the corresponding .m
@interface NSArray (SafeMethods)
- (id) firstObject;
@end



@implementation O2JSViewController


// All Objective C objects are actually C pointers to id type.
// a message sent to a nil object quitely does nothing. (nil is a maybe monad for objective C)

// ARC is back compat for projects up to iOs4.3
// methods with alloc, copy or new in their name are assumed to return objects
// that must be "memory-managed" -- other methods don't.
- (IBAction)handleTweetButtonTapped:(id)sender
{
    NSLog(@"handleTweetButtonTapped:");

    if (![SLComposeViewController
                isAvailableForServiceType:SLServiceTypeTwitter]) {
        NSLog(@"Can't Tweet :(");

        return;
    }

    SLComposeViewController *tweetVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];

//    [tweetVC setInitialText:@"Tweeting from iOS"];


    tweetVC.completionHandler = ^(SLComposeViewControllerResult result) {
        if (result != SLComposeViewControllerResultDone) {
            return;
        }

        // Self is a variable in scope at the time of the block's creation.
        // Don't thinks of self like `this` in JavaScript.
        [self dismissViewControllerAnimated:YES completion:NULL];

        [self reloadTweets];
    };

    [tweetVC setInitialText: NSLocalizedString(@"Tweeting from iOS", nil)];

    [self presentViewController:tweetVC animated:YES completion:^{
        NSLog(@"tweet view is shown");
    }];

    //NSArray:enumerateObjectsUsingBlock: you can sort stuff using blocks too.
    //NSDictionary has similar method too.

    // Grand Central Dispatch
}


// typedef void (^SLComposeVIewControllerCompletionHandler)
// (SLComposeViewControllerResult result);

// a block contains both executable code and program state (like a closure)

- (IBAction)handleShowMyTweetsTapped:(id)sender
{
    [self reloadTweets];
}

- (void) reloadTweets
{
    [self.twitterWebView loadRequest:[
        NSURLRequest requestWithURL:[
                NSURL URLWithString:@"http://twitter.com/linkibol"
            ]
        ]
    ];
}

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

@end
