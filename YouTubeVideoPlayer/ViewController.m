//
//  ViewController.m
//  YouTubeVideoPlayer
//
//  Created by 이 승환 on 13. 8. 30..
//  Copyright (c) 2013년 thomas. All rights reserved.
//

#import "ViewController.h"
#import "YouTubeVideoViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet    UITableView     *tableView;

@property (strong, nonatomic)           NSMutableArray  *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"YouTube Video Player";
    
    _dataSource = [NSMutableArray arrayWithObjects:
                   @(ExampleType_PlayInLine),
                   @(ExampleType_PlayInFullScreen),
                   @(ExampleType_PlayAutomatically),
                   @(ExampleType_ControlPlayback),
                   nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    }
    
    NSInteger type = [_dataSource[indexPath.row] integerValue];
    NSString *typeString[] = {  @"1. inline thumbnail, inline play",
                                @"2. inline thumbnail, play in full screen",
                                @"3. inline thumbnail, autoplay",
                                @"4. inline thumbnail, control playback"};
    
    
    cell.textLabel.text = typeString[type];

    return cell;
}


#pragma mark - UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YouTubeVideoViewController *ctrl = [[YouTubeVideoViewController alloc] initWithNibName:NSStringFromClass([YouTubeVideoViewController class]) bundle:nil withType:[_dataSource[indexPath.row] integerValue]];
    [self.navigationController pushViewController:ctrl animated:YES];
}


@end
