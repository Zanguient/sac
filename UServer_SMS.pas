// ************************************************ ************************ / /
// Os tipos declarados neste arquivo foram gerados a partir de dados lidos a partir do
// Arquivo WSDL descrito abaixo:
// WSDL: http://www.naoligo.com.br/ws/server.php?wsdl
// Import: http://www.naoligo.com.br/ws/server.php?wsdl> 0
// Encoding /: ISO-8859-1
// Versão: 1.0
// (25/05/2011 10:33:55 - - $ Rev: 25.127 $)
// ************************************************ ************************ / /

unit UServer_SMS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  ServerSendSMSPortType = interface(IInvokable)
  ['{F7691D00-CE8D-60F9-65DD-629275062196}']
    function  hello(const name_: string): string; stdcall;
    function  sendSMS(const email: string; const senha: string; const ddd: string; const telefone: string; const texto: string): string; stdcall;
  end;

function GetServerSendSMSPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServerSendSMSPortType;


implementation
  uses SysUtils;

function GetServerSendSMSPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServerSendSMSPortType;
const
  defWSDL = 'http://www.naoligo.com.br/ws/server.php?wsdl';
  defURL  = 'http://www.naoligo.com.br/ws/server.php';
  defSvc  = 'ServerSendSMS';
  defPrt  = 'ServerSendSMSPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ServerSendSMSPortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(ServerSendSMSPortType), 'urn:ServerSendSMS', 'ISO-8859-1');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ServerSendSMSPortType), 'urn:ServerSendSMS#hello');
  InvRegistry.RegisterExternalParamName(TypeInfo(ServerSendSMSPortType), 'hello', 'name_', 'name');

end.
