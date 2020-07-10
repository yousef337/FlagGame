//
//  ViewControllerTatorialView.m
//  aBigHomeWork.yousef
//
//  Created by yousef on 1/11/1437 AH.
//  Copyright © 1437 yousef. All rights reserved.
//

#import "ViewControllerTatorialView.h"

@interface ViewControllerTatorialView ()

@end

@implementation ViewControllerTatorialView

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray* arrayPhotos =[[NSArray alloc]initWithObjects:
                           @"0.png",
                           @"1.png",
                           @"2.png",
                           @"3.png",
                           @"4.png",
                           nil];
    float xPositon = 0;
    
    //start Photo
    
    for (int x = 0; x < arrayPhotos.count; x++) {
        
        
        UIImageView* myImage = [[UIImageView alloc]initWithFrame:CGRectMake(xPositon,
                                                                            0,
                                                                            _myScroll.frame.size.width,
                                                                            _myScroll.frame.size.height)];
        
        
        NSString* myPhoto = [NSString stringWithFormat:@"%@.jpg",[arrayPhotos objectAtIndex:x] ];
        
        myImage.image = [UIImage imageNamed:myPhoto];
        
        myImage.tag = x + 100;
        
        [_myScroll addSubview:myImage];
        
        
        NSLog(@"xPositon before: %f",xPositon);
        
        xPositon = xPositon + _myScroll.frame.size.width;
        
        NSLog(@"xPositon after: %f",xPositon);
        
        NSLog(@"--------------");
        
    }
    
    _myScroll.contentSize = CGSizeMake(_myScroll.frame.size.width * arrayPhotos.count ,0);
    
    _myScroll.clipsToBounds = NO;
    _myScroll.scrollEnabled = YES;
    _myScroll.pagingEnabled = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
