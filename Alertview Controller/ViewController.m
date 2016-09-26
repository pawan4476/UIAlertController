//
//  ViewController.m
//  Alertview Controller
//
//  Created by Nagam Pawan on 9/14/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    alertTitle = @"Text input Alert";
    alertMesssage = @"Plain and secure Text input";
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)alert:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle message:alertMesssage preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){textField.placeholder = NSLocalizedString(@"Login Email", @"Login");
        [textField addTarget:self action:@selector(alertTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = NSLocalizedString(@"Password", @"Password");
        textField.secureTextEntry = YES;
    }];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Login" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
    alertAction.enabled = NO;
    UIAlertAction *cancelAlert = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){}];
    [alertController addAction:cancelAlert];
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)Delete:(id)sender {
    UIAlertController *deleteBtn = [UIAlertController alertControllerWithTitle:@"Archive or Deele Data" message:@"Deleted data cannot be undone" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelaAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){}];
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){}];
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"Archive" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
    [deleteBtn addAction:cancelaAction];
    [deleteBtn addAction:deleteAction];
    [deleteBtn addAction:archiveAction];
    [self presentViewController:deleteBtn animated:YES completion:nil];
}
-(void)alertTextFieldDidChange: (UITextField *)sender{
    UIAlertController *controller = (UIAlertController *)self.presentedViewController;
    if (controller) {
        UITextField *login = controller.textFields.firstObject;
        UIAlertAction *ok = controller.actions.lastObject;
        ok.enabled = login.text.length > 2;
    }
}
@end
