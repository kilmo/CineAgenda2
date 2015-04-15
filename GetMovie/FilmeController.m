//
//  FilmeController.m
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/8/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//

#import "FilmeStore.h"
#import "FilmeController.h"
#import <Parse/Parse.h>

@interface FilmeController()


@end

@implementation FilmeController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setarCores];
    [self buscarDadosFilme];
   // _scrolldown.subviews.accessibilityFrame.size.width = _scrolldown.contentSize.width;
    [_scrolldown setContentOffset: CGPointMake(0, self.scrolldown.contentOffset.y)];
    _scrolldown.directionalLockEnabled = YES;
}

//----------------------------------------------
- (void) buscarDadosFilme {
    
    _nomeFilme.text = [[[FilmeStore sharedStore] gambiarra]objectAtIndex:0];
    
    PFQuery *query = [PFQuery queryWithClassName:@"filmes"];
    [query  whereKey:@"nomeFilme" equalTo:_nomeFilme.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *filmeEsc, NSError *error) {
        
        if (!error) {
            PFObject *filme = [filmeEsc objectAtIndex:0];
            
            _lancamento.text = filme[@"dataLancamento"];
            _sinopse.text = filme[@"sinopse"];
            _elenco.text = filme[@"elencoFilme"];
            _diretor.text = filme[@"diretor"];
            _soundtrack.text = filme[@"soundtrack"];
            _genero.text = filme[@"generoFilme"];
            _classificacao.text = filme[@"rating"];
            _duracao.text = filme[@"duration"];
            
            PFFile *foto = filme[@"filmeFoto"];
            NSURL *url = [NSURL URLWithString:foto.url];
            NSData *data = [[NSData alloc] initWithContentsOfURL:url];
            _fotoFilme.image = [UIImage imageWithData: data];
            
            _lancamento.numberOfLines = 0;
            [_lancamento sizeToFit];
            _sinopse.numberOfLines = 0;
            [_sinopse sizeToFit];
            _elenco.numberOfLines = 0;
            [_elenco sizeToFit];
            _diretor.numberOfLines = 0;
            [_diretor sizeToFit];
            _soundtrack.numberOfLines = 0;
            [_soundtrack sizeToFit];
            _genero.numberOfLines = 0;
            [_genero sizeToFit];
            _classificacao.numberOfLines = 0;
            [_classificacao sizeToFit];
            _duracao.numberOfLines = 0;
            [_duracao sizeToFit];
            
            [self configuracaoLabels];
        }
        else{
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", errorString);
        }
        
    }];
    
}

//----------------------------------------------

-(void)configuracaoLabels{
    _lancamento.numberOfLines = 0;
    [_lancamento sizeToFit];
    _sinopse.numberOfLines = 0;
    [_sinopse sizeToFit];
    _elenco.numberOfLines = 0;
    [_elenco sizeToFit];
    _diretor.numberOfLines = 0;
    [_diretor sizeToFit];
    _soundtrack.numberOfLines = 0;
    [_soundtrack sizeToFit];
    _genero.numberOfLines = 0;
    [_genero sizeToFit];
    _classificacao.numberOfLines = 0;
    [_classificacao sizeToFit];
    _duracao.numberOfLines = 0;
    [_duracao sizeToFit];
    
}

- (void) setarCores {
   
    self.nomeFilme.textColor = [UIColor redColor];
    self.lancamento.textColor = [UIColor redColor];
    self.sinopse.textColor = [UIColor redColor];
    self.elenco.textColor = [UIColor redColor];
    self.diretor.textColor = [UIColor redColor];
    self.soundtrack.textColor = [UIColor redColor];
    self.genero.textColor = [UIColor redColor];
    self.classificacao.textColor = [UIColor redColor];
    self.duracao.textColor = [UIColor redColor];
}
//----------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
