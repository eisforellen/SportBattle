//
//  DetailViewController.m
//  SportBattle
//
//  Created by Ellen Mey on 6/7/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.playerNameLabel.text = self.playerToEdit.playerName;
    self.currentStatsLabel.text = [NSString stringWithFormat:@"Wins: %d \n Losses: %d \n Goals: %d \n Assists: %d \n", _playerToEdit.wins, _playerToEdit.losses, _playerToEdit.goals, _playerToEdit.assists];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)updateButtonPressed:(id)sender {
    self.playerToEdit.wins += [_winsLabel.text intValue];
    self.playerToEdit.losses += [_lossesLabel.text intValue];
    self.playerToEdit.goals += [_goalsOrSavesLabel.text intValue];
    self.playerToEdit.assists += [_assistsOrShotsFacedLabel.text intValue];
    self.currentStatsLabel.text = [NSString stringWithFormat:@"Wins: %d \nLosses: %d \nGoals: %d \nAssists: %d \n", _playerToEdit.wins, _playerToEdit.losses, _playerToEdit.goals, _playerToEdit.assists];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
