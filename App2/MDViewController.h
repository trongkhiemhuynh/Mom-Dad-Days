//
//  ViewController.h
//  App2
//
//  Created by Khiem T. Huynh on 4/10/16.
//  Copyright © 2016 Khiem Huynh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface MDViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;

@property (strong, nonatomic) IBOutlet UILabel *lblResultMom;

@property (strong, nonatomic) IBOutlet UILabel *lblResultDad;

@property (strong, nonatomic) NSArray *arr;

@property (strong, nonatomic) AVAudioPlayer *backgroundMusic;

@end

