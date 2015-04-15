        //
//  cadastroUsuario.h
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/6/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cadastroUsuario : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *sobrenome;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *conEmail;
@property (weak, nonatomic) IBOutlet UITextField *senha;
@property (weak, nonatomic) IBOutlet UITextField *conSenha;
@property (weak, nonatomic) IBOutlet UILabel *textoEntrada;
@property (weak, nonatomic) IBOutlet UIButton *cadastrarUsuarioButton;
@property (nonatomic) NSInteger status;

@end
