/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */


#import "NSNumberTest.h"

 void *CBRetainValue (CFAllocatorRef allocator, const void *ptr) {
    CFTypeRef cf = (CFTypeRef)ptr;

    CFRetain( cf );

    NSLog( @"CBRetainValue: %@", cf );

   return cf;
}

typedef struct {
    NSInteger lengthInSeconds; NSInteger yearRecorded;
} Song;


@interface NSNumberTest ()
- (void)enumerateObjectsUsingBlock:(void (^)(id, NSUInteger, BOOL *))block;

@end

@implementation NSNumberTest {
}
- (NSValue*) structObjectValue {
    // NSValue is used to wrap primitive c values into objective c objects.
    // it provides a way to store raw pointers and even non-retained references
    // to other objective c objects.
    // Unilke NSData, it stores the primitive type along with actual data.


    Song mySong; mySong.lengthInSeconds = 243; mySong.yearRecorded = 1970;
    NSValue* item = [NSValue valueWithBytes: &mySong objCType: @encode(Song)];
    return item; }

- (void) testValue {
    objCType: @encode(char**)];

    // value object with a C string.
    NSValue* stringObject = self.stringObjectValue;
    char* stringValue = NULL;
    [stringObject getValue: &stringValue];
    NSLog( @"stringValue: %s", stringValue );

    // value object with a struct.
    NSValue* structObject = self.structObjectValue;

    Song mySong;
    [structObject getValue: &mySong];
    NSLog( @"structValue: %ld, %ld",
            mySong.lengthInSeconds, mySong.yearRecorded );
    NSMutableDictionary* songInfo = [NSMutableDictionary dictionary];
    [songInfo setObject:stringObject forKey:@"name"];
    [songInfo setObject:structObject forKey:@"details"];

    // wrapping primitive objects in NSValue enable them to be used in arrays, dictionaries or sets.
    // you can also wrap regular objective c objects to prevent them from being retained by the collection.

    NSMutableString* string1 = [[NSMutableString alloc] init]; [string1 appendFormat:@"Item %ld", 1];
    [string1 appendFormat:@"Item %ld", 2];
    [string1 appendFormat:@"Item %ld", 3];
    NSMutableString* string2 = [string1 mutableCopy];
    NSLog( @"string 1 retain count: %lu", string1.retainCount ); NSLog( @"string 2 retain count: %lu", string2.retainCount );
    NSValue* stringWrapper = [NSValue valueWithNonretainedObject:string2]; NSMutableArray* array = [NSMutableArray array];
    [array addObject:string1];
    [array addObject:stringWrapper];
    NSLog( @"string 1 retain count: %lu", string1.retainCount ); NSLog( @"string 2 retain count: %lu", string2.retainCount );
}

- (NSValue*) stringObjectValue {
    char* itemName = "Hey Jude";
    NSValue* item = [NSValue valueWithBytes: &itemName
            objCType: @encode(char**)];
                                             return item; }



+(void) test {
    NSNumber* secondsInDay = [NSNumber numberWithInt:(60 * 60 * 24)];
    NSNumber* scaleFactor = [NSNumber numberWithFloat:0.1234];
    NSNumber* doStuff = [NSNumber numberWithBool:YES];

    NSLog(
       @"%@ %i, %@ %f, %@ %i", secondsInDay, secondsInDay.intValue,
       scaleFactor, scaleFactor.floatValue, doStuff, doStuff.boolValue
    );

    NSInteger intValue = 2000;
    CFNumberRef intNumber = CFNumberCreate(NULL, kCFNumberNSIntegerType, &intValue);

    CGFloat floatValue = 105.3;
    CFNumberRef floatNumber = CFNumberCreate( NULL, kCFNumberFloatType, &floatValue);

    CFRelease( (CFTypeRef) intNumber );
    CFRelease( (CFTypeRef) floatNumber );

    // Booleans

    // one advantage of these ref types (not CF ref types but "ref" types in general) is that they can be stored in arrays.
    CFBooleanRef controlEnabled = kCFBooleanTrue;
    CFBooleanRef resetPreferences = kCFBooleanFalse;
    if ( CFBooleanGetValue( controlEnabled ) == true ) {NSLog( @"controlEnabled" );}
    if ( CFBooleanGetValue( resetPreferences ) == true ) {NSLog( @"resetPreferences" );}

    // You won't be using core foundation types often, if you are not working with a file that'll
    // be compiled to plain C.

    // Cocoa Primitive Types
    // NSInteger
    // NSUInteger
    // CGFloat

    // NSInteger is just an alias for int in 32bit and long for 64bit platforms (see source)
    // use it wherever you would use an interger; same for CGFloat.

    //#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
    //    typedef long NSInteger;
    //    typedef unsigned long NSUInteger;
    //#else
    //typedef int NSInteger;
    //typedef unsigned int NSUInteger;
    //#endif

    NSInteger myAray[] = {1,2,3,4,5};
    NSInteger index = 4;

    CGFloat scale = 0.4;

    // NSDecimalNumber

    NSDecimalNumber* starsInTheSky;
    starsInTheSky = [NSDecimalNumber decimalNumberWithMantissa: 7
                                                      exponent: 22
                                                    isNegative: NO];
    NSLog( @"starsInTheSky: %@", starsInTheSky );

    starsInTheSky = [NSDecimalNumber decimalNumberWithString:@"7e22"];

    NSLog( @"starsInTheSky: %@", starsInTheSky );

    //decimalNumberWithMantissa:exponent:isNegative:
    //    Creates a decimal number with structured values
    //        +decimalNumberWithString:
    // Creates a number from a string
    //+maximumDecimalNumber
//    Returns an instance with the maximum possible value
    //        +notANumber
//     Returns an object that represents a nonnumeric value for error handling
    //        -decimalNumberByAdding:
//        Adds the value of a secondary object, returns the result
//    -decimalNumberBySubtracting:
//    Subtracts the value of a secondary object, returns the result
//    -decimalNumberByMultiplyingBy:
//    Multiplies the value of a secondary object, returns the result
//    -decimalNumberByDividingBy:
//    Divides the value of a secondary object, returns the result

// current population of 6,778,000,000. // growth rate of 1.14%.
    NSDecimalNumber* population =
            [NSDecimalNumber decimalNumberWithString:@"6.778e9"];
    NSDecimalNumber* annualGrowth =
            [NSDecimalNumber decimalNumberWithString:@"0.0114"];
    NSDecimalNumber* yearPopulation = population; NSDecimalNumber* netGain;
    NSInteger year;
    for ( year = 2009; year < 2016; year++ ) {

        // calculate the net gain for each year using 'annualGrowth'. // add the net gain to the current total.
        netGain = [yearPopulation decimalNumberByMultiplyingBy:annualGrowth];
        yearPopulation = [yearPopulation decimalNumberByAdding:netGain];
    }
    NSLog ( @"Projected population for 2015: %@", yearPopulation );

// -decimalNumberByRoundingAccordingToBehavior
// - (NSDecimalNumber *)decimalNumberByRoundingAccordingToBehavior:(id <NSDecimalNumberBehaviors>)behavior;
    // Round to the scale of the behavior.
// takes anything that implements the NSDecimalNumberBehaviors protocol.
// you can make your own class or use NSDecimalNumberHandler.

    NSDecimalNumberHandler* round;
    NSRoundingMode mode = NSRoundPlain;
    round = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode: mode
                                                                   scale: 0
                                                        raiseOnExactness: NO
                                                         raiseOnOverflow: NO
                                                        raiseOnUnderflow: NO
                                                     raiseOnDivideByZero: NO
    ];

    NSDecimalNumber* total;

    total = [yearPopulation decimalNumberByRoundingAccordingToBehavior:round];

    NSLog ( @"Projected population for 2015: %@", total );

    NSString* totalString;

    NSNumberFormatterStyle formatStyle = NSNumberFormatterDecimalStyle;

    totalString = [NSNumberFormatter localizedStringFromNumber: total
                                                   numberStyle: formatStyle
    ];

    NSLog ( @"Projected population for 2015 (formatted): %@", totalString );

  // Cocoa also has a plain C Struct called NSDecimal; but NSDecimalNumber is easier to use and integrates better
  // with the rest of the Cocoa.

    // You can re-use NSNumberObject, it's good to keep them around when needed instead of initializing every time, which is expensive.
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle: NSNumberFormatterDecimalStyle];
    [formatter setThousandSeparator:@"*"];

    NSString* totalString2 = [formatter stringFromNumber:total];

    NSLog ( @"Projected population for 2015 (formatted): %@", totalString2 );

    [formatter release];

    NSNumber* secondsInDay2 = [NSNumber numberWithInt:86400];
    NSNumberFormatter* formatter2 = [[NSNumberFormatter alloc] init];
    [formatter2 setNumberStyle: NSNumberFormatterSpellOutStyle];
    NSString* secondsAsString = [formatter2 stringFromNumber:secondsInDay];

    NSLog ( @"Seconds in day (formatted): %@", secondsAsString );

    [formatter2 release];

    // NSInteger, NSUInteger, CGFloat => Best to be used for in-application date (array indexes and such)
    // NSNumber => Best for dealing with persistent user data that'll be saved to disk.
    // NSDecimalNumber => Best for high-precision vital data (bank transactions, scientific calculations)
    // NSDecimal => Works similar to NSDecimalNumber; unless you know otherwise, it's better to use NSDecimalNumber instead.

    // NSData -- stores blocks of raw data (like a downloaded file over the network)

    //+dataWithContentsOfURL:
    // Creates a data object with the contents of a file at a URL
    //+dataWithContentsOfFile:
    // Creates a data object with the contents of a file at a path
    //+dataWithBytes:length:
    // Creates a data object by copying raw memory
    //-writeToURL:atomically:
    //     Writes the data to a local file URL
    //-writeToFile:atomically:
    // Writes the data to a file path

    // Data objects are especially useful for stuff that cannot be reasonably expressed in String form (like an image).

    NSString* moviePath = @"/Users/volkan.ozcelik/experimental/sample.m4v";
    NSData* movieData = [NSData dataWithContentsOfFile:moviePath];

    NSInteger byteCount = 1000;

    void* rawMemory = malloc (byteCount);

    NSData* rawMemoryAsData = [NSData dataWithBytes:rawMemory length:(NSUInteger) byteCount];

    NSString* file = @"/Users/volkan.ozcelik/experimantal/test.jpg";
    NSImage* image = [[NSImage alloc] initWithContentsOfFile:file];
    NSData* imageData = [image TIFFRepresentation];

    NSString* streetName = @"Shoreline";
    NSData* stringData = [streetName dataUsingEncoding:NSUTF8StringEncoding];
    NSString* filePath =
            [NSHomeDirectory() stringByAppendingPathComponent:@"/home.txt"];
    [stringData writeToFile:filePath atomically:YES];

//    + (id)data;
//    + (id)dataWithBytes: (const void *)bytes length: (NSUInteger)length;
//    + (id)dataWithBytesNoCopy: (void *)bytes length: (NSUInteger)length
//    + (id)dataWithBytesNoCopy: (void *)bytes length: (NSUInteger)length freeWhenDone: (BOOL)b;

    NSInteger count = 4;
    NSInteger byteCount2= (sizeof(NSInteger) * count);
    NSInteger* allNumbers= malloc ( byteCount2 );
    NSInteger* currentNumber = allNumbers;
    for ( int i = 0; i < count; i++ ) {
        // advance pointer and set data.
        currentNumber = (allNumbers + i);
        *currentNumber = i*100;
    }

    NSData* data = [NSData dataWithBytesNoCopy: allNumbers
                                        length: byteCount2
                                  freeWhenDone: YES
    ];
 //freeWhenDone
//    If YES, the returned object takes ownership of the bytes pointer and frees it on deallocation.

    // no need to call free here. NSData does it.
    // free(allNumbers2)

    //

    // NSMutableData

    NSMutableData* data = [NSMutableData data];

    [data appendData:[@"First" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"Second" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"Third" dataUsingEncoding:NSUTF8StringEncoding]];

    NSLog(@"data: %@", data);

    [data resetBytesInRange: NSMakeRange(0,data.length) ];

    NSLog(@"data after resetting contents: %@", data);

    // remove all data.
    [data setData: [NSData data]];

    NSLog(@"data after removing contents: %@", data);

    NSInteger count3 = 4;
    NSInteger byteCount3 = sizeof(NSInteger) * count3;
    NSInteger* allNumbers3 = malloc( byteCount3 );
    NSInteger* currentNumber3 = allNumbers3;

    for ( int i = 0; i < count3; i++ ) {
        currentNumber3 = (allNumbers3 + i);
        *currentNumber3 = i*8;
    }
    [data appendBytes:allNumbers3 length:byteCount3];

    NSLog(@"data: %@", data);

    [data setData: [NSData data]];

    NSLog(@"data after removing contents: %@", data);

    free ( allNumbers3 );

    // There's also CFDataRef and CFMutableDataRef

    /// Array

    // requires nil to terminate.
    NSArray* array1 = [NSArray arrayWithObjects:@"One", @"Two", @"Three", nil];

    // Arrays can contain only objects
    // You can't store nil, but you can store NSNull.
    // Use NSNull sparingly, urge to create Arrays with valid objects.

    NSArray* array = [NSArray arrayWithObjects:@"One", @"Two", @"Three", nil];
    NSLog( @"array: %@", array );

    id object = [array objectAtIndex:1];

    NSLog( @"object: %@", object );

    NSUInteger indexOfObject = [array indexOfObject:@"Three"];

    NSLog( @"indexOfObject: %lu", indexOfObject );

    array = [array arrayByAddingObject:@"Four"];

    NSLog( @"array: %@", array );

    NSArray* array2 = [[NSArray alloc] initWithObjects:@"Five", @"Six", nil];
    array = [array arrayByAddingObjectsFromArray:array2];

    NSLog( @"array: %@", array );

    [array2 release];

    // string from array.
    NSArray* array11 = [NSArray arrayWithObjects:
            @"One", @"Two", @"Three", nil];
    NSString* formatted = [array11 componentsJoinedByString:@" -- "];

    NSLog( @"formatted: %@", formatted ); // array from string.

    NSString* list = @"Red * Green * Blue";

    NSArray* array2 = [list componentsSeparatedByString:@" * "];

    NSLog( @"array2: %@", array2 );

    NSArray* weekendDays = [NSArray arrayWithObjects:
            @"Friday", @"Saturday", @"Sunday", nil];

    for (id object in weekendDays) { NSLog( @"day: %@", object );
    }


//    @interface NSArray : NSObject <NSCopying, NSMutableCopying, NSSecureCoding, NSFastEnumeration>
//
//            - (NSUInteger)count;
//    - (id)objectAtIndex:(NSUInteger)index;
//
//    @end

//    @interface NSArray (NSExtendedArray)

//    starting in Objective-C 2.0 (meaning Mac OS X Leopard, iPhone OS 2.0, and later) you can create a category with an empty name (i.e. @interface MyClass ()) called Class Extension. What's unique about a class extension is that the method implementations must go in the same @implementation MyClass as the public methods.

    NSArray* colors = [NSArray arrayWithObjects:
            @"Red", @"Green", @"Blue", nil];
// enumeration using a block.
[colors enumerateObjectsUsingBlock:
// beginning of block.
    ^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog( @"%@ at %lu", obj, idx );
        if ( idx == 1 ) {
            NSLog( @"Found index 1, stopping" );
            *stop = YES;
        }
    } // end of block.
    ];


    NSArray* colors2 = [NSArray arrayWithObjects:
            @"Red", @"Green", @"Blue", nil];

    // enumeration using a block.
    [colors enumerateObjectsUsingBlock:
        // beginning of block.
        ^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog( @"%@ at %lu", obj, idx );
            if ( idx == 1 ) {
                NSLog( @"Found index 1, stopping" );

                *stop = YES;
            }
        }
        // end of block.
    ];

    // standard enumeration.
    for ( id obj in colors ) {
        NSUInteger idx = [colors indexOfObject:obj];

        NSLog( @"%@ at %lu", obj, idx );

        if ( idx == 1 ) {
            NSLog( @"Found index 1, stopping" ); break;
        }
    }

    // Mutable Array.

    NSMutableArray* painters = [NSMutableArray array];

    [painters addObject:@"Leonardo"];
    [painters addObject:@"Michelangelo"];
    [painters addObject:@"Donatello"];
    [painters addObject:@"Raphael"];

    NSLog(@"painters: %@", painters);

    [painters removeAllObjects];

    NSLog(@"painters: %@", painters);

    // combine arrays, replace items.

    NSMutableArray* allMembers = [NSMutableArray array];

    NSArray* members1 = [NSArray arrayWithObjects:@"Paul", @"John", nil];
    NSArray* members2 = [NSArray arrayWithObjects:@"George", @"Pete", nil];

    [allMembers addObjectsFromArray:members1];
    [allMembers addObjectsFromArray:members2];

    NSUInteger index = [allMembers indexOfObject:@"Pete"];

    [allMembers replaceObjectAtIndex:index withObject:@"Ringo"];

    NSLog(@"allMembers: %@", allMembers);

    // CFArrayRef CFMutableArrayRef

    // NSIndexSet , NSMutableIndexSet

    NSMutableArray* ninjas = [NSMutableArray array]; [ninjas addObject:@"Leonardo"];
    [ninjas addObject:@"Michelangelo"];
    [ninjas addObject:@"Donatello"];
    [ninjas addObject:@"Raphael"]; NSLog( @"ninjas: %@", ninjas );

    NSMutableIndexSet* indexSet;
    indexSet = [NSMutableIndexSet indexSet]; [indexSet addIndex:1];
    [indexSet addIndex:3];
    NSArray* someNinjas;

    someNinjas = [ninjas objectsAtIndexes:indexSet]; NSLog( @"someNinjas: %@", someNinjas );
    [ninjas removeObjectsAtIndexes:indexSet]; NSLog( @"ninjas: %@", ninjas );

    NSMutableArray* streets = [NSMutableArray array]; [streets addObject:@"De Anza Blvd"];
    [streets addObject:@"Homestead Rd"];
    [streets addObject:@"Sunnyvale Saratoga Rd"]; [streets addObject:@"Fremont Ave"];
    [streets addObject:@"Stelling Rd"]; NSLog( @"All streets: %@", streets );
    NSIndexSet* roadsIndexes;

    roadsIndexes = [streets indexesOfObjectsPassingTest:
            ^( id obj, NSUInteger idx, BOOL *stop ) {
                return [obj hasSuffix:@"Rd"];
            }];

    NSLog( @"roadIndexes: %lu", roadsIndexes.count );

    NSArray* roads = [streets objectsAtIndexes:roadsIndexes]; NSLog( @"roads: %@", roads );

    // NSDictionary

    NSString* const NSString* const NSString* const
    NSArray* values
    NSArray* keys
    CBCityKey = @"city"; CBStateKey = @"state"; CBZipcodeKey = @"zipcode";
    = [NSArray arrayWithObjects:
            @"Cupertino", @"California", @"95014", nil];
    = [NSArray arrayWithObjects:
            CBCityKey, CBStateKey, CBZipcodeKey, nil];
    NSDictionary* info;
    info = [NSDictionary dictionaryWithObjects:values forKeys:keys]; NSLog( @"info dictionary: %@", info );
    NSLog( @"info keys: %@", info.allKeys );
    NSLog( @"info values: %@", info.allValues );
    NSString* city = [info objectForKey:CBCityKey]; NSLog( @"city value: %@", city );

    // Keys need not be Strings, they can be NSNumbers too, but strings are the most common and the most practical.

    NSDictionary* info;
    info = [NSDictionary dictionaryWithObjectsAndKeys:
            @"Cupertino", CBCityKey, @"California", CBStateKey, @"95014", CBZipcodeKey, nil];


    for ( id key in info ) {
        NSLog( @"%@: %@", key, [info objectForKey:key] );
    }

    [info enumerateKeysAndObjectsUsingBlock:
            ^( id key, id obj, BOOL *stop ) { NSLog( @"%@: %@", key, obj );
            } ];

    // NSMutableDictionary

    NSMutableDictionary* info1 = [NSMutableDictionary dictionary];
    [info1 setObject: @"Looking up at the stars." forKey: @"title"];
    [info1 setObject: [NSNumber numberWithFloat:1.8] forKey: @"focalDistance"];
    [info1 setObject: [NSDate date] forKey: @"creationDate"];
    [info1 setObject: [NSNumber numberWithFloat:1.2] forKey: @"exposure"];
    NSLog( @"info1: %@", info1 );
    NSMutableDictionary* info2 = [NSMutableDictionary dictionary];
    [info2 setObject: [NSNumber numberWithInteger:500] forKey: @"width"];

    [info2 setObject: [NSNumber numberWithInteger:450] forKey: @"height"];
    [info2 setObject: [NSNumber numberWithInteger:300] forKey: @"dpi"];
    [info1 addEntriesFromDictionary:info2]; NSLog( @"info1: %@", info1 );
    NSArray* keys = [NSArray arrayWithObjects:@"width", @"height", nil]; [info1 removeObjectsForKeys:keys];
    NSLog( @"info1: %@", info1 );

    //CFDictionaryRef

    const void* CBRetainValue (CFAllocatorRef alloc, const void *ptr) {
        CFTypeRef cf = (CFTypeRef)ptr; CFRetain(cf); NSLog(@"CBRetainValue: %@", cf); return cf;


        CFStringRef const CBCityKey = CFSTR("city");
        CFStringRef const CBStateKey = CFSTR("state"); CFStringRef const CBZipcodeKey = CFSTR("zipcode");
        CFIndex capacity = 0; CFMutableDictionaryRef dict;
        dict = CFDictionaryCreateMutable( NULL,
                capacity, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks );
        CFDictionaryAddValue ( dict, CBCityKey, @"San Francisco" ); CFDictionaryAddValue ( dict, CBCityKey, @"Mountain View" );
// will not cause exceptions.
        CFDictionaryRemoveValue ( dict, CBStateKey ); CFDictionaryReplaceValue ( dict, CBZipcodeKey, @"95014" ); NSLog( @"dict: %@", dict );
        CFDictionaryReplaceValue ( dict, CBCityKey, @"Cupertino" ); NSLog( @"dict: %@", dict );
        CFRelease( dict );


   // NSSet unordered collection of unique values.

// manually created set.
        NSSet* days;
        days = [NSSet setWithObjects: @"Friday", @"Saturday",nil]; days = [days setByAddingObject:@"Sunday"];
        NSLog( @"days: %@", days );
// set from array.
        NSMutableArray* planets = [NSMutableArray array]; [planets addObject:@"Earth"];
        [planets addObject:@"Mercury"];
        [planets addObject:@"Mars"];
        [planets addObject:@"Jupiter"];
        [planets addObject:@"Jupiter"];
        [planets addObject:@"Jupiter"];
        NSSet* planetsSet = [NSSet setWithArray:planets]; NSLog( @"planetsSet: %@", planetsSet );
// add an object.
        NSSet* morePlanets = [planetsSet setByAddingObject:@"Venus"]; if ([planetsSet isSubsetOfSet:morePlanets])
            NSLog( @"morePlanets is a superset of planetsSet" );
// loop through with fast enumeration. for ( id planet in planetsSet ) {
        if ([planet isEqual:@"Earth"]) { NSLog ( @"Found home!" );
        } }
// filter objects with a block.
    NSSet* mPlanets = [morePlanets objectsPassingTest:
            ^(id obj, BOOL *stop) {
                return [obj hasPrefix:@"M"];
            }];


    // if you create an NSSet from NSArray and the array has duplicate items, the set will not.
    // there's no inherent ordering in a set. The order of items in the array, may be different from the order of items in the set.

    // NSMutableSet


    NSMutableSet* planets1 = [NSMutableSet set]; [planets1 addObject:@"Earth"];
    [planets1 addObject:@"Mercury"];
    [planets1 addObject:@"Pluto"];
    NSMutableSet* planets2 = [NSMutableSet set]; [planets2 addObject:@"Mars"];
    [planets2 addObject:@"Jupiter"];
    NSMutableSet* allPlanets = [NSMutableSet set]; [allPlanets unionSet:planets1];
    [allPlanets unionSet:planets2];
    NSLog( @"allPlanets: %@", allPlanets );
    NSMutableSet* notPlanets = [NSSet setWithObject:@"Pluto"]; [allPlanets minusSet:notPlanets];
    NSLog( @"allPlanets: %@", allPlanets );
    NSMutableSet* overlap = [[allPlanets mutableCopy] autorelease]; [overlap intersectSet:planets1];
    NSLog( @"overlap: %@", overlap );

    // NSValue wraps primite C values into objective C objects.


    // NSDate calculates points in time.

    NSTimeZone* timeZone = [NSTimeZone systemTimeZone];
    NSInteger offset = [timeZone secondsFromGMTForDate:[NSDate date]]; NSInteger seconds = (( 60 * 60 * 24 * 365 ) - offset);

    NSDate* reference;
    reference = [NSDate dateWithTimeIntervalSinceReferenceDate:(-offset)];
    NSDate* targetDate;
    targetDate = [NSDate dateWithTimeIntervalSinceReferenceDate:seconds];
    NSLog( @"reference: %@", reference ); NSLog( @"targetDate: %@", targetDate );


// standard formatting.
    NSDateFormatter* formatter1 = [[NSDateFormatter alloc] init]; [formatter1 setLenient: YES];
    [formatter1 setDateStyle: NSDateFormatterShortStyle];
    [formatter1 setTimeStyle:
            NSString* dateString = NSDate* basicDate = NSString* formattedDate = NSLog( @"date only: NSLog( @"short formatted:
            NSDateFormatterShortStyle];
    @"March 24 2001 10:00am";
    [formatter1 dateFromString:dateString]; [formatter1 stringFromDate:basicDate]; %@", basicDate );
            %@", formattedDate );
    NSDateFormatter* formatter2 = [[NSDateFormatter alloc] init]; [formatter2 setLenient: YES];
    [formatter2 setDateStyle: NSDateFormatterLongStyle]; [formatter2 setTimeStyle: NSDateFormatterLongStyle]; formattedDate = [formatter2 stringFromDate: basicDate]; NSLog( @"long formatted: %@", formattedDate );
// relative formatting.
    NSDateFormatter* formatter3 = [[NSDateFormatter alloc] init]; [formatter3 setLenient: YES];
    [formatter3 setDoesRelativeDateFormatting: YES];
    [formatter3 setDateStyle: NSDateFormatterShortStyle]; [formatter3 setTimeStyle: NSDateFormatterShortStyle];
    NSTimeInterval oneDay = (60*60*24);
    NSDate* startDate = [NSDate date];
    NSDate* prevDate = [startDate dateByAddingTimeInterval: -oneDay]; NSDate* nextDate = [startDate dateByAddingTimeInterval: oneDay];
    NSString* startFormatted = [formatter3 stringFromDate: startDate]; NSString* prevFormatted = [formatter3 stringFromDate: prevDate]; NSString* nextFormatted = [formatter3 stringFromDate: nextDate]; NSLog( @"relative start: %@", startFormatted );
    NSLog( @"relative prev: %@", prevFormatted );

    // CFDateRef

    CFTimeZoneRef timeZone = CFTimeZoneCopyDefault(); CFAbsoluteTime current = CFAbsoluteTimeGetCurrent();
    CFTimeInterval offset = CFTimeZoneGetSecondsFromGMT( timeZone, current ); CFIndex seconds = (( 60 * 60 * 24 * 365 ) - offset);
    CFDateRef reference;
    reference = CFDateCreate( NULL, -offset );
    CFDateRef targetDate;
    targetDate = CFDateCreate( NULL, seconds );
    NSLog( @"reference: %@", reference ); NSLog( @"targetDate: %@", targetDate );
    CFRelease( timeZone ); CFRelease( reference ); CFRelease( targetDate );

    // THere's also CFDateFormatterRef
}
}
- (void) dictionaryWithRetainedKeys {
// start with standard callbacks, add custom retain option.
// // this will cause the keys to be retained instead of copied.
// CFDictionaryKeyCallBacks keyCallbacks;
    keyCallbacks = kCFCopyStringDictionaryKeyCallBacks; keyCallbacks.retain = CBRetainValue;
    CFMutableDictionaryRef dict;
    CFIndex capacity = 0;
    dict = CFDictionaryCreateMutable( NULL,
            capacity,
            &keyCallbacks, &kCFTypeDictionaryValueCallBacks );
    CFDictionarySetValue( dict, @"city", @"Palo Alto" ); }

//blocks
- (void)enumerateObjectsUsingBlock: (
        void (^) (id obj, NSUInteger idx, BOOL *stop)
) block {

}

- (void) retainCallbacksForArray {
    CFArrayCallBacks callbacks = kCFTypeArrayCallBacks;

    callbacks.retain = CBRetainValue;

    CFIndex capacity = 0; // no limit. CFMutableArrayRef array;

    array = CFArrayCreateMutable( NULL, capacity, &callbacks );

    // items are retained as they are added.

    CFArrayAppendValue( array, @"De Anza Blvd" );
    CFArrayAppendValue( array, @"Homestead Rd" );

    // works when cast to NSMutableArray as well.
    NSMutableArray* arrayObj = (NSMutableArray*)array;
    [arrayObj addObject: @"Sunnyvale Saratoga Rd"];
    [arrayObj addObject: @"Fremont Ave"];
    [arrayObj addObject: @"Stelling Rd"];

    NSLog( @"array: %@", array ); }
@end