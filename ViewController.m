//
//  ViewController.m
//  H265VideoDemo
//
//  Created by apple on 2017/8/24.
//  Copyright © 2017年 Bingo.com. All rights reserved.
//

#import "ViewController.h"
#import <VideoToolbox/VideoToolbox.h>
#import <VideoToolboxPlus/VideoToolboxPlus.h>
@interface ViewController ()<VTPCompressionSessionDelegate>

@property (nonatomic, strong) VTPCompressionSession *session;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGSize size = self.view.bounds.size;
    NSError *err = nil;
    self.session = [[VTPCompressionSession alloc] initWithWidth:size.width height:size.height codec:kCMVideoCodecType_H264 error:&err];
    
    
    if (err) {
        NSLog(@"%@",[err localizedDescription]);
        return;
    }
        
    [self.session setDelegate:self queue:dispatch_get_main_queue()];
    [self.session prepare];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
