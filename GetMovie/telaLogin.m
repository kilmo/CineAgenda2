//
//  telaLogin.m
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/6/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//

#import "FilmeAgendaController.h"
#import <Parse/Parse.h>
#import "telaLogin.h"
#import <Foundation/Foundation.h>


@implementation telaLogin


- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setarCorFundo];
    
}

- (IBAction)acaoEntrar:(id)sender {
    [self logarUsuario];
}

//----------------------------------------------
- (void) logarUsuario {
    
    PFQuery *query = [PFQuery queryWithClassName:@"usuario"];
    [query  whereKey:@"email" equalTo:_labelEmail.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *usuario, NSError *error) {
        
        if(usuario == nil || usuario.count == 0)
        {
            _textLabel.text = @"Usuário não cadastrado.";
        }
        
        if (!error) {
            
            PFObject *user = [usuario objectAtIndex:0];
            
            if ([user[@"email"] isEqual:@""] || usuario == nil ) {
                _textLabel.text = @"Usuário não cadastrado.";
            }
            
            else if(![_labelSenha.text isEqual:user[@"senha"]]) {
                _textLabel.text = @"Senha incorreta.";
            }
            else
            {
                [self performSegueWithIdentifier: @"tabelaFilme" sender: self];
            }
        }
        else{
            _textLabel.text = @"Erro ao se conectar no DB.";
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", errorString);
        }
        
    }];
}
//----------------------------------------------

- (void) setarCorFundo {
    UIColor *color = [[UIColor alloc]initWithRed:206.0/255.0 green:32.0/255.0 blue:39.0/255.0 alpha:1.0];
    
    self.view.backgroundColor = color;
    
    //Label de teste - Apagar no final
    _labelSenha.text = @"a";
    _labelEmail.text = @"a";
}

//-------------- Esconde Teclado -----------------
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView * txt in self.view.subviews){
        if ([txt isKindOfClass:[UITextField class]] && [txt isFirstResponder]) {
            [txt resignFirstResponder];
        }
    }
}

@end
