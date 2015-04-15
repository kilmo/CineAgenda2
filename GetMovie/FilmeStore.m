//
//  FilmeStore.m
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/7/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//

#import <Parse/Parse.h>
#import "FilmeStore.h"

@interface FilmeStore ()

@property (nonatomic, strong) NSMutableArray *nomeFilme;
@property (nonatomic, strong) NSMutableArray *diretorFilme;
@property (nonatomic, strong) NSMutableArray *dataFilme;
@property (nonatomic, strong) NSMutableArray *generosFilme;
@property (nonatomic, strong) NSMutableArray *fotoFilme;

///
@end


@implementation FilmeStore

- (void) loadFilme {

PFQuery *query = [PFQuery queryWithClassName:@"filmes"];
//[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    NSArray* objects = [query findObjects];
    
        for(int i = 0; i != objects.count; i++)
        {
        PFObject *user = [objects objectAtIndex:i];
        PFFile *foto = user[@"filmeFoto"];
        
            [_fotoFilme addObject:foto.url];
            [_nomeFilme addObject:user[@"nomeFilme"]];
            [_diretorFilme addObject:user[@"diretor"]];
            [_dataFilme addObject:user[@"dataLancamento"]];
            [_generosFilme addObject:user[@"generoFilme"]];
            
        }
    }

// Fim loadFilme



- (NSArray *)arrayFotoFilme
{
    return [self.fotoFilme copy];
}

//------------------------------------------------

- (NSArray *)arrayNomeFilme
{
    return [self.nomeFilme copy];
}

//------------------------------------------------

- (NSArray *)arrayDiretorFilme
{
    return [self.diretorFilme copy];
}

//------------------------------------------------

- (NSArray *)arrayDataFilme
{
    return [self.dataFilme copy];
}

//------------------------------------------------

- (NSArray *)arrayGenerosFilme
{
    return [self.generosFilme copy];
}

//------------------------------------------------

+ (instancetype)sharedStore
{
    static FilmeStore *sharedStore;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

//------------------------------------------------

- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[FilmeStore sharedStore]"];
    return nil;
}

//------------------------------------------------

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        //_filmesPrivados = [[NSMutableArray alloc] init];
        _nomeFilme = [[NSMutableArray alloc] init];
        _diretorFilme  = [[NSMutableArray alloc] init];
        _dataFilme  = [[NSMutableArray alloc] init];
        _generosFilme  = [[NSMutableArray alloc] init];
        _fotoFilme = [[NSMutableArray alloc] init];
    }
    return self;
}


@end
