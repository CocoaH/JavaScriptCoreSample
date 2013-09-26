//
//  KIViewController.m
//  JavaScriptCoreSample
//
//  Created by Marcus Kida on 24.09.13.
//  Copyright (c) 2013 Marcus Kida. All rights reserved.
//

#import "KIViewController.h"

@interface KIViewController ()
{
    JSContext *_jsContext;
    
    IBOutlet UITextView *_inTextView;
    IBOutlet UITextView *_outTextView;
}
@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_inTextView setText:@"function add(one, two) {\n   return one + two;\n}\nresult = add(3, 7);"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _jsContext = [[JSContext alloc] initWithVirtualMachine:[[JSVirtualMachine alloc] init]];
    _jsContext[@"result"] = @"";
}

- (IBAction)interpret:(id)sender
{
    [_jsContext evaluateScript:[_inTextView text]];
    
    JSValue *val = _jsContext[@"result"];
    [_outTextView setText:[val toString]];
}

@end
