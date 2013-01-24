//
//  calculatorValueStateMachine.h
//  calculator
//
//  Created by 中村　匡利 on 12/11/29.
//  Copyright (c) 2012年 Masatoshi Nakamura. All rights reserved.
//

#import <Foundation/Foundation.h>

@class calculatorViewController;

@interface calculatorValueStateMachine : NSObject
{
    int place, Dplace, PushedEq, PushedCul;
    double value, buff;
}

@property enum {Natural, Decimal} valstate;

@property enum {DEF, ADD, SUB, MUL, DIV} calstate;

-(void)ChangeValueType:(char)Input controller:(calculatorViewController*)controller;

-(void)ChangeToDecimal:(calculatorViewController*)controller;

-(void)ChangeCalcuType:(char)InputCalcu controller:(calculatorViewController*)controller;

-(void)PushEqual:(calculatorViewController *)controller;

-(void)Clear:(id)sender controller:(calculatorViewController*)controller;

-(void)Valini:(id)sender controller:(calculatorViewController*)controller;

-(double)ValueInputNAT:(double)Tvalue NTmp:(double)NTmp;

-(double)ValueInputDEC:(double)Tvalue DTmp:(double)DTmp TDplace:(int)TDplace;

@end
