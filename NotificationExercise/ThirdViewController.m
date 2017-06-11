//
//  ThirdViewController.m
//  NotificationExercise
//
//  Created by Alex Lee on 2017-06-11.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (readonly, nonatomic) CGFloat oldConstraint;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChangeFrameNotificationHandler:) name:UIKeyboardWillChangeFrameNotification object:nil];
    _oldConstraint = self.bottomConstraint.constant;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)keyboardDidChangeFrameNotificationHandler:(NSNotification *)notification;
{
    NSValue *value = notification.userInfo [UIKeyboardFrameEndUserInfoKey];
    CGRect rect = value.CGRectValue;
    CGFloat yPos = rect.origin.y;
    CGFloat viewHeight = self.view.bounds.size.height;
    self.bottomConstraint.constant = (yPos == viewHeight) ? self.oldConstraint : viewHeight - yPos;
}

- (IBAction)viewTapped:(UITapGestureRecognizer *)sender {
    [self.textField resignFirstResponder];
}

@end
