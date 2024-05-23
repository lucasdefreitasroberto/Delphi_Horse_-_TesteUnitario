unit HorseServer;

interface

uses
  Horse, Horse.CORS, Horse.Jhonson, uController.Person;

type
  THorseServer = class
  public
    class procedure ConfigureMiddlewares;
    class procedure RegisterRoutes;
    class procedure StartServer(Port: Integer);
    class procedure StopServer;
    class function VerifyStartingHorse:Boolean;
  end;

implementation

class procedure THorseServer.ConfigureMiddlewares;
begin
  THorse.Use(Jhonson());
  THorse.Use(CORS);
end;

class procedure THorseServer.RegisterRoutes;
begin
  THorse.Get('/',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('<h4>API running.</h4>');
    end);

  uController.Person.Registry;
end;

class procedure THorseServer.StartServer(Port: Integer);
begin
  THorse.Listen(Port);
  ConfigureMiddlewares;
  RegisterRoutes;
end;

class procedure THorseServer.StopServer;
begin
  THorse.StopListen;
end;

class function THorseServer.VerifyStartingHorse: Boolean;
begin
  Result := THorse.IsRunning;
end;

end.

