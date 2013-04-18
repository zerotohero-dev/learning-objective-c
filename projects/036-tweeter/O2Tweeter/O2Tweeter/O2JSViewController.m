/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2JSViewController.h"
#import <Social/Social.h>

@interface O2JSViewController ()

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

    [tweetVC setInitialText: NSLocalizedString(@"Tweeting from iOS", nil)];

    [self presentViewController:tweetVC animated:YES completion:NULL];
}

- (IBAction)handleShowMyTweetsTapped:(id)sender
{
    //self?
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
