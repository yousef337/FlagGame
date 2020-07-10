//
//  ViewControllerVeryHardLeval.h
//  aBigHomeWork.yousef
//
//  Created by yousef on 1/4/1437 AH.
//  Copyright © 1437 yousef. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewControllerVeryHardLeval : UIViewController <AVAudioPlayerDelegate>{
    
    NSArray*arrayRandomPicharHome;
    UIButton *gameButtone;
    UIButton *homeButtone;
    NSTimer* timerLine;
    NSTimer* gameShom;
    NSTimer* moveIfDontClik;
    NSTimer* goToTimer;
    UILabel* point;
    NSTimer* finishTimerLine;
    NSTimer* finsh;
    UIView *myTimerView;
    NSMutableArray* erorUp;
    NSTimer* goToUp;
    NSArray *myImages;
    NSTimer* erorToUp;
    AVAudioPlayer* myAudioPlayer;
    int xPocLeftImage;
    int YPocLeftImage;

}


@end
