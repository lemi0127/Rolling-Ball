//
//  ViewController.m
//  Rolling Ball
//
//  Created by Alicia Lemieux on 2016-03-30.
//  Copyright © 2016 info.alicialemieux. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButton:(id)sender {
    [self performSegueWithIdentifier:@"segue1" sender:self];
}

@end
