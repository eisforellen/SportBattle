//
//  DetailViewController.h
//  SportBattle
//
//  Created by Ellen Mey on 6/7/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"


@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentStatsLabel;
@property (strong, nonatomic) IBOutlet UITextField *winsLabel;
@property (strong, nonatomic) IBOutlet UITextField *lossesLabel;
@property (strong, nonatomic) IBOutlet UITextField *goalsOrSavesLabel;
@property (strong, nonatomic) IBOutlet UITextField *assistsOrShotsFacedLabel;

@property NSString *playerNameLabelText;

@property(strong, nonatomic)Player *playerToEdit;

@end
