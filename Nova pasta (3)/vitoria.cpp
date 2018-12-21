#include <stdio.h>  
#include <conio.h> 
#include <stdlib.h>

	// Necessário para usar a função printf
			// A função printf exibe um ou mais dados na tela
int count = 0;  	 
int contador, sair, soma;
   char nome[500][30], cargo[500][30];
   int idade[500];
   float salario[500];	
   
 void calcularSalario (int c)
  {    
      int flag = 0;
  	 // count = 0; 
  	 printf("\tValor do count: %d \n", c); 
     if (c > 0)
      {
      	  for(int i =0; i < c; i++)
      	  {
		  	 // printf(" 50 anos \n"); 
		    if(idade[i] > 50) 
      	  	  {
      	  	  	  printf("\tNome: %s \n", nome[i]);
		  	      printf("\tIdade: %d \n", idade[i]);
			  	  printf("\tCargo: %s \n", cargo[i]);
			  	  printf("\tSalario: %f \n\n\n", salario[i]);
			  	  flag = 1;
			  }
		  }
		  
		  if(flag == 0)
		  {
		  	  printf("Não há funcionarios maiores de 50 anos \n"); 
		  }
	  }	 
  }
  
int main ()
{
   // clrscr();
   //  getch();   
    	
   
  //nome 30  %s      char str_vect [3][10] = { "Joao", "Maria", "Jose" };
  //idade   %d
  //salario  %f
  //cargo  %s
  
  contador = 0;
  sair = 1;
  
  
  while(sair == 1)
  {
  	  printf("Digite 1 para cadastrar Funcionario \n");
  	  printf("Digite 2 para Sair \n");  
  	  
  	  if(contador > 0)
  	  {
  	  	 printf("Digite 3 para Visualizar funcionarios maiores de 50 anos \n"); 
	  } 
  	  
	  scanf("%d", &sair);
  	  
  	  if(sair == 2)
  	  {   
		   while(count < contador)
			  {			  	 
			  	 printf("\tNome: %s \n", nome[count]);
			  	 printf("\tIdade: %d \n", idade[count]);
			  	 printf("\tCargo: %s \n", cargo[count]);
			  	 printf("\tSalario: %f \n\n\n", salario[count]);
			  	 count++;  
			  }
  	  	  break;
	  }
	  else if(sair == 3)
	  {
	  	 calcularSalario(contador);
	  }
	  else
	  {
	  	  printf("Iniciando cadastro \n\n\n");
	  	  printf("Digite o Nome: \n");
	  	  scanf("%s", &nome[contador]);
	  	  
	  	  printf("Digite a idade \n");
	  	  scanf("%d", &idade[contador]);
	  	  
	  	  printf("Digite o cargo \n");
	  	  scanf("%s", &cargo[contador]);
	  	  
		  printf("Digite salario \n");
		  scanf("%f", &salario[contador]);
		  
	  	  contador++;
	  }
  	  
  	  
  	  
  	  
  }
  
 
 
  
  //printf("Digite o nome: ");
  //scanf("%s", nome); //recebe um inteiro e armazena na variável a
  //printf("Nome %s", nome);
  //printf("Digite um numero inteiro: ");
  //scanf("%d", &b); //recebe um inteiro e armazena na variável b
  //soma = a + b;
  //Efetua adição de a com b e armazena na variável soma
  
 // printf("O valor da soma = %d\n", soma); //Mostra mensagem com o resultado
  
 // system ("pause");
   return 0; 
//Depois de Executar o programa, tecle ALT-F5 para ver o resultado na tela
}

