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


/*
- (void)testExample
{
    [stateMachine setState:Natural];
    
    int inputN = 0;
    
    [e ChangeValueType:inputN controller:void];
    
    Nvalue = [calculatorValueStateMachine value];
    
    STAssertEqualsWithAccuracy(inputN, [calculatorValueStateMachine value], 0.00001, @"Natural error");
}


- (void)testSetStateToNatural
{
    [stateMachine setState:Natural];
    STAssertEquals(Natural, [stateMachine state], @"state is not Natural");
}

- (void)testSetStateToDecimal
{
    [stateMachine setState:Decimal];
    STAssertEquals(Decimal, [stateMachine state], @"state is not Decimal");
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
*/

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
