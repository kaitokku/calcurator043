//
//  MockcalculatorViewContoroller.m
//  calculator
//
//  Created by 中村　匡利 on 13/01/17.
//  Copyright (c) 2013年 Masatoshi Nakamura. All rights reserved.
//



#import <SenTestingKit/SenTestingKit.h>
#import "MockcalculatorViewContoroller.h"

@interface MockcalculatorViewContoroller ()

@end

@implementation MockcalculatorViewContoroller

@synthesize willNAT, willDEC, done, testCode;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTextDecimal
{
    STAssertTrue(willDEC, @"unexpected setTextDecimal called.");
    if(willDEC)
        done = true;
}

- (void)setTextNatural
{
    STAssertTrue(willNAT, @"unexpected setTextNatural called.");
    if(willNAT)
        done = true;
}

- (void)failWithException: (NSException *) e
{
    [testCode failWithException:e];
}

@end
