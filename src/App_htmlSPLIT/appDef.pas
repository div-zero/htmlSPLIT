unit appDef;
(* --------------------------------------------------------------------------
   copyright (c) 2020 by Matthias Jung
   http://www.intelli-bit.de
   -------------------------------------------------------------------------- *)

interface

const
  APP_COMPANY = 'intelli-bit';
  APP_NAME = 'htmlSPLIT';
  APP_VER: string = '0.00';

  APP_NAME_CONTEXT: string = APP_NAME;

  EDITION_LT = 'LT';
  EDITION_PRO = 'PRO';
  APP_EDITION: string = EDITION_LT;
  APP_LICENSE_ID = 0;
  APP_LICENSE_VER = 0000;
  APP_GUID = '';

  APP_CR = '(c) 2020 by Matthias Jung';
  APP_AUTHOR = 'Matthias Jung';
  APP_ADDR_1 = 'Goethestraﬂe 22';
  APP_ADDR_2 = 'D 63543 Neuberg';
  APP_MAIL = 'matthias-jung@intelli-bit.de';
  APP_URL = 'http://www.intelli-bit.de';

  ICON_SCHEMA_COLOR = 0;
  ICON_SCHEMA_BW = 1;
  APP_ICON_SCHEMA = ICON_SCHEMA_BW;

implementation

(* ////////////////////////////////////////////////////////////////////////// *)
uses
  Windows,
  SysUtils,
  Classes;

(* ////////////////////////////////////////////////////////////////////////// *)
var
  rs: TResourceStream;
  VerBlock: PVSFIXEDFILEINFO;
  iVerBlockLen: Cardinal;
  iVerHigh: Cardinal;
  iVerMid: Cardinal;

(* ////////////////////////////////////////////////////////////////////////// *)
initialization
  rs := TResourceStream.CreateFromID( HInstance, 1, RT_VERSION );
  try
    rs.Position := 0;
    if( VerQueryValue( rs.Memory, '\', Pointer( VerBlock ), iVerBlockLen ) ) then
    begin
      iVerHigh := VerBlock.dwFileVersionMS shr 16;
      iVerMid := VerBlock.dwFileVersionMS and $FFFF;
      APP_VER := Format( '%d.%.2d', [iVerHigh, iVerMid] );
    end;
  finally
    rs.Free;
  end;

(* ////////////////////////////////////////////////////////////////////////// *)
end.
