//
//  YouTubeVideoViewController.m
//  YouTubeVideoPlayer
//
//  Created by 이 승환 on 13. 8. 30..
//  Copyright (c) 2013년 thomas. All rights reserved.
//

#import "YouTubeVideoViewController.h"

@interface YouTubeVideoViewController ()

@property (weak, nonatomic) IBOutlet    UIWebView   *webView;
@property (weak, nonatomic) IBOutlet    UIButton    *playBtn;

@property (assign, nonatomic)           ExampleType type;

@end

@implementation YouTubeVideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withType:(ExampleType)type
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _type = type;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    NSString *typeString[] = {  @"inline play",
                                @"play in full screen",
                                @"autoplay",
                                @"control playback"};

    self.title = typeString[_type];
    
    
    switch (_type) {
        case ExampleType_PlayInLine:
        {
            _webView.allowsInlineMediaPlayback = YES;
            
            NSString *htmlString = @"<body style=\"margin: 0px\"> \
            <iframe \
            webkit-playsinline \
            width=\"200\" \
            height=\"200\" \
            src=\"http://www.youtube.com/embed/sLSCpAKV-_4?feature=player_detailpage&playsinline=1\" \
            frameborder=\"0\"/> \
            </body>";
            
            [_webView loadHTMLString:htmlString baseURL:nil];

            break;
        }
            
        case ExampleType_PlayInFullScreen:
        {
            NSURL *url = [NSURL URLWithString:@"http://www.youtube.com/embed/sLSCpAKV-_4?feature=player_detailpage"];
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
            [_webView loadRequest:urlRequest];
            
            break;
        }
            
        case ExampleType_PlayAutomatically:
        {
            [_webView setMediaPlaybackRequiresUserAction:NO];
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"YouTubeVideoPlayAutomatically"
                                                                                ofType:@"html"] isDirectory:NO];
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
            [_webView loadRequest:urlRequest];

            break;
        }
            
        case ExampleType_ControlPlayback:
        {
            NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"YouTubeVideoControlPlayback"
                                                                                ofType:@"html"] isDirectory:NO];
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
            [_webView loadRequest:urlRequest];
            
            _playBtn.hidden = NO;

            break;
        }
            
        default:
            break;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapPlayBtn:(id)sender
{
    [_webView stringByEvaluatingJavaScriptFromString:@"ytPlayer.playVideo()"];
}

@end
