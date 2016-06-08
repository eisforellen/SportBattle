//
//  Player.h
//  SportBattle
//
//  Created by Ellen Mey on 6/7/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatsAndRankings.h"

@interface Player : NSObject <StatsAndRankings>

@property (strong, nonatomic) NSString *playerName;
@property (strong, nonatomic) NSString *position;
@property int wins;
@property int losses;
@property int goals;
@property int assists;

-(id)initWithName:(NSString *)name;

@end
