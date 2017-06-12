//
//  WhiteView.m
//  NotificationExercise
//
//  Created by Alex Lee on 2017-06-11.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "WhiteView.h"

@implementation WhiteView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)panGesture:(UIPanGestureRecognizer *)sender {
    self.point = [sender translationInView:self];
    //NSLog(@"%@", NSStringFromCGPoint(self.point));
}

@end
