//
//  calculatorValueStateMachineTests.m
//  calculator
//
//  Created by 中村　匡利 on 13/01/10.
//  Copyright (c) 2013年 Masatoshi Nakamura. All rights reserved.
//

#import "calculatorValueStateMachineTests.h"
#import "calculatorValueStateMachine.h"
#import "calculatorViewController.h"


@implementation calculatorValueStateMachineTests

calculatorValueStateMachine* e;

- (void)setUp
{
    [super setUp];
    
    e = [[calculatorValueStateMachine alloc]init];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}


-(void)testNaturalValue
{
    double inputN = 2.0;
    double value = 0.0;
    double output = [e ValueInputNAT:value NTmp:inputN];
    STAssertEqualsWithAccuracy(2.0, output, 0.00001, @"Natural error");
}

-(void)testDecimalValue
{
    double inputD = 2.0;
    double value = 0.0;
    int Dplace = -1;
    double output = [e ValueInputDEC:value DTmp:inputD TDplace:Dplace];
    STAssertEqualsWithAccuracy(0.2, output, 0.00001, @"Decimal error");
}


@end
