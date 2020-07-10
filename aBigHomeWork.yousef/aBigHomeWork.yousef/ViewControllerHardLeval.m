//
//  ViewControllerHardLeval.m
//  aBigHomeWork.yousef
//
//  Created by yousef on 1/4/1437 AH.
//  Copyright © 1437 yousef. All rights reserved.
//

#import "ViewControllerHardLeval.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewControllerHardLeval ()

@end

@implementation ViewControllerHardLeval

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"starViewDidLoad");
    
    arrayRandomPicharHome = [[NSArray alloc]initWithObjects:
                             @"arabia.jpg",
                             @"Brazil.gif",
                             @"germany-flag-desktop-hd-wallpaper-for-background-full-free.jpg",
                             @"FLAG_2007_09_28_16_40_51_UNITED_ARAB_EMIRATES.bmp",
                             @"Flag_of_Jordan.png",
                             @"images.png",
                             @"india-flag-1280x768.jpg",
                             @"turkishflag_big.jpg",
                             @"south_africa_1.png",
                             nil];
    
    point = [[UILabel alloc] initWithFrame: CGRectMake([self randomValueBetweenX:0 and:270],    [self randomValueBetweenY:158 and:440]
                                                       ,100,100)];
    point.text = @"100+";
    
    [self createButtoneHome];
    [self timer];
    
    erorUp = [[NSMutableArray alloc] init];

    NSLog(@"StarTimeLine");
    
    timerLine =[NSTimer scheduledTimerWithTimeInterval:0.3
                                                target:self
                                              selector:@selector(timerIm)
                                              userInfo:nil
                                               repeats:NO];
}

-(void)timer{
    
    NSLog(@"StartGameShowTimer");
    
    gameShom = [NSTimer scheduledTimerWithTimeInterval:0.3
                                                target:self
                                              selector:@selector(gamebuttone)
                                              userInfo:nil
                                               repeats:NO];
    
}

-(void)createButtoneHome{
    NSLog(@"CreatHomeFlag");
    homeButtone = [[UIButton alloc]initWithFrame:CGRectMake(260,70,70,60)];
    [homeButtone setImage:[UIImage imageNamed:[arrayRandomPicharHome objectAtIndex:[self randomValueBetweenArray:0 and:arrayRandomPicharHome.count -1]]] forState:UIControlStateNormal];
    homeButtone.showsTouchWhenHighlighted = YES;
    [self.view addSubview:homeButtone];
}

-(void)gameButtoneActionStart{
    
    if ([gameButtone.imageView.image  isEqual: homeButtone.imageView.image]) {
        NSLog(@"No you are lose");
        
        if ([timerLine isValid]) {
            
            [timerLine invalidate];
            timerLine = nil;
        }
        
        if ([gameShom isValid]) {
            
            [gameShom invalidate];
            gameShom = nil;
        }
        
        if ([moveIfDontClik isValid]) {
            
            [moveIfDontClik invalidate];
            moveIfDontClik = nil;
        }
        
        if ([goToTimer isValid]) {
            
            [goToTimer invalidate];
            goToTimer = nil;
        }
        
        if ([finishTimerLine isValid]){
            [finishTimerLine invalidate];
            finishTimerLine = nil;
        }
        
        if ([finsh isValid]) {
            [finsh invalidate];
            finsh = nil;
        }
        
        [myTimerView.layer removeAllAnimations];
        
        
        
        gameButtone.enabled = NO;
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"لقد خسرت"
                                                                                 message:@"للاسف لقد خسرت لانك ضغطت نفس الصوره فوق"
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *uLose = [UIAlertAction actionWithTitle:@"خروج"
                                                        style:UIAlertActionStyleDefault
                                                      handler:nil];
        [alertController addAction:uLose];
        [self presentViewController:alertController animated:YES completion:nil];

        
        //
        
        NSString* wrongAnswerALoseGame = [[NSBundle mainBundle] pathForResource:@"wrongAnswerALoseGame" ofType:@"mp3"];
        
        NSLog(@"wrongAnswerALoseGame path: %@",wrongAnswerALoseGame);
        
        
        myAudioPlayer = [[AVAudioPlayer alloc]
                         initWithContentsOfURL:[NSURL fileURLWithPath:wrongAnswerALoseGame]
                         error:NULL];
        [myAudioPlayer setDelegate:self];
        [myAudioPlayer setVolume:1.0];
        
        [myAudioPlayer play];
    }
    else{
        NSLog(@"comen you are good");
        
        [moveIfDontClik invalidate];
        
        moveIfDontClik = nil;
        
        gameButtone.hidden = YES;
        
        point.hidden= NO;
        
        NSLog(@"100+");
        
        
        [self.view addSubview:point];
        
        [self timer];
        
    }
    
}

-(void)mithodForFinshLoseGame{
    
    NSLog(@"No you are lose");
    
    if ([timerLine isValid]) {
        
        [timerLine invalidate];
        timerLine = nil;
    }
    
    if ([gameShom isValid]) {
        
        [gameShom invalidate];
        gameShom = nil;
    }
    
    if ([moveIfDontClik isValid]) {
        
        [moveIfDontClik invalidate];
        moveIfDontClik = nil;
    }
    
    if ([goToTimer isValid]) {
        
        [goToTimer invalidate];
        goToTimer = nil;
    }
    
    if ([finishTimerLine isValid]){
        [finishTimerLine invalidate];
        finishTimerLine = nil;
    }
    
    if ([finsh isValid]) {
        [finsh invalidate];
        finsh = nil;
    }
    
    [myTimerView.layer removeAllAnimations];
    
    
    
    gameButtone.enabled = NO;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"لقد خسرت"
                                                                             message:@"لقد استهلكت جميع الفرص ولقد تاخرت بالضغط فخسرت"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *uLose = [UIAlertAction actionWithTitle:@"خروج"
                                                    style:UIAlertActionStyleDefault
                                                  handler:nil];
    [alertController addAction:uLose];
    [self presentViewController:alertController animated:YES completion:nil];
    //
    
    NSString* wrongAnswerALoseGame = [[NSBundle mainBundle] pathForResource:@"wrongAnswerALoseGame" ofType:@"mp3"];
    
    NSLog(@"wrongAnswerALoseGame path: %@",wrongAnswerALoseGame);
    
    
    myAudioPlayer = [[AVAudioPlayer alloc]
                     initWithContentsOfURL:[NSURL fileURLWithPath:wrongAnswerALoseGame]
                     error:NULL];
    [myAudioPlayer setDelegate:self];
    [myAudioPlayer setVolume:1.0];
    
    [myAudioPlayer play];
}

-(void)gamebuttone{
    
    
    NSLog(@"create Randomly Flags");
    point.hidden=YES;
    gameButtone = [[UIButton alloc]initWithFrame:CGRectMake([self randomValueBetweenX:0 and:270],    [self randomValueBetweenY:178 and:445]
                                                            ,80,60)];
    
    [gameButtone setImage:[UIImage imageNamed:[arrayRandomPicharHome objectAtIndex:[self randomValueBetweenArray:0 and:arrayRandomPicharHome.count -1]]] forState:UIControlStateNormal];
    
    moveIfDontClik =[NSTimer scheduledTimerWithTimeInterval:0.8
                                                     target:self
                                                   selector:@selector(moveInNoClik)
                                                   userInfo:nil
                                                    repeats:NO];
    
    [gameButtone addTarget:self
                    action:@selector(gameButtoneActionStart)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:gameButtone];
    
    
}


-(void)moveInNoClik{
    
    xPocLeftImage=0;
    YPocLeftImage=70;
    
    NSLog(@"User Dont Clike FLAG Go To Uo");


    goToTimer = [NSTimer scheduledTimerWithTimeInterval:0.2
                                                 target:self
                                               selector:@selector(timer)
                                               userInfo:nil
                                                repeats:NO];
    //   ANIMATION     //
    
    [erorUp addObject:gameButtone.imageView.image];

    if ([gameButtone.imageView.image  isEqual: homeButtone.imageView.image]) {
        
        gameButtone.hidden = YES;
        [erorUp removeObject:gameButtone.imageView.image];
    }
    

    if (erorUp.count == 2){

        NSLog(@"eror2");
        
        xPocLeftImage = 100;
        
        [self mithodForFinshLoseGame];
        
    }
    
    //
    NSLog(@"erorIs, %lu",(unsigned long)erorUp.count);

    NSLog(@"starting animeation");
    CGRect imageFrame = gameButtone.frame;
    imageFrame.origin.x = xPocLeftImage;
    imageFrame.origin.y = YPocLeftImage;
    
    //a. Start animation code
    gameButtone.enabled = NO;
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:3];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationRepeatCount:0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    gameButtone.frame = imageFrame;
    
    [UIView commitAnimations];
    
}

- (int)randomValueBetweenX:(int)min and:(int)max {
    
    NSLog(@"starting Random X");
    
    return (int)(min + arc4random_uniform(max - min + 1));
}
- (int)randomValueBetweenY:(int)min and:(int)max {
    
    NSLog(@"starting Random Y");
    
    return (int)(min + arc4random_uniform(max - min + 1));
}

- (int)randomValueBetweenArray:(int)min and:(int)max {
    NSLog(@"start Randomly Flags");
    return (int)(min + arc4random_uniform(max - min + 1));
}

-(void)timerIm{
    
    myTimerView = [[UIView alloc] initWithFrame:CGRectMake(0,140, 375, 22)];
    myTimerView.backgroundColor =[UIColor redColor];
    [self.view addSubview:myTimerView];
    
    [UIView animateWithDuration:45.0 animations:^ {
        
        myTimerView.frame = CGRectMake(0,140,
                                0,
                                myTimerView.frame.size.height);
    }
     
    completion:^(BOOL finished){
        
        if (finished) {
            
            NSLog(@"FTLM");
            
            [self performSelector:@selector(finshGame) withObject:nil afterDelay:0.1];
        }
        
     }
     ];
    
    }


-(void)finshGame{
    
    if ([timerLine isValid]) {
        
        [timerLine invalidate];
        timerLine = nil;
    }
    
    if ([gameShom isValid]) {
        
        [gameShom invalidate];
        gameShom = nil;
    }
    
    if ([moveIfDontClik isValid]) {
        
        [moveIfDontClik invalidate];
        moveIfDontClik = nil;
    }
    
    if ([goToTimer isValid]) {
        
        [goToTimer invalidate];
        goToTimer = nil;
    }
    
    
    point.hidden = YES;
    gameButtone.enabled = NO;
    
    NSLog(@"---");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"لقد فزت"
                                                                             message:@"مبرووك لقد فزت "
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionOk = [UIAlertAction actionWithTitle:@"خروج"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil]; //You can use a block here to handle a press on this button
    [alertController addAction:actionOk];
    [self presentViewController:alertController animated:YES completion:nil];
    //
    NSString* audioFinshAndWin = [[NSBundle mainBundle] pathForResource:@"winSonud" ofType:@"mp3"];
    
    NSLog(@"audioFinshAndWin path: %@",audioFinshAndWin);
    
    
     myAudioPlayer = [[AVAudioPlayer alloc]
                     initWithContentsOfURL:[NSURL fileURLWithPath:audioFinshAndWin]
                     error:NULL];
    [myAudioPlayer setDelegate:self];
    [myAudioPlayer setVolume:0.1];
    
    [myAudioPlayer play];

    
}
-(void)viewDidDisappear:(BOOL)animated{

    NSLog(@"No you are lose");
    
    if ([timerLine isValid]) {
        
        [timerLine invalidate];
        timerLine = nil;
    }
    
    if ([gameShom isValid]) {
        
        [gameShom invalidate];
        gameShom = nil;
    }
    
    if ([moveIfDontClik isValid]) {
        
        [moveIfDontClik invalidate];
        moveIfDontClik = nil;
    }
    
    if ([goToTimer isValid]) {
        
        [goToTimer invalidate];
        goToTimer = nil;
    }
    
    if ([finishTimerLine isValid]){
        [finishTimerLine invalidate];
        finishTimerLine = nil;
    }
    
    if ([finsh isValid]) {
        [finsh invalidate];
        finsh = nil;
    }
    
    [myTimerView.layer removeAllAnimations];
    
    
    
    gameButtone.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
