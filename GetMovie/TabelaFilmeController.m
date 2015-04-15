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
@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *diretor;
@property (nonatomic, strong) NSString *genero;
@property (nonatomic, strong) NSString *data;
@property (nonatomic, strong) UILabel *labelNome;
@property (nonatomic, strong) UILabel *labelData;
@property (nonatomic, strong) UIView *myView;

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
    
    UIView *myView = [[UIView alloc] init];

    static NSString *simpleTableIdentifier = @"Filmes";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
        
    [self setCellColor:indexPath SecondObject:myView ThirdObject:cell];
    
    [self getFotoFilme:indexPath SecondObject:cell];
    
    [self setButtonCell:indexPath secondObject:cell];

    [self getNomeFilme:indexPath SecondObject:cell];
    
    [self getDiretorFilme:indexPath secondObject:cell];
    
    [self getGeneroFilme:indexPath secondObjects:cell];

    [self getEstreiaFilme:indexPath SecondObject:cell];
    
    return cell;
}

//----------------------------------------------------------------------

-(void) setButtonCell : (NSIndexPath*) indexPath secondObject: (UITableViewCell*) cell {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(aparecerView:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"Layout Feed 01 Agenda.png"] forState: UIControlStateNormal];
    [button sizeToFit];
    button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y, 100, 31);
    button.center = CGPointMake(335, 135);
    
    [cell addSubview:button];
}

//----------------------------------------------------------------------

-(void) getFotoFilme : (NSIndexPath*) indexPath SecondObject: (UITableViewCell*) cell{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 150)];
    
    NSURL *url = [NSURL URLWithString:[[[FilmeStore sharedStore] arrayFotoFilme] objectAtIndex:indexPath.row]];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    imageView.image = [UIImage imageWithData: data];
    [cell addSubview:imageView];
}

//----------------------------------------------------------------------

-(void) setCellColor: (NSIndexPath*) indexPath SecondObject: (UIView*) myView ThirdObject: (UITableViewCell*) cell {
    
    //UIView *myView = [[UIView alloc] init];
    if (indexPath.row % 2) {
        myView.backgroundColor = [UIColor whiteColor];
    } else {
        myView.backgroundColor = [UIColor lightGrayColor];
    }
    cell.backgroundView = myView;
    
    cell.textLabel.text = [[[FilmeStore sharedStore] arrayNomeFilme] objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor clearColor];
}

//----------------------------------------------------------------------

- (void) getNomeFilme: (NSIndexPath*)indexPath SecondObject: (UITableViewCell*) cell {

    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(130, 20, 240, 20)];
    
    self.nome = [NSString stringWithFormat:@"Filme: %@", [[[FilmeStore sharedStore] arrayNomeFilme] objectAtIndex:indexPath.row]];
    

    [labelNome setText:self.nome];

    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:14];
    //Nome Filme
    
    [cell addSubview:labelNome];
    
}

//----------------------------------------------------------------------

- (void) getEstreiaFilme: (NSIndexPath*) indexPath SecondObject: (UITableViewCell*) cell {
    
    UILabel *labelData = [[UILabel alloc] initWithFrame:CGRectMake(130, 90, 150, 20)];
    
    self.data = [NSString stringWithFormat:@"Data: %@", [[[FilmeStore sharedStore] arrayDataFilme] objectAtIndex:indexPath.row]];
    
    [labelData setText:self.data];
    
    
    UIFont *font = labelData.font;
    labelData.font = [font fontWithSize:16];
    
    
    [cell addSubview:labelData];
    
}

//----------------------------------------------------------------------

- (void) getGeneroFilme: (NSIndexPath*) indexPath secondObjects: (UITableViewCell*) cell {
    
    UILabel *labelGeneros = [[UILabel alloc] initWithFrame:CGRectMake(130, 60, 250, 20)];
    
    self.genero = [NSString stringWithFormat:@"Genero: %@", [[[FilmeStore sharedStore] arrayGenerosFilme] objectAtIndex:indexPath.row]];
    
    UIFont *font = labelGeneros.font;
    labelGeneros.font = [font fontWithSize:14];
    
    [labelGeneros setText:self.genero];
    [cell addSubview:labelGeneros];
}

//----------------------------------------------------------------------

- (void) getDiretorFilme: (NSIndexPath*) indexPath secondObject: (UITableViewCell*) cell {
    
    UILabel *labelDiretor = [[UILabel alloc] initWithFrame:CGRectMake(130, 40, 250, 20)];
    
    self.diretor = [NSString stringWithFormat:@"Diretor: %@", [[[FilmeStore sharedStore] arrayDiretorFilme] objectAtIndex:indexPath.row]];

    [labelDiretor setText:self.diretor];
    
    UIFont *font = labelDiretor.font;
    labelDiretor.font = [font fontWithSize:14];
    
    [cell addSubview:labelDiretor];

}

//----------------------------------------------------------------------

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
