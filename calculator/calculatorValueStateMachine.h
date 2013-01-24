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
    int place, Dplace;
    double value, buff;
}

@property enum State {Natural, Decimal} state;

-(void)ChangeValueType:(char)Input controller:(calculatorViewController*)controller;

-(void)ChangeToDecimal:(calculatorViewController*)controller;

-(void)Valini:(id)sender controller:(calculatorViewController*)controller;

-(double)ValueInputNAT:(double)Tvalue NTmp:(double)NTmp;

-(double)ValueInputDEC:(double)Tvalue DTmp:(double)DTmp TDplace:(int)TDplace;

@end
