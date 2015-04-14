//
//  cadastroUsuario.m
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/6/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//
#import <CommonCrypto/CommonDigest.h>
#import <Parse/Parse.h>
#import "cadastroUsuario.h"
#import <Foundation/Foundation.h>

@interface cadastroUsuario () <UITextFieldDelegate>

@end

@implementation cadastroUsuario



- (void)viewDidLoad {
    
    [self setBackGroundColor];
    
    
}


- (IBAction)cadastrarUsuarioButton:(id)sender {
    [self cadastrarUsuario:sender];
}

//----------------------------------------------------

- (void) setBackGroundColor {
    UIColor *color = [[UIColor alloc]initWithRed:206.0/255.0 green:32.0/255.0 blue:39.0/255.0 alpha:1.0];
    
    self.view.backgroundColor = color;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView * txt in self.view.subviews){
        if ([txt isKindOfClass:[UITextField class]] && [txt isFirstResponder]) {
            [txt resignFirstResponder];
        }
    }
}


- (void) cadastrarUsuario:(id)sender {
    _status = 0;
    
    if([_nome.text isEqualToString:@""] || [_sobrenome.text isEqualToString:@""] || [_email.text isEqualToString:@""] || [_senha.text isEqualToString:@""]){
        
        _textoEntrada.text = @"Preencha todos os campos.";
        _status = 1;
    }
    
    if(![_email.text isEqualToString:_conEmail.text ])
    {
        _textoEntrada.text = @"E-mails não correspondem!";
        _status = 1;
    }
    
    else if(![_senha.text isEqualToString:_conSenha.text])
    {
        _textoEntrada.text = @"Senhas não correspondem!";
        _status = 1;
    }
    else {
        PFQuery *query = [PFQuery queryWithClassName:@"usuario"];
        [query  whereKey:@"email" equalTo:_email.text];
        [query findObjectsInBackgroundWithBlock:^(NSArray *usuario, NSError *error) {
            
            if(usuario != nil || usuario.count != 0)
            {
                _textoEntrada.text = @"Usuário já cadastrado.";
                _status = 1;
                
            }
            
            if (!error) {
                PFObject *user = [usuario objectAtIndex:0];
                
                
                if (![user[@"email"] isEqual:@""] || usuario != nil ) {
                    _textoEntrada.text = @"Usuário já cadastrado.";
                    _status = 1;
                }
                
            }
            else{
                _textoEntrada.text = @"Erro ao se conectar do DB.";
                NSString *errorString = [[error userInfo] objectForKey:@"error"];
                NSLog(@"Error: %@", errorString);
            }
            
            
            
            if(_status == 0) {
                PFObject *usuario = [PFObject objectWithClassName:@"usuario"];
                usuario[@"nome"] = _nome.text;
                usuario[@"sobrenome"] = _sobrenome.text;
                usuario[@"email"] = _email.text;
                usuario[@"senha"] = _senha.text;
                
                [usuario saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    
                    if (succeeded){
                        _textoEntrada.text = @"Usuário cadastrado com sucesso";
                        NSLog(@"User Uploaded!");
                        [self performSegueWithIdentifier: @"tabelaFilme" sender: self];
                        
                        
                    }
                    else{
                        _textoEntrada.text = @"Erro ao cadastrar usuário.";
                        NSString *errorString = [[error userInfo] objectForKey:@"error"];
                        NSLog(@"Error: %@", errorString);
                    }
                    
                }];
            }
        }];
    }
}

@end
