//
//  ViewController.m
//  TableDemo
//
//  Created by 周子翔 on 16/8/16.
//  Copyright © 2016年 zzx. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *listArray;

@end

@implementation ViewController
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.listArray[indexPath.row];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"TODETAIL"]) {
        DetailViewController *detailVC = [segue destinationViewController];
        NSString *name = self.listArray[self.tableView.indexPathForSelectedRow.row];
        
        detailVC.imageName =[[name lowercaseString]stringByAppendingString:@"_hphover.png"];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.listArray = @[@"Brewmaster",@"Dragon_knight",@"Wraith_king",@"Ursa",@"Earthshaker"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
