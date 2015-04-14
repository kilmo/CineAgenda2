//
//  FilmeAgendaController.m
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/9/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//

#import "FilmeAgendaController.h"

@interface FilmeAgendaController()

@property (weak, nonatomic) IBOutlet UILabel *nomeFilme;
@property (weak, nonatomic) IBOutlet UITextField *textFieldVezesSemana;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAgendarMes;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAgendarAno;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAgendarDia;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNotificacaoAno;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNotificacaoMes;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNotificacaoDia;
@property (weak, nonatomic) IBOutlet UITextField *textFieldHorarios;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPush;
@end

@implementation FilmeAgendaController

-(IBAction)confirmar_button:(id)sender{
    [self adiciona_reminder];
}


-(void)adiciona_reminder{
        NSLog(@"FOIIIIII");
    NSLog(@"%@", _textFieldAgendarDia.text);
    NSLog(@"%@", _textFieldAgendarMes.text);
    NSLog(@"%@", _textFieldAgendarAno.text);
    NSString *data_agendada = (@"%@%@%@", _textFieldAgendarDia.text, _textFieldAgendarMes.text, _textFieldAgendarAno.text);
    
//    NSString *data_inicio_notificacao = (@"%@%@%@", _textFieldNotificacaoDia.text, _textFieldNotificacaoMes.text, _textFieldNotificacaoAno.text);
//   
    // Convert string to date object
    NSDateFormatter *data_agenda_formatada = [[NSDateFormatter alloc] init];
    [data_agenda_formatada setDateFormat:@"ddMMyyyy"];
    
    NSLog(@"%@",data_agenda_formatada);
    
    NSDate *date = [data_agenda_formatada dateFromString:data_agendada];
    
    // Convert date object to desired output format
    [data_agenda_formatada setDateFormat:@"dd/MM/yyyy"];
    data_agendada = [data_agenda_formatada stringFromDate:date];
    

    
    NSLog(@"%@",data_agendada);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView * txt in self.view.subviews){
        if ([txt isKindOfClass:[UITextField class]] && [txt isFirstResponder]) {
            [txt resignFirstResponder];
        }
    }
}


/*
    if([_text.text isEqualToString:@""] || [_sobrenome.text isEqualToString:@""] || [_email.text isEqualToString:@""] || [_senha.text isEqualToString:@""]){
        
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
  */
    





@end
