//
//  FilmeAgendaController.h
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/9/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilmeAgendaController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *confirmar_button;

-(IBAction)confirmar_button:(id)sender;
-(void)adiciona_reminder;
@end
