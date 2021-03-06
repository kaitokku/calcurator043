//
//  calculatorViewController.h
//  calculator
//
//  Created by 中村　匡利 on 12/10/26.
//  Copyright (c) 2012年 Masatoshi Nakamura. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "calculatorValueStateMachine.h"

@interface calculatorViewController : UIViewController{
    int tmp;
}

@property (weak, nonatomic) IBOutlet UILabel *label;

//@property enum {NUM, ADD, SUB, MUL, DIV, CAL} state;

@property(readonly) calculatorValueStateMachine* Vmodel;

- (IBAction)button0:(id)sender;
- (IBAction)button1:(id)sender;
- (IBAction)button2:(id)sender;
- (IBAction)button3:(id)sender;
- (IBAction)button4:(id)sender;
- (IBAction)button5:(id)sender;
- (IBAction)button6:(id)sender;
- (IBAction)button7:(id)sender;
- (IBAction)button8:(id)sender;
- (IBAction)button9:(id)sender;

- (IBAction)decimal:(id)sender;

- (IBAction)addition:(id)sender;
- (IBAction)subtraction:(id)sender;
- (IBAction)multiplication:(id)sender;
- (IBAction)division:(id)sender;

- (IBAction)clear:(id)sender;
- (IBAction)ClearAll:(id)sender;

- (IBAction)equal:(id)sender;


/*数値表示*/
-(void)setTextNatural:(double)nat;
-(void)setTextDecimal:(double)dec;
-(void)setTextExponent:(double)exp;


@end
