//
//  ConvertionTableCell.m
//  Papyrus
//
//  Created by Joseph Gerald J on 05/10/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import "ConvertionTableCell.h"

@implementation ConvertionTableCell

@synthesize UnitLabel, UnitValueLabel, backgroundLayer;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
