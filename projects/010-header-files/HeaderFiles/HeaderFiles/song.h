/*
 *  This program is distributed under
 *  the terms of the MIT license.
 *  Please see the LICENSE file for details.
 */

#ifndef HeaderFiles_song_h
#define HeaderFiles_song_h

    typedef struct {
        char* title;
        int lengthInSeconds;
        int yearRecorded;
    } Song;

    Song createSong (char* title, int length, int year);
    void displaySong(Song theSong);

#endif
