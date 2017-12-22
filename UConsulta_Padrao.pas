unit UConsulta_Padrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  ADODB;

type
  TFrmConsulta_Padrao = class(TForm)
    DBGrid1: TDBGrid;
    RadioGroup1: TRadioGroup;
    EdtDescricao: TEdit;
    RadioGroup2: TRadioGroup;
    ImgImagens: TImageList;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qryconsulta_padrao: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsulta_Padrao: TFrmConsulta_Padrao;

implementation

uses UDM;

{$R *.dfm}

end.
