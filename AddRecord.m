//
//  AddRecord.m
//  StoreUI
//
//  Created by Crack on 2/26/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "AddRecord.h"
#import "Item.h"

@interface AddRecord ()
@property (weak, nonatomic) IBOutlet UITextField *productAdd;
@property (strong, nonatomic) IBOutlet UIView *descriptionAdd;
@property (weak, nonatomic) IBOutlet UITextField *costAdd;
@property (weak, nonatomic) IBOutlet UIPickerView *numOnHandAdd;
@property NSMutableArray* data;

@end

@implementation AddRecord

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [[NSMutableArray alloc] init];
    for (int i = 0; i <= 100; i++)
        [self.data addObject:[NSString stringWithFormat:@"%d",i]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    return [self.data count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [self.data objectAtIndex:row];
}

#pragma mark TextField Delegate Methods

 -(BOOL) textFieldShouldReturn:(UITextField *)textField {
     [textField resignFirstResponder];
     Item* addProduct;
     if (textField == self.productAdd)
         [addProduct setName:textField.text];
     else if (textField == self.descriptionAdd) {
         [addProduct setDescription:textField.text];
     }
     else {
         float cost = [textField.text floatValue];
         [addProduct setRetailCost:cost];
     }
     [addProduct setProductImage:[UIImage imageNamed:@"black11.jpg"]];
     [self.secondProducts addObject:addProduct];
     return YES;
 }

@end
