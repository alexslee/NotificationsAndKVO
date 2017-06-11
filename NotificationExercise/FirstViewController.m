//
//  FirstViewController.m
//  NotificationExercise
//
//  Created by Alex Lee on 2017-06-11.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self stepperTapped:self.stepper];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperTapped:(UIStepper *)sender {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithFloat:self.stepper.value], @"StepperValue", nil];
    
    NSNotification *notification = [[NSNotification alloc] initWithName:@"StepperWasTapped" object:self userInfo:dictionary];
    
    [notificationCenter postNotification:notification];
}

@end
