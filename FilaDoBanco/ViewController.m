//
//  ViewController.m
//  FilaDoBanco
//
//  Created by Tarek Jradi on 08/07/13.
//  Copyright (c) 2013 DasDad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadAtributos];
}

-(void)loadAtributos{
    self.fila   = [[NSMutableArray alloc] initWithCapacity:[self.qtdClientes.text intValue]];
    self.caixas = [[NSMutableArray alloc] initWithCapacity:[self.qtdCaixas.text intValue]];
    [self.resultados setContentSize:CGSizeMake(self.resultados.frame.size.width, 2000)];
}

-(IBAction)iniciaFila:(id)sender{
    if ([self validateForm]) {
        [self limpaPainel];
        for (int i = 0; i < [self.qtdCaixas.text intValue]; i++) {
            Caixas *caixa = [[Caixas alloc] init];
            [self.caixas addObject:caixa];
        }
        [self iniciaAtendimento];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        [self.qtdClientes resignFirstResponder];
        [self.qtdCaixas resignFirstResponder];
    }
}

-(void)limpaPainel{
    for (UILabel *lb in [self.resultados subviews])
        [lb removeFromSuperview];
    [self.fila removeAllObjects];
    [self.caixas removeAllObjects];
    self.horas  = [NSDate date];
    [self.qtdExpirados setText:@"Aguarde enquanto todos são atendidos."];
}

-(void)iniciaAtendimento{
    for (int x = 0; x < [self.caixas count]; x++) {
        Caixas *caixa = (Caixas *)[self.caixas objectAtIndex:x];
        
        Clientes *cliente = [[Clientes alloc] init];
        cliente.tempoAtendimento.dataInicial = self.horas;
        [cliente.tempoAtendimento startTimer];
        
        if (![caixa ocupado]){
            [self.fila addObject:cliente];
            [caixa setOcupado:YES];
            
            NSArray *objs = [NSArray arrayWithObjects:caixa, nil];
            NSArray *keys = [NSArray arrayWithObjects:@"caixa", nil];
            
            //Gera valor randomico para tempo do atendimento.
            int rndValue = 1 + arc4random() % (10 - 1);
            [NSTimer scheduledTimerWithTimeInterval:rndValue
                                             target:self
                                           selector:@selector(finalizaAtendimento:)
                                           userInfo:[NSDictionary dictionaryWithObjects:objs
                                                                                forKeys:keys]
                                                                                repeats:NO];
            [cliente.tempoAtendimento stopTimer];

            caixa = nil;
            cliente = nil;
            objs = nil;
            keys = nil;
        }
    }
}

-(void)finalizaAtendimento:(NSTimer *)timer{
    Caixas   *cx = (Caixas *)[[timer userInfo] valueForKey:@"caixa"];
    [cx setOcupado:NO];
    if ([self.fila count] >= [self.qtdClientes.text intValue]){
        [self fimAtendimentoGeral];
    }else
        [self iniciaAtendimento];
}

-(void)fimAtendimentoGeral{
    int count = 0;
    int expirados = 0;
    for (Clientes *cln in self.fila) {
        UILabel *tempoAtendimento = [[UILabel alloc] initWithFrame:CGRectMake(60,  count*20, 40, 20)];
        UILabel *tempoInicialFila = [[UILabel alloc] initWithFrame:CGRectMake(160, count*20, 20, 20)];

        int tempoAtend = (int)[cln.tempoAtendimento timeElapsedInSecondsTotal];
        if (tempoAtend > 10) expirados++;
        
        [tempoAtendimento setText:[NSString stringWithFormat:@"%i", tempoAtend]];
        [tempoInicialFila setText:[NSString stringWithFormat:@"%i", count]];

        [self.resultados addSubview:tempoInicialFila];
        [self.resultados addSubview:tempoAtendimento];
                
        count++;
        tempoAtendimento = nil;
        tempoInicialFila = nil;
    }
    [self.qtdExpirados setText:[NSString stringWithFormat:@"máximo (10m) : Qtde de Tempo Expirado = %i", expirados]];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(BOOL)validateForm{
    BOOL isValid = YES;
    UIColor *placeHolderColor = [UIColor colorWithRed:253.0/255.0 green:103.0/255.0 blue:102.0/255.0 alpha:1.f];
    if ([self.qtdCaixas.text intValue] >= 11 || [self.qtdCaixas.text length] == 0) {
        [self.qtdCaixas setText:@""];
        [self.qtdCaixas setPlaceholder:@"Max 10"];
        [self.qtdCaixas setValue:placeHolderColor
                      forKeyPath:@"_placeholderLabel.textColor"];
        isValid = NO;
    }
    if ([self.qtdClientes.text intValue] >= 101 || [self.qtdClientes.text length] == 0) {
        [self.qtdClientes setText:@""];
        [self.qtdClientes setPlaceholder:@"Max 100"];
        [self.qtdClientes setValue:placeHolderColor
                     forKeyPath:@"_placeholderLabel.textColor"];
        isValid = NO;
    }
        
    placeHolderColor = nil;
    return isValid;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
