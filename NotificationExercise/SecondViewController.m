//
//  SecondViewController.m
//  NotificationExercise
//
//  Created by Alex Lee on 2017-06-11.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation SecondViewController

//couldn't get it to work, so just coded the 0 in the viewDidLoad
- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stepCountDidChange:) name:@"StepperWasTapped" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countLabel.text = @"0";
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)stepCountDidChange:(NSNotification *)sender;
{
    self.countLabel.text = [NSString stringWithFormat:@"%.0lf",[[sender.userInfo objectForKey:@"StepperValue"] floatValue] ];
}


@end
