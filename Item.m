//
//  Item.m
//  HW2
//
//  Created by Crack on 2/24/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "Item.h"

@interface Item ()

@end

@implementation Item

- (NSString *)getName; {
    return Name;
}

- (void)setName:(NSString *) d; {
    Name = d;
}

- (NSString *)getDescription; {
    return Description;
}

- (void)setDescription:(NSString *) d; {
    Description = d;
}

- (float)getRetailCost; {
    return Retail_Cost;
}

- (void)setRetailCost:(float) r; {
    Retail_Cost = r;
}

- (float)getWholesaleCost; {
    return Wholesale_Cost;
}

- (void)setWholesaleCost:(float) w; {
    Wholesale_Cost = w;
}

- (int)getNumOnHand; {
    return Num_on_Hand;
}

- (void)setNumOnHand:(int) noh; {
    Num_on_Hand = noh;
}

- (int)getNumSold; {
    return Num_Sold;
}

- (void)setNumSold:(int) nsold; {
    Num_Sold = nsold;
}

- (UIImage *)getProductImage {
    return productImage;
}

- (void)setProductImage:(UIImage *)productIm {
    productImage = productIm;
}

- (void)Print_Object; {
    NSLog(@"Description: %@, Retail Cost: %f, Wholesale Cost: %f, Number On Hand: %d, Number Sold: %d", Description, Retail_Cost, Wholesale_Cost, Num_on_Hand, Num_Sold);
}

- (void)Add_Stock:(NSString *)Name :(int)newStock; {
    Num_on_Hand += newStock;
}

- (void)Sell_Item; {
    if (Num_on_Hand > 0) {
        Num_on_Hand -= 1;
        NSLog(@"Name: %@, Description: %@, Retail Cost: %f, Wholesale Cost: %f, Number On Hand: %d, Number Sold: %d", Name, Description, Retail_Cost, Wholesale_Cost, Num_on_Hand, Num_Sold);
    }
    else
        NSLog(@"Error: No stock");
}

@end
