//
//  ConvertionTableCell.h
//  Papyrus
//
//  Created by Joseph Gerald J on 05/10/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConvertionTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *backgroundLayer;
@property (strong, nonatomic) IBOutlet UILabel *UnitLabel;
@property (strong, nonatomic) IBOutlet UILabel *UnitValueLabel;

@end
