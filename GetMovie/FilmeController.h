//
//  FilmeController.h
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/8/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilmeController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nomeFilme;
@property (weak, nonatomic) IBOutlet UILabel *lancamento;
@property (weak, nonatomic) IBOutlet UILabel *sinopse;
@property (weak, nonatomic) IBOutlet UIImageView *fotoFilme;
@property (weak, nonatomic) IBOutlet UILabel *elenco;
@property (weak, nonatomic) IBOutlet UILabel *diretor;
@property (weak, nonatomic) IBOutlet UILabel *soundtrack;
@property (weak, nonatomic) IBOutlet UILabel *genero;
@property (weak, nonatomic) IBOutlet UILabel *classificacao;
@property (weak, nonatomic) IBOutlet UILabel *duracao;

@end
