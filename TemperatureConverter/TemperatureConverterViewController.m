//
//  TemperatureConverterViewController.m
//  TemperatureConverter
//
//  Created by Anshu Veda Jain on 8/4/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\anshuv. All rights reserved.
//

#import "TemperatureConverterViewController.h"

@interface TemperatureConverterViewController ()
-(void) synchronizeTemperatureValues;
@end


@implementation TemperatureConverterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.celsiusTextField.text=blankString;
    self.fahrenheitTextField.text=blankString;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Static Resources

static NSString * const blankString = @"";
/*+ (void) clearTextField:(UITextField *)textField {
    textField.text = blankString;
}*/


#pragma mark - Private Methods

// Target Action for TextField to clear the counterpart
- (IBAction)clicked:(UITextField *)sender {
    NSLog(@"Sender is: %@", sender);
    if ([sender isEqual:self.fahrenheitTextField])
        self.celsiusTextField.text = blankString;
    else if ([sender isEqual:self.celsiusTextField])
        self.fahrenheitTextField.text = blankString;
;
}

// Target Action for the Convert Button
- (IBAction)doConversion:(UIButton *)sender {
    sender.selected = NO;
    [self.fahrenheitTextField endEditing: YES];
    [self.celsiusTextField endEditing: YES];
    [self synchronizeTemperatureValues];
    
}

-(void) synchronizeTemperatureValues
{
    float celsisusValue = [self.celsiusTextField.text floatValue];
    float fahrenheitValue = [self.fahrenheitTextField.text floatValue];
    
    if([self.celsiusTextField.text isEqualToString:blankString]) {
        NSLog(@"Fahreneit input, update celsius");
        celsisusValue=(fahrenheitValue - 32.0)*100.0/180.0;
        self.celsiusTextField.text = [NSString stringWithFormat:@"%0.1f",celsisusValue];
    } else if ([self.fahrenheitTextField.text isEqualToString:blankString]) {
        NSLog(@"Celsius input, update Fahreneit");
        fahrenheitValue = (celsisusValue * 180.0/100.0) + 32.0;
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%.1f",fahrenheitValue];
    }

}

@end
