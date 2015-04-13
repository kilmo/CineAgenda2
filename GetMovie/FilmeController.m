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
@property (weak, nonatomic) NSString *foto;


@end
@implementation FilmeController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    UIColor *color = [[UIColor alloc]initWithRed:206.0/255.0 green:32.0/255.0 blue:39.0/255.0 alpha:1.0];
    
    _nomeFilme.text = [[[FilmeStore sharedStore] gambiarra]objectAtIndex:0];
    
    //NSLog(@"%@", _nomeFilme.text);
    
    PFQuery *query = [PFQuery queryWithClassName:@"filmes"]; //1
     [query  whereKey:@"nomeFilme" equalTo:_nomeFilme.text];//2
     [query findObjectsInBackgroundWithBlock:^(NSArray *filmeEsc, NSError *error) {
     
     if (!error) {
         //[FilmeController setNeedsDisplay];
         PFObject *filme = [filmeEsc objectAtIndex:0];
     
     NSLog(@"%@", filme[@"dataLancamento"]);
     _lancamento.text = filme[@"dataLancamento"];
     _sinopse.text = filme[@"sinopse"];
     _elenco.text = filme[@"elencoFilme"];
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
