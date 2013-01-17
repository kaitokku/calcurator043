//
//  calculatorValueStateMachineTests.m
//  calculator
//
//  Created by 中村　匡利 on 13/01/10.
//  Copyright (c) 2013年 Masatoshi Nakamura. All rights reserved.
//

#import "calculatorValueStateMachineTests.h"
#import "calculatorValueStateMachine.h"
#import "MockcalculatorViewContoroller.h"


calculatorValueStateMachine* e;
calculatorValueStateMachine* stateMachine;
MockcalculatorViewContoroller* mock;

@implementation calculatorValueStateMachineTests

- (void)setUp
{
    [super setUp];
    
    e = [[calculatorValueStateMachine alloc]init];

    mock = [[MockcalculatorViewContoroller alloc] init];
    [mock setTestCode:self];
    [mock viewDidLoad];
    [mock setDone:false];
    stateMachine = [mock Vmodel];

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

- (void)testSetStateToNatural
{
    [e setState:Natural];
    STAssertEquals(Natural, [e state], @"state is not Hello");
}

- (void)testSetStateToDecimal
{
    [e setState:Decimal];
    STAssertEquals(Decimal, [e state], @"state is not Hello");
}


/*
 Natural 状態の時に decimal メソッドを呼び出す(小数点を押す)テスト
*/
 
- (void)testdecimalNAT
{
    [stateMachine setState:Natural]; // 整数状態の時
    [mock setWillDEC:true]; // setTextDecimal が呼ばれる
    [mock setWillNAT:false]; // setTextNatural は呼ばれない
    [mock decimal:self];
    STAssertEquals(Decimal, [stateMachine state], @"state is not Decimal"); // decimalのあと Decimal 状態に
    STAssertTrue([mock done], @"setTextDecimal is not called."); // setTextDecimal が呼ばれているか確認
}

/*
 Decimal 状態の時に A メソッドを呼び出す(CAを押す)テスト
 */
 
- (void)testAllClearDEC
{
    [stateMachine setState:Decimal];
    [mock setWillDEC:false];
    [mock setWillNAT:true];
    [mock ClearAll:self];
    STAssertEquals(Natural, [stateMachine state], @"state is not Natural");
    STAssertTrue([mock done], @"setTextNatural is not called.");
}

@end
