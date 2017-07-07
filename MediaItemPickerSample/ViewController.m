//
//  ViewController.m
//  MediaItemPickerSample
//
//  Created by y.naito on 2017/07/07.
//  Copyright © 2017年 y.naito. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property MPMusicPlayerController* player;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.player = [MPMusicPlayerController applicationMusicPlayer];
}

- (IBAction)pick:(id)sender {
    NSLog(@"naito : pick!");
    // MPMediaPickerControllerのインスタンスを作成
    MPMediaPickerController *picker = [[MPMediaPickerController alloc]init];
    // ピッカーのデリゲートを設定
    picker.delegate = self;
    // 複数選択を不可にする。（YESにすると、複数選択できる）
    picker.allowsPickingMultipleItems = NO;
    // ピッカーを表示する
    [self presentViewController:picker animated:YES completion:nil];
}

// メディアアイテムピッカーでアイテムを選択完了したときに呼び出される
- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection
{
    NSLog(@"naito : mediaPicker!");
    // 選択した曲情報がmediaItemCollectionに入っているので、これをplayerにセット。
    [self.player setQueueWithItemCollection:mediaItemCollection];
    // 再生開始
    [self.player play];
    // ピッカーを閉じ、破棄する
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

//選択がキャンセルされた場合に呼ばれる
- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    NSLog(@"naito : mediaPickerDidCancel!");
    
    // ピッカーを閉じ、破棄する
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)pushPlay:(id)sender {
    NSLog(@"naito : pushPlay!");
    [self.player play];
}
- (IBAction)pushPause:(id)sender {
    NSLog(@"naito : pushPause!");
    [self.player pause];
}
- (IBAction)pushStop:(id)sender {
    NSLog(@"naito : pushStop!");
    
    [self.player stop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
