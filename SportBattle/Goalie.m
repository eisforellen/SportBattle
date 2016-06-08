//
//  Goalie.m
//  SportBattle
//
//  Created by Ellen Mey on 6/7/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import "Goalie.h"

@implementation Goalie

-(int)savePercentage{
    //add math for save percentage
    int savePercent = self.saves / self.shotsFaced;
    return savePercent;
}



@end
