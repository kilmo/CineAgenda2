//
//  ViewController.m
//  GetMovie
//
//  Created by Bruno Pereira dos Santos on 4/14/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Ao clicar mostra o menu
    _barButtom.target = self.revealViewController;
    _barButtom.action = @selector(revealToggle:);
    
    //Ao arrastar para o lado mostrar o menu
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
