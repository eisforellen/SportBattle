//
//  StatsAndRankings.h
//  SportBattle
//
//  Created by Ellen Mey on 6/7/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StatsAndRankings <NSObject>

@optional
-(float)winPercentage;
-(float)goalsPerGame;
-(int)playerRating;

@end
