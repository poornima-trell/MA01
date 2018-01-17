//
//  ViewController.m
//  MA01
//
//  Created by Poornima on 17/01/18.
//  Copyright © 2018 Poornima. All rights reserved.
//

#import "ViewController.h"
#import "MA01.h"

@interface ViewController ()
- (IBAction)maAction:(id)sender ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)maAction:(id)sender {
    MA01 *m = [[MA01 alloc]initWithNibName:@"MA01" bundle:[NSBundle mainBundle]];
    NSMutableDictionary *d = [[NSMutableDictionary alloc]init];
//    d = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Media/bg_480X320SC.jpg",@"BgImage",@"Media/navbar_44X320SC.png",@"HeaderBackground",@"MA01",@"HeaderText",@"#ffFFFFFF",@"HeaderTextColor",1,@"IncludeInFull",@"",@"IncludeInSample",4,@"Length",@"","MainsectionCaptionBackground",1,@"ShowHeaderText",3,@"Temperature",1,@"Volume",2,@"Weight", nil];
    NSMutableDictionary *C = [[NSMutableDictionary alloc]init];
//   C = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Media/bg_480X320SC.jpg",@"BgImage",@"Media/navbar_44X320SC.png",@"HeaderBackground",@"MA01",@"HeaderText",@"#ffFFFFFF",@"HeaderTextColor",1,@"IncludeInFull",@"",@"IncludeInSample",4,@"Length",@"","MainsectionCaptionBackground",1,@"ShowHeaderText", nil];
    m.ComponentdefaultProperties = C;
    m.ComponentProperties = d;
    [self.navigationController pushViewController:m animated:true];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
