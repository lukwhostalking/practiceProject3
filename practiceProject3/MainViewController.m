//
//  MainViewController.m
//  practiceProject3
//
//  Created by ANUPRIYA AGRAWAL on 6/25/14.
//  Copyright (c) 2014 IshanBhalla. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *responseLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *btnGo;
- (IBAction)onGoBtn:(id)sender;
- (IBAction)onEditingChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
- (void) checkResponse;
- (IBAction)onAction:(id)sender;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.responseLabel.text = @"Hello";
    self.btnGo.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onGoBtn:(id)sender {
    [self.loadingIndicator startAnimating];
    [self performSelector:@selector (checkResponse) withObject:nil afterDelay:1];

}

- (IBAction)onEditingChanged:(id)sender {
    self.responseLabel.text = @"";
    if([self.inputField.text isEqualToString:@""])
    {
        self.btnGo.enabled = NO;
    }
    else
    {
        self.btnGo.enabled = YES;
    }
}
- (void) checkResponse
{
    [self.loadingIndicator stopAnimating];
    if ([[self.inputField.text lowercaseString] isEqualToString:@"hello"]) {
        self.responseLabel.text = @"Wassup?";
    }
    else if([self.inputField.text isEqualToString:@""])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ooops!!"
                                                            message:@"Type something and then press Go"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
        self.responseLabel.text = @"Go fuck yourself!";
    }
    
}

- (IBAction)onAction:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Yahoo" delegate:nil cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"boom" otherButtonTitles:@"1",@"2", nil];
    [actionSheet showInView:(self.view)];
}


@end
