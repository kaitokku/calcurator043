//
//  MockcalculatorViewContoroller.h
//  calculator
//
//  Created by 中村　匡利 on 13/01/17.
//  Copyright (c) 2013年 Masatoshi Nakamura. All rights reserved.
//

#import "calculatorViewController.h"

#import <SenTestingKit/SenTestingKit.h>

@interface MockcalculatorViewContoroller : calculatorViewController

@property SenTestCase* testCode;

@property bool willNAT;

@property bool willDEC;

@property bool done;

-(void)failWithException:(NSException *) e;

@end
