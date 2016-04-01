//
//  SecondViewController.m
//  Rolling Ball
//
//  Created by Alicia Lemieux on 2016-03-30.
//  Copyright © 2016 info.alicialemieux. All rights reserved.
//

#import "SecondViewController.h"

#define FRAMES_UNTIL_FIRED 1
#define BALL_SPEED 10

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ballImage;

@property float xMove;
@property float yMove;

@property CADisplayLink * timer;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(_timer == nil)
    {
        _timer = [NSClassFromString(@"CADisplayLink") displayLinkWithTarget:self selector:@selector(loopingFunction)];
        
        [_timer setFrameInterval:FRAMES_UNTIL_FIRED];
        [_timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loopingFunction{
    
    if(_xMove!=0 || _yMove!=0)
    {
        float newX = _ballImage.center.x + _xMove;
        float newY = _ballImage.center.y + _yMove;
        
        int halfImage = _ballImage.frame.size.width/2;
        
        if(newY > self.view.frame.size.height - halfImage){
            newY = self.view.frame.size.height - halfImage;
        }
        
        if(newY < halfImage){
            newY = halfImage;
        }
        
        if(newX > self.view.frame.size.width - halfImage){
            newX = self.view.frame.size.width - halfImage;
        }
        
        if(newX < halfImage){
            newX = halfImage;
        }
        
        
        
        [_ballImage setCenter:CGPointMake(newX, newY)];
    }
    
    
}

- (IBAction)backButton:(id)sender {
    [_timer invalidate];
    _timer=nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)upButtonPressed:(id)sender {
    _yMove -= BALL_SPEED;
}

- (IBAction)upButtonReleased:(id)sender {
    _yMove = 0;
}


- (IBAction)downButtonPressed:(id)sender {
    _yMove += BALL_SPEED;
}

- (IBAction)downButtonReleased:(id)sender {
    _yMove = 0;
}


- (IBAction)leftButtonPressed:(id)sender {
    _xMove -= BALL_SPEED;
}

- (IBAction)leftButtonReleased:(id)sender {
    _xMove = 0;
}


- (IBAction)rightButtonPressed:(id)sender {
    _xMove += BALL_SPEED;
}

- (IBAction)rightButtonReleased:(id)sender {
    _xMove = 0;
}


@end
