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
            
        }
        else{
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", errorString);
        }
        
    }];
    
<<<<<<< Updated upstream
    PFQuery *query = [PFQuery queryWithClassName:@"filmes"]; //1
     [query  whereKey:@"nomeFilme" equalTo:_nomeFilme.text];//2
     [query findObjectsInBackgroundWithBlock:^(NSArray *filmeEsc, NSError *error) {
     
     if (!error) {
         //[FilmeController setNeedsDisplay];
         PFObject *filme = [filmeEsc objectAtIndex:0];
     
     NSLog(@"%@", filme[@"dataLancamento"]);
     _lancamento.text = filme[@"dataLancamento"];
     _sinopse.text = filme[@"sinopse"];
         _sinopse.numberOfLines = 0;
         [_sinopse sizeToFit];
     _elenco.text = filme[@"elencoFilme"];
         _elenco.numberOfLines = 0;
         [_elenco sizeToFit];
    _diretor.text = filme[@"diretor"];
    _soundtrack.text = filme[@"soundtrack"];
    _genero.text = filme[@"generoFilme"];
    _classificacao.text = filme[@"rating"];
    _duracao.text = filme[@"duration"];
    _foto = filme[@"filmeFoto"];
     
         NSURL *url = [NSURL URLWithString:_foto];
         NSData *data = [[NSData alloc] initWithContentsOfURL:url];
         _fotoFilme.image = [UIImage imageWithData: data];
     
     }
     else{
     NSString *errorString = [[error userInfo] objectForKey:@"error"];
     NSLog(@"Error: %@", errorString);
     }
     
     }];
//*/
    self.view.backgroundColor = color;
=======
>>>>>>> Stashed changes
}
//----------------------------------------------
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
