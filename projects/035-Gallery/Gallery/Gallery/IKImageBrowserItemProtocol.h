@interface NSObject (IKImageBrowserItem)

- (NSString *) imageUID;                /* required */
- (NSString *) imageRepresentationType; /* required */
- (id)         imageRepresentation;     /* required */

- (NSUInteger) imageVersion;
- (NSString *) imageTitle;
- (NSString *) imageSubtitle;
- (BOOL)       isSelectable;

@end