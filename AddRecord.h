//
//  AddRecord.h
//  StoreUI
//
//  Created by Crack on 2/26/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddRecordDelegate <NSObject>
@required
- (void)dataFromController:(NSMutableArray *)secondProducts;
@end


@interface AddRecord : UIViewController<UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, retain) NSMutableArray* secondProducts;
@property (nonatomic, weak) id<AddRecordDelegate> delegate;

@end
