//
//  Goalie.h
//  SportBattle
//
//  Created by Ellen Mey on 6/7/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatsAndRankings.h"

@interface Goalie : NSObject <StatsAndRankings>

@property int wins;
@property int losses;
@property int saves;
@property int shotsFaced;

-(int)savePercentage;

@end
