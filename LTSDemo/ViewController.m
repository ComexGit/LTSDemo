//
//  ViewController.m
//  LTSDemo
//
//  Created by yuqian on 2018/9/14.
//  Copyright © 2018年 yuqian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleBackgroundTask:) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void) handleBackgroundTask:(NSNotification*)notification
{
    UIApplication* app = [UIApplication sharedApplication];
    
    // 定义一个UIBackgroundTaskIdentifier类型（本质就是NSUInteger)的变量，
    // 该变量将作为后台任务的标示符
    __block UIBackgroundTaskIdentifier backTaskId;
    /* beginBackgroundTaskWithExpirationHandler: 方法默认请求额外获取3分钟的后台时间 */
   
    backTaskId = [app beginBackgroundTaskWithExpirationHandler:^{
      NSLog(@"===在额外申请的3分钟内依然没有完成任务===");  
        // 结束后台任务
        [app endBackgroundTask:backTaskId];
    }];
    
    if(backTaskId == UIBackgroundTaskInvalid)
    {
        NSLog(@"===iOS版本不支持后台运行，后台任务启动失败===");
        return;
    }
    
    NSLog(@"开始执行任务===额外申请的后台任务时间为：%f===", app.backgroundTimeRemaining);
    
    //不阻塞主线程
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        [self doAsyncJob:app backTaskId:backTaskId];
        
        NSBlockOperation *blockOp = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"结束执行任务===剩余的后台任务时间为：%f===", app.backgroundTimeRemaining);
        }];
        [NSOperationQueue.mainQueue addOperation:blockOp];
        
        // 结束后台任务
        [app endBackgroundTask:backTaskId];
    });
}

- (void) doAsyncJob:(UIApplication*)app backTaskId:(NSUInteger)backTaskId {
 
        // 其他内存清理的代码也可在此处完成
        for(int i = 0 ; i < 10 ; i ++)
        {
            NSLog(@"下载任务完成了%d%%" , i );
            // 暂停10秒模拟正在执行后台下载
            [NSThread sleepForTimeInterval:1];
        }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
