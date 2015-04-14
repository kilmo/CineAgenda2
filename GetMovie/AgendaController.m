//
//  AgendaController.m
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/8/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//
#import "FilmeStore.h"
#import "AgendaController.h"
#import "FilmeAgendaController.h"

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
    FilmeAgendaController * tabelaDeFilmesAgenda = [tela instantiateViewControllerWithIdentifier:@"FilmeAgendaController"];
    NSString *stringNome = [[[FilmeStore sharedStore] arrayNomeFilme] objectAtIndex:indexPath.row];
    
    FilmeStore *store = [FilmeStore sharedStore];
    
    if(![store gambiarra]){
        [store setGambiarra:[NSMutableArray array]];
    }
    [[store gambiarra]removeAllObjects];
    [[store gambiarra] addObject:stringNome];
    
    [self presentViewController:tabelaDeFilmesAgenda animated:YES completion:nil];
    
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
    
    // Label Nome do Filme
    UILabel *labelNome = [[UILabel alloc] initWithFrame:CGRectMake(130, 20, 240, 20)];
    UIFont *font = labelNome.font;
    labelNome.font = [font fontWithSize:14];
    [labelNome setText:[[[FilmeStore sharedStore] arrayFilmesUsuario] objectAtIndex:indexPath.row]];
    [cell addSubview:labelNome];

    return cell;
}



@end
