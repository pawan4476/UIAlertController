//
//  ViewController.h
//  Alertview Controller
//
//  Created by Nagam Pawan on 9/14/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSString *alertTitle;
    NSString *alertMesssage;
}

- (IBAction)alert:(id)sender;
- (IBAction)Delete:(id)sender;

@end

