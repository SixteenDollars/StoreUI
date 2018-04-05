//
//  Item.h
//  HW2
//
//  Created by Crack on 2/24/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Item : NSObject {
    NSString *Name;
    NSString *Description;
    float Retail_Cost;
    float Wholesale_Cost;
    int Num_on_Hand;
    int Num_Sold;
    UIImage *productImage;
}

- (NSString *)getName;

- (void)setName:(NSString *) d;

- (NSString *)getDescription;

- (void)setDescription:(NSString *) d;

- (float)getRetailCost;

- (void)setRetailCost:(float)Retail_Cost;

- (float)getWholesaleCost;

- (void)setWholesaleCost:(float)Wholesale_Cost;

- (int)getNumOnHand;

- (void)setNumOnHand:(int)Num_on_Hand;

- (int)getNumSold;

- (void)setNumSold:(int)Num_Sold;

- (UIImage *)getProductImage;

- (void)setProductImage:(UIImage *)productImage;

- (void)Print_Object;

- (void)Add_Stock:(NSString *)Name :(int)newStock;

- (void)Sell_Item;

@end

