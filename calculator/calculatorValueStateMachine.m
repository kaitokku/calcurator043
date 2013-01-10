//
//  calculatorValueStateMachine.m
//  calculator
//
//  Created by 中村　匡利 on 12/11/29.
//  Copyright (c) 2012年 Masatoshi Nakamura. All rights reserved.
//

#import "calculatorValueStateMachine.h"
#import "calculatorViewController.h"

@implementation calculatorValueStateMachine

@synthesize state;


-(void)ChangeValueType:(char)Input controller:(calculatorViewController*)controller{
    
    if (place == 0 && Input == 0) {
        [controller setTextNatural:value];
        return;
    }
    
    //小数点が入力された場合
    if (Input == -1){
        [self setState:Decimal];
        [controller setTextDecimal:value];
        return;
    }
    
    //演算子が入力された場合
    if(Input == -2 && value != NAN){
        buff = value;
        value = NAN;
        return;
    }
    
    place++;
    
    switch ([self state]){
        case Natural:
            value = value * 10 + Input;
            if (place <= 8){
                [controller setTextNatural:value];
            }
            break;
            
        case Decimal:
            Dplace--;
            value = value + Input * pow(10, Dplace);
            if (place <= 8){
                [controller setTextDecimal:value];
            }
            break;
    }
    
    if (place > 8){
        [controller setTextExponent:value];
    }
}

-(void)Valini:(id)sender controller:(calculatorViewController*)controller{
    place = 0;
    Dplace = 0;
    value = 0;
    [controller setTextNatural:value];
    [self setState:Natural];
}

@end
