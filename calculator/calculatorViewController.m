//
//  calculatorViewController.m
//  calculator
//
//  Created by 中村　匡利 on 12/10/26.
//  Copyright (c) 2012年 Masatoshi Nakamura. All rights reserved.
//

#import "calculatorViewController.h"

#define DecMark -1

@interface calculatorViewController ()

@end

@implementation calculatorViewController

@synthesize Vmodel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    Vmodel = [[calculatorValueStateMachine alloc] init];
    [Vmodel setState:Natural];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)button0:(id)sender {
    [Vmodel ChangeValueType:0 controller:self];
}

- (IBAction)button1:(id)sender {
    [Vmodel ChangeValueType:1 controller:self];
}

- (IBAction)button2:(id)sender {
    [Vmodel ChangeValueType:2 controller:self];
}

- (IBAction)button3:(id)sender {
    [Vmodel ChangeValueType:3 controller:self];
}

- (IBAction)button4:(id)sender {
    [Vmodel ChangeValueType:4 controller:self];
}

- (IBAction)button5:(id)sender {
    [Vmodel ChangeValueType:5 controller:self];
}

- (IBAction)button6:(id)sender {
    [Vmodel ChangeValueType:6 controller:self];
}

- (IBAction)button7:(id)sender {
    [Vmodel ChangeValueType:7 controller:self];
}

- (IBAction)button8:(id)sender {
    [Vmodel ChangeValueType:8 controller:self];
}

- (IBAction)button9:(id)sender {
    [Vmodel ChangeValueType:9 controller:self];
}

- (IBAction)decimal:(id)sender {
    [Vmodel ChangeValueType:DecMark controller:self];
}

- (IBAction)addition:(id)sender {

}

- (IBAction)subtraction:(id)sender {
    NSLog(@"pushedSub");
}

- (IBAction)multiplication:(id)sender {
    NSLog(@"pushedMul");
}

- (IBAction)division:(id)sender {
    NSLog(@"pushedDiv");
}

- (IBAction)clear:(id)sender {
    NSLog(@"pushedC");
}

- (IBAction)ClearAll:(id)sender {
    
    [Vmodel Valini:(id)sender controller:self];
}

- (IBAction)equal:(id)sender {
    NSLog(@"pushedEq");
}



-(void)setTextNatural:(double)nat
{
    tmp = nat;
    [[self label] setText:[NSString stringWithFormat:@"%d",tmp]];
}

-(void)setTextDecimal:(double)dec
{
    [[self label] setText:[NSString stringWithFormat:@"%f",dec]];
}

-(void)setTextExponent:(double)exp
{
    [[self label] setText:[NSString stringWithFormat:@"%e",exp]];
}




@end
