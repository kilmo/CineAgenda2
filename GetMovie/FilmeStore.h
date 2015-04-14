//
//  FilmeStore.h
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/7/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Filme.h"
@interface FilmeStore : NSObject

@property (nonatomic, strong) NSArray *arrayNomeFilme;
@property (nonatomic, strong) NSArray *arrayDiretorFilme;
@property (nonatomic, strong) NSArray *arrayDataFilme;
@property (nonatomic, strong) NSArray *arrayGenerosFilme;
@property (nonatomic, strong) NSArray *arrayFotoFilme;

@property (nonatomic, strong) NSMutableArray *gambiarra;
@property (nonatomic, strong) NSMutableArray *arrayFilmesUsuario;


+ (instancetype)sharedStore;//permite todas as classes ter acesso somente a uma instância dele, evita incoerências na informacao

- (void)loadFilme;
- (instancetype)init;
- (instancetype)initPrivate;

@end
