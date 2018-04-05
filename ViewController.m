//
//  ViewController.m
//  StoreUI
//
//  Created by Crack on 2/25/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "ViewController.h"
#import "Item.h"
#import "AddRecord.h"

@interface ViewController () <AddRecordDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UITextField *productText;
@property (weak, nonatomic) IBOutlet UITextField *descriptionText;
@property (weak, nonatomic) IBOutlet UITextField *costText;
@property (weak, nonatomic) IBOutlet UIPickerView *numOnHandPicker;
@property (weak, nonatomic) IBOutlet UIButton *forwardInArray;
@property (weak, nonatomic) IBOutlet UIButton *backwardInArray;
- (Boolean)addItem:(NSString*)itemName description:(NSString*)itemDescription retailCost:(float)itemRetailCost wholesaleCost:(float)itemWholeSaleCost numSold:(int)itemNumSold numOnHand:(int)itemNumOnHand productIm:(UIImage *)productIm;
@property NSMutableArray* data ;
@property int objIndex;

@end

@implementation ViewController

-(IBAction)unwindHome:(UIStoryboardSegue *)segue {
}

- (void)passDataForward
{
    AddRecord *secondViewController = [[AddRecord alloc] init];
    secondViewController.secondProducts = products; // Set the exposed property
    secondViewController.delegate = self;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void)dataFromController:(NSMutableArray *)secondProducts
{
    products = secondProducts;
}

- (IBAction)backwardPress:(id)sender {
    self.objIndex--;
    if (self.objIndex <= 0)
        self.backwardInArray.enabled = NO;
    if (self.objIndex >= 0)
        self.forwardInArray.enabled = YES;
    [self loadObjectFromIndex:self.objIndex];
}

- (IBAction)forwardPress:(id)sender {
    self.objIndex++;
    if (self.objIndex <= 0)
        self.backwardInArray.enabled = NO;
    else
        self.backwardInArray.enabled = YES;
    if (self.objIndex == (int) products.count - 1) {
        self.forwardInArray.enabled = NO;
    }
    [self loadObjectFromIndex:self.objIndex];
}

- (void)loadObjectFromIndex:(int)objectIndex {
    self.productText.text = [[products objectAtIndex:objectIndex] getName];
    self.descriptionText.text =  [[products objectAtIndex:objectIndex] getDescription];
    int itemCost = [[products objectAtIndex:objectIndex] getRetailCost];
    self.costText.text =  [NSString stringWithFormat:@"%i", itemCost];
    self.productImage.image = [[products objectAtIndex:objectIndex] getProductImage];
    int row = [[products objectAtIndex:objectIndex] getNumOnHand];
    [self.numOnHandPicker selectRow:row inComponent:0 animated:true];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [[NSMutableArray alloc] init];
    for (int i = 0; i <= 100; i++)
        [self.data addObject:[NSString stringWithFormat:@"%d",i]];
    
    self.objIndex = -1;
    self.backwardInArray.enabled = NO;
    products = [[NSMutableArray alloc] init];
    
    [self addItem:@"iPhone 8" description:@"Apple's iPhone 8" retailCost:769.00 wholesaleCost:450.00 numSold:0 numOnHand:2 productIm:[UIImage imageNamed:@"iphone8-silver-select-2017.jpeg"]];
    
    [self addItem:@"Galaxy Note 7" description:@"Samsung's Exploding Phone" retailCost:850.00  wholesaleCost:550.00 numSold:0 numOnHand:0 productIm:[UIImage imageNamed:@"82201685704PM_635_samsung_galaxy_note7.jpeg"]];
    
    [self addItem:@"40-inch TV" description:@"Sony's LED TV" retailCost:298.00 wholesaleCost:250.00 numSold:0 numOnHand:89 productIm:[UIImage imageNamed:@"1ce49d27d70520958e62b4b6346469780d26ddbb.jpeg"]];
    
    [self addItem:@"Kindle Reader" description:@"Amazon's E-Reader" retailCost:79.99 wholesaleCost:75.00 numSold:0 numOnHand:74 productIm:[UIImage imageNamed:@"61fnkc4jmSL._SL1000_.jpg"]];
    
    [self addItem:@"Apple Watch" description:@"Series 2 - Aluminum Case" retailCost:299.00 wholesaleCost:200.00 numSold:0 numOnHand:20 productIm:[UIImage imageNamed:@"img_1189.png"]];
    
}

- (Boolean)addItem:(NSString*)itemName description:(NSString*)itemDescription retailCost:(float)itemRetailCost wholesaleCost:(float)itemWholeSaleCost numSold:(int)itemNumSold numOnHand:(int)itemNumOnHand productIm:(UIImage *)productIm
{
    Item *newItem = [[Item alloc] init];
        [newItem setName:itemName];
        [newItem setDescription:itemDescription];
        [newItem setRetailCost:itemRetailCost];
        [newItem setWholesaleCost:itemWholeSaleCost];
        [newItem setNumOnHand:itemNumOnHand];
        [newItem setNumSold:itemNumSold];
        [newItem setProductImage:productIm];
        [products addObject: newItem];
        
        return true;
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    Item* product = [products objectAtIndex:self.objIndex];
    [product setNumOnHand:(int) row];
}

#pragma mark TextField Delegate Methods

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    Item* product = [products objectAtIndex:self.objIndex];
    if (textField == self.productText)
        [product setName:textField.text];
    else if (textField == self.descriptionText) {
        [product setDescription:textField.text];
        [product setDescription:textField.text];
    }
    else {
        float cost = [textField.text floatValue];
        [product setRetailCost:cost];
    }
    return YES;
}

@end
