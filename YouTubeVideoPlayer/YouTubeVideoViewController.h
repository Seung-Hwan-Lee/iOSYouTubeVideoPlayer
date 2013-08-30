//
//  YouTubeVideoViewController.h
//  YouTubeVideoPlayer
//
//  Created by 이 승환 on 13. 8. 30..
//  Copyright (c) 2013년 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ExampleType_PlayInLine,
    ExampleType_PlayInFullScreen,
    ExampleType_PlayAutomatically,
    ExampleType_ControlPlayback,
} ExampleType;

@interface YouTubeVideoViewController : UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withType:(ExampleType)type;

@end
