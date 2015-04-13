//
//  AgendaController.m
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/8/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//
#import "FilmeStore.h"
#import "AgendaController.h"

@interface AgendaController()
@property ( nonatomic, strong ) IBOutlet UITableView  *tabelaAgenda;
@property (weak, nonatomic) IBOutlet UIButton *botaoFavoritos;
@property (weak, nonatomic) IBOutlet UIButton *botaoMenu;


@end


@implementation AgendaController

- (IBAction)favoritosAgenda:(id)sender {
}

- (IBAction)menuAgenda:(id)sender {
}

- (void)viewDidLoad

{
    
    [super viewDidLoad];
    
    self.tabelaAgenda.dataSource = self;
    self.tabelaAgenda.delegate = self;
    
}

//------------------------------------------------

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}

//------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return [[[FilmeStore sharedStore] arrayFilmesUsuario] count];
    
}

//------------------------------------------------

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UIStoryboard * tela = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    //faz com que ao clicar na celula ela te redirecione para uma nova view
    UIViewController * tabelaDeFilmesAgenda = [tela instantiateViewControllerWithIdentifier:@"FilmeAgendaController"];
    
    [self presentViewController:tabelaDeFilmesAgenda animated:NO completion:nil];
    
}

//------------------------------------------------

//permite configurar a altura das células
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

//------------------------------------------------


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:

(NSIndexPath *)indexPath{
    
    NSString *simpleTableIdentifier = [NSString stringWithFormat:@"Cell %ld", (long)indexPath.row];
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
    
    //Adiciona itens nas células da tabela cada label é uma linha nova
    
    // Label Imagem do Filme
    //    for(NSString * str in _cartazEstreia){
    //        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 90, 120)];
    //        [imageView setImage:[UIImage imageNamed:str]];
    //        [cell addSubview:imageView];
    //    }
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 90, 120)];
//    [imageView setImage:[UIImage imageNamed:@"Layout Feed 01 Poster size.png"]];
//    [cell addSubview:imageView];
    
    
    
    // Botão Célula - Adicionar Filme
    /*UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
     [button addTarget:self action:@selector(aparecerView:) forControlEvents:UIControlEventTouchUpInside];
     [button setBackgroundImage:[UIImage imageNamed:@"Layout Feed 01 Agenda.png"] forState: UIControlStateNormal];
     [button sizeToFit];
     button.frame = CGRectMake(button.frame.origin.x,
     button.frame.origin.y, 85, 30);
     // Set a new (x,y) point for the button's center
     button.center = CGPointMake(335, 135);
     
     [cell addSubview:button]; */
    
    
    // Label Nome do Filme
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(130, 20, 240, 20)];
    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:14];
    [labelNome setText:[[[FilmeStore sharedStore] arrayFilmesUsuario] objectAtIndex:indexPath.row]];
    [cell addSubview:labelNome];
//    
//    // Label Diretor do Filme
//     UILabel *labelDiretor = [[UILabel alloc] initWithFrame:CGRectMake(130, 40, 250, 20)];
//     font = labelDiretor.font;
//     labelDiretor.font = [font fontWithSize:14];
//     [labelDiretor setText:[[[FilmeStore sharedStore] arrayDiretorFilme] objectAtIndex:indexPath.row]];
//     [cell addSubview:labelDiretor];
//     
//     // Label Generos do Filme
//     UILabel *labelGeneros = [[UILabel alloc] initWithFrame:CGRectMake(130, 60, 250, 20)];
//     font = labelGeneros.font;
//     labelGeneros.font = [font fontWithSize:14];
//     [labelGeneros setText:[[[FilmeStore sharedStore] arrayGenerosFilme] objectAtIndex:indexPath.row]];
//     [cell addSubview:labelGeneros];
//     
//     // Label Data do Filme
//     UILabel *labelData = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 60, 40)];
//     font = labelData.font;
//     labelData.font = [font fontWithSize:16];
//     [labelData setText:[[[FilmeStore sharedStore] arrayDataFilme] objectAtIndex:indexPath.row]];
//     [cell addSubview:labelData];
//    
//    
//    // Label Data Estréia do Filme
//    UILabel *labelEstreia = [[UILabel alloc] initWithFrame:CGRectMake(130, 90, 150, 20)];
//    font = labelEstreia.font;
//    labelEstreia.font = [font fontWithSize:16];
//    [labelEstreia setText:[[[FilmeStore sharedStore] arrayDataFilme] objectAtIndex:indexPath.row]];
//    [cell addSubview:labelData];
//    //cell.imageView.image = [UIImage imageNamed:@"image.png"];
//    
//    
    return cell;
}



@end
