//
//  Player.m
//  SportBattle
//
//  Created by Ellen Mey on 6/7/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import "Player.h"

@implementation Player

-(id)initWithName:(NSString *)newName{
    self = [super init];
    if (self) {
        NSLog(@"init: %@", self);
        _playerName = newName;
    }
    return self;
}

// likely issues with floats and ints and maths

-(int)totalGames{
    if (self.wins > 0 || self.losses > 0){
        return self.wins + self.losses;
    } else {
        return 0;
    }
}

-(float)winPercentage{
    float winPercent;
    if (self.wins > 0 && [self totalGames] > 0){
        winPercent = self.wins / [self totalGames];
    } else {
        winPercent = 0;
    }
    return winPercent;
}
-(float)goalsPerGame{
    return self.goals / [self totalGames];
}
-(int)playerRating{
    int rating = [self winPercentage] + [self goals];
    return rating;
}


@end
