//
//  AppDelegate.m
//  GetMovie
//
//  Created by Érika Tiemi Uehara Moriya on 4/6/15.
//  Copyright (c) 2015 LLBE Corp. All rights reserved.
//

#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "FilmeStore.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [Parse enableLocalDatastore];
    
    //[Parse setApplicationId:@"R7CrDlzjXJY3HjPTTCcfCX1hjkrn4SgfwpM5mKhw"
       //           clientKey:@"L1jDkXRq2X3ooclucDRBFd219V8Z4ILuttzKkomS"];

    
    [Parse setApplicationId:@"MfeeMf2ope18ievNWzFc3353nrJmHGDPjp3mmCs7"
                  clientKey:@"hbpF6rUJtTPK2IUDzwDcPmdsFOS5jlK4swvqXGCl"];

    
        // Override point for customization after application launch.
    [[FilmeStore sharedStore] loadFilme];

    /*PFObject *filme = [PFObject objectWithClassName:@"filmes"];
    //PFObject *usuarioFilmes = [PFObject objectWithClassName:@"usuarioFilmes"];
    // Salva os dados do usuário
    filme[@"nomeFilme"] = @"Super Velozes, Mega Furiosos";
    filme[@"dataLancamento"] = @"30/04/2015";
    filme[@"sinopse"] = @"Paul White (Alex Ashbaugh) é um policial que entra disfarçado para a gangue de corredores de rua ilegais liderada por Vin Serento (Dale Pavinski). Agindo de forma veloz e furiosa a gangue tem o plano ousado e, ao mesmo tempo, ridículode passar a perna no chefão do crime Juan carlos de la Sol (Omar Chaparro) e pegar o dinheiro que ele enconde em uma lanchonete de comida mexicana.";
    filme[@"elencoFilme"] = @"Alex Ashbaugh, Amin Joseph, Andrea Navedo, Chris Pang, Dale Pavinski, Daniel Booko, Dio Johnson, Gonzalo Menendez, Joseph Julian Soria, Lili Mirojnick, Michael Flores, Omar Chaparro, Shakira Barrera, Shantel Wislawski, Veronica McCluskey";
    filme[@"generoFilme"] = @"Comédia";
    filme[@"duration"] = @"99 minutos";
    filme[@"soundtrack"] = @"Tim Wynn";
    filme[@"rating"] = @"14 anos";
    filme[@"diretor"] = @"Aaron Seltzer, Jason Friedberg";
    
    //usuarioFilmes[@"email"] = _email.text;
    
    //Enviar pro DB
    //[usuario saveInBackground];
    [filme saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (succeeded){
            NSLog(@"Filme Uploaded!");
        }
        else{
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", errorString);
        }
        
    }]; */
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
