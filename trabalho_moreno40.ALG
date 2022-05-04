algoritmo "semnome"
// Função :
// Autor :
// Data : 30/10/2021
// Seção de Declarações
Var
TMPI:INTEIRO
TMPC:CARACTER
TMPR:REAL
TMPL:LOGICO

cli:logico
TotalCliente,TotalParcela:inteiro
Posicao1Cid:inteiro
Posicao1Est:inteiro
x,y,z,a,NomCli:inteiro
Contador:inteiro
Contador1,C,D:inteiro
MenCliConCidadeTot:inteiro
MenCliConEstadoTot:inteiro
MenCliConNomeTot:inteiro
Navega,menu:caractere
MenCliConTipo:inteiro
MenCliConCodigo:caractere
MenCliConCidade:caractere
MenCliConEstado:caractere
MenCliConOrdem:caractere
CodigoCli,NomeCli,CidadeCli,EstadoCli,CPFCli:vetor[1..150] de caractere
NumeroPar,CodigoPar,DataVePar,DataRePar,CodBanPar:vetor[1..150] de caractere
ValorPar:vetor[1..150] de real
Linha,Lixo:caractere

//------------------------------------------------------------------------------------------------------
//
//                                          MENU PRINCIPAL
//
//------------------------------------------------------------------------------------------------------
Procedimento MenPri

Inicio
Limpatela
Navega:=""
Escreval ("--------------------------------------------------")
Escreval ("                  Menu Principal")
Escreval ("--------------------------------------------------")
Escreval
Escreval ("[1] Clientes")
Escreval ("[2] Parcelas")
Escreval ("[3] Receitas")
Escreval ("[4] Importar Clientes e Parcelas")
Escreval ("[8] Créditos")
Escreval ("[9] Sair")
Escreval
Escreva ("Escolha uma das opções: ")
Leia(Navega)
Escolha Navega
Caso "1"
   MenCli
Caso "2"
   MenPar
Caso "3"
   MenRec
Caso "4"
   Se (CodigoCli[1] = "") Entao
      LeCliente
      LeParcela
      MenPri
   SeNao
      Escreva ("Atenção! Os arquivos já foram importados. Precione Enter para voltar")
      Leia (Lixo)
      MenPri
   FimSe
Caso "8"
   MenCre
Caso "9"
FimAlgoritmo
FimEscolha

FimProcedimento
//------------------------------------------------------------------------------------------------------
//
//                                          MENU CLIENTES
//
//------------------------------------------------------------------------------------------------------
Procedimento MenCli
Inicio

Limpatela
ZerConCli
Navega:=""
Escreval ("--------------------------------------------------")
Escreval ("                  Menu Clientes")
Escreval ("--------------------------------------------------")
Escreval
Escreval ("[1] Consultas")
Escreval ("[2] Incluir")
Escreval ("[3] Alterar")
Escreval ("[4] Excluir")
Escreval ("[9] Voltar")
Escreval
Escreva ("Escolha uma das opções: ")
Leia (Navega)
Escolha (Navega)
Caso "1"
MenCliCon
Caso "2"
MenCliInc
Caso "3"
MenCliAlt
Caso "4"
MenCliExc
Caso "9"
MenPri
FimEscolha

FimProcedimento
//------------------------------------------------------------------------------------------------------
//
//                                          MENU CLIENTES CONSULTAS
//
//------------------------------------------------------------------------------------------------------
Procedimento MenCliCon
Var
Inicio

Limpatela
ZerConCli
Navega:=""
Escreval ("--------------------------------------------------")
Escreval ("              Menu Clientes Consultas")
Escreval ("--------------------------------------------------")
Escreval ("Tipo de Busca: ")
Escreval
Escreval ("[1] Por Cidade")
Escreval ("[2] Por Estado")
Escreval ("[3] Todos")
Escreval ("[4] Por Código")
Escreval ("[9] Voltar")
Escreval
Escreva ("Digite sua opção: ")
Leia (MenCliConTipo)
Enquanto (MenCliConTipo <> 1) e (MenCliConTipo <> 2) e (MenCliConTipo <> 3) e (MenCliConTipo <> 4) e (MenCliConTipo <> 9) Faca
Escreva ("Digite uma opção válida: ")
Leia (MenCliConTipo)
FimEnquanto
Escolha (MenCliConTipo)

Caso 1
Escreval
Escreva ("Digite a Cidade: ")
Leia (MenCliConCidade)
Para x de 1 ate TotalCliente Faca
   Se (CidadeCli[x] = MenCliConCidade) Entao
      TMPC:=CidadeCli[x]
   FimSe
FimPara
Se (TMPC = "") Entao
   Escreval
   Escreva ("Nenhum cliente cadastrado nessa cidade. Prescione Enter para continuar")
   Leia (Lixo)
   MenCliCon
FimSe

Caso 2
Escreval
Escreva ("Digite o Estado (Dois Digitos): ")
Leia (MenCliConEstado)
Para x de 1 ate TotalCliente Faca
   Se (EstadoCli[x] = MenCliConEstado) Entao
      TMPC:=EstadoCli[x]
   FimSe
FimPara
Se (TMPC = "") Entao
   Escreval
   Escreva ("Nenhum cliente cadastrado nesse estado. Prescione Enter para continuar")
   Leia (Lixo)
   MenCliCon
FimSe

Caso 4
Escreval
Escreva ("Digite o Código: ")
Leia (MenCliConCodigo)
Para x de 1 ate TotalCliente Faca
   Se (MenCliConCodigo = CodigoCli[x]) Entao
      MenCliConCod
      MenCliConCodigo:=""
   FimSe
FimPara
Se (x = TotalCliente+1) Entao
   Escreval
   Escreva ("Código não encontrado. Prescione Enter para voltar")
   Leia (Lixo)
   MenCliConCodigo:=""
   MenCliCon
FimSe

Caso 9
MenCli
FimEscolha

Escreval
Escreval ("Ordem de classificação:")
Escreval
Escreval ("[1] Código")
Escreval ("[2] Nome")
Escreval
Escreva ("Digite sua opção: ")
Leia (MenCliConOrdem)
Enquanto (MenCliConOrdem <> "1") e (MenCliConOrdem <> "2") Faca
Escreva ("Digite uma opção válida: ")
Leia (MenCliConOrdem)
FimEnquanto
Escolha (MenCliConTipo)

Caso 1
Escolha (MenCliConOrdem)
Caso "1"
   CidECod
Caso "2"
   CidENom
FimEscolha
Caso 2
Escolha (MenCliConOrdem)
Caso "1"
   EstECod
Caso "2"
   EstENom
FimEscolha
Caso 3
Escolha (MenCliConOrdem)
Caso "1"
   TotECod
Caso "2"
   TotENom
FimEscolha
FimEscolha

FimProcedimento
//------------------------------------------------------------------------------------------------------
//
//                                          MENU CLIENTES INCLUIR
//
//------------------------------------------------------------------------------------------------------
Procedimento MenCliInc
var

simnao:caracter

inicio

TotalCliente:=TotalCliente+1
LimpaTela
Escreval ("--------------------------------------------------")
Escreval ("               Adicionar novo cliente")
Escreval ("--------------------------------------------------")
Escreval
Escreva ("Insira o código do cliente: ")
leia (CodigoCli[TotalCliente])

TMPL:=ValCod(CodigoCli[TotalCliente])
Enquanto TMPL = Verdadeiro Faca
Escreva ("Código já cadastrado. Digite outro código: ")
Leia (CodigoCli[TotalCliente])
TMPL:=ValCod(CodigoCli[TotalCliente])
FimEnquanto

Escreval ("")
Escreva ("Nome: ")
Leia(NomeCli[TotalCliente])

Escreval ("")
Escreva ("Cidade: ")
Leia(CidadeCli[TotalCliente])

Escreval ("")
Escreva ("Estado (UF): ")
Leia(EstadoCli[TotalCliente])
TMPL:=valEst(EstadoCli[TotalCliente])
Enquanto TMPL = Falso Faca
Escreva ("Formato do nome incorreto. Digite apenas duas letras: ")
Leia(EstadoCli[TotalCliente])
TMPL:=valEst(EstadoCli[TotalCliente])
FimEnquanto

Escreval("Escolha entre o CPF OU CNPJ: ")
Escreval ("[1] CPF")
Escreval ("[2] CNPJ")
Leia (TMPC)
Escolha TMPC

Caso "1"
Escreva("Informe o CPF (somente numeros):")
leia(CPFCli[TotalCliente])

CPFCli[TotalCliente]:=arruma_CPF(CPFCli[TotalCliente])

Escreval ("")
Escreva("Deseja incluir o cliente (S ou N): ")
Leia (simnao)
Enquanto (simnao <> "S") e (simnao <> "N") Faca
   Escreva("Digite S ou N: ")
   Leia(simnao)
FimEnquanto

Se (simnao = "N") Entao
   CodigoCli[TotalCliente]:=""
   NomeCli[TotalCliente]:=""
   CidadeCli[TotalCliente]:=""
   EstadoCli[TotalCliente]:=""
   CPFCli[TotalCliente]:=""
   TotalCliente:=TotalCliente-1
FimSe
MenCli

Caso "2"
Escreva("Informe o CNPJ (somente numeros):")
leia(CPFCli[TotalCliente])

CPFCli[TotalCliente]:=arruma_CNPJ(CPFCli[TotalCliente])

Escreval ("")
Escreva("Deseja incluir o cliente (S ou N): ")
Leia (simnao)
Enquanto (simnao <> "S") e (simnao <> "N") Faca
   Escreva("Digite S ou N: ")
   Leia(simnao)
FimEnquanto

Se (simnao = "N") Entao
   CodigoCli[TotalCliente]:=""
   NomeCli[TotalCliente]:=""
   CidadeCli[TotalCliente]:=""
   EstadoCli[TotalCliente]:=""
   CPFCli[TotalCliente]:=""
   TotalCliente:=TotalCliente-1
FimSe
MenCli
fimescolha
FimProcedimento
//------------------------------------------------------------------------------------------------------
//
//                                          MENU CLIENTES ALTERAR
//
//------------------------------------------------------------------------------------------------------
Procedimento MenCliAlt
Var
simnao,opcao,CodigoCli: caracter
AlterarCliente: inteiro
inicio
LimpaTela
Escreval ("--------------------------------------------------")
Escreval ("               Alterar de Cliente")
Escreval ("--------------------------------------------------")
Escreval
Escreva ("Insira o código do cliente: ")
Leia(CodigoCli)
TMPL:=valCodAlt(CodigoCli)
Enquanto TMPL = Verdadeiro Faca
Escreval
Escreva ("Código inexistente. Digite outro código: ")
Leia (CodigoCli)
TMPL:=valCodAlt(CodigoCli)
FimEnquanto

Para x de 1 ate TotalCliente Faca
Se (CodigoCli = CodigoCli[x]) Entao
   AlterarCliente:=x
FimSe
FimPara

Escreval
Escreval ("[1] Alterar Nome")
Escreval ("[2] Alterar Cidade")
Escreval ("[3] Alterar Estado")
Escreval ("[4] Alterar CPF/CNPJ")
Escreval ("[9] Voltar")
Escreva ("Opção: ")
Leia(opcao)
Enquanto (opcao <> "1") e (opcao <> "2") e (opcao <> "3") e (opcao <> "4") e (opcao <> "9") Faca
Escreva ("Digite uma opção válida: ")
Leia (opcao)
FimEnquanto
Escolha opcao

caso "1"
Escreval
Escreva ("Informe o novo Nome: ")
Leia(TMPC)
menu:=(tmpc)
se verifica_cidade=menu entao
fimse
Escreval
Escreval("Deseja mesmo alterar (S ou N)? ")
leia(simnao)
Enquanto (simnao <> "S") e (simnao <> "N") Faca
   Escreval
   Escreva ("Digite S ou N: ")
   Leia(simnao)
FimEnquanto
SE simnao = "S" ENTAO
   NomeCli[AlterarCliente]:=TMPC
FimSe

Caso "2"
Escreval
Escreva ("Informe a nova Cidade: ")
Leia(TMPC)
menu:=tmpc
se verifica_cidade=menu entao
fimse
Escreval
Escreval("Deseja mesmo alterar (S ou N)? ")
leia(simnao)
Enquanto (simnao <> "S") e (simnao <> "N") Faca
   Escreval
   Escreva("Digite S ou N: ")
   Leia(simnao)
FimEnquanto
SE simnao = "S" ENTAO
   CidadeCli[AlterarCliente]:=TMPC
FimSe

Caso "3"
Escreval
Escreva ("Informe o novo Estado: ")
Leia(tmp)

TMPL:=valEst(TMPC)
Enquanto TMPL = Falso Faca
   Escreva ("Formato do nome incorreto. Digite apenas duas letras: ")
   Leia(TMPC)
   menu:=tmpc
se valEst=menu entao
fimse
FimEnquanto
Escreval
Escreval("Deseja mesmo alterar (S ou N)? ")
leia(simnao)
Enquanto (simnao <> "S") e (simnao <> "N") Faca
   Escreval
   Escreva("Digite S ou N: ")
   Leia(simnao)
FimEnquanto
SE simnao = "S" ENTAO
   EstadoCli[AlterarCliente]:= TMPC
fimse

Caso "4"
Escreval
Escreva ("Informe o novo CPF/CNPJ: ")
Leia(TMPC)
se tmpc=11 entao
menu:=tmpc
se valida_CPF=menu entao //**VALIDAR CPF
fimse
Escreval
Escreval("Deseja mesmo alterar (S ou N)? ")
Leia(simnao)
Enquanto (simnao <> "S") e (simnao <> "N") Faca
   Escreval
   Escreva("Digite S ou N: ")
   Leia(simnao)
FimEnquanto
SE simnao = "S" ENTAO
   CPFCli[AlterarCliente]:= TMPC
FimSe
FimEscolha

MenCli

FimProcedimento
//------------------------------------------------------------------------------------------------------
//
//                                          MENU CLIENTES EXCLUIR
//
//------------------------------------------------------------------------------------------------------
Procedimento MenCliExc
var
CodigoCli:caracter
simnao:caracter
cli:inteiro
Inicio
LimpaTela
Escreval ("--------------------------------------------------")
Escreval ("               Excluir um cliente")
Escreval ("--------------------------------------------------")
Escreval
cli:=0
repita
Escreva ("Insira o código do cliente: ")
Leia(CodigoCli)
TMPL:=valCodAlt(CodigoCli)
Enquanto TMPL = Verdadeiro Faca
   Escreval
   Escreva ("Código inexistente. Digite outro código: ")
   Leia (CodigoCli)
   TMPL:=valCodAlt(CodigoCli)
FimEnquanto

Para x de 1 ate TotalCliente Faca
   Se (CodigoCli = CodigoCli[x]) Entao
      TMPI:=x
   FimSe
FimPara

Para x de 1 ate TotalParcela Faca
   Se (CodigoCli[TMPI] = CodigoPar[x]) Entao
      Se (DataRePar[x] = "") Entao
         Escreva ("Cliente com parcela em aberto. Prescione Enter para voltar!")
         Leia(Lixo)
         MenCli
      FimSe
   FimSe
FimPara

Para x de 1 ate TotalCliente Faca
   Se (CodigoCli = CodigoCli[x]) Entao
      cli:=cli+1
      Escreval("             Nome: ",NomeCli[x])
      Escreval("           Cidade: ",CidadeCli[x])
      Escreval("               UF: ",EstadoCli[x])
      Escreval("         CPF/CNPJ: ",CPFCli[x])
      Escreval
      Escreva("Deseja excluir o cliente (S ou N): ")
      leia (simnao)
      Enquanto (simnao <> "S") e (simnao <> "N") Faca
         Escreval
         Escreva("Digite S ou N: ")
         Leia(simnao)
      FimEnquanto
   FimSe

   Se (simnao = "S") Entao
      CodigoCli[x]:=""
      NomeCli[x]:=""
      CidadeCli[x]:=""
      EstadoCli[x]:=""
      CPFCli[x]:=""
   FimSe
FimPara
MenCli
FimProcedimento
//------------------------------------------------------------------------------------------------------
//
//                                          MENU PARCELAS
//
//------------------------------------------------------------------------------------------------------
Procedimento MenPar
Inicio

Limpatela
Navega:=""
Escreval ("--------------------------------------------------")
Escreval ("                  Menu Parcelas")
Escreval ("--------------------------------------------------")
Escreval
Escreval ("[1] Consultas")
Escreval ("[2] Incluir")
Escreval ("[3] Alterar")
Escreval ("[4] Excluir")
Escreval ("[9] Voltar")
Escreval
Escreva ("Escolha uma das opções: ")
Leia (Navega)
Escolha Navega
Caso "1"
   MenParCon
Caso "2"
   MenParInc
Caso "3"
   MenParAlt
Caso "4"
   MenParExc
Caso "9"
   MenPri
FimEscolha

FimProcedimento
//------------------------------------------------------------------------------------------------------
//
//                                          MENU PARCELAS CONSULTAS
//
//------------------------------------------------------------------------------------------------------
Procedimento MenParCon
Var
MenParConTipo:inteiro
Inicio

Limpatela
ZerConCli
Navega:=""
Escreval ("--------------------------------------------------")
Escreval ("             Menu Parcelas Consultas")
Escreval ("--------------------------------------------------")
Escreval ("")
Escreval ("Tipo de Busca: ")
Escreval ("")
Escreval ("[1] Por Número")
Escreval ("[2] Por Vencimento")
Escreval ("[9] Voltar")
Escreval ("")
Escreva ("Digite sua opção: ")
Leia (MenParConTipo)
Enquanto (MenParConTipo <> 1) e (MenParConTipo <> 2) e (MenParConTipo <> 9) Faca
   Escreva ("Digite uma opção válida: ")
   Leia (MenParConTipo)
FimEnquanto
Escolha (MenParConTipo)
Caso 1
   MenParConNum
Caso 2
   MenParConVen
Caso 9
   MenPar
FimEscolha

FimProcedimento
//------------------------------------------------------------------------------------------------------
//
//                                          MENU ADICIONAR PARCELAS
//
//------------------------------------------------------------------------------------------------------
Funcao valCodPar(Var P:caractere):logico
Var
Q,X:inteiro
Inicio
Q:=1
Para x de 1 ate TotalCliente Faca
   Se (P = CodigoCli[x]) Entao
      Q:=Q+1
   FimSe
FimPara
Se Q <> 1 Entao
   Retorne Verdadeiro
FimSe
Se Q = 1 Entao
   Retorne Falso
FimSe

FimFuncao
//-----------------------------------------------------------------------------------------------------
Procedimento MenParInc
var
simnao:caracter
ValidacaoCod:caractere
teste:real
PAR:logico
inicio
TotalParcela:=TotalParcela+1
LimpaTela
Escreval ("--------------------------------------------------")
Escreval ("             Adicionar uma nova parcela")
Escreval ("--------------------------------------------------")
Escreval ("")
Escreva ("Insira o número: ")
Leia(NumeroPar[TotalParcela])


PAR:=valNumPar(NumeroPar[TotalParcela])
Enquanto PAR = Verdadeiro Faca
   Escreva ("Número já cadastrado. Digite outro número: ")
   Leia (NumeroPar[TotalParcela])
   PAR:=valNumPar(NumeroPar[TotalParcela])
FimEnquanto

Se (verifica_num(NumeroPar[TotalParcela]) <> NumeroPar[TotalParcela]) Entao
   Para x de 1 ate TotalParcela-1 Faca
      Se (NumeroPar[TotalParcela] = NumeroPar[x]) Entao
         Escreval ("")
         Escreva ("Numero de parcela já cadastrado. Insira um novo número: ")
         Leia (NumeroPar[TotalCliente])
      FimSe
   FimPara
FimSe

Escreval ("")
Escreva ("Código do cliente: ")
Leia(CodigoPar[TotalParcela])

PAR:=ValCodPar(CodigoPar[TotalParcela])
Enquanto PAR = Falso Faca
   Escreva ("Código não encontrado. Digite outro código: ")
   Leia (CodigoPar[TotalParcela])
   PAR:=ValCodPar(CodigoPar[TotalParcela])
FimEnquanto

Escreval ("")
Escreva ("Data de Vencimento: ")
Leia(DataVePar[TotalParcela])
menu<-DataVePar[TotalParcela]
se verifica_venc(menu)=menu entao
fimse
Escreval ("")
Escreva ("Valor: R$")
Leia(ValorPar[TotalParcela])
Escreval ("")
Escreva ("Código do Banco: ")
Leia(CodBanPar[TotalParcela])
menu<-CodBanPar[TotalParcela]
se valida_banco(menu)=menu entao
fimse
Escreval ("")
escreva("Deseja incluir a parcela (S ou N): ")
leia (simnao)
Enquanto (simnao <> "S") e (simnao <> "N") Faca
   Escreval ("")
   Escreva("Digite S ou N: ")
   Leia(simnao)
FimEnquanto
Se (simnao = "N") Entao
   NumeroPar[TotalParcela]:="999999/9"
   CodigoPar[TotalParcela]:=""
   DataVePar[TotalParcela]:="99/99/9999"
   ValorPar[TotalParcela]:=0
   CodBanPar[TotalParcela]:=""
   TotalParcela:=TotalParcela-1
FimSe
MenPar
FimProcedimento
//------------------------------------------------------------------------------------------------------
Funcao valParAlt(Var P:caractere):logico
Var
Q,X:inteiro
Inicio
Q:=1
Para x de 1 ate TotalParcela Faca
   Se (P = CodigoCli[x]) Entao
      Q:=Q+1
   FimSe
FimPara
Se Q <> 1 Entao
   Retorne Verdadeiro
FimSe
Se Q = 1 Entao
   Retorne Falso
FimSe

FimFuncao
//------------------------------------------------------------------------------------------------------

Procedimento MenParAlt
Var
simnao, tmp, opcao, ParcelaPar: caracter
AlteraParcela: inteiro
PAR:logico
TMP1:real
inicio

Escreval("Alteração de Parcela")
Escreval
Escreva ("Insira o número da parcela: ")
Leia(ParcelaPar)
menu:=ParcelaPar
se verifica_num=menu entao
fimse

Para x de 1 ate TotalParcela Faca
   Se (NumeroPar[x] = ParcelaPar) Entao
      AlteraParcela:=x
   FimSe
FimPara

Escreval
Escreval
Escreval("1 - Alterar Código")
Escreval("2 - Alterar Data de Vencimento")
Escreval("3 - Alterar Data de Recebimento")
Escreval("4 - Alterar Valor")
Escreval("5 - Alterar Banco")
Escreval("9 - Voltar")
Escreva("Opção: ")
Leia(opcao)
Escreval

Enquanto (opcao <> "1") e (opcao <> "2") e (opcao <> "3") e (opcao <> "4") e (opcao <> "5") e (opcao <> "9") Faca
   Escreva ("Digite uma opção válida: ")
   Leia (opcao)
FimEnquanto

Escolha opcao

caso "1"
   Escreva ("Informe o novo código: ")
   Leia(tmp)
   Escreval("Deseja mesmo alterar (S ou N)? ")
   leia(simnao)
   Enquanto (simnao <> "S") e (simnao <> "N") Faca
      Escreva("Digite S ou N: ")
      Leia(simnao)
   FimEnquanto
   SE simnao = "S" ENTAO
      CodigoPar[AlteraParcela]:=tmp
   fimse
   MenPar

caso "2"
   Escreva ("Informe a nova data de vencimento: ")
   Leia(tmp)
   menu:=tmp
se verifica_venc=menu entao
fimse
   Escreval("Deseja mesmo alterar (S ou N)? ")
   leia(simnao)
   Enquanto (simnao <> "S") e (simnao <> "N") Faca
      Escreva("Digite S ou N: ")
      Leia(simnao)
   FimEnquanto
   SE simnao = "S" ENTAO
      DataVePar[AlteraParcela]:= tmp
   fimse
   MenPar

caso "3"
   Escreva ("Informe a data de recebimento: ")
   Leia(tmp)
      menu:=tmp
se verifica_venc=menu entao
   Escreval("Deseja mesmo alterar (S ou N)? ")
   leia(simnao)
   Enquanto (simnao <> "S") e (simnao <> "N") Faca
      Escreva("Digite S ou N: ")
      Leia(simnao)
   FimEnquanto
   SE simnao = "S" ENTAO
      DataRePar[AlteraParcela]:= tmp
   fimse
   MenPar

caso "4"
   Escreva ("Informe o novo valor: ")
   Leia(tmp1)
   Escreval("Deseja mesmo alterar (S ou N)? ")
   leia(simnao)
   Enquanto (simnao <> "S") e (simnao <> "N") Faca
      Escreva("Digite S ou N: ")
      Leia(simnao)
   FimEnquanto
   SE simnao = "S" ENTAO
      ValorPar[AlteraParcela]:= tmp1
   fimse
   MenPar

caso "5"
   Escreva ("Informe o código do novo banco: ")
   Leia(tmp)
      menu:=tmp
se codpnome=menu entao
fimse
   Escreval("Deseja mesmo alterar (S ou N)? ")
   leia(simnao)
   Enquanto (simnao <> "S") e (simnao <> "N") Faca
      Escreva("Digite S ou N: ")
      Leia(simnao)
   FimEnquanto
   SE simnao = "S" ENTAO
      CodBanPar[AlteraParcela]:= tmp
   fimse
   MenPar

caso "9"
   MenPar

fimescolha
FimProcedimento
//------------------------------------------------------------------------------------------------------
Procedimento MenParExc
var
simnao,c:caracter
cli:inteiro

TMP:inteiro
Inicio
LimpaTela
Escreval ("--------------------------------------------------")
Escreval ("               Excluir uma parcela")
Escreval ("--------------------------------------------------")
Escreval
cli:=0
repita
   Escreva ("Insira o número da parcela: ")
   leia (c)

   //Para x de 1 ate TotalParcela Faca
   //   Se (c = NumeroPar[x]) Entao
   //      tmp:=x
   //   FimSe
   //FimPara

   //Para x de 1 ate TotalParcela Faca
   //   Se (CodigoCli[TMP] = CodigoPar[x]) Entao
   //      Se (DataRePar[x] = "") Entao
   //        Escreva ("Cliente com parcela em aberto. Prescione Enter para voltar!")
   //         Leia(Lixo)
   //         MenCli
   //      FimSe
   //   FimSe
   //FimPara

   para x de 1 ate TotalParcela faca
      se c = NumeroPar[x] entao
         cli:=cli+1
         Escreval("  Número da parcela: ",NumeroPar[x])
         Escreval("             Código: ",CodigoPar[x])
         Escreval(" Data de Vencimento: ",DataVePar[x])
         Escreval("Data de Recebimento: ",DataRePar[x])
         Escreval("              Valor: ",ValorPar[x])
         Escreval("              Banco: ",CodBanPar[x])
         Escreval
         Escreva("Deseja excluir a parcela (S ou N): ")
         leia (simnao)
         Enquanto (simnao <> "S") e (simnao <> "N") Faca
            Escreva("Digite S ou N: ")
            Leia(simnao)
         FimEnquanto
         Se (simnao = "S") Entao
            NumeroPar[x]:="99999/9"
            CodigoPar[x]:=""
            DataVePar[x]:=""
            DataRePar[x]:=""
            ValorPar[x]:=0
            CodBanPar[x]:=""
            TotalParcela:=TotalParcela-1
         FimSe
      senao
         c:=c
      fimse
   fimpara
   Se (cli=0) ENTAO
      escreval("A parcela não existe")
   fimse
Ate (cli<>0)
MenPar

FimProcedimento
//------------------------------------------------------------------------------------------------------
//
//                                          MENU RECEITAS
//
//------------------------------------------------------------------------------------------------------
Procedimento MenRec
Inicio

Limpatela
Navega:=""
Escreval ("--------------------------------------------------")
Escreval ("                  Menu Receitas")
Escreval ("--------------------------------------------------")
Escreval ("")
Escreval ("[1] Por Cliente")
Escreval ("[2] Por Banco")
Escreval ("[3] Total em Aberto")
Escreval ("[4] Total Recebido")
Escreval ("[5] Total Geral")
Escreval ("[9] Voltar")
Escreval ("")
Escreva ("Escolha uma das opções: ")
Leia (Navega)
Escolha Navega
Caso "1"
   MenRecCli
Caso "2"
   MenRecBanco
Caso "3"
   MenRecTotAberto
Caso "4"
   MenRecTotRecebido
Caso "5"
   MenRecTotGeral
Caso "9"
   MenPri
FimEscolha

FimProcedimento
//------------------------------------------------------------------------------------------------------
//
//                                          MENU RECEITAS POR CLIENTE
//
//------------------------------------------------------------------------------------------------------
Procedimento MenRecCli
Inicio

Limpatela
Navega:=""
Escreval ("--------------------------------------------------")
Escreval ("             Menu Receitas Por Cliente")
Escreval ("--------------------------------------------------")
Escreval ("")
Escreval ("[1] Em Aberto")
Escreval ("[2] Recebidas")
Escreval ("[3] Em Aberto e Recebidas")
Escreval ("[9] Voltar")
Escreval ("")
Escreva ("Escolha uma das opções: ")
Leia (Navega)
Escolha (Navega)
Caso "1"
   MenRecCliAberto
Caso "2"
   MenRecCliRecebidos
Caso "3"
   MenRecCliAbertoERecebido
caso "9"
   MenRec
FimEscolha

FimProcedimento
//------------------------------------------------------------------------------------------------------
Procedimento MenRecCliAberto
var
x,tot:inteiro
c,menu: caractere
irr: caracter
inicio
limpatela
Escreval ("--------------------------------------------------")
Escreval ("              Receitas em aberto")
Escreval ("--------------------------------------------------")
Escreval ("")
Escreval("Consultando receitas em aberto")
Escreval("Como deseja consultar?")
Escreval("[1]- Todos os clientes")
Escreval("[2]- Cliente específico")
Escreval("[9]- Voltar")
Escreva("")
leia(menu)
escolha (menu)
caso "1"
   tot:= tot + 1
   para x de 1 ate 80 faca
      se DataVePar[X] = "" entao
         x:=x
      senao
         se DataRePar[x] = ""  entao
            Escreval(CodigoCli[x]:6, NumeroPar[x]:9, DataVePar[x]:11,"R$ ",ValorPar[x]:7:2," ",codpnome(CodBanPar[x]))
         fimse
      fimse
   fimpara
   Escreva ("Prescione Enter para voltar")
   Leia (Lixo)
   MenRecCli
caso "2"
   escreva("Imforme o codigo do cliente(apenas 4 digitos: ")
   leia (irr)
   para x de 1 ate 80 faca
      se CodigoCli[x] = irr entao
         se DataRePar[x] = ""  entao
            tot:= tot + 1
            Escreval(CodigoCli[x]:6, NumeroPar[x]:9, DataVePar[x]:11,"R$ ",ValorPar[x]:7:2," ",codpnome(CodBanPar[x]))
         fimse
      fimse
   fimpara
   se tot=0 entao
      escreval("O cliente não possui parcelas em aberto")
   fimse
   Escreva ("Prescione Enter para voltar")
   Leia (Lixo)
   MenRecCli
caso "9"
   MenRecCli
fimescolha
FimProcedimento
//------------------------------------------------------------------------------------------------------
Procedimento MenRecCliRecebidos
var
x,tot:inteiro
c,menu: caractere
irr: caracter
inicio
limpatela
Escreval ("--------------------------------------------------")
Escreval ("              Receitas Recebidas")
Escreval ("--------------------------------------------------")
Escreval ("")
Escreval("Consultando receitas recebidas")
Escreval("Como deseja consultar?")
Escreval("[1]- Todos os clientes")
Escreval("[2]- Cliente específico")
Escreval("[9]- Voltar")
Escreva("")
leia(menu)
escolha (menu)
caso "1"
   tot:= tot + 1
   para x de 1 ate 80 faca
      se DataRePar[x] <> ""  entao
         Escreval(CodigoCli[x]:6, NumeroPar[x]:9, DataVePar[x]:11,"R$ ",ValorPar[x]:7:2," ",DataRePar[x]:11,codpnome(CodBanPar[x]))
      fimse
   fimpara
   Escreva ("Prescione Enter para voltar")
   Leia (Lixo)
   MenRecCli
caso "2"
   escreva("Imforme o codigo do cliente(apenas 4 digitos): ")
   leia (irr)
   para x de 1 ate 80 faca
      se CodigoCli[x] = irr entao
         se DataRePar[x] <> ""  entao
            tot:= tot + 1
            Escreval(CodigoCli[x]:6, NumeroPar[x]:9, DataVePar[x]:11,"R$ ",ValorPar[x]:7:2," ",DataRePar[x]:11,codpnome(CodBanPar[x]))
         fimse
      fimse
   fimpara
   se tot=0 entao
      escreval("O cliente não possui parcelas recebidas")
   fimse
   Escreva ("Prescione Enter para voltar")
   Leia (Lixo)
   MenRecCli
caso "9"
   MenRecCli
fimescolha
FimProcedimento
//------------------------------------------------------------------------------------------------------
Procedimento MenRecCliAbertoERecebido
var
x,tot:inteiro
c,menu: caractere
inicio
limpatela
Escreval ("--------------------------------------------------")
Escreval ("              Receitas Recebidas e em aberto")
Escreval ("--------------------------------------------------")
Escreval ("")
Escreval("Consultando receitas Recebidas e em aberto")
Escreval("Como deseja consultar?")
Escreval("[1]- Todos os clientes")
Escreval("[2]- Cliente específico")
Escreval("[9]- Voltar")
Escreva("")
leia(menu)
escolha (menu)
caso "1"
   tot:= tot + 1
   para x de 1 ate 80 faca
      se DataRePar[x] <> ""  entao
         Escreval(CodigoCli[x]:6, NumeroPar[x]:9, DataVePar[x]:11,"R$ ",ValorPar[x]:7:2," ",DataRePar[x]:11,codpnome(CodBanPar[x]))
      senao
         se DataVePar[x] = "" entao
            x:=x
         senao
            Escreval(CodigoCli[x]:6, NumeroPar[x]:9, DataVePar[x]:11,"R$ ",ValorPar[x]:7:2,"            ",codpnome(CodBanPar[x]))
         fimse
      fimse
   fimpara
   Escreva ("Prescione Enter para voltar")
   Leia (Lixo)
   MenRecCli
caso "2"
   escreva("Imforme o codigo do cliente(apenas 4 digitos): ")
   leia (irr)
   para x de 1 ate 80 faca
      se CodigoCli[x] = irr entao
         se DataRePar[x] <> ""  entao
            tot:= tot + 1
            Escreval(CodigoCli[x]:6, NumeroPar[x]:9, DataVePar[x]:11,"R$ ",ValorPar[x]:7:2," ",DataRePar[x]:11,codpnome(CodBanPar[x])))
         senao
            Escreval(CodigoCli[x]:6, NumeroPar[x]:9, DataVePar[x]:11,"R$ ",ValorPar[x]:7:2,"            ",codpnome(CodBanPar[x]))
         fimse
      fimse
   fimpara
   se tot=0 entao
      escreval("O cliente não possui parcelas")
   fimse
   Escreva ("Prescione Enter para voltar")
   Leia (Lixo)
   MenRecCli
caso "9"
   MenRecCli
fimescolha
FimProcedimento
//------------------------------------------------------------------------------------------------------
Procedimento MenRecBanco
inicio

Limpatela
Navega:=""
Escreval ("--------------------------------------------------")
Escreval ("              Menu Receitas Por Banco")
Escreval ("--------------------------------------------------")
Escreval ("")
Escreval ("[1] Em Aberto")
Escreval ("[2] Recebidas")
Escreval ("[3] Em Aberto e Recebidas")
Escreval ("[4] Resumo das Receitas Em Aberto")
Escreval ("[5] Resumo das Receitas Recebidas")
Escreval ("[9] Voltar")
Escreval ("")
Escreva ("Escolha uma das opções: ")
Leia (Navega)
Escolha Navega
Caso "1"
   MenRecBanAberto
Caso "2"
   MenRecBanRecebido
Caso "3"
   MenRecBanAbertoERecebido
Caso "4"
   MenRecBanResAberto
Caso "5"
   MenRecBanResRecebido
Caso "9"
   MenRec
FimEscolha

FimProcedimento
//------------------------------------------------------------------------------------------------------
Procedimento MenRecBanAberto
var
irr:caracter
menu: inteiro
x,tot: inteiro
inicio
// Seção de Comandos
LimpaTela
Escreval ("--------------------------------------------------")
Escreval ("        Menu Receitas Por Banco em aberto --------")
Escreval ("--------------------------------------------------")
Escreval
Escreval ("[1]- Todas as receitas em aberto")
Escreval ("[2]- Receitas em aberto de um banco específico")
Escreval ("[9]- Voltar")
Escreval
Escreva ("Digite uma das opções: ")
leia(menu)

escolha (menu)
caso 1

   para x de 1 ate TotalParcela faca
      se DataRePar[x] = "" entao
         escreval(NumeroPar[x]:9,CodigoPar[x]:6,DataVePar[x]:11,"R$ ",ValorPar[x]:7:2,"  ",codpnome(CodBanPar[x]):15)
         PausaAprePar
         Contador:=Contador+1
         Contador1:=Contador1+1
      senao
         DataRePar[x] := DataRePar[x]
      fimse
   fimpara

   Escreva ("Prescione Enter para voltar")
   Leia (Lixo)
   MenRecBanco
caso 2

   Escreval("Digite o código do banco(No caso de careteira digite 0)")
   Escreva("")
   leia(irr)
   menu:=irr
se valida_banco=menu entao
fimse
   
Caso 9
   MenRecBanco
fimescolha
FimProcedimento
//------------------------------------------------------------------------------------------------------
Procedimento MenRecBanRecebido
var
irr:caracter
menu: inteiro
x,tot: inteiro
inicio
// Seção de Comandos
LimpaTela
Escreval ("--------------------------------------------------")
Escreval ("         Menu Receitas Por Banco recebidas -------")
Escreval ("--------------------------------------------------")
Escreval
Escreval ("[1]- Todas as receitas  recebidas")
Escreval ("[2]- Receitas  recebidas de um banco específico")
Escreval ("[9]- Voltar")
Escreval
Escreva ("Digite uma das opções: ")
leia(menu)
tot:=0
escolha (menu)
caso 1

   para x de 1 ate TotalParcela faca
      se DataRePar[x] <> "" entao
         escreval(NumeroPar[x]:9,CodigoPar[x]:6,DataVePar[x]:11,"R$ ",ValorPar[x]:7:2,"  ",DataRePar[x]:11,codpnome(CodBanPar[x]):15)
         PausaAprePar
         Contador:=Contador+1
         Contador1:=Contador1+1
      senao
         DataRePar[x] := DataRePar[x]
      fimse
   fimpara

   Escreva ("Prescione Enter para voltar")
   Leia (Lixo)
   MenRecBanco
caso 2

   Escreval("Digite o código do banco(No caso de careteira digite 0)")
   Escreva("")
      menu:=irr
se valida_banco=menu entao
fimse
   leia(irr)
   //Se (valida_banco(menu) = menu) Entao
   Escreval("Banco consultado:",codpnome(irr))
   para x de 1 ate TotalParcela faca
      se CodBanPar[x] <> menu entao

         //senao
         DataRePar[x] := DataRePar[x]
         se DataRePar[x] <> "" entao
            tot:=tot+1
            Escreval(NumeroPar[x]:9,CodigoPar[x]:6,DataVePar[x]:11,DataRePar[x]:11,"R$ ",ValorPar[x]:7:2)
         fimse
      fimse
   fimpara
   se   tot = 0 entao
      escreval("Nenhuma receita recebida")
   fimse
   //fimse
   Escreva ("Prescione Enter para voltar")
   Leia (Lixo)
   MenRecBanco
Caso 9
   MenRecBanco
   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   Procedimento MenRecBanAbertoERecebido
   var
   irr:caracter
   menu: inteiro
   x,tot: inteiro
   inicio
   LimpaTela
   Escreval ("--------------------------------------------------")
   Escreval ("  Menu Receitas Por Banco em Aberto e recebidas --")
   Escreval ("--------------------------------------------------")
   Escreval
   Escreval("Digite o código do banco(No caso de careteira digite 0)")
   Escreva("")
   leia(irr)
      menu:=irr
se valida_banco=menu entao
fimse
   //se valida_banco(menu) = menu entao
   Escreval("Banco consultado:",codpnome(irr))
   para x de 1 ate 80 faca
      se CodBanPar[x] = irr entao
         se DataRePar[x] = "" entao
            Escreval(NumeroPar[x]:9,CodigoPar[x]:6,DataVePar[x]:11,"R$ ",ValorPar[x]:7:2)
            PausaAprePar
            Contador:=Contador+1
            Contador1:=Contador1+1
         senao
            Escreval(NumeroPar[x]:9,CodigoPar[x]:6,DataVePar[x]:11,"R$ ",ValorPar[x]:7:2,"  ",DataRePar[x]:11)
         fimse
      fimse
   fimpara
   //fimse
   Escreva ("Prescione Enter para voltar")
   Leia (Lixo)
   MenRecBanco
   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   Procedimento MenRecBanResAberto
   Var
   menu:caractere
   x,bb,nb,cef,br,c,st,it:inteiro
   tot:inteiro
   Inicio
   limpatela
   bb:= 0
   nb:= 0
   cef:= 0
   br:= 0
   c:= 0
   st:= 0
   para x de 1 ate 80 faca
      se CodBanPar[x] = "0" entao
         se DataRePar[x] = "" entao
            c:= c + 1
         senao
            c:= c
         fimse
      fimse
      se CodBanPar[x] = "001" entao
         se DataRePar[x] = "" entao
            bb:= bb + 1
         senao
            bb:= bb
         fimse
      fimse
      se CodBanPar[x] = "104" entao
         se DataRePar[x] = "" entao
            cef:= cef + 1
         senao
            cef:= cef
         fimse
      fimse
      se CodBanPar[x] = "237" entao
         se DataRePar[x] = "" entao
            br:= br + 1
         senao
            br:= br
         fimse
      fimse
      se CodBanPar[x] = "260" entao
         se DataRePar[x] = "" entao
            nb:= nb + 1
         senao
            nb:= nb
         fimse
      fimse
      se CodBanPar[x] = "033" entao
         se DataRePar[x] = "" entao
            st:= st + 1
         senao st:= st
         fimse
      fimse
      se CodBanPar[x] = "341" entao
         se DataRePar[x] = "" entao
            it:= it + 1
         senao it:= it
         fimse
      fimse
   fimpara
   Escreval(" Resumo de receitas em aberto por banco")
   Escreval("Banco do Brasil :",bb)
   Escreval("Caixa Econômica Federal :",cef)
   Escreval("Bradesco :", br)
   Escreval("Nubank :", nb)
   Escreval("Santander:",st)
   Escreval("Itaú:",it)
   Escreval("Carteira:",c)
   Escreva ("Prescione Enter para voltar")
   Leia (Lixo)
   MenRecBanco
   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   Procedimento MenRecBanResRecebido
   Var
   menu:caractere
   x,bb,nb,cef,br,c,st,it:inteiro
   tot:inteiro
   Inicio
   limpatela
   bb:= 0
   nb:= 0
   cef:= 0
   br:= 0
   c:= 0
   st:= 0
   para x de 1 ate 80 faca
      se CodBanPar[x] = "0" entao
         se DataRePar[x] <> "" entao
            c:= c + 1
         senao
            c:= c
         fimse
      fimse
      se CodBanPar[x] = "001" entao
         se DataRePar[x] <> "" entao
            bb:= bb + 1
         senao
            bb:= bb
         fimse
      fimse
      se CodBanPar[x] = "104" entao
         se DataRePar[x] <> "" entao
            cef:= cef + 1
         senao
            cef:= cef
         fimse
      fimse
      se CodBanPar[x] = "237" entao
         se DataRePar[x] <> "" entao
            br:= br + 1
         senao
            br:= br
         fimse
      fimse
      se CodBanPar[x] = "260" entao
         se DataRePar[x] <> "" entao
            nb:= nb + 1
         senao
            nb:= nb
         fimse
      fimse
      se CodBanPar[x] = "033" entao
         se DataRePar[x] <> "" entao
            st:= st + 1
         senao st:= st
         fimse
      fimse
      se CodBanPar[x] = "341" entao
         se DataRePar[x] <> "" entao
            it:= it + 1
         senao it:= it
         fimse
      fimse
   fimpara

   Escreval("Resumo de receitas recebidas por banco")
   Escreval("Banco do Brasil :",bb)
   Escreval("Caixa Econômica Federal :",cef)
   Escreval("Bradesco :", br)
   Escreval("Nubank :", nb)
   Escreval("Santander:",st)
   Escreval("Itaú:",it)
   Escreval("Carteira:",c)
   Escreva ("Prescione Enter para voltar")
   Leia (Lixo)
   MenRecBanco
   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   Procedimento MenRecTotAberto
   Var
   TotAbe:real
   Inicio

   Para a de 1 ate TotalParcela Faca
      Se (DataRePar[a] = "") Entao
         EscPar
         TotAbe:=TotAbe+ValorPar[a]
      FimSe
   FimPara
   Escreval ("")
   Escreval ("Total em Aberto: R$",TotAbe)
   Escreval ("")
   Escreva ("Precione Enter para continuar")
   Leia (Lixo)
   ZerConCli
   MenRec


   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   procedimento MenRecTotRecebido
   Var
   TotRec:real
   Inicio

   Para a de 1 ate TotalParcela Faca
      Se (DataRePar[a] <> "") Entao
         EscPar
         TotRec:=TotRec+ValorPar[a]
      FimSe
   FimPara
   Escreval ("")
   Escreval ("Total Recebido: R$",TotRec)
   Escreval ("")
   Escreva ("Precione Enter para continuar")
   Leia (Lixo)
   ZerConCli
   MenRec

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   procedimento MenRecTotGeral
   Var
   TotRecG:real
   TotAbeG:real
   Inicio

   Para a de 1 ate TotalParcela Faca
      Se (DataRePar[a] <> "") Entao
         TotRecG:=TotRecG+ValorPar[a]
      SeNao
         TotAbeG:=TotAbeG+ValorPar[a]
      FimSe
      EscPar
   FimPara
   Escreval ("--------------------------------------------------")
   Escreval ("              Total de Receitas")
   Escreval ("--------------------------------------------------")
   Escreval ("")
   Escreval ("Total Recebido: R$",TotRecG)
   Escreval ("Total em Aberto: R$",TotAbeG)
   Escreval ("")
   Escreva ("Precione Enter para continuar")
   Leia (Lixo)
   ZerConCli
   MenRec

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                          MENU IMPORTAR
   //
   //------------------------------------------------------------------------------------------------------
   Funcao LeCampo(Var p:inteiro):caractere
   Var
   R,Car:caractere
   Inicio
   R:=""
   Car:=Copia(Linha,P,1)
   Enquanto ASC(Car)<>34 Faca
      R:=R+Car
      P:=P+1
      Car:=Copia(Linha,P,1)
   FimEnquanto
   P:=P+3
   Retorne R
   FimFuncao
   //------------------------------------------------------------------------------------------------------
   Procedimento LeCliente
   Arquivo "Clientes.txt"
   Var
   Col:inteiro
   Inicio
   Para x de 1 ate 147 Faca
      Leia(Linha)
      Col:=2
      CodigoCli[x]:=LeCampo(Col)
      NomeCli[x]:=LeCampo(Col)
      CidadeCli[x]:=LeCampo(Col)
      EstadoCli[x]:=LeCampo(Col)
      Lixo:=LeCampo(Col)
      Lixo:=LeCampo(Col)
      Lixo:=LeCampo(Col)
      CPFCli[x]:=LeCampo(Col)
      TotalCliente:=TotalCliente+1
   FimPara
   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   Procedimento LeParcela
   Arquivo "Parcelas.txt"
   Var
   Col:inteiro
   Inicio
   Para x de 1 ate 76 Faca
      Leia(Linha)
      Col:=2
      NumeroPar[x]:=LeCampo(Col)
      CodigoPar[x]:=LeCampo(Col)
      DataVePar[x]:=LeCampo(Col)
      DataRePar[x]:=LeCampo(Col)
      ValorPar[x]:=CaracPNum(LeCampo(Col))
      CodBanPar[x]:=LeCampo(Col)
      TotalParcela:=TotalParcela+1
   FimPara
   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                          MENU CREDITOS
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento MenCre

   var
   credito: vetor[1..22] de caractere
   b,x,y: inteiro
   c:caractere

   inicio
   LimpaTela
   Escreval("----------------------------------------------------")
   credito[1]:="C R E D I T O S"
   credito[2]:="
   credito[3]:="Programa desenvolvido por JW CLUB"
   credito[4]:="Disciplina: Algoritmos e Lógica de Programação I"
   credito[5]:="Curso: Engenharia de Software - ESOFT2S"
   credito[6]:="Professor responsável: Alexandre Moreno"
   credito[7]:="Unicesumar 2021"
   credito[8]:="----------------------------------------------------"
   credito[9]:="JW CLUB"
   credito[10]:="
   credito[11]:="Membros do JW CLUB"
   credito[12]:="
   credito[13]:="Scrum Master:      Luigi Siqueira Capóia         RA: 21013423-2"
   credito[14]:="Product Owner(PO): Akio Andrei Matera            RA: 21034408-2"
   credito[15]:="Development team:  Thiago Dantas Teixeira        RA: 21081493-2"
   credito[16]:="Development team:  Hemerson Jean Calixto Filho   RA: 21153589-2"
   credito[17]:="  _ _ _ _ _ _ _      ____      _____      ____ "
   credito[18]:=" |_0 _1 0 _1_0_|     \ 1 \    / 0 1 \    / 0 / "
   credito[19]:="      | 0 |           \ 0 \  / 1   1 \  / 1 /  "
   credito[20]:="      | 1 |            \ 1 \/ 0 / \ 1 \/ 1 /   "
   credito[21]:="  _ _ | 0 |             \ 0  1 /   \ 0  0 /    "
   credito[22]:=" |_1__0_1_|              \_10_/     \_01_/     "


   para x de 1 ate 22 faca
      para y de 1 ate compr(credito[x]) faca
         c:=copia(credito[x],y,1)
         escreva(c)
         temporizador(500)
      FimPara
      Escreval()
   FimPara
   Escreval("----------------------------------------------------")
   Escreva ("")
   Escreva ("Precione Enter para continuar")
   Leia(lixo)
   MenPri
   limpatela
   MenPri
   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                          FUNÇÕES
   //
   //------------------------------------------------------------------------------------------------------
   //------------------------------------------------------------------------------------------------------
   funcao valida_banco(ban: caracter): caractere
   var
   x,n: inteiro
   inicio

   se (compr(ban) = 1) entao
      se ban = "0" entao
         retorne ban
      senao
         Escreval("Digite o código do banco corretamente")
         escreva("")
         leia(ban)
         menu:= ban
         Retorne valida_banco(ban)
      fimse
   fimse
   se compr(ban) <> 3 entao
      Escreval("Digite o código do banco corretamente")
      escreva("")
      leia(ban)
      menu:= ban
      Retorne valida_banco(ban)
   senao
      para x de 1 ate compr(ban) faca
         n:= asc(copia(ban,x,1))
         se (n < 48) ou (n > 57 ) entao
            Escreval("Digite o código do banco corretamente")
            escreva("")
            leia(ban)
            menu:= ban
            Retorne valida_banco(ban)
         senao
            retorne ban
         fimse
      fimpara
   fimse



   fimfuncao




   //-----------------------------------------------------------------------------------------------
   //------------------------------------------------------------------------------------------------------

   //--------------------------------------Validação de BANCO----------------------------------------------

   //------------------------------------------------------------------------------------------------------
   funcao codpnome(menu: caractere): caractere

   var
   x,n: inteiro

   inicio

   Se menu = "0" Entao
      Retorne "Carteira"
   FimSe

   Se menu = "001" Entao
      Retorne "Banco do Brasil"
   FimSe

   Se menu = "104" Entao
      Retorne "CEF"
   FimSe

   Se menu = "237" Entao
      Retorne "Bradesco"
   FimSe

   Se menu = "260" Entao
      Retorne "Nubank"
   FimSe

   Se menu = "033" Entao
      Retorne "Santander"
   FimSe

   fimfuncao
   //------------------------------------------------------------------------------------------------------
   //--------------------Função arruma CNPJ--------------------------//

   funcao arruma_CNPJ(menu:caractere):caractere

   //11.222.333/0001-81
   var
   x: inteiro
   cpf,c: caractere

   inicio
   cpf:= ""
   para x de 1 ate compr(menu) faca
      c:= copia(menu,x,1)
      se x <> 13 entao
         se x <> 9 entao
            se (x = 3) ou (x = 6) entao
               cpf:= cpf + "."
               cpf:= cpf + c
            senao
               cpf:= cpf + c
            fimse
         senao
            cpf:= cpf + "/"
            cpf:= cpf + c
         fimse
      senao
         cpf:= cpf + "-"
         cpf:= cpf + c
      fimse
   fimpara

   retorne cpf

   fimfuncao

   //-------------------------------------------------------------------------------------------------
   //------------------- Função arruma CPF ---------------------------//

   funcao arruma_CPF(menu: caractere): caractere

   //111.111.111-11
   var
   x: inteiro
   cpf,c: caractere

   inicio

   para x de 1 ate compr(menu) faca
      c:=copia(menu,x,1)
      se x <> 10 entao
         se (x = 4) ou (x = 7) entao
            cpf:= cpf + "."
            cpf:= cpf + c
         senao
            cpf:= cpf + c
         fimse
      senao
         cpf:= cpf + "-"
         cpf:= cpf + c
      fimse
   fimpara
   retorne cpf
   fimfuncao
   //------------------------------------------------------------------------------------------------------
   //------------------------------------------------------------------------------------------------------
   //
   //                                    VALIDA CÓDIGO CLIENTE INCLUSAO
   //
   //------------------------------------------------------------------------------------------------------
   Funcao valCod(Var P:caractere):logico
   Var
   Q,X:inteiro
   Inicio
   Q:=1
   Para x de 1 ate TotalCliente-1 Faca
      Se (P = CodigoCli[x]) Entao
         Q:=Q+1
      FimSe
   FimPara
   Se Q <> 1 Entao
      Retorne Verdadeiro
   FimSe
   Se Q = 1 Entao
      Retorne Falso
   FimSe

   FimFuncao
   //------------------------------------------------------------------------------------------------------
   //
   //                                    VALIDA CÓDIGO CLIENTE ALTERAÇÃO
   //
   //------------------------------------------------------------------------------------------------------
   Funcao valCodAlt(Var P:caractere):logico
   Var
   Q,X:inteiro
   Inicio
   Q:=1
   Para x de 1 ate TotalCliente Faca
      Se (P = CodigoCli[x]) Entao
         Q:=Q+1
      FimSe
   FimPara
   Se Q <> 1 Entao
      Retorne Falso
   FimSe
   Se Q = 1 Entao
      Retorne Verdadeiro
   FimSe

   FimFuncao
   //------------------------------------------------------------------------------------------------------
   //
   //--------------------------------------Validação de ESTADO----------------------------------------------
   //
   //------------------------------------------------------------------------------------------------------
   funcao valEst(menu:caractere): logico
   var

   x,n: inteiro

   inicio

   funcao valest(st: caractere): caractere

   var
   x,n: inteiro

   inicio
   se compr(st) <> 2 Entao
      Escreval("Digite apenas 2 digitos:")
      Escreva("")
      leia(st)
      menu:= st
      retorne valest(st)
   senao
      para x de 1 ate compr(st) faca
         n:= asc(copia(st,x,1))
         se (n < 65) ou (n > 122) entao
            Escreval("Digite somente caracteres:")
            Escreva("")
            leia(st)
            menu:= st
            retorne valest(st)
         fimse
         se (n > 90) e (n < 97) ou (n > 122) entao
            Escreval("Digite somente caracteres:")
            Escreva("")
            leia(st)
            menu:= st
            retorne valest(st)
         senao
            retorne st
         fimse
      fimpara
   fimse
   fimfuncao

   //--------------------------------------------Validação de cidade---------------------------------------------------------

   funcao verifica_cidade(cidade:caractere): caractere

   var
   x,n: inteiro

   inicio

   para x de 1 ate compr(cidade) faca
      n:= asc(copia(cidade,x,1))
      se( n > 32) e (n < 65) ou (n < 32) entao
         Escreval("Digite somente caracteres:")
         Escreva("")
         leia(cidade)
         menu:= cidade
         retorne verifica_cidade(cidade)
      fimse
      se (n > 90) e (n < 97) ou (n > 122) entao
         Escreval("Digite somente caracteres:")
         Escreva("")
         leia(cidade)
         menu:= cidade
         retorne verifica_cidade(cidade)
      senao
         retorne cidade
      fimse
   fimpara

   fimfuncao


   //---------------------------------------Validação de parcela------------------------------------------------------//
   funcao verifica_num(menu:caractere): caractere

   var
   x,y:inteiro
   s: caractere
   conf: logico
   inicio

   y:= 0
   Se compr(menu) = 7 Entao
      Para x de 1 ate compr(menu) Faca
         y:= y + 1
         s:= copia(menu,x,1)
         Se y = 6 entao
            Se asc(s) <> 47 Entao
               Escreva("Formato incorreto, digite novamente:")
               Leia(menu)
               Retorne verifica_num(menu)
            Senao
               Retorne menu
            Fimse
         SeNao
         FimSe
         Se (y <> 6) entao
            Se asc(s) < 48 entao
               Escreva("Formato incorreto, digite novamente:")
               Leia(menu)
               Retorne verifica_num(menu)
            Fimse
            Se asc(s) > 57 entao
               Escreva("Formato incorreto, digite novamente:")
               Leia(menu)
               Retorne verifica_num(menu)
            SeNao
               Retorne menu
            FimSe
         Senao
            Retorne menu
         FimSe
      FimPara
   Senao
      Escreva("Formato incorreto, digite novamente:")
      Leia(menu)
      Retorne verifica_num(menu)
   Fimse
   fimfuncao

   //---------------------------------------verifica_data----------------------------------------------//
   funcao verifica_venc(data:caractere): caractere



   var
   x,y,s,dia,mes,ano:inteiro
   c,b:caractere


   inicio
   y:=0


   se compr(data) <> 8 entao
      Escreva("Digite a data no formato (xx/yy/zz):")
      leia(data)
      menu:= data
      retorne verifica_venc(data)
   fimse

   para x de 1 ate compr(data) faca
      c:=copia(data,x,1)
      s:=asc(c)
      se ((x mod 3) = 0) e (s <> 47) entao
         Escreva("Digite novamente a data no formato (xx/yy/zz):")
         leia(data)
         menu:= data
         retorne verifica_venc(data)
      senao
         y:= y + 1
         se (y < 3) entao
            dia:= dia + caracpnum(copia(menu,x,1))
         fimse
         se (y > 3) e (y < 6) entao
            mes:= mes + caracpnum(copia(menu,x,1))
         fimse
         se (y > 6) e (y < 9) entao
            ano:= ano + caracpnum(copia(menu,x,1))
         fimse
      fimse
   fimpara




   //-----------------------Validação da data da função------------------------//
   se (mes < 1) ou (mes > 12) ou (dia < 1) ou (dia > 31) ou (ano < 0) entao
      Escreval("Esta data não existe no calendário.")
      Escreva("Digite novamente a data no formato (xx/yy/zz):")
      leia(data)
      menu:= data
      retorne verifica_venc(data)
   fimse

   se ((mes = 4) ou (mes = 6) ou (mes = 9) ou (mes = 11)) e (dia > 30) entao
      Escreval("Esta data não existe no calendário.")
      Escreva("Digite novamente a data no formato (xx/yy/zz):")
      leia(data)
      menu:= data
      retorne verifica_venc(data)
   fimse

   se (ano mod 4 = 0) entao
      se (mes = 2) e (dia > 29) entao
         Escreval("Esta data não existe no calendário.")
         Escreva("Digite novamente a data no formato (xx/yy/zz):")
         leia(data)
         menu:= data
         retorne verifica_venc(data)
      senao
         retorne data
      fimse
   fimse

   se (mes = 2) e (dia > 28) entao
      Escreval("Esta data não existe no calendário.")
      Escreva("Digite novamente a data no formato (xx/yy/zz):")
      leia(data)
      menu:= data
      retorne verifica_venc(data)
   senao
      retorne data
   fimse


   fimfuncao

   //------------------------------------------------------------------------------------------------------
   Funcao valNumPar(Var P:caractere):logico
   Var
   Q,X:inteiro
   Inicio
   Q:=1
   Para x de 1 ate TotalParcela-1 Faca
      Se (P = NumeroPar[x]) Entao
         Q:=Q+1
      FimSe
   FimPara
   Se Q <> 1 Entao
      Retorne Verdadeiro
   FimSe
   Se Q = 1 Entao
      Retorne Falso
   FimSe

   FimFuncao
   //------------------------------------------------------------------------------------------------------

   //-----------------------------------------------------------------------------------------------------
   //------------------------------------------------------------------------------------------------------
   //
   //                                          PROCEDIMENTOS AUXILIARES
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento TroCli
   Var
   TMP:caractere
   Inicio

   TMP:=CodigoCli[x]
   CodigoCli[x]:=CodigoCli[y]
   CodigoCli[y]:=TMP
   TMP:=NomeCli[x]
   NomeCli[x]:=NomeCli[y]
   NomeCli[y]:=TMP
   TMP:=CidadeCli[x]
   CidadeCli[x]:=CidadeCli[y]
   CidadeCli[y]:=TMP
   TMP:=EstadoCli[x]
   EstadoCli[x]:=EstadoCli[y]
   EstadoCli[y]:=TMP
   TMP:=CPFCli[x]
   CPFCli[x]:=CPFCli[y]
   CPFCli[y]:=TMP

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                           ROTINA DE PAUSA NA APRESENTAÇÃO DAS CONSULTAS POR PAGINA
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento PauAprCli
   Inicio

   Se (Contador = 25) ou (Contador1 = TotalCliente) ou (Contador1 = MenCliConCidadeTot) ou (Contador1 = MenCliConEstadoTot) Entao
      Escreva ("Precione Enter para continuar")
      Leia (Lixo)
      LimpaTela
      Contador:=0
   FimSe

   FimProcedimento
   //_________________
   procedimento temporizador(t:inteiro) //usado para criar um DELAY
   var
   k,s:inteiro
   inicio
   para x de 1 ate t faca
      k:=k+x
   fimpara
   fimprocedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                   ROTINA DE ESCREVER AS CONSULTAS
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento EscCli
   Inicio

   Contador:=Contador+1
   Contador1:=Contador1+1
   Escreval (CodigoCli[a]:4," ",NomeCli[a]:20," ",CidadeCli[a]:24," ",EstadoCli[a]:2," ",CPFCli[a]:18)
   PauAprCli

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                     ROTINA QUE ZERA OS CONTADORES
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento ZerConCli
   Inicio

   MenCliConCidadeTot:=0
   MenCliConEstadoTot:=0
   Contador:=0
   Contador1:=0

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                 ROTINA DE CONSULTAS - CLIENTE POR CÓDIGO
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento MenCliConCod
   Var
   CodigoDoCli:caractere
   CodigoDoCli1:inteiro
   OpcaoCli:inteiro
   Inicio
   LimpaTela
   Escreval ("--------------------------------------------------")
   Escreval ("              Menu Clientes Consultas")
   Escreval ("--------------------------------------------------")
   Escreval ("")
   Escreval ("  Codigo: ",CodigoCli[x])
   Escreval ("    Nome: ",NomeCli[x])
   Escreval ("  Cidade: ",CidadeCli[x])
   Escreval ("  Estado: ",EstadoCli[x])
   Escreval ("CPF/CNJP: ",CPFCli[x])
   Escreval ("")
   Escreva ("Precione Enter para continuar")
   Leia (Lixo)
   MenCliCon
   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                 ROTINA DE CONSULTAS - CIDADE E CÓDIGO
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento CidECod
   Inicio

   Para z de 1 ate TotalCliente Faca
      Se (MenCliConCidade = CidadeCli[z]) Entao
         MenCliConCidadeTot:=(MenCliConCidadeTot+1)
      FimSe
   FimPara
   Para x de 1 ate TotalCliente-1 Faca
      Para y:=(x+1) ate TotalCliente Faca
         Se (CodigoCli[x] > CodigoCli[y]) Entao
            TroCli
         FimSe
      FimPara
   FimPara
   Para a de 1 ate TotalCliente Faca
      Se (MenCliConCidade = CidadeCli[a]) Entao
         EscCli
      FimSe
   FimPara
   ZerConCli
   MenCli

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                 ROTINA DE CONSULTAS - CIDADE E NOME
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento CidENom
   Inicio

   Para z de 1 ate TotalCliente Faca
      Se (MenCliConCidade = CidadeCli[z]) Entao
         MenCliConCidadeTot:=(MenCliConCidadeTot+1)
      FimSe
   FimPara
   Para x de 1 ate TotalCliente-1 Faca
      Para y:=(x+1) ate TotalCliente Faca
         Se (NomeCli[x] > NomeCli[y]) Entao
            TroCli
         FimSe
      FimPara
   FimPara
   Para a de 1 ate TotalCliente Faca
      Se (MenCliConCidade = CidadeCli[a]) Entao
         EscCli
      FimSe
   FimPara
   ZerConCli
   MenCli

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                 ROTINA DE CONSULTAS - ESTADO E CÓDIGO
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento EstECod
   Inicio

   Para z de 1 ate TotalCliente Faca
      Se (MenCliConEstado = EstadoCli[z]) Entao
         MenCliConEstadoTot:=(MenCliConEstadoTot+1)
      FimSe
   FimPara
   Para x de 1 ate TotalCliente-1 Faca
      Para y:=(x+1) ate TotalCliente Faca
         Se (CodigoCli[x] > CodigoCli[y]) Entao
            TroCli
         FimSe
      FimPara
   FimPara
   Para a de 1 ate TotalCliente Faca
      Se (MenCliConEstado = EstadoCli[a]) Entao
         EscCli
      FimSe
   FimPara
   ZerConCli
   MenCli

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                 ROTINA DE CONSULTAS - ESTADO E NOME
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento EstENom
   Inicio

   Para z de 1 ate TotalCliente Faca
      Se (MenCliConEstado = EstadoCli[z]) Entao
         MenCliConEstadoTot:=(MenCliConEstadoTot+1)
      FimSe
   FimPara
   Para x de 1 ate TotalCliente-1 Faca
      Para y:=(x+1) ate TotalCliente Faca
         Se (NomeCli[x] > NomeCli[y]) Entao
            TroCli
         FimSe
      FimPara
   FimPara
   Para a de 1 ate TotalCliente Faca
      Se (MenCliConEstado = EstadoCli[a]) Entao
         EscCli
      FimSe
   FimPara
   ZerConCli
   MenCli

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                 ROTINA DE CONSULTAS - TODOS E CÓDIGO
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento TotECod
   Inicio

   Para x de 1 ate TotalCliente-1 Faca
      Para y:=(x+1) ate TotalCliente Faca
         Se (CodigoCli[x] > CodigoCli[y]) Entao
            TroCli
         FimSe
      FimPara
   FimPara
   Para a de 1 ate TotalCliente Faca
      EscCli
   FimPara
   ZerConCli
   MenCli

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                 ROTINA DE CONSULTAS - TODOS E NOME
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento TotENom
   Inicio

   Para x de 1 ate TotalCliente-1 Faca
      Para y:=(x+1) ate TotalCliente Faca
         Se (NomeCli[x] > NomeCli[y]) Entao
            TroCli
         FimSe
      FimPara
   FimPara
   Para a de 1 ate TotalCliente Faca
      EscCli
   FimPara
   ZerConCli
   MenCli

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                          ROTINA DE ORDENAÇÃO
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento TroPar
   Var
   TMP:caractere
   TMP1:real
   Inicio

   TMP:=NumeroPar[x]
   NumeroPar[x]:=NumeroPar[y]
   NumeroPar[y]:=TMP
   TMP:=CodigoPar[x]
   CodigoPar[x]:=CodigoPar[y]
   CodigoPar[y]:=TMP
   TMP:=DataVePar[x]
   DataVePar[x]:=DataVePar[y]
   DataVePar[y]:=TMP
   TMP:=DataRePar[x]
   DataRePar[x]:=DataRePar[y]
   DataRePar[y]:=TMP
   TMP1:=ValorPar[x]
   ValorPar[x]:=ValorPar[y]
   ValorPar[y]:=TMP1
   TMP:=CodBanPar[x]
   CodBanPar[x]:=CodBanPar[y]
   CodBanPar[y]:=TMP

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                           ROTINA DE PAUSA NA APRESENTAÇÃO DAS CONSULTAS POR PAGINA
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento PausaAprePar
   Inicio

   Se (Contador = 25) ou (Contador1 = TotalParcela) Entao
      Escreva ("Precione Enter para continuar")
      Leia (Lixo)
      LimpaTela
      Contador:=0
   FimSe

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                   ROTINA DE ESCREVER AS CONSULTAS
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento EscPar
   Inicio

   Contador:=Contador+1
   Contador1:=Contador1+1
   Escreval (NumeroPar[a]:7," ",CodigoPar[a]:4," ",DataVePar[a]:8," ",DataRePar[a]:8," ",ValorPar[a]:7:2," ",CodBanPar[a]:3)
   PausaAprePar

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                 ROTINA DE CONSULTAS - PARCELAS POR NUMERO
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento MenParConNum
   Inicio

   Para x de 1 ate TotalParcela-1 Faca
      Para y:=(x+1) ate TotalParcela Faca
         Se (NumeroPar[x] > NumeroPar[y]) Entao
            TroPar
         FimSe
      FimPara
   FimPara
   Para a de 1 ate TotalParcela Faca
      EscPar
   FimPara
   ZerConCli
   MenPar

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                 ROTINA DE CONSULTAS - PARCELAS POR VENCIMENTO
   //
   //------------------------------------------------------------------------------------------------------
   Procedimento MenParConVen
   Inicio

   Para x de 1 ate TotalParcela-1 Faca
      Para y:=(x+1) ate TotalParcela Faca
         Se (DataVePar[x] > DataVePar[y]) Entao
            TroPar
         FimSe
      FimPara
   FimPara
   Para a de 1 ate TotalParcela Faca
      EscPar
   FimPara
   ZerConCli
   MenPar

   FimProcedimento
   //------------------------------------------------------------------------------------------------------
   //
   //                                          INICIO
   //
   //------------------------------------------------------------------------------------------------------
   Inicio
   LeCliente
   LeParcela
   MenPri
FimAlgoritmo



