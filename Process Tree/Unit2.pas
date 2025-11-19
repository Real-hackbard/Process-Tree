unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, tlhelp32, PSAPI, Registry, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    pidNum : Cardinal;
  end;

var
  Form2: TForm2;


implementation

uses Unit1;

{$R *.dfm}
function RecurseWin32(const R: TRegistry; const ThePath: string;
  const TheKey: string): string;
var
  TheList: TStringList;
  i: Integer;
  LP: string;
  OnceUponATime: string;
begin
  Result  := '-';
  TheList := TStringList.Create;
  try
    R.OpenKey(ThePath, False);
    R.GetKeyNames(TheList);
    R.CloseKey;
    if TheList.Count = 0 then Exit;
    for i := 0 to TheList.Count - 1 do with TheList do
      begin
        LP := ThePath + '\' + TheList[i];
        if CompareText(Strings[i], TheKey) = 0 then
        begin
          Result := LP;
          Break;
        end;
        OnceUponATime := RecurseWin32(R, LP, TheKey);
        if OnceUponATime <> '-' then
        begin
          Result := OnceUponATime;
          Break;
        end;
      end;
  finally
    TheList.Clear;
    TheList.Free;
  end;
end;

function GetWin32TypeLibList(var Lines: TStringList): Boolean;
var
  R: TRegistry;
  W32: string;
  i, j, TheIntValue, TheSizeOfTheIntValue: Integer;
  TheSearchedValue, TheSearchedValueString: string;
  TheVersionList, TheKeyList: TStringList;
  TheBasisKey: string;
begin
  Result := True;
  try
    try
      R          := TRegistry.Create;
      TheVersionList := TStringList.Create;
      TheKeyList := TStringList.Create;

      R.RootKey := HKEY_CLASSES_ROOT;
      R.OpenKey('TypeLib', False);
      TheBasisKey := R.CurrentPath;

      (* Basis Informations *)
      case R.GetDataType('') of
        //rdUnknown: ShowMessage('Nothing ???');
        rdExpandString, rdString: TheSearchedValueString := R.ReadString('');
        rdInteger: TheIntValue         := R.ReadInteger('');
        rdBinary: TheSizeOfTheIntValue := R.GetDataSize('');
      end;
      (* Build the List of Keys *)
      R.GetKeyNames(TheKeyList);
      R.CloseKey;
      //ShowMessage(TheKeyList.Strings[1]);
      for i := 0 to TheKeyList.Count - 1 do
         (* Loop around the typelib entries)
         (* Schleife um die TypeLib Einträge *)
        with TheKeyList do
          if Length(Strings[i]) > 0 then
          begin
            R.OpenKey(TheBasisKey + '\' + Strings[i], False);
            TheVersionList.Clear;
            R.GetKeyNames(TheVersionList);
            R.CloseKey;
            (* Find "Win32" for each version *)
            (* Finde der "win32" für jede VersionVersion:*)
            for j := 0 to TheVersionList.Count - 1 do
              if Length(TheVersionList.Strings[j]) > 0 then
              begin
                W32 := RecurseWin32(R, TheBasisKey + '\' +
                  Strings[i] + '\' +
                  TheVersionList.Strings[j],
                  'Win32');
                if W32 <> '-' then
                begin
                  Lines.Add(W32);
                  R.OpenKey(W32, False);
                  case R.GetDataType('') of
                    rdExpandString,
                    rdString: TheSearchedValue := R.ReadString('');
                    else
                      TheSearchedValue := 'Nothing !!!';
                  end;
                  R.CloseKey;
                  Lines.Add('-----> ' + TheSearchedValue);
                end;
              end;
          end;
    finally
      TheVersionList.Free;
      TheKeyList.Free;
    end;
  except
    Result := False;
  end;
end;

function StrToCardinal(const S : String) : Cardinal;
var
    I64 : UInt64;
begin
    I64 := StrToUInt64(S);
    if (I64 shr 32) <> 0 then
        raise EConvertError.Create('StrToCardinal invalid value');
    Result := Cardinal(I64);
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  Process: THandle;
  Mbi: TMemoryBasicInformation;
  Filename: array [0..MAX_PATH] of Char;
  Txt: string;
  L: TStringList;
begin
  if Form1.StringGrid1.Cells[1,3] = '' then Exit;
  Screen.Cursor := crHourGlass;
  Memo1.Clear();
  pidNum := StrToCardinal(Form1.StringGrid1.Cells[1,3]);
  Process := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_OPERATION or
  PROCESS_VM_READ, False, pidNum); // ...use pid target
  if Process <> 0 then
  try
    Mbi.BaseAddress := nil;
    while (VirtualQueryEx(Process, Mbi.BaseAddress, Mbi,
    SizeOf(TMemoryBasicInformation)) > 0) and (Mbi.RegionSize > 0) do
    begin
      if (Mbi.State <> MEM_FREE) then
      begin
        // range
        Txt := IntToHex(Cardinal(Mbi.BaseAddress), 8) + '-' +
        IntToHex(Cardinal(Mbi.BaseAddress) + Mbi.RegionSize, 8);
        // state
        if Mbi.State = MEM_COMMIT then
          Txt := Txt + ' [commited]'
        else if Mbi.State = MEM_RESERVE then
          Txt := Txt + ' [reserved]';
        // type
        if Mbi.Type_9 = MEM_IMAGE then
          Txt := Txt + ' (image)'
        else if Mbi.Type_9 = MEM_MAPPED then
          Txt := Txt + ' (mapped)'
        else if Mbi.Type_9 = MEM_PRIVATE then
          Txt := Txt + ' (private)';
          // ...AllocationProtect
          // ...Protect

          // try to get image name (uses PSApi - WinNT only)
          // (requires PROCESS_VM_READ)
        if GetModuleFileNameEx(Process, HINST(Mbi.AllocationBase),
          Filename, MAX_PATH) > 0 then
          Txt := Txt + ' - ' + Filename;

        Memo1.Lines.Add(Txt);
      end;
      Inc(Cardinal(Mbi.BaseAddress), Mbi.RegionSize);
    end;
  finally
    CloseHandle(Process);
  end;
  L := TStringList.Create;
  GetWin32TypeLibList(L);
  Memo2.Lines.Assign(L);
  L.Free;
  Screen.Cursor := crDefault;
end;

end.
