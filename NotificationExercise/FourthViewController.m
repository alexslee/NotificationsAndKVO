//
//  FourthViewController.m
//  NotificationExercise
//
//  Created by Alex Lee on 2017-06-11.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@property (weak, nonatomic) IBOutlet UIView *yellow;

@property (weak, nonatomic) IBOutlet WhiteView *white;

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panWhite;

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.white addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionNew context:nil];
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self forKeyPath:@"point" context:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"point"]) {
        id value = change [NSKeyValueChangeNewKey];
        NSValue *valueCast = (NSValue *)value;
        CGPoint point = valueCast.CGPointValue;
        
        CGFloat yellowX = self.yellow.center.x;
        CGFloat yellowY = self.yellow.center.y;
        
        yellowX += point.x;
        yellowY += point.y;
        
        CGPoint newCenter = CGPointMake(yellowX, yellowY);
        self.yellow.center = newCenter;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
