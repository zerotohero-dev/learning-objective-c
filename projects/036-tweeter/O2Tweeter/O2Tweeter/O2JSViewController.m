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


- (IBAction)handleTweetButtonTapped:(id)sender
{
    NSLog(@"handleTweetButtonTapped:");

    if (![SLComposeViewController
                isAvailableForServiceType:SLServiceTypeTwitter]) {
        NSLog(@"Can't Tweet :(");

        return;
    }

    SLComposeViewController *tweetVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];

    [tweetVC setInitialText:@"Tweeting from iOS"];

    [self presentViewController:tweetVC animated:YES completion:NULL];
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
