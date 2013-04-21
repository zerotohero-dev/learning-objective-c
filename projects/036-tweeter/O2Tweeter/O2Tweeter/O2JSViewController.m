/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import "O2JSViewController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface O2JSViewController ()
- (void) reloadTweets;
- (void) handleTwitterData: (NSData*) data
               urlResponse: (NSHTTPURLResponse*) urlResponse
                     error: (NSError*) error;

//@property (nonatomic, strong) IBOutlet UIWebView *twitterWebView;

@property (nonatomic, strong) IBOutlet UITextView *twitterTextView;

@property (strong) ACAccountStore *accountStore;
@property (readonly, strong) ACAccount *twitterAccount;

@end


// class extensions versus categories

// goes to NSArray+MySafeMethods.h (by convention) where implementaiton goes
// to the corresponding .m
@interface NSArray (SafeMethods)
- (id) firstObject;
@end



@implementation O2JSViewController


// instance var is _twitterAccount
// setter is setTwitterAccount
// getter is twitterAccount -- since the property is readonly there's no setter.
@synthesize twitterAccount = _twitterAccount;

// lazy loading.
- (ACAccount*) twitterAccount {
    if ( _twitterAccount ) {
        return _twitterAccount;
    }

    self.accountStore = [[ACAccountStore alloc] init];

    ACAccountType *twitterAccountType = [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];


    NSArray *twitterAccounts = [self.accountStore accountsWithAccountType:twitterAccountType];

    if ([twitterAccounts count] > 0) {
        _twitterAccount = [twitterAccounts objectAtIndex:0];
    }

    return _twitterAccount;
}


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
    NSURL *twitterApiUrl = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/home_timeline.json"];

    NSDictionary *twitterParams = @{
//        @"screen_name" : @"linkibol"
    };

    SLRequest *request = [SLRequest
             requestForServiceType : SLServiceTypeTwitter
                     requestMethod : SLRequestMethodGET
                               URL : twitterApiUrl
                        parameters : twitterParams
    ];

// if you remove this, you'll get "bad authentication data" error.
    request.account = self.twitterAccount;

    [request performRequestWithHandler:^(
                NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        [self handleTwitterData:responseData urlResponse:urlResponse error:error];
    }];


//    [self.twitterWebView loadRequest:[
//        NSURLRequest requestWithURL:[
//                NSURL URLWithString:@"http://twitter.com/linkibol"
//            ]
//        ]
//    ];
}

// dispatch_get_main_queue
// dispatch_get_async

- (void) handleTwitterData:(NSData *)data
               urlResponse:(NSHTTPURLResponse *)urlResponse
                     error:(NSError *)error {

    NSError *jsonError = nil;

    NSArray  *jsonResponse = [NSJSONSerialization
                JSONObjectWithData:data
                           options:0
                             error:&jsonError
    ];

    NSLog(@"jsonResponse: %@", jsonResponse);

    if (jsonError || ![jsonResponse isKindOfClass:[NSArray class]]) {
        NSLog(@"Error in handleTwitter data serialization");

        return;
    }

    // Key Value Coding (Key Value Chain)
    // Things we can get thru string keys (like keys in a dictionary)
    // can be chained together in a path with a dot operator.
    // NSString *userName = [dict valueForKeyPath:@"user.name"];
    // Key value coding applies to public properties of objects
    // public instance varables, and manually writtern getter methods.

    NSString *myString = @"foo";

    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%@", myString);

        NSArray *tweets = jsonResponse;

        tweets = [tweets sortedArrayUsingComparator:^NSComparisonResult (id obj1, id obj2) {
            NSString *tweet1 = [obj1 valueForKey:@"text"];
            NSString *tweet2 = [obj2 valueForKey:@"text"];
            return [tweet1 compare:tweet2];
        }];

        NSSortDescriptor *sortByText = [NSSortDescriptor sortDescriptorWithKey:@"text"
                                                                     ascending:YES];

        NSArray *sortDescriptors = @[sortByText];

        tweets = [tweets sortedArrayUsingDescriptors:sortDescriptors];

        for (NSDictionary *tweetDict in tweets) {
            NSString *tweetText = [NSString stringWithFormat:@"%@: %@ (%@)",
                [tweetDict valueForKeyPath : @"user.name" ],
                [tweetDict valueForKey     : @"text"      ],
                [tweetDict valueForKey     : @"created_at"]
            ];



            self.twitterTextView.text = [NSString stringWithFormat:@"%@%@\n\n",
                self.twitterTextView.text,
                tweetText
            ];
        }
    });

    myString = @"bar";
}

// MVC in iOS in a nutshell
// views are built in interface builder
// models are built in code
// UIViewController bridge the two.

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
