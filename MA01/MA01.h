//
//  MA01.h
//  Papyrus
//
//  Created by Joseph Gerald J on 03/10/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConvertionTableCell.h"

@interface MA01 : UIViewController <UIPickerViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) NSMutableDictionary* ComponentProperties;
@property (strong, nonatomic) NSArray* sortedKeys;
@property (strong, nonatomic) NSMutableArray* UnitOptionsList;
@property (strong, nonatomic) NSMutableArray* ConvertionResultList;
@property (strong, nonatomic) NSString* ComponentInstanceID;
@property (strong, nonatomic) NSString* ComponentName;

@property (strong, nonatomic) IBOutlet UIImageView *BackgroundImage;
@property (strong, nonatomic) IBOutlet UIView *OptionsView;
@property (strong, nonatomic) IBOutlet UILabel *OptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *OptionImage;
@property (strong, nonatomic) IBOutlet UIView *UnitSelectionButton;
@property (strong, nonatomic) IBOutlet UILabel *SelectedUnitOptionLabel;
@property (strong, nonatomic) IBOutlet UITextField *UnitValueTextField;
@property (strong, nonatomic) IBOutlet UIPickerView *optionPicker;
@property (strong, nonatomic) IBOutlet UITableView *ConvertionTable;
@property (strong, nonatomic) IBOutlet ConvertionTableCell *mConvertionTableCell;
@property (strong, nonatomic) IBOutlet UILabel *UnitNameCaptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *UnitValueCaptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *OptionConverterImage;
@property (strong,nonatomic) NSString* mainCaptionbackground;

@property (strong, nonatomic) NSString* SelectedOption;
@property (strong, nonatomic) NSString* SelectedUnitOption;

@property (weak, nonatomic) IBOutlet UIButton *pickerActionButton;
@property (strong, nonatomic) NSMutableDictionary* ComponentdefaultProperties;
@property (strong, nonatomic) UIImage* backImage;
@property (strong, nonatomic) NSString* defaultMainSectionCaptionBackground;

- (IBAction) doTextChanged:(id)sender;

- (void)ShowOptionsPicker:(BOOL)ShowPicker;
- (void)AssignSelectedOption:(NSInteger)row;
- (void)AssignSelectedUnitOption:(NSInteger)row;
- (NSInteger)occurrencesOf:(NSString *)str InString:(NSString *)mainString;
- (void)GetConvertionTable;
- (IBAction)pickerAction:(id)sender;

@end
