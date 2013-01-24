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

@synthesize valstate;

@synthesize calstate;

//数字を押した際の動作
-(void)ChangeValueType:(char)Input controller:(calculatorViewController*)controller{
    if(PushedEq ==1){
        [self Valini:self controller:controller];
    }
    
    if (place == 0 && Input == 0) {
        [controller setTextNatural:value];
        return;
    }
    
    place++;
    
    switch ([self valstate]){
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
        switch ([self valstate]) {
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

//演算子を押した際の動作（イコールは別に用意）
//calstateの状態に応じた計算をした後に対応した状態に変換する
-(void)ChangeCalcuType:(char)InputCalcu controller:(calculatorViewController*)controller{
    if(PushedCul == 0){
        if(PushedEq == 0){
            [self PushEqual:controller];
        }
        buff = value;
        value = 0;
    }
    
    place = 0;
    Dplace = 0;
    PushedEq = 0;

    switch (InputCalcu) {
        case '+':
            [self setCalstate:ADD];
            break;
        case '-':
            [self setCalstate:SUB];
            break;
        case '*':
            [self setCalstate:MUL];
            break;
        case '/':
            [self setCalstate:DIV];
            break;
        default:
            break;
    }
    PushedCul = 1;
}

//イコールを押した際の動作
//前回押された演算子に応じて計算を行い数値を表示する
- (void)PushEqual:(calculatorViewController *)controller{
    PushedCul = 0;
    switch (calstate) {
        case ADD:
            value=buff+value;
            break;
        case SUB:
            value=buff-value;
            break;
        case MUL:
            value=buff*value;
            break;
        case DIV:
            value=buff/value;
            break;
        case DEF:
            break;
    }
    [controller setTextExponent:value];
    [self setValstate:Natural];
    PushedEq = 1;
}

//小数点を押した際の動作
//状態を整数から小数に変更する
-(void)ChangeToDecimal:(calculatorViewController*)controller{
    [self setValstate:Decimal];
    [controller setTextDecimal:value];
    return;
}

//入力された数値と表示されている数字を自然数として足し合わせて表示する数値を返す
-(double)ValueInputNAT:(double)Tvalue NTmp:(double)NTmp{
    return Tvalue * 10 + NTmp;
}

//入力された数値と表示されている数字を小数として足し合わせて表示する数値を返す
-(double)ValueInputDEC:(double)Tvalue DTmp:(double)DTmp TDplace:(int)TDplace{
    return Tvalue + DTmp * pow(10, TDplace);
}

//Cを押した際の動作
//CAを押した場合と違い何の演算子を入力したかと演算子を入力する前の数値だけは記憶したままそれ以外を初期化する
-(void)Clear:(id)sender controller:(calculatorViewController*)controller{
    if(PushedEq == 1){
        [self Valini:self controller:controller];
    }
    place = 0;
    Dplace = 0;
    value = 0;
    [self setValstate:Natural];
    [controller setTextNatural:value];
}

//CAを押した際の動作
//状態及び全数値を初期化して0を表示させる（CAを押した際の動作）
-(void)Valini:(id)sender controller:(calculatorViewController*)controller{
    place = 0;
    Dplace = 0;
    value = 0;
    buff = 0;
    PushedEq = 0;
    PushedCul = 0;
    [controller setTextNatural:value];
    [self setValstate:Natural];
    [self setCalstate:DEF];
}

@end
