unit Util.TLog;

interface
 uses
  TLoggerUnit;
  type
    TLog = class
      public
        class procedure Error(msg : string);
        class procedure Debug(msg : string);
        class procedure Info(msg : string);
    end;

implementation

{ TLog }

uses
 SysUtils;

class procedure TLog.Debug(msg: string);
begin
  TLogger.GetInstance.Debug(msg+' - '+FormatDateTime('HH:MM:SS:ZZZ', Now));
end;

class procedure TLog.Error(msg: string);
begin
  TLogger.GetInstance.Error(msg+' - '+FormatDateTime('HH:MM:SS:ZZZ', Now));
end;

class procedure TLog.Info(msg: string);
begin
  TLogger.GetInstance.Info(msg+' - '+FormatDateTime('HH:MM:SS:ZZZ', Now));
end;

end.
