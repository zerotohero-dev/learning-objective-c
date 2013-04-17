//
//  PGAppDelegate.h
//  Gallery
//
//  Created by Volkan Ozcelik on 3/10/13.
//  Copyright (c) 2013 Volkan Ozcelik. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CBMainWindow;
@class CBAlbum;

@interface PGAppDelegate : NSObject <NSApplicationDelegate>

@property (retain) CBMainWindow* mainWindow;
@property (retain) CBMainWindow* mainWindowController;
@property (retain) CBAlbum* selectedAlbum;

- (IBAction) newAlbum: (id)sender;

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:(id)sender;

@end
