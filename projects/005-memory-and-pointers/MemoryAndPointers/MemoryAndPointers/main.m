/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#import <Cocoa/Cocoa.h>

float amounts[4];

//You cannot redeclare an array; once the size it set, it is set.
//float amounts[150];

float stuff[4] = {10.1, 11.1, 12.1, 13.1};

// C is clever enough to guess the array size.
float others[] = {10.1, 11.1, 12.1, 13.1};

int main(int argc, char *argv[]) {
    amounts[0] = 11.2;
    amounts[1] = 11.3;
    amounts[2] = 11.4;
    amounts[3] = 12.15;
    
    char words[5];
    words[0] = 'C';
    words[1] = 'o';
    words[2] = 'c';
    words[3] = 'o';
    words[4] = 'a';
    
    char anotherWords[] = {'C', 'o', 'c', 'o', 'a'};
    
    // A String is nothing but a null-terminated char array.
    char fullString[] = {'C', 'o', 'c', 'o', 'a', '\0'};
    
    char fullStringToo[] = "Cocoa";
        
    float hede = amounts[2];
    
    int cells[2][3];
    
    cells[1][2] = 12;
    
    int morecells[2][3] = {
                            {1, 2, 3},
                            {4, 5, 6}
                        };
    
    int  number = 4;
    int  otherNumber = 12;
    int* numberPointer = &number;
    
    // Update the value of what numberPointer points to.
    *numberPointer = 1000;
    
    printf("number %i \n", number);
    printf("number pointer %i \n", *numberPointer);
    printf("number pointer %i \n\n", numberPointer);
    
    number = 16;

    printf("number %i \n", number);
    printf("number pointer %i \n", *numberPointer);
    printf("number pointer %i \n\n", numberPointer);

    int startSpeed = 52;
    int maxSpeed   = 100;
    
    // mph is a pointer to a "const int".
    const int* mph = &startSpeed;
    
    // The below will give an error, since what mph points to
    // is read only (because of the `const`):
    // *mph = maxSpeed;
    
    // The below is okay though:
    
    mph = &maxSpeed;
    
    // Because pointers give you a level of indirection,
    // there are two ways of changing the value they point to:
    // modifying the value itself, or modifying what the
    // pointer points to. With a const pointer, you can't
    // change the value through the pointer, but you
    // can always point it at something else.
    
    // Dynamic Memory Allocation
    
    int* dynamicAllocation;
    int* start;
    
    start = dynamicAllocation = malloc(sizeof(int) * 10);
    
    *dynamicAllocation = 280;
    
    dynamicAllocation++;
    
    *dynamicAllocation = 121;
    
    dynamicAllocation += 2;
    
    //free(dynamicAllocation); -- will raise an error.
    //malloc: *** error for object 0x100100084: pointer being freed was not allocated
    
    free(start);
    
    // Strings and Dynamic Memory
    
    char* fullName;
    
    asprintf(&fullName, "Volkan Ozcelik");
    
    printf("%s \n", fullName);
    
    free(fullName);

    float ratio = 1.618;
    int   total = 12;
    char* res;
    
    asprintf(&res, "total: %i, ratio: %f", total, ratio);
    
    printf("%s\n", res);
    
    // "Dynamically" allocated memory will "not" go away
    // until you free it.
    free(res);
    
    char* first;
    char* second;
    char* third;
    char firstAr[] = "Hello";
    char secondAr[] = "world";
    char thirdAr[] = "Stars!";
    
    first  = &firstAr[0];
    second = &secondAr[0];
    third  = &thirdAr[0];

    // A dynamic array of strings.
    char* chars[] = {first, second, third};
    
    for (int i = 0; i < 3; i++) {
        printf("%s\n", chars[i]);
    }
    
    return NSApplicationMain(argc, (const char **)argv);
}
