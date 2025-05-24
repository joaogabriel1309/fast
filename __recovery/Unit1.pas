unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxSmartMemo,
  frCoreClasses, frxClass, frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    ButtonEmitir: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    FDQuery: TFDQuery;
    FDQuery1: TFDQuery;
    FDQuery1id: TFDAutoIncField;
    FDQuery1id_cliente: TIntegerField;
    FDQuery1id_empresa: TIntegerField;
    FDQuery1id_usuario: TIntegerField;
    FDQuery1data_emissao: TDateField;
    FDQuery1data_entrega: TDateField;
    FDQuery1prazo_entrega: TStringField;
    FDQuery1condicoes_pagamento: TStringField;
    FDQuery1observacoes: TMemoField;
    FDQuery1total: TBCDField;
    FDQuery1id_1: TIntegerField;
    FDQuery1id_orcamento: TIntegerField;
    FDQuery1id_produto: TIntegerField;
    FDQuery1local_ambiente: TStringField;
    FDQuery1largura: TBCDField;
    FDQuery1altura: TBCDField;
    FDQuery1quantidade: TIntegerField;
    FDQuery1valor_unitario: TBCDField;
    FDQuery1valor_total: TBCDField;
    FDQuery1observacoes_1: TMemoField;
    FDQuery1id_2: TIntegerField;
    FDQuery1nome: TStringField;
    FDQuery1descricao: TMemoField;
    FDQuery1cor_acessorio: TStringField;
    FDQuery1cor_perfil: TStringField;
    FDQuery1cor_espessura: TStringField;
    FDQuery1tipo: TStringField;
    FDQuery1linha: TStringField;
    FDQuery1imagem: TStringField;
    procedure ButtonEmitirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.ButtonEmitirClick(Sender: TObject);
begin
   FDQuery.Close;
   FDQuery.SQL.Clear;
   FDQuery.SQL.Add('SELECT * FROM EMPRESA');
   FDQuery.Open();
   frxReport1.Variables['EMPRESA'] := QuotedStr(FDQuery.FieldByName('RAZAO_SOCIAL').AsString);
   frxReport1.Variables['ENDERECO'] := QuotedStr(FDQuery.FieldByName('ENDERECO').AsString);
   frxReport1.Variables['CIDADE'] := QuotedStr(FDQuery.FieldByName('CIDADE').AsString);
   frxReport1.Variables['CNPJ'] := QuotedStr(FDQuery.FieldByName('CNPJ').AsString);
   frxReport1.Variables['IE'] := QuotedStr(FDQuery.FieldByName('IE').AsString);
   frxReport1.Variables['EMAIL'] := QuotedStr(FDQuery.FieldByName('EMAIL').AsString);
   frxReport1.Variables['CEP'] := QuotedStr(FDQuery.FieldByName('CEP').AsString);
   frxReport1.Variables['TELEFONE1'] := QuotedStr(FDQuery.FieldByName('TELEFONE1').AsString);
   frxReport1.Variables['TELEFONE2'] := QuotedStr(FDQuery.FieldByName('TELEFONE2').AsString);
   FDQuery.Close;

   FDQuery.SQL.Clear;
   FDQuery.SQL.Add('SELECT * FROM ORCAMENTO LEFT JOIN USUARIO ON (ORCAMENTO.ID_USUARIO = USUARIO.ID) ');
   FDQuery.Open();
   frxReport1.Variables['NUMERO'] := QuotedStr(FDQuery.FieldByName('ID').AsString);
   frxReport1.Variables['EMISSAO'] := QuotedStr(FDQuery.FieldByName('DATA_EMISSAO').AsString);
   frxReport1.Variables['VENDEDOR'] := QuotedStr(FDQuery.FieldByName('NOME').AsString);
   frxReport1.Variables['CONTATO'] := QuotedStr('(65) 999755911');//CRIAR UMA COLONA NO USUARIO
   frxReport1.Variables['EMAIL_VENDEDOR'] := QuotedStr(FDQuery.FieldByName('EMAIL').AsString);
   FDQuery.Close;

   FDQuery.SQL.Clear;
   FDQuery.SQL.Add('SELECT * FROM CLIENTE ');
   FDQuery.Open();
   frxReport1.Variables['CLIENTE_SUB'] := QuotedStr(FDQuery.FieldByName('NOME').AsString);
   frxReport1.Variables['EMAIL_SUB'] := QuotedStr(FDQuery.FieldByName('EMAIL').AsString);
   frxReport1.Variables['ENDERECO_SUB'] := QuotedStr(FDQuery.FieldByName('ENDERECO').AsString);
   frxReport1.Variables['CEP_SUB'] := QuotedStr(FDQuery.FieldByName('CEP').AsString);
   frxReport1.Variables['TEL_FIXO_SUB'] := QuotedStr(FDQuery.FieldByName('TELEFONE1').AsString);
   frxReport1.Variables['TEL_FAX_SUB'] := QuotedStr(FDQuery.FieldByName('TELEFONE2').AsString);
   frxReport1.Variables['CELULAR_SUB'] := QuotedStr('(65) 999755911');//CRIAR COLUNA
   frxReport1.Variables['RG_SUB'] := QuotedStr(FDQuery.FieldByName('RG_IE').AsString);
   frxReport1.Variables['CNPJ_CPF_SUB'] := QuotedStr(FDQuery.FieldByName('CPF_CNPJ').AsString);
   FDQuery.Close;

   FDQuery.SQL.Clear;
   FDQuery.SQL.Add('SELECT * FROM PRODUTO');
   FDQuery.Open();
   frxReport1.ShowReport();
   FDQuery.Close;
end;

end.
