//
//  TabelaFilmeController.m
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/7/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//


#import "FilmeStore.h"
#import "TabelaFilmeController.h"
#import <Parse/Parse.h>
#import "FilmeController.h"
#import "AgendaController.h"
#import "SWRevealViewController.h"


@interface TabelaFilmeController()

@property ( nonatomic, strong ) IBOutlet UITableView  *tabelaEstreia;

@end

@implementation TabelaFilmeController

- (void)viewDidLoad

    {
    [super viewDidLoad];
      
    self.tabelaEstreia.dataSource = self;
    self.tabelaEstreia.delegate = self;
 
    
}

//------------------------------------------------

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

//------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    //permite que o tableView saiba o numero completo de itens das celulas
    
        return [[[FilmeStore sharedStore] arrayNomeFilme]count];
}

//------------------------------------------------

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    UIStoryboard * tela = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    FilmeController *tabelaDeFilmes = [tela instantiateViewControllerWithIdentifier:@"FilmeController"];
    
    NSString *stringNome = [[[FilmeStore sharedStore] arrayNomeFilme] objectAtIndex:indexPath.row];
    
    FilmeStore *store = [FilmeStore sharedStore];
    
    if(![store gambiarra]){
        [store setGambiarra:[NSMutableArray array]];
    }
    [[store gambiarra]removeAllObjects];
    [[store gambiarra] addObject:stringNome];
    [self presentViewController:tabelaDeFilmes animated:YES completion:nil];
}

//------------------------------------------------

//permite configurar a altura das células
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

//------------------------------------------------

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:

    (NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"Filmes";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    //configura as cores da celula
    UIView *myView = [[UIView alloc] init];
    if (indexPath.row % 2) {
        myView.backgroundColor = [UIColor whiteColor];
    } else {
        myView.backgroundColor = [UIColor lightGrayColor];
    }
    cell.backgroundView = myView;
    
    cell.textLabel.text = [[[FilmeStore sharedStore] arrayNomeFilme] objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor clearColor];
    //Adiciona itens nas células da tabela cada label é uma linha nova
    

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 150)];
    
    // ----- Array para Fotos -------
    
    NSURL *url = [NSURL URLWithString:[[[FilmeStore sharedStore] arrayFotoFilme] objectAtIndex:indexPath.row]];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    imageView.image = [UIImage imageWithData: data];
    [cell addSubview:imageView];
    
    // ------ Fim Array Fotos ------
    
    
    // Botão Célula - Agendar Filme
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(aparecerView:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"Layout Feed 01 Agenda.png"] forState: UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, 85, 30);
    button.center = CGPointMake(335, 135);
    
    [cell addSubview:button];
    // Fim Botão célula
    
    // Label Nome do Filme
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(130, 20, 240, 20)];
    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:14];
    NSString *nomeFilme = [NSString stringWithFormat:@"Filme: %@", [[[FilmeStore sharedStore] arrayNomeFilme] objectAtIndex:indexPath.row]];
    
    [labelNome setText:nomeFilme];
    [cell addSubview:labelNome];
    
    // Label Diretor do Filme
    UILabel *labelDiretor = [[UILabel alloc] initWithFrame:CGRectMake(130, 40, 250, 20)];
    font = labelDiretor.font;
    labelDiretor.font = [font fontWithSize:14];
    NSString *diretorFilme = [NSString stringWithFormat:@"Diretor: %@", [[[FilmeStore sharedStore] arrayDiretorFilme] objectAtIndex:indexPath.row]];
    
    [labelDiretor setText:diretorFilme];
    [cell addSubview:labelDiretor];
    
    
    // Label Generos do Filme
    UILabel *labelGeneros = [[UILabel alloc] initWithFrame:CGRectMake(130, 60, 250, 20)];
    font = labelGeneros.font;
    labelGeneros.font = [font fontWithSize:14];
    NSString *generoFilme = [NSString stringWithFormat:@"Genero: %@", [[[FilmeStore sharedStore] arrayGenerosFilme] objectAtIndex:indexPath.row]];

    
    [labelGeneros setText:generoFilme];
    [cell addSubview:labelGeneros];
    
    
    // Label Data do Filme
    UILabel *labelData = [[UILabel alloc] initWithFrame:CGRectMake(130, 90, 150, 20)];
    font = labelData.font;
    labelData.font = [font fontWithSize:16];
    NSString *dataFilme = [NSString stringWithFormat:@"Data: %@", [[[FilmeStore sharedStore] arrayDataFilme] objectAtIndex:indexPath.row]];
    [labelData setText:dataFilme];
    [cell addSubview:labelData];
     
     return cell;
}

- (IBAction)aparecerView:(id)sender {
    UIButton *button = sender;
    
    UITableViewCell *cell = (UITableViewCell *)[button superview];
    NSString *str = cell.textLabel.text;
    NSLog(@"%@", str);
    FilmeStore *store = [FilmeStore sharedStore];
    if(![store arrayFilmesUsuario]){
        [store setArrayFilmesUsuario:[NSMutableArray array]];
    }
    [[store arrayFilmesUsuario] addObject:str];
    
    
    [self performSegueWithIdentifier:@"agendaView" sender:self];
    
}
     
     
     @end
