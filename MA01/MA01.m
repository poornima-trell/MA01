//
//  MA01.m
//  Papyrus
//
//  Created by Joseph Gerald J on 03/10/12.
//  Copyright (c) 2012 Trellisys. All rights reserved.
//

#import "MA01.h"
#import "UnitConverterTypes.h"
#import "LengthStrategy.h"
#import "WeightStrategy.h"
#import "VolumeStrategy.h"
#import "TemperatureStrategy.h"
#import "UIColor+colorWithHexString.h"

#define IS_IPAD   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@implementation MA01

@synthesize ComponentProperties, sortedKeys;
@synthesize ComponentInstanceID, ComponentName, BackgroundImage;
@synthesize OptionsView, OptionLabel, OptionImage, SelectedUnitOptionLabel;
@synthesize UnitSelectionButton, UnitValueTextField, optionPicker;
@synthesize SelectedOption, SelectedUnitOption, UnitOptionsList;
@synthesize ConvertionTable, mConvertionTableCell, ConvertionResultList;
@synthesize UnitNameCaptionLabel, UnitValueCaptionLabel,OptionConverterImage,mainCaptionbackground,ComponentdefaultProperties;
@synthesize backImage,defaultMainSectionCaptionBackground;
BOOL SHOW_UNIT_OPTIONS = NO;

/*
-(id)initWithAppRender:(AppRenderer*)_appRenderer
{
 self = [super initWithNibName:@"MA01" bundle:nil];
 //self = [super initWithNibName:(IS_IPAD ? @"MA01_IPad_old" : @"MA01_old") bundle:nil];
    if (self) {
        appRenderer = _appRenderer;
    }
    return self;
}
*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
    optionPicker.showsSelectionIndicator = YES;
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    [numberToolbar sizeToFit];
    UnitValueTextField.inputAccessoryView = numberToolbar;
    
   
    
    if (IS_IPAD){
       // UnitValueTextField.frame = CGRectMake(450, 68, 250, 44);
    }
//pass the color code from the main app
//    UnitSelectionButton.backgroundColor = [UIColor colorWithHexStr:@"#99666666"];
    UnitSelectionButton.layer.borderColor = [UIColor blackColor].CGColor;
    UnitSelectionButton.layer.borderWidth = 0.5f;
    UnitSelectionButton.layer.cornerRadius = 10.0f;
    
    UITapGestureRecognizer* recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openOptionsDropDownView:)];
    recognizer.numberOfTapsRequired = 1;
    recognizer.numberOfTouchesRequired = 1;
    [OptionsView addGestureRecognizer:recognizer];
    recognizer = nil;
    
    recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openUnitOptionsDropDownView:)];
    recognizer.numberOfTapsRequired = 1;
    recognizer.numberOfTouchesRequired = 1;
    [UnitSelectionButton addGestureRecognizer:recognizer];
    recognizer = nil;
    
    SHOW_UNIT_OPTIONS = NO;
    ConvertionResultList = nil;
    [self AssignSelectedOption:0];
    
    
    if (UnitOptionsList.count == 0 && sortedKeys.count == 0) {
        UnitSelectionButton.hidden = YES;
        OptionLabel.hidden = YES;
        SelectedUnitOptionLabel.hidden = YES;
        UnitSelectionButton.hidden = YES;
        UnitValueTextField.hidden = YES;
        UnitValueCaptionLabel.hidden = YES;
        UnitNameCaptionLabel.hidden = YES;
        OptionsView.hidden = YES;
        OptionImage.hidden = YES;
        OptionConverterImage.hidden = YES;
    }else{
        UnitSelectionButton.hidden = NO;
        OptionLabel.hidden = NO;
        SelectedUnitOptionLabel.hidden = NO;
        UnitSelectionButton.hidden = NO;
        UnitValueTextField.hidden = NO;
        UnitValueCaptionLabel.hidden = NO;
        UnitNameCaptionLabel.hidden = NO;
        OptionsView.hidden = NO;
        OptionImage.hidden = NO;
        OptionConverterImage.hidden = NO;
    }
    
    if (IS_IPAD){
//        [OptionLabel setFont:[UIFont fontWithName:@"Museo-700" size:18.0]];
//        [SelectedUnitOptionLabel setFont:[UIFont fontWithName:@"Museo-700" size:18.0]];
        //pass the color code from the main app
//        [UnitNameCaptionLabel setFont:[UIFont fontWithName:FONTNAME size:18.0]];
//        [UnitValueCaptionLabel setFont:[UIFont fontWithName:FONTNAME size:18.0]];
    }else{
//        [OptionLabel setFont:[UIFont fontWithName:@"Museo-700" size:12.0]];
//        [SelectedUnitOptionLabel setFont:[UIFont fontWithName:@"Museo-700" size:12.0]];
        //pass the color code from the main app
//        [UnitNameCaptionLabel setFont:[UIFont fontWithName:FONTNAME size:12.0]];
//        [UnitValueCaptionLabel setFont:[UIFont fontWithName:FONTNAME size:12.0]];
    }
    
//    OptionsView.backgroundColor = [UIColor colorWithHexStr:@"#aa666666"];
//    UnitNameCaptionLabel.textColor = [UIColor colorWithHexStr:appRenderer.defaultButtonTextColor];
//    UnitValueCaptionLabel.textColor = [UIColor colorWithHexStr:appRenderer.defaultButtonTextColor];
//    SelectedUnitOptionLabel.textColor = [UIColor colorWithHexStr:appRenderer.defaultButtonTextColor];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
//    appRenderer = nil;
    ComponentProperties = nil;
    ComponentInstanceID = nil;
    ComponentName = nil;
    sortedKeys = nil;
    ConvertionResultList = nil;
    mainCaptionbackground = nil;
    [self setPickerActionButton:nil];
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated
{
 /*   if ([ComponentdefaultProperties valueForKey:@"BgImage"]) {
        if ([ComponentdefaultProperties valueForKey:@"BgImage"] && [[ComponentdefaultProperties valueForKey:@"BgImage"] length] > 0 && [[ComponentdefaultProperties valueForKey:@"BgImage"] characterAtIndex:0] == '#'){
            [self.view setBackgroundColor:[UIColor colorWithHexStr:[ComponentdefaultProperties valueForKey:@"BgImage"]]];
        } else {
            BackgroundImage.image = [UIImage imageWithContentsOfFile:[appRenderer getBookRootPath:[ComponentdefaultProperties valueForKey:@"BgImage"]]];
        }
    }else{
        if ([appRenderer.defaultBgImage characterAtIndex:0]=='#') {
            [self.view setBackgroundColor:[UIColor colorWithHexStr:appRenderer.defaultBgImage]];
        }else{
            BackgroundImage.image = [UIImage imageWithContentsOfFile:[appRenderer getBookRootPath:appRenderer.defaultBgImage]];
        }
    }*/
    
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    for (id subview in (self.navigationController.navigationBar).subviews) {
        if ([subview isMemberOfClass:[UIImageView class]]) {
            if (((UIImageView*)subview).tag==999) {
                [self.navigationController.navigationBar bringSubviewToFront:subview];
            }
        }
        if ([subview isMemberOfClass:NSClassFromString(@"UINavigationBarBackground")]){
            for (UIImageView* subImageView in [subview subviews]) {
                [subImageView removeFromSuperview];
            }
        }
    }
    
    [super viewWillDisappear:animated];
}

-(void)viewDidAppear:(BOOL)animated
{
//    [self setNavigationBar];
    [super viewDidAppear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    if (self.isMovingFromParentViewController || self.isBeingDismissed) {
        // Do your stuff here when the view is nolonger required.. Back button is pressed.
        BackgroundImage.image = nil;
        BackgroundImage = nil;
        UnitOptionsList = nil;
        ConvertionResultList = nil;
    }
    [super viewDidDisappear:animated];
}

-(void)addNavigationButtons:(UINavigationItem*)item
{
    if (!item.leftBarButtonItem) {
      /*  UIImage* backImage = [UIImage imageNamed:[appRenderer getIconName:@"navbutton_back"
                                            HeaderTextColorWithHexaString:appRenderer.defaultHeaderTextColor == nil? [ComponentProperties objectForKey:@"HeaderTextColor"]:appRenderer.defaultHeaderTextColor]];*/
        //UIImage* backHoverImage = [UIImage imageNamed:@"back_ho"];
        UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:backImage forState:UIControlStateNormal];
        //[backButton setImage:backHoverImage forState:UIControlStateSelected];
        backButton.frame = CGRectMake(0, 0, backImage.size.width, backImage.size.height);
        [backButton addTarget:self action:@selector(backTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem* backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        item.leftBarButtonItem = backButtonItem;
    }
}

-(UINavigationItem*)navigationItem
{
    UINavigationItem* item = super.navigationItem;
    [self addNavigationButtons:item];
    return item;
}

-(void)backTapped:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (IS_IPAD) {
        return YES;
    }
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

////////ios 6 orientations ////////////////

-(BOOL)shouldAutorotate
{
    if (IS_IPAD) {
        return YES;
    }
    return NO;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return IS_IPAD? UIInterfaceOrientationMaskAll:UIInterfaceOrientationMaskPortrait;

}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{

    return IS_IPAD? UIInterfaceOrientationMaskAll:UIInterfaceOrientationMaskPortrait;
    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
 //   [appRenderer setNavigationHeaderBar:self.navigationController orientation:toInterfaceOrientation];
//    [appRenderer setNavigationHeaderBar:ComponentdefaultProperties navController:self.navigationController orientation:toInterfaceOrientation];
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}



#pragma mark Custom Events

-(void)openOptionsDropDownView:(UITapGestureRecognizer*)recognizer
{
    [UnitValueTextField resignFirstResponder];
    SHOW_UNIT_OPTIONS = NO;
    [optionPicker reloadAllComponents];
    if (sortedKeys.count==0) {
        return;
    }else{
    [self ShowOptionsPicker:YES];
    }
}

-(void)openUnitOptionsDropDownView:(UITapGestureRecognizer*)recognizer
{
      
    [UnitValueTextField resignFirstResponder];
    SHOW_UNIT_OPTIONS = YES;
    [optionPicker reloadAllComponents];
    if (UnitOptionsList.count==0) {
        return;
    }else{
        [self ShowOptionsPicker:YES];
    }
}

- (IBAction) doTextChanged:(id)sender
{
    [self GetConvertionTable];
}


#pragma mark Standard Methods

/*-(void) openComponentTemplate:(CXMLElement*)ComponentXMLNode
{
    ComponentInstanceID = [[ComponentXMLNode attributeForName:@"instanceId"] stringValue];
    ComponentName = [[ComponentXMLNode attributeForName:@"name"] stringValue];
    [self parseContents:ComponentXMLNode];
}

-(void)parseContents:(CXMLElement*)content
{
    for (CXMLElement* element in [content children]) {
        for (CXMLElement* subElement in [element children]){
            if ([[subElement name] isEqualToString:@"section"]) {
                for (CXMLElement* subNode in [subElement children]){
                    if ([[subNode name] isEqualToString:@"properties"]){
                        ComponentProperties = [appRenderer.AppXMLParser doParseProperties:subNode];
                    }
                }
            }
        }
    }
    
    
    if ([ComponentProperties valueForKey:@"MainsectionCaptionBackground"]) {
        mainCaptionbackground  = [ComponentProperties valueForKey:@"MainsectionCaptionBackground"];
    }else{
        mainCaptionbackground = appRenderer.defaultMainSectionCaptionBackground;
    }
    
    ComponentdefaultProperties = [[NSMutableDictionary alloc] init];
    NSString* keyToBeRemoved = @"";
    
    for(id key in ComponentProperties)
    {
        id value = [ComponentProperties objectForKey:key];
         NSScanner* scan = [NSScanner scannerWithString:value];
        int val;

        BOOL isInterger = [scan scanInt:&val];
        if (!isInterger) {
             keyToBeRemoved = key;
            [ComponentdefaultProperties setObject:value forKey:keyToBeRemoved];
        }
    }
    for (id object in [ComponentdefaultProperties allKeys] ) {
        [ComponentProperties removeObjectForKey:object];

    }
    
    sortedKeys = [ComponentProperties keysSortedByValueUsingComparator: ^(id obj1, id obj2)
    {
        if ([obj1 integerValue] > [obj2 integerValue])
        {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if ([obj1 integerValue] < [obj2 integerValue])
        {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
}

-(void)setNavigationBar
{
  //  [appRenderer setNavigationHeaderBar:self.navigationController orientation:[[UIApplication sharedApplication] statusBarOrientation]];
    [appRenderer setNavigationHeaderBar:ComponentdefaultProperties navController:self.navigationController orientation:[[UIApplication sharedApplication] statusBarOrientation]];
}
*/

#pragma mark PickerView Delegate Methods

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component
{
    if (SHOW_UNIT_OPTIONS){
        [self AssignSelectedUnitOption:row];
    }else{
        [self AssignSelectedOption:row];
    }
    
    [self ShowOptionsPicker:NO];
}

- (IBAction)pickerAction:(id)sender
{
    
    NSInteger row = [optionPicker selectedRowInComponent:0];
    if (SHOW_UNIT_OPTIONS){
        [self AssignSelectedUnitOption:row];
    }else{
        [self AssignSelectedOption:row];
    }
    
    [self ShowOptionsPicker:NO];

}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (SHOW_UNIT_OPTIONS){
        return UnitOptionsList.count;
    }else{
        return sortedKeys.count;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (SHOW_UNIT_OPTIONS){
        return UnitOptionsList[row];
    }else{
        return sortedKeys[row];
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return pickerView.frame.size.width;
}


#pragma mark UITextField Delegate
-(void)cancelNumberPad{
    [UnitValueTextField resignFirstResponder];
    UnitValueTextField.text = @"";
    [self GetConvertionTable];

}

-(void)doneWithNumberPad{
    [UnitValueTextField resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *nonNumberSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."].invertedSet;
    
    // allow backspace
    if (range.length > 0 && string.length == 0) {
        return YES;
    }
    
    // do not allow . at the beggining
    if (range.location == 0 && [string isEqualToString:@"."]) {
        return NO;
    }
    
    // set the text field value manually
    NSString *newValue = [textField.text stringByReplacingCharactersInRange:range withString:string];
    newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
    textField.text = newValue;
    [self GetConvertionTable];
    // return NO because we're manually setting the value
    return NO;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == UnitValueTextField){
        [textField resignFirstResponder];
        [self GetConvertionTable];
        return NO;
    }
    
    return YES;
}


#pragma mark UITableView Delegate Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ConvertionResultList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mConvertionTablecell";
    ConvertionTableCell *cell = (ConvertionTableCell *)[ConvertionTable dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:(IS_IPAD ? @"ConvertionTableCell_IPad" : @"ConvertionTableCell") owner:self options:nil];
        cell = (ConvertionTableCell*)mConvertionTableCell;
    }
    
    UnitConvertResultData *result = ConvertionResultList[indexPath.row];
    cell.UnitLabel.text = result.UnitName;
    cell.UnitValueLabel.text = result.UnitValue;
    
    
    cell.backgroundLayer.backgroundColor = [UIColor colorWithHexStr:defaultMainSectionCaptionBackground];
    
    if([defaultMainSectionCaptionBackground isEqualToString:@""])
    {
        cell.backgroundLayer.backgroundColor = [UIColor colorWithHexStr: @"#30333333"];
    }
    
   // cell.backgroundLayer.backgroundColor = [UIColor colorWithHexStr:mainCaptionbackground];
    
    if (indexPath.row %2){
        cell.backgroundLayer.alpha = 0.85;
    }else{
        cell.backgroundLayer.alpha = 1.0;
    }
    
    if (IS_IPAD){
        (cell.UnitLabel).font = [UIFont fontWithName:@"Museo-700" size:18.0];
        (cell.UnitValueLabel).font = [UIFont fontWithName:@"Museo-700" size:18.0];
    }else{
        (cell.UnitLabel).font = [UIFont fontWithName:@"Museo-700" size:12.0];
        (cell.UnitValueLabel).font = [UIFont fontWithName:@"Museo-700" size:12.0];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark Custom Methods

- (void)ShowOptionsPicker:(BOOL)ShowPicker
{
    if (IS_IPAD)
    {
        CGRect frame = optionPicker.frame;
        
        if (ShowPicker && frame.origin.y == self.view.frame.size.height){
            frame.origin.y = self.view.frame.size.height - frame.size.height;
        }
        if (!ShowPicker){
            frame.origin.y = self.view.frame.size.height;
        }
        
        [UIView beginAnimations:NULL context:nil];
        optionPicker.frame = frame;
        _pickerActionButton.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 44);
        [UIView setAnimationDuration:5.0];
        [UIView commitAnimations];
    }
    else
    {
        CGRect frame = optionPicker.frame;
        
        if (ShowPicker && frame.origin.y == self.view.frame.size.height){
            frame.origin.y = self.view.frame.size.height - frame.size.height;
        }
        if (!ShowPicker){
            frame.origin.y = self.view.frame.size.height;
        }
        
        [UIView beginAnimations:NULL context:nil];
        optionPicker.frame = frame;
        _pickerActionButton.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 44);
        [UIView setAnimationDuration:0.8];
        [UIView commitAnimations];
    }
}

- (void)AssignSelectedOption:(NSInteger)row
{
    SelectedOption = [sortedKeys[row] lowercaseString];
    
    if ([SelectedOption isEqualToString:LENGTH]){
        OptionLabel.text = @"Length";
        OptionImage.image = [UIImage imageNamed:@"length_icon.png"];
        UnitOptionsList = [[NSMutableArray alloc] initWithObjects:LENGTH_CENTIMETRE, LENGTH_FEET, LENGTH_INCH, LENGTH_KILOMETRE, LENGTH_METRE, LENGTH_MILE, LENGTH_MILLIMETRE, nil];
        [self AssignSelectedUnitOption:0];
    }else if ([SelectedOption isEqualToString:WEIGHT]){
        OptionLabel.text = @"Weight";
        OptionImage.image = [UIImage imageNamed:@"weight_icon.png"];
        UnitOptionsList = [[NSMutableArray alloc] initWithObjects:WEIGHT_GRAM, WEIGHT_KILOGRAM, WEIGHT_POUND, WEIGHT_MILLIGRAM, WEIGHT_OUNCE, nil];
        [self AssignSelectedUnitOption:0];
    }else if ([SelectedOption isEqualToString:VOLUME]){
        OptionLabel.text = @"Volume";
        OptionImage.image = [UIImage imageNamed:@"volume_icon.png"];
        UnitOptionsList = [[NSMutableArray alloc] initWithObjects:VOLUME_LITRE, VOLUME_MILLILITRE, VOLUME_US_GALLON, VOLUME_US_PINT, VOLUME_US_QUART, VOLUME_TEASPOON, VOLUME_TABLESPOON, VOLUME_FLUID_OUNCES, nil];
        if (!IS_IPAD) {
            ConvertionTable.scrollEnabled = YES;
        }
        [self AssignSelectedUnitOption:0];
    }else if ([SelectedOption isEqualToString:TEMPERATURE]){
        OptionLabel.text = @"Temperature";
        OptionImage.image = [UIImage imageNamed:@"temp_icon.png"];
        UnitOptionsList = [[NSMutableArray alloc] initWithObjects:TEMPERATURE_CELCIUS, TEMPERATURE_FAHRENHEIT, nil];

        [self AssignSelectedUnitOption:0];
    }
}

- (void)AssignSelectedUnitOption:(NSInteger)row
{
    SelectedUnitOption = UnitOptionsList[row];
    SelectedUnitOptionLabel.text = SelectedUnitOption;
    [self GetConvertionTable];
}

- (NSInteger)occurrencesOf:(NSString *)str InString:(NSString *)mainString
{
    NSLog(@"Occurences of . is: %lu", (unsigned long)[mainString componentsSeparatedByString:str].count);
    return [mainString componentsSeparatedByString:str].count;
}

- (void)GetConvertionTable
{
    if ([UnitValueTextField.text isEqualToString:@""])
    {
        [ConvertionTable setHidden:YES];
        return;
    }
    
    @try{
        NSLog(@"Valid double number is: %f", (UnitValueTextField.text).doubleValue);
    }@catch (NSException *ex) {
        return;
    }
    
    if ([SelectedOption isEqualToString:LENGTH]){
        ConvertionResultList = [LengthStrategy convert:SelectedUnitOption InputValue:(UnitValueTextField.text).doubleValue];
    }else if ([SelectedOption isEqualToString:WEIGHT]){
        ConvertionResultList = [WeightStrategy convert:SelectedUnitOption InputValue:(UnitValueTextField.text).doubleValue];
    }else if ([SelectedOption isEqualToString:VOLUME]){
        ConvertionResultList = [VolumeStrategy convert:SelectedUnitOption InputValue:(UnitValueTextField.text).doubleValue];
    }else if ([SelectedOption isEqualToString:TEMPERATURE]){
        ConvertionResultList = [TemperatureStrategy convert:SelectedUnitOption InputValue:(UnitValueTextField.text).doubleValue];
    }
    
    [ConvertionTable reloadData];
    if (ConvertionTable.hidden) [ConvertionTable setHidden:NO];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
