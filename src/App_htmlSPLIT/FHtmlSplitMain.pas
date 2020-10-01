unit FHtmlSplitMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmHtmlSplitMain = class(TForm)
    imgMain: TImage;
    lblCaption: TLabel;
    lblTeaser: TLabel;
    lblStatus: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    procedure WMDropFiles( var msg: TWMDropFiles ); message wm_DropFiles;
    procedure handleFile( strFileName: string );

  end;

var
  frmHtmlSplitMain: TfrmHtmlSplitMain;

implementation

uses
  ShellApi,
  WinTypes,
  IOUtils,
  appDef;

{$R *.dfm}

procedure TfrmHtmlSplitMain.FormCreate( Sender: TObject );
begin
  Caption := Format( '%s %s', [APP_NAME, APP_VER] );
  lblCaption.Caption := APP_NAME;
  DragAcceptFiles( Handle, True );
end;

procedure TfrmHtmlSplitMain.FormKeyUp( Sender: TObject; var Key: Word; Shift: TShiftState );
begin
  if( KEY = VK_ESCAPE ) then
    Close;
end;

procedure TfrmHtmlSplitMain.WMDropFiles( var msg: TWMDropFiles );
var
  iNumDropped: integer;
  DroppedName: array[0..255] of char;
begin
  iNumDropped := DragQueryFile( msg.Drop, $FFFFFFFF, nil, 0 );
  if( iNumDropped > 0 ) then
  begin
    DragQueryFile( msg.Drop, 0, DroppedName, SizeOf( DroppedName ) );
    DragFinish( msg.Drop );
    handleFile( DroppedName );
  end;
end;

procedure TfrmHtmlSplitMain.handleFile( strFileName: string );
var
  strBaseDir: string;
  iCounter: integer;
  txtIn: TextFile;
  txtOut: TextFile;
  strOutFile: string;
  strCurrentLine: string;

  procedure prepareNextOutFile;
  begin
    inc( iCounter );
    strOutFile := Format( '%.8d.html', [iCounter] );
    strOutFile := TPath.Combine( strBaseDir, strOutFile );
    AssignFile( txtOut, strOutFile );      /// associate output file object
    Rewrite( txtOut );                     /// create that output file (for writing)
  end;

begin
  lblStatus.Caption := strFileName;
  strBaseDir := ExtractFilePath( strFileName );

  iCounter := 0;
  prepareNextOutFile;                      /// initially create the first output file

  AssignFile( txtIn, strFileName );        /// associate input file object
  reset( txtIn );                          /// open input file (for reading)
  while not Eof( txtIn ) do                /// end of file not yet reached ?
  begin
    Readln( txtIn, strCurrentLine );       /// pick the next line from input file
    if( Trim( strCurrentLine ) = '' ) then /// is it an empty line ?
    begin
      CloseFile( txtOut );                 /// close the current output file
      prepareNextOutFile;                  /// incfrement index and prepare the output file
    end
    else
      Writeln( txtOut, strCurrentLine );   /// write the current line to the current output file
  end;
  CloseFile( txtIn );                      /// close the input file
  CloseFile( txtOut );                     /// close the last used output file
end;

end.

