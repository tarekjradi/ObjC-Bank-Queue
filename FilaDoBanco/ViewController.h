//
//  ViewController.h
//  FilaDoBanco
//
//  Created by Tarek Jradi on 08/07/13.
//  Copyright (c) 2013 DasDad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Caixas.h"
#import "Clientes.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *qtdCaixas;   //(C)
@property (nonatomic, strong) IBOutlet UITextField *qtdClientes; //(N)

@property (nonatomic, strong) NSMutableArray *fila;
@property (nonatomic, strong) NSMutableArray *caixas;

// Tempo Corrente da Abertura da Fila.
@property (nonatomic, strong) NSDate *horas;

// Qtd Pessoas que passaram do Limite de Tempo.
@property (nonatomic, strong) IBOutlet UILabel      *qtdExpirados;

@property (nonatomic, strong) IBOutlet UIScrollView *resultados;

-(IBAction)iniciaFila:(id)sender;
-(void)iniciaAtendimento;

@end
