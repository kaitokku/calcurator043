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
    
    //演算子が入力された場合
    if(Input == -2 && value != NAN){
        buff = value;
        value = NAN;
        return;
    }
    
    place++;
    
    switch ([self state]){
        case Natural:
            value = [self ValueInputNAT:value NTmp:Input];
            break;
            
        case Decimal:
            Dplace--;
            value = [self ValueInputDEC:value DTmp:Input TDplace:Dplace];
            break;
    }
    
    if (place > 8){
        [controller setTextExponent:value];
    }else if(place <= 8){
        switch ([self state]) {
            case Natural:
                [controller setTextNatural:value];
                break;
                
            case Decimal:
                [controller setTextDecimal:value];
                break;
        }
    }
    return;
}

//小数点が入力された時に値を整数から小数に変更する
-(void)ChangeToDecimal:(calculatorViewController*)controller{
    [self setState:Decimal];
    [controller setTextDecimal:value];
    return;
}


-(double)ValueInputNAT:(double)Tvalue NTmp:(double)NTmp{
    return Tvalue * 10 + NTmp;
}

-(double)ValueInputDEC:(double)Tvalue DTmp:(double)DTmp TDplace:(int)TDplace{
    return Tvalue + DTmp * pow(10, TDplace);
}


-(void)Valini:(id)sender controller:(calculatorViewController*)controller{
    place = 0;
    Dplace = 0;
    value = 0;
    [controller setTextNatural:value];
    [self setState:Natural];
}

@end
