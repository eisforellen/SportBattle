//
//  HomeTableViewController.m
//  SportBattle
//
//  Created by Ellen Mey on 6/7/16.
//  Copyright © 2016 Ellen Mey. All rights reserved.
//

#import "HomeTableViewController.h"
#import "DetailViewController.h"
#import "Player.h"

@interface HomeTableViewController () <UIAlertViewDelegate>

@property (strong, nonatomic) NSMutableArray *playersArray;

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    
    // init an initial player to populate the array to get us going
    Player *player1 = [[Player alloc]initWithName:@"Pylon"];
    
    
    _playersArray = @[player1].mutableCopy;
    self.navigationItem.title = @"Player Statistics";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewPlayer:)];
    
    [super viewDidLoad];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)addNewPlayer:(UIBarButtonItem *)sender {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Add New Player"
                                  message:@"Enter Player Name"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                               handler:^(UIAlertAction * action) {
                                                   //Do Some action here
                                                   UITextField *playerName = alert.textFields.firstObject;
                                                   NSLog(@"New player name: %@", playerName.text);
                                                   NSString *newName = playerName.text;
                                                   Player *player1 = [[Player alloc]initWithName:newName];
                                                   [self.playersArray addObject:player1];
                                                   NSLog(@"New player list: %@", self.playersArray.description);
                                                   [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.playersArray.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
                                                   
                                               }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                                   }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Player Name";
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _playersArray.count ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //cell.textLabel.text = [_playersArray objectAtIndex:indexPath.row];
    Player *player1 = [_playersArray objectAtIndex:indexPath.row];
    cell.textLabel.text = player1.playerName;
    
    if ([player1 playerRating] > 0){
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", [player1 playerRating]];
    } else {
        cell.detailTextLabel.text = @"N/A";
    }
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *vc = segue.destinationViewController;
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
   // vc.playerNameLabelText = [self.playersArray objectAtIndex:indexPath.row];
    
    vc.playerToEdit = [self.playersArray objectAtIndex:indexPath.row];
}

- (IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue{
    DetailViewController *vc = unwindSegue.sourceViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    Player *player1 = [_playersArray objectAtIndex:indexPath.row];
    player1.wins = vc.playerToEdit.wins;
    player1.losses = vc.playerToEdit.losses;
    player1.goals = vc.playerToEdit.goals;
    player1.assists = vc.playerToEdit.assists;
   
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

 
@end
