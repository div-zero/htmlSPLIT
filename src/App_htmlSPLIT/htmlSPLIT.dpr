program htmlSPLIT;

{$R 'version.res' 'version.rc'}

uses
  Vcl.Forms,
  FHtmlSplitMain in 'FHtmlSplitMain.pas' {frmHtmlSplitMain},
  appDef in 'appDef.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmHtmlSplitMain, frmHtmlSplitMain);
  Application.Run;
end.
