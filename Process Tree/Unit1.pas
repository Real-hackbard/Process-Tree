unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Shell.ShellCtrls, Vcl.StdCtrls, TlHelp32, Grids,
  ImgList, System.ImageList, Vcl.Menus, Vcl.ClipBrd, psApi, ShellApi,
  ComObj, Math, Vcl.ExtCtrls, IniFiles;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    ExpandTree1: TMenuItem;
    Collaps1: TMenuItem;
    Refresh1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Copy1: TMenuItem;
    Show1: TMenuItem;
    Hide1: TMenuItem;
    N1: TMenuItem;
    StatusBar1: TStatusBar;
    Priotity1: TMenuItem;
    IDLE1: TMenuItem;
    NORMAL1: TMenuItem;
    HIGH1: TMenuItem;
    REALTIME1: TMenuItem;
    N3: TMenuItem;
    Force1: TMenuItem;
    erminate1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Save1: TMenuItem;
    ExportCSV1: TMenuItem;
    N4: TMenuItem;
    ExportExcel1: TMenuItem;
    N5: TMenuItem;
    StringGrid2: TStringGrid;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    Architecture1: TMenuItem;
    ShowModules1: TMenuItem;
    N6: TMenuItem;
    Details1: TMenuItem;
    PopupMenu3: TPopupMenu;
    N7: TMenuItem;
    ExportCSV2: TMenuItem;
    ExportExcel2: TMenuItem;
    Save2: TMenuItem;
    N2: TMenuItem;
    Save3: TMenuItem;
    SaveDialog2: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure CreateProcessTree();
    procedure AddChild(k: integer);
    procedure AddWindow(_hwnd: longint);
    procedure TreeView1DblClick(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvwProcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ExpandTree1Click(Sender: TObject);
    procedure Collaps1Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure Hide1Click(Sender: TObject);
    procedure Force1Click(Sender: TObject);
    procedure erminate1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure ExportCSV1Click(Sender: TObject);
    procedure ExportExcel1Click(Sender: TObject);
    procedure Architecture1Click(Sender: TObject);
    procedure ShowModules1Click(Sender: TObject);
    procedure Details1Click(Sender: TObject);
    procedure ExportCSV2Click(Sender: TObject);
    procedure ExportExcel2Click(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure Save3Click(Sender: TObject);
  private
   { Private-Declaration }
   function SaveToCSV:Boolean;
   function SaveToCSVArchitecture:Boolean;
  public
  { Public-Declaration }

  end;

  PPe=^TProcessEntry32;

const Max_=255;

var
  Form1: TForm1;
  SH   : Cardinal;
  DT_hWnd, buflen : longint;
  all  : array of TProcessEntry32;
  buf  : array [0..Max_] of Char;
  hw   : array[0..255] of dword;
  prId,thId, pr : DWord;
  IWV: boolean;
  ihw: byte;
  n, thrCount: integer;

type
  TFileVersionInfo = record
    FileType,
    CompanyName,
    FileDescription,
    FileVersion,
    InternalName,
    LegalCopyRight,
    LegalTradeMarks,
    OriginalFileName,
    ProductName,
    ProductVersion,
    Comments,
    SpecialBuildStr,
    PrivateBuildStr,
    FileFunction: string;
    DebugBuild,
    PreRelease,
    SpecialBuild,
    PrivateBuild,
    Patched,
    InfoInferred: Boolean;
end;

type
  TNodeType = (ntNew, ntChild, ntNormal);

implementation

uses WbemScripting_TLB, Unit2;

{$R *.dfm}
(* Converting a hierarchical data structure
   (a "tree") to an INI file is possible, but requires that the tree
   adheres to the structural limitations of the INI format, which is a
   simple key-value format with only a single level of sectioning.*)
procedure TreeToIni(Tree: TTreeView; INI: TIniFile; Section: string);
var
  n: Integer;
  MS: TMemoryStream;
  tTv: TStringList;
  Msg: string;
begin
  tTv := TStringList.Create;
  MS := TMemoryStream.Create;
  try
    Tree.SaveToStream(MS);
    MS.Position := 0;
    tTv.LoadFromStream(MS);
    INI.EraseSection(Section);
    for n := 0 to tTv.Count - 1 do
      INI.WriteString(Section, 'Node' + IntToStr(n), StringReplace(tTv[n], #9,
        '#', [rfReplaceAll]));
  finally
    tTv.Free;
    MS.Free;
  end;
end;

// To get process memory usage information
function GetMemoryUsage(pid : cardinal) : DWORD;
var
  hdl : cardinal;
  pcb : PROCESS_MEMORY_COUNTERS;
begin
  result := 0;
  // Open the process
  hdl := OpenProcess(PROCESS_QUERY_INFORMATION,false,pid);

  if hdl > 0 then
  begin
    // Get the memory information
    GetProcessMemoryInfo(hdl,@pcb,sizeof(pcb));
    result := pcb.WorkingSetSize;
  end;
end;

procedure DumpDOSHeader(const h: IMAGE_DOS_HEADER);
begin
(* The DOS header is a 64-byte structure at the beginning of an executable
   file (.exe) that contains information for compatibility with
   the old MS-DOS format.*)
  Form1.StringGrid2.Cells[1,0] := Format('%d', [h.e_magic]);
  Form1.StringGrid2.Cells[1,1] := Format('%d', [h.e_cblp]);
  Form1.StringGrid2.Cells[1,2] := Format('%d', [h.e_cp]);
  Form1.StringGrid2.Cells[1,3] := Format('%d', [h.e_crlc]);
  Form1.StringGrid2.Cells[1,4] := Format('%d', [h.e_cparhdr]);
  Form1.StringGrid2.Cells[1,5] := Format('%d', [h.e_minalloc]);
  Form1.StringGrid2.Cells[1,6] := Format('%d', [h.e_maxalloc]);
  Form1.StringGrid2.Cells[1,7] := Format('%d', [h.e_ss]);
  Form1.StringGrid2.Cells[1,8] := Format('%d', [h.e_sp]);
  Form1.StringGrid2.Cells[1,9] := Format('%d', [h.e_csum]);
  Form1.StringGrid2.Cells[1,10] := Format('%d', [h.e_ip]);
  Form1.StringGrid2.Cells[1,11] := Format('%d', [h.e_cs]);
  Form1.StringGrid2.Cells[1,12] := Format('%d', [h.e_lfarlc]);
  Form1.StringGrid2.Cells[1,13] := Format('%d', [h.e_ovno]);
  Form1.StringGrid2.Cells[1,14] := Format('%d', [h.e_oemid]);
  Form1.StringGrid2.Cells[1,15] := Format('%d', [h.e_oeminfo]);
  Form1.StringGrid2.Cells[1,16] := Format('%d', [h._lfanew]);
end;

procedure DumpPEHeader(const h: IMAGE_FILE_HEADER);
var
  dt: TDateTime;
begin
  Form1.StringGrid2.Cells[1,17] := Format('%4x', [h.Machine]);

  case h.Machine of
    IMAGE_FILE_MACHINE_UNKNOWN : Form1.StringGrid2.Cells[1,18] :=('MACHINE_UNKNOWN ');
    IMAGE_FILE_MACHINE_I386:     Form1.StringGrid2.Cells[1,18] :=('Intel 386. ');
    IMAGE_FILE_MACHINE_R3000:    Form1.StringGrid2.Cells[1,18] :=('MIPS little-endian, 0x160 big-endian ');
    IMAGE_FILE_MACHINE_R4000:    Form1.StringGrid2.Cells[1,18] :=('MIPS little-endian ');
    IMAGE_FILE_MACHINE_R10000:   Form1.StringGrid2.Cells[1,18] :=('MIPS little-endian ');
    IMAGE_FILE_MACHINE_ALPHA:    Form1.StringGrid2.Cells[1,18] :=('Alpha_AXP ');
    IMAGE_FILE_MACHINE_POWERPC:  Form1.StringGrid2.Cells[1,18] :=('IBM PowerPC Little-Endian ');
    // some values no longer defined in winnt.h
    $14D: Form1.StringGrid2.Cells[1,18] :=('Intel i860');
    $268: Form1.StringGrid2.Cells[1,18] :=('Motorola 68000');
    $290: Form1.StringGrid2.Cells[1,18] :=('PA RISC');
    else
      Form1.StringGrid2.Cells[1,18] :=('Unknown Machine typ');
  end;

  Form1.StringGrid2.Cells[1,19] := Format('%d', [h.NumberOfSections]);
  Form1.StringGrid2.Cells[1,20] := Format('%d', [h.TimeDateStamp]);
  dt := EncodeDate(1970, 1, 1) + h.Timedatestamp / SecsPerDay;
  Form1.StringGrid2.Cells[1,21] := FormatDateTime('c', dt);
  Form1.StringGrid2.Cells[1,22] := Format('%d', [h.PointerToSymbolTable]);
  Form1.StringGrid2.Cells[1,23] := Format('%d', [h.NumberOfSymbols]);
  Form1.StringGrid2.Cells[1,24] := Format('%d', [h.SizeOfOptionalHeader]);
  Form1.StringGrid2.Cells[1,25] := Format('%d', [h.Characteristics]);

  if (IMAGE_FILE_DLL and h.Characteristics) <> 0 then
    Form1.StringGrid2.Cells[1,25] := ('File is a DLL')
  else if (IMAGE_FILE_EXECUTABLE_IMAGE and h.Characteristics) <> 0 then
    Form1.StringGrid2.Cells[1,25] := ('File is a program');
end;

procedure DumpOptionalHeader(const h: IMAGE_OPTIONAL_HEADER);
begin
  Form1.StringGrid2.Cells[1,26] := Format('%d', [h.Magic]);

  case h.Magic of
    $107: Form1.StringGrid2.Cells[1,26] :=('ROM image');
    $10b: Form1.StringGrid2.Cells[1,26] :=('Executable image');
    else
      Form1.StringGrid2.Cells[1,26] :=('Unknown image type');
  end;

  Form1.StringGrid2.Cells[1,27] := Format('%d', [h.MajorLinkerVersion]);
  Form1.StringGrid2.Cells[1,28] := Format('%d', [h.MinorLinkerVersion]);
  Form1.StringGrid2.Cells[1,29] := Format('%d', [h.SizeOfCode]);
  Form1.StringGrid2.Cells[1,30] := Format('%d', [h.SizeOfInitializedData]);
  Form1.StringGrid2.Cells[1,31] := Format('%d', [h.SizeOfUninitializedData]);
  Form1.StringGrid2.Cells[1,32] := Format('%d', [h.AddressOfEntryPoint]);
  Form1.StringGrid2.Cells[1,33] := Format('%d', [h.BaseOfCode]);
  Form1.StringGrid2.Cells[1,34] := Format('%d', [h.BaseOfData]);
  Form1.StringGrid2.Cells[1,35] := Format('%d', [h.ImageBase]);
  Form1.StringGrid2.Cells[1,36] := Format('%d', [h.SectionAlignment]);
  Form1.StringGrid2.Cells[1,37] := Format('%d', [h.FileAlignment]);
  Form1.StringGrid2.Cells[1,38] := Format('%d', [h.MajorOperatingSystemVersion]);
  Form1.StringGrid2.Cells[1,39] := Format('%d', [h.MinorOperatingSystemVersion]);
  Form1.StringGrid2.Cells[1,40] := Format('%d', [h.MajorImageVersion]);
  Form1.StringGrid2.Cells[1,41] := Format('%d', [h.MinorImageVersion]);
  Form1.StringGrid2.Cells[1,42] := Format('%d', [h.MajorSubsystemVersion]);
  Form1.StringGrid2.Cells[1,43] := Format('%d', [h.MinorSubsystemVersion]);
  Form1.StringGrid2.Cells[1,44] := Format('%d', [h.Win32VersionValue]);
  Form1.StringGrid2.Cells[1,45] := Format('%d', [h.SizeOfImage]);
  Form1.StringGrid2.Cells[1,46] := Format('%d', [h.SizeOfHeaders]);
  Form1.StringGrid2.Cells[1,47] := Format('%d', [h.CheckSum]);
  Form1.StringGrid2.Cells[1,48] := Format('%d', [h.Subsystem]);

  case h.Subsystem of
    IMAGE_SUBSYSTEM_NATIVE:
      Form1.StringGrid2.Cells[1,48] := ('Image doesn''t require a subsystem. ');
    IMAGE_SUBSYSTEM_WINDOWS_GUI:
      Form1.StringGrid2.Cells[1,48] := ('Image runs Windows GUI subsystem. ');
    IMAGE_SUBSYSTEM_WINDOWS_CUI:
      Form1.StringGrid2.Cells[1,48] := ('Image runs Windows character subsystem. ');
    IMAGE_SUBSYSTEM_OS2_CUI:
      Form1.StringGrid2.Cells[1,48] := ('Image runs OS/2 character subsystem. ');
    IMAGE_SUBSYSTEM_POSIX_CUI:
      Form1.StringGrid2.Cells[1,48] := ('Image run Posix character subsystem. ');
    else
      Form1.StringGrid2.Cells[1,48] := ('Unknown subsystem')
  end;

  Form1.StringGrid2.Cells[1,49] := Format('%d', [h.DllCharacteristics]);
  Form1.StringGrid2.Cells[1,50] := Format('%d', [h.SizeOfStackReserve]);
  Form1.StringGrid2.Cells[1,51] := Format('%d', [h.SizeOfStackCommit]);
  Form1.StringGrid2.Cells[1,52] := Format('%d', [h.SizeOfHeapReserve]);
  Form1.StringGrid2.Cells[1,53] := Format('%d', [h.SizeOfHeapCommit]);
  Form1.StringGrid2.Cells[1,54] := Format('%d', [h.LoaderFlags]);
  Form1.StringGrid2.Cells[1,55] := Format('%d', [h.NumberOfRvaAndSizes]);
end;

function StringToVariant(const SourceString : string) : Variant;
var
  FloatValue : Extended;
begin
  if TryStrToFloat(SourceString, FloatValue) then
    Result := FloatValue
  else
    Result := SourceString;
end;

function RefToCell(Col, Row : Integer) : string;
var
  Pos : Integer;
begin
  // Determine column
  Result := '';
  while Col > 0 do
  begin
    Pos := Col mod 26;
    if Pos = 0 then
    begin
      Pos := 26;
      Dec(Col);
    end;
    Result := Chr(Ord('A') + Pos - 1) + Result;
    Col := Col div 26;
  end;
  // Merge column and row
  Result := Result + IntToStr(Row);
end;

function ExportStringGridToExcel(StringGrid : TStringGrid) : Boolean;
var
  Col       : Integer;
  Data      : OleVariant;
  ExcelApp  : OleVariant;
  MaxCol    : Integer;
  MaxRow    : Integer;
  Range     : OleVariant;
  Row       : Integer;
  Workbook  : OleVariant;
  Worksheet : OleVariant;
  Value     : OleVariant;
begin
  Result := False;
  // Connect to Excel
  ExcelApp := CreateOleObject('Excel.Application');
  try
    if not VarIsNull(ExcelApp) then
    begin
      // Open new Workbook
      Workbook := ExcelApp.Workbooks.Add;
      if not VarIsNull(Workbook) then
      begin
        // Determine maximum range
        MaxCol := Min(StringGrid.ColCount, ExcelApp.Columns.Count);
        MaxRow := Min(StringGrid.RowCount, ExcelApp.Rows.Count);
        if (MaxRow > 0) and (MaxCol > 0) then
        begin
          // Worksheet select
          Worksheet := Workbook.ActiveSheet;
          // Select area
          Range := Worksheet.Range[RefToCell(1, 1), RefToCell(MaxCol, MaxRow)];
          if not VarIsNull(Range) then
          begin
            //Get data from grid
            Data := VarArrayCreate([1, MaxRow, 1, MaxCol], varVariant);
            for Row := 0 to Pred(MaxRow) do
            begin
              for Col := 0 to Pred(MaxCol) do
              begin
                Value := StringToVariant(StringGrid.Cells[Col, Row]);
                Data[Succ(Row), Succ(Col)] := Value
              end;
            end;
            // Transfer data to Excel sheet
            Range.Value := Data;
            Range.Columns.AutoFit;
            // Show Excel
            Workbook.Activate;
            ExcelApp.Visible := True;
            Result := True;
          end;
        end;
      end;
    end;
  finally
    Value    := UnAssigned;
    Data     := UnAssigned;
    Range    := UnAssigned;
    Workbook := UnAssigned;
    ExcelApp := UnAssigned;
  end;
end;

function TForm1.SaveToCSV : Boolean;
var
  SD : TSaveDialog;
  I : Integer;
  CSV : TStrings;
  FileName : String;
begin
  Try
  // Create File Dialog
  SD := TSaveDialog.Create(Self);
  SD.Filter := 'CSV-Trennzeichen getrennt (*.csv)|*.CSV';
  // Execute File Dialog
  If SD.Execute = True Then
  Begin
    // Assign file name
    FileName := SD.FileName;
    If Copy(FileName,Pos('.',FileName),Length(FileName)-Pos('.',FileName)+1) <> '.csv' Then FileName := FileName + '.csv';
    Screen.Cursor := crHourGlass;
    // Stringliste Create
    CSV := TStringList.Create;
    Try
      // Stringliste fill
      For I := 0 To StringGrid1.RowCount - 1 Do CSV.Add(StringGrid1.Rows[I].CommaText);
      // CSV Save
      CSV.SaveToFile(FileName);
      Result := True;
    Finally
      CSV.Free;
    End;
  End;

  Finally
    SD.Free;
    Screen.Cursor := crDefault;
  End;
end;

function TForm1.SaveToCSVArchitecture : Boolean;
var
  SD : TSaveDialog;
  I : Integer;
  CSV : TStrings;
  FileName : String;
begin
  Try
  // Create File Dialog
  SD := TSaveDialog.Create(Self);
  SD.Filter := 'CSV-Trennzeichen getrennt (*.csv)|*.CSV';
  // Execute File Dialog
  If SD.Execute = True Then
  Begin
    // Assign file name
    FileName := SD.FileName;
    If Copy(FileName,Pos('.',FileName),Length(FileName)-Pos('.',FileName)+1) <>
                            '.csv' Then FileName := FileName + '.csv';
    Screen.Cursor := crHourGlass;
    // Stringliste Create
    CSV := TStringList.Create;
    Try
      // Stringliste fill
      For I := 0 To StringGrid2.RowCount - 1 Do CSV.Add(StringGrid2.Rows[I].CommaText);
      // CSV Save
      CSV.SaveToFile(FileName);
      Result := True;
    Finally
      CSV.Free;
    End;
  End;

  Finally
    SD.Free;
    Screen.Cursor := crDefault;
  End;
end;

procedure SaveStringGridToFile(StringGrid: TStringGrid; const FileName: String);
var
  F: TStringList;
  i: Integer;
begin
  F := TStringList.Create;
  try
    F.Add(IntToStr(StringGrid.RowCount));
    F.Add(IntToStr(StringGrid.ColCount));
    for i := 0 to (StringGrid.RowCount - 1) do
      F.Add(StringGrid.Rows[i].CommaText);
    F.SaveToFile(FileName);
  finally
    F.Free;
  end;
end;

(* You can find file owner information through a file's Properties on
   Windows, which shows details like the "Author" and "Owner" on the
   "Details" or "Security" tabs, respectively.*)
function GetFileOwner(FileName: string;
  var Domain, Username: string): Boolean;
var
  SecDescr: PSecurityDescriptor;
  SizeNeeded, SizeNeeded2: DWORD;
  OwnerSID: PSID;
  OwnerDefault: BOOL;
  OwnerName, DomainName: PChar;
  OwnerType: SID_NAME_USE;
begin
  GetFileOwner := False;
  GetMem(SecDescr, 1024);
  GetMem(OwnerSID, SizeOf(PSID));
  GetMem(OwnerName, 1024);
  GetMem(DomainName, 1024);
  try
    if not GetFileSecurity(PChar(FileName),
      OWNER_SECURITY_INFORMATION,
      SecDescr, 1024, SizeNeeded) then
      Exit;
    if not GetSecurityDescriptorOwner(SecDescr,
      OwnerSID, OwnerDefault) then
      Exit;
    SizeNeeded  := 1024;
    SizeNeeded2 := 1024;
    if not LookupAccountSID(nil, OwnerSID, OwnerName,
      SizeNeeded, DomainName, SizeNeeded2, OwnerType) then
      Exit;
    Domain   := DomainName;
    Username := OwnerName;
  finally
    FreeMem(SecDescr);
    FreeMem(OwnerName);
    FreeMem(DomainName);
  end;
  GetFileOwner := True;
end;

function FileVersionInfo(const sAppNamePath: TFileName): TFileVersionInfo;
var
  rSHFI: TSHFileInfo;
  iRet: Integer;
  VerSize: Integer;
  VerBuf: PChar;
  VerBufValue: Pointer;
  VerHandle: Cardinal;
  VerBufLen: Cardinal;
  VerKey: string;
  FixedFileInfo: PVSFixedFileInfo;

  // dwFileType, dwFileSubtype
  function GetFileSubType(FixedFileInfo: PVSFixedFileInfo): string;
  begin
    case FixedFileInfo.dwFileType of

      VFT_UNKNOWN: Result    := 'Unknown';
      VFT_APP: Result        := 'Application';
      VFT_DLL: Result        := 'DLL';
      VFT_STATIC_LIB: Result := 'Static-link Library';

      VFT_DRV:
        case
          FixedFileInfo.dwFileSubtype of
          VFT2_UNKNOWN: Result         := 'Unknown Driver';
          VFT2_DRV_COMM: Result        := 'Communications Driver';
          VFT2_DRV_PRINTER: Result     := 'Printer Driver';
          VFT2_DRV_KEYBOARD: Result    := 'Keyboard Driver';
          VFT2_DRV_LANGUAGE: Result    := 'Language Driver';
          VFT2_DRV_DISPLAY: Result     := 'Display Driver';
          VFT2_DRV_MOUSE: Result       := 'Mouse Driver';
          VFT2_DRV_NETWORK: Result     := 'Network Driver';
          VFT2_DRV_SYSTEM: Result      := 'System Driver';
          VFT2_DRV_INSTALLABLE: Result := 'InstallableDriver';
          VFT2_DRV_SOUND: Result       := 'Sound Driver';
        end;
      VFT_FONT:
        case FixedFileInfo.dwFileSubtype of
          VFT2_UNKNOWN: Result       := 'Unknown Font';
          VFT2_FONT_RASTER: Result   := 'Raster Font';
          VFT2_FONT_VECTOR: Result   := 'Vector Font';
          VFT2_FONT_TRUETYPE: Result := 'Truetype Font';
          else;
        end;
      VFT_VXD: Result := 'Virtual Defice Identifier = ' +
          IntToHex(FixedFileInfo.dwFileSubtype, 8);
    end;
  end;


  function HasdwFileFlags(FixedFileInfo: PVSFixedFileInfo; Flag: Word): Boolean;
  begin
    Result := (FixedFileInfo.dwFileFlagsMask and
      FixedFileInfo.dwFileFlags and
      Flag) = Flag;
  end;

  function GetFixedFileInfo: PVSFixedFileInfo;
  begin
    if not VerQueryValue(VerBuf, '', Pointer(Result), VerBufLen) then
      Result := nil
  end;

  function GetInfo(const aKey: string): string;
  begin
    Result := '';
    VerKey := Format('\StringFileInfo\%.4x%.4x\%s',
      [LoWord(Integer(VerBufValue^)),
      HiWord(Integer(VerBufValue^)), aKey]);
    if VerQueryValue(VerBuf, PChar(VerKey), VerBufValue, VerBufLen) then
      Result := StrPas(PChar(VerBufValue));
  end;

  function QueryValue(const aValue: string): string;
  begin
    Result := '';
    // obtain version information about the specified file
    if GetFileVersionInfo(PChar(sAppNamePath), VerHandle, VerSize, VerBuf) and
      // return selected version information
      VerQueryValue(VerBuf, '\VarFileInfo\Translation', VerBufValue, VerBufLen) then
      Result := GetInfo(aValue);
  end;
begin
  // Initialize the Result
  with Result do
  begin
    FileType         := '';
    CompanyName      := '';
    FileDescription  := '';
    FileVersion      := '';
    InternalName     := '';
    LegalCopyRight   := '';
    LegalTradeMarks  := '';
    OriginalFileName := '';
    ProductName      := '';
    ProductVersion   := '';
    Comments         := '';
    SpecialBuildStr  := '';
    PrivateBuildStr  := '';
    FileFunction     := '';
    DebugBuild       := False;
    Patched          := False;
    PreRelease       := False;
    SpecialBuild     := False;
    PrivateBuild     := False;
    InfoInferred     := False;
  end;

  // Get the file type
  if SHGetFileInfo(PChar(sAppNamePath), 0, rSHFI, SizeOf(rSHFI),
    SHGFI_TYPENAME) <> 0 then
  begin
    Result.FileType := rSHFI.szTypeName;
  end;

  iRet := SHGetFileInfo(PChar(sAppNamePath), 0, rSHFI, SizeOf(rSHFI), SHGFI_EXETYPE);
  if iRet <> 0 then
  begin
    // determine whether the OS can obtain version information
    VerSize := GetFileVersionInfoSize(PChar(sAppNamePath), VerHandle);
    if VerSize > 0 then
    begin
      VerBuf := AllocMem(VerSize);
      try
        with Result do
        begin
          CompanyName      := QueryValue('CompanyName');
          FileDescription  := QueryValue('FileDescription');
          FileVersion      := QueryValue('FileVersion');
          InternalName     := QueryValue('InternalName');
          LegalCopyRight   := QueryValue('LegalCopyRight');
          LegalTradeMarks  := QueryValue('LegalTradeMarks');
          OriginalFileName := QueryValue('OriginalFileName');
          ProductName      := QueryValue('ProductName');
          ProductVersion   := QueryValue('ProductVersion');
          Comments         := QueryValue('Comments');
          SpecialBuildStr  := QueryValue('SpecialBuild');
          PrivateBuildStr  := QueryValue('PrivateBuild');
          // Fill the VS_FIXEDFILEINFO structure
          FixedFileInfo := GetFixedFileInfo;
          DebugBuild    := HasdwFileFlags(FixedFileInfo, VS_FF_DEBUG);
          PreRelease    := HasdwFileFlags(FixedFileInfo, VS_FF_PRERELEASE);
          PrivateBuild  := HasdwFileFlags(FixedFileInfo, VS_FF_PRIVATEBUILD);
          SpecialBuild  := HasdwFileFlags(FixedFileInfo, VS_FF_SPECIALBUILD);
          Patched       := HasdwFileFlags(FixedFileInfo, VS_FF_PATCHED);
          InfoInferred  := HasdwFileFlags(FixedFileInfo, VS_FF_INFOINFERRED);
          FileFunction  := GetFileSubType(FixedFileInfo);
        end;
      finally
        FreeMem(VerBuf, VerSize);
      end
    end;
  end
end;

function GetPathFromPID(const PID: cardinal): string;
var
  hProcess: THandle;
  path: array[0..MAX_PATH - 1] of char;
begin
(* The Process ID (PID) is a unique numerical identifier automatically
   assigned by the operating system (OS) to each running process
   (an instance of a program). This identifier is crucial for the OS to
   manage resources, monitor process status, facilitate inter-process
   communication, and for users or administrators to control or debug
   processes, such as adjusting their priority or terminating them.*)
  hProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, false, PID);
  if hProcess <> 0 then
    try
      if GetModuleFileNameEx(hProcess, 0, path, MAX_PATH) = 0 then
        RaiseLastOSError;
      result := path;
    finally
      CloseHandle(hProcess)
    end
  else
    RaiseLastOSError;
end;

function GetProcessPath(Exename: string): String;
var
  hProcSnap, hModSnap: THandle;
  PE32: TProcessEntry32;
  ME32: TModuleEntry32;
begin
  Result := '';
  hProcSnap := CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS, 0);
  if hProcSnap <> INVALID_HANDLE_VALUE then
   begin
    PE32.dwSize := SizeOf(ProcessEntry32);
    if Process32First(hProcSnap, PE32) = True then
     begin
      while Process32Next(hProcSnap, PE32) = True do
       begin
        if Pos(Exename, PE32.szExeFile) <> 0 then
         begin
          hModSnap := CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, PE32.th32ProcessID);
          if hModSnap <> INVALID_HANDLE_VALUE then
           begin
            ME32.dwSize := SizeOf(TModuleEntry32);
            if Module32First(hModSnap, ME32) = True then
             Result := ME32.szExePath;
           end;
          CloseHandle(hModSnap);
         end;
       end;
     end;
    CloseHandle(hProcSnap);
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

procedure TForm1.Collaps1Click(Sender: TObject);
begin
  TreeView1.FullCollapse;
end;

procedure TForm1.Copy1Click(Sender: TObject);
var
  s : string;
  i, k : integer;
begin
  S:= '';
  With StringGrid1 do
  for i:= Selection.Top to Selection.Bottom do
  begin
    for k:= Selection.Left to Selection.Right do
    begin
      S := S + Cells[k,i];
      if k <> Selection.Right Then S := S + #9;
    end;
    S:= S + #13#10;
  end;
  Clipboard.AsText := S;
end;

(* A process tree is a hierarchical representation of running processes
   on an operating system, illustrating their parent-child relationships.*)
procedure TForm1.CreateProcessTree();
var
  i,j,k: integer;
  PE   : TProcessEntry32;
  IsRoot: boolean;
begin
 n:=0;
 ihw:=0;
 thrCount:=0;
 SH := CreateToolHelp32SnapShot(Th32cs_SnapAll, 0);
 pe.dwSize:=sizeof(PE);
 Process32First(SH, PE);
 repeat                 
   SetLength(all,n+2);
   all[n]:=PE;
   inc(thrCount,all[n].cntThreads);
   inc(n);
 until not Process32Next(SH, PE);
 i:=0;
 DT_hWnd :=GetDesktopWindow;  
 repeat
   IsRoot:=true;
   for j:=0 to n-1 do
     if (all[i].th32ParentProcessID=all[j].th32ProcessID) and (i<>j)
     then
      begin
       IsRoot:=false;
       break;
      end;
   if IsRoot
   then
    begin
     TreeView1.Items.AddObject(nil,ExtractFileName(all[i].szExeFile),@all[i]);
     TreeView1.Items[TreeView1.Items.Count-1].ImageIndex:=1;
     AddChild(i);
    end;
   inc(i);
  until i>=n;
 CloseHandle(SH);
end;

procedure TForm1.Details1Click(Sender: TObject);
begin
  if Details1.Checked = false then
  begin
    StringGrid1.Visible := false;
    Splitter1.Visible := false;
  end else begin
    StringGrid1.Visible := true;
    Splitter1.Visible := true;
  end;
end;

procedure TForm1.erminate1Click(Sender: TObject);
var
  procId, ExCode : Cardinal;
  Hp : Thandle;   th: byte;
begin
  th := ppe(TreeView1.Selected.data)^.cntThreads;
  Procid := StrToCardinal(StringGrid1.Cells[1,3]);
  Hp := OpenProcess(PROCESS_TERMINATE, false, procid );

  if TerminateProcess(Hp,ExCode) then
  begin
    TreeView1.Selected.Delete;
    dec(n);
    dec(thrCount,th);
  end
  else
    ShowMessage('Process Terminated failed');
  TreeView1.Repaint;
end;

procedure TForm1.ExpandTree1Click(Sender: TObject);
begin
  TreeView1.FullExpand;
end;

procedure TForm1.ExportCSV1Click(Sender: TObject);
begin
  SaveToCSV;
end;

procedure TForm1.ExportCSV2Click(Sender: TObject);
begin
  SaveToCSVArchitecture;
end;

procedure TForm1.ExportExcel1Click(Sender: TObject);
begin
  ExportStringGridToExcel(StringGrid1);
end;

procedure TForm1.ExportExcel2Click(Sender: TObject);
begin
  ExportStringGridToExcel(StringGrid2);
end;

procedure TForm1.AddChild(k: integer);
var
  m,i: integer;
begin
  i:=0;
  m:=TreeView1.Items.Count;
  pr:=all[k].th32ProcessID;
  AddWindow(DT_hwnd);
  repeat
    if (all[i].th32ParentProcessID=all[k].th32ProcessID)and(i<>k) then begin
      TreeView1.Items.AddChildObject (TreeView1.Items[m-1],
                                    ExtractFileName(all[i].szExeFile),@all[i]);
      TreeView1.Items[TreeView1.Items.Count-1].ImageIndex:=1;
      AddChild(i);
    end;
    inc(i);
  until i>=n;
end;

procedure TForm1.AddWindow(_hwnd: longint);
var
  m: integer;
begin
  m:=TreeView1.Items.Count-1;
  _hwnd:=GetWindow(_hWnd,GW_CHILD);

  while (_HWnd<>0) do
  begin
    thID:=GetWindowThreadProcessId(_hWnd,@prId);
    if prID=pr then
    begin
      buflen:=GetWindowText(_HWnd,@buf,MaX_);
      if (buflen >0) then
      begin
        inc(ihw);
        hw[ihw]:=_hwnd;
        TreeView1.Items.AddChildObject(TreeView1.Items[m],String(buf),@hw[ihw]);
        TreeView1.Items[TreeView1.Items.Count-1].ImageIndex:=2;
        AddWindow(_hwnd);
      end;
    end;
    _hwnd :=GetWindow(_hwnd, GW_HWNDNEXT);
  end;
end;

procedure TForm1.Architecture1Click(Sender: TObject);
begin
  StringGrid2.Visible := Architecture1.Checked;
end;

procedure TForm1.TreeView1DblClick(Sender: TObject);
begin
  if not ((ppe(TreeView1.Selected.Data)^.cntThreads=0) or
          (ppe(TreeView1.Selected.Data)^.pcPriClassBase>32)) then
  begin
    StringGrid1.Cells[1,3]:= IntToStr(Ppe(TreeView1.Selected.Data)^.th32ProcessID);
    erminate1.Enabled:=true;
  end;
end;

procedure TForm1.TreeView1Click(Sender: TObject);
const
  Tabulator: array[0..0] of Integer = (70);
  BoolValues: array[Boolean] of string = ('No', 'Yes');
var
  cpos: TPoint;
  tr: TRect;
  FvI: TFileVersionInfo;
  i : integer;
  Domain, Username: string;
  l_nSize: Cardinal;
  fs: TFilestream;
  signature : DWORD;
  dos_header: IMAGE_DOS_HEADER;
  pe_header : IMAGE_FILE_HEADER;
  opt_header: IMAGE_OPTIONAL_HEADER;
begin

  Screen.Cursor := crHourGlass;
  for i := 0 to 22 do
    begin
      StringGrid1.Cells[1,i] := '';
    end;

  if (ppe(TreeView1.Selected.Data)^.cntThreads=0) or
     (ppe(TreeView1.Selected.Data)^.pcPriClassBase>32) then
  BEGIN
    Force1.Enabled := false;
    erminate1.Enabled := false;
    StatusBar1.Panels[1].Text := 'n/a';
    ShowModules1.Enabled := false;
  end else begin
    ShowModules1.Enabled := true;
    //Hide1.Enabled := false;
    //Show1.Enabled := false;
    Force1.Enabled := true;
    erminate1.Enabled := false;

    StringGrid1.Cells[1,0] := Ppe(TreeView1.Selected.Data)^.szExeFile;
    StringGrid1.Cells[1,1] := IntToStr(Ppe(TreeView1.Selected.Data)^.pcPriClassBase);
    StringGrid1.Cells[1,2] := IntToStr(Ppe(TreeView1.Selected.Data)^.cntThreads);
    StringGrid1.Cells[1,3] := IntToStr(Ppe(TreeView1.Selected.Data)^.th32ProcessID);
    StringGrid1.Cells[1,4] := GetProcessPath(StringGrid1.Cells[1,0]);

    FvI := FileVersionInfo(StringGrid1.Cells[1,4]);
    with FvI do
    begin
      StringGrid1.Cells[1,5] := FileType;
      StringGrid1.Cells[1,6] := CompanyName;
      StringGrid1.Cells[1,7] := FileDescription;
      StringGrid1.Cells[1,8] := FileVersion;
      StringGrid1.Cells[1,9] := InternalName;
      StringGrid1.Cells[1,10] := LegalCopyRight;
      StringGrid1.Cells[1,11] := LegalTradeMarks;
      StringGrid1.Cells[1,12] := OriginalFileName;
      StringGrid1.Cells[1,13] := ProductName;
      StringGrid1.Cells[1,14] := ProductVersion;
      StringGrid1.Cells[1,15] := SpecialBuildStr;
      StringGrid1.Cells[1,16] := PrivateBuildStr;
      StringGrid1.Cells[1,17] := FileFunction;
      StringGrid1.Cells[1,18] := BoolValues[DebugBuild];
      StringGrid1.Cells[1,19] := BoolValues[PreRelease];
      StringGrid1.Cells[1,20] := BoolValues[PrivateBuild];
      StringGrid1.Cells[1,21] := BoolValues[SpecialBuild];
      StringGrid1.Cells[1,22] := Comments;
    end;

    if IsWindowVisible(longint(TreeView1.Selected.Data^)) then
    begin
      StatusBar1.Panels[1].Text :='Show';
      Hide1.Enabled := true;
      Show1.Enabled := false;
    end else begin
      StatusBar1.Panels[1].Text := 'Hide';
      Show1.Enabled := true;
      Hide1.Enabled := false;
    end;

    StatusBar1.Panels[5].Text :=
    IntToStr(GetMemoryUsage(StrToInt(StringGrid1.Cells[1,3]))div 1000) + ' Kb';
    GetFileOwner(StringGrid1.Cells[1,4], domain, username);
    StatusBar1.Panels[3].Text := username + '@' + domain;

    case Ppe(TreeView1.Selected.Data)^.pcPriClassBase of
      4:  IDLE1.Checked := true;
      8:  NORMAL1.Checked := true;
      13: HIGH1.Checked := true;
      24: REALTIME1.Checked := true;
    end;

    if (StringGrid1.Cells[1,4] = 'No') or
       (StringGrid1.Cells[1,4] = '') then
       begin
         for i := 0 to 55 do
          begin
            StringGrid2.Cells[1,i] := 'No';
          end;
          Screen.Cursor := crDefault;
         Exit;
       end;

    try
      fs := TFilestream.Create(StringGrid1.Cells[1,4],
                               fmOpenread or fmShareDenyNone);
      fs.read(dos_header, SizeOf(dos_header));

        if dos_header.e_magic <> IMAGE_DOS_SIGNATURE then
        begin
          StringGrid2.Cells[1,0] := ('Invalid Signature file header');
          Exit;
        end;
        DumpDOSHeader(dos_header);

        fs.seek(dos_header._lfanew, soFromBeginning);
        fs.read(signature, SizeOf(signature));
        if signature <> IMAGE_NT_SIGNATURE then
        begin
          StringGrid2.Cells[1,1] := ('Invalid PE header');
          Exit;
        end;

        fs.read(pe_header, SizeOf(pe_header));
        DumpPEHeader(pe_header);

        if pe_header.SizeOfOptionalHeader > 0 then
        begin
          fs.read(opt_header, SizeOf(opt_header));
          DumpOptionalHeader(opt_header);
        end;
    finally
        fs.Free;
        Screen.Cursor := crDefault;
    end;

    for i := 0 to 23 do
    begin
      if StringGrid1.Cells[1,i] = '' then StringGrid1.Cells[1,i] := 'No';
    end;

  END;
  Screen.Cursor := crDefault;
end;

procedure TForm1.tvwProcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=38) or (key=40) then TreeView1Click(Self);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CreateProcessTree();
  // StringGrid Dimensions
  StringGrid1.ColWidths[0] := 100;
  StringGrid1.ColWidths[1] := 500;
  StringGrid2.ColWidths[0] := 150;
  StringGrid2.ColWidths[1] := 500;

  // PE Deatils information
  StringGrid1.Cells[0,0]:='Process :';
  StringGrid1.Cells[0,1]:='PriClassBase :';
  StringGrid1.Cells[0,2]:='Threads :';
  StringGrid1.Cells[0,3]:='PID :';
  StringGrid1.Cells[0,4]:='Path :';
  StringGrid1.Cells[0,5]:='File Type :';
  StringGrid1.Cells[0,6]:='Company Name :';
  StringGrid1.Cells[0,7]:='File Description :';
  StringGrid1.Cells[0,8]:='File Version :';
  StringGrid1.Cells[0,9]:='Internal Name :';
  StringGrid1.Cells[0,10]:='Legal CopyRight :';
  StringGrid1.Cells[0,11]:='Legal TradeMarks :';
  StringGrid1.Cells[0,12]:='Original FileName :';
  StringGrid1.Cells[0,13]:='Product Name :';
  StringGrid1.Cells[0,14]:='Product Version :';
  StringGrid1.Cells[0,15]:='Special Build Str :';
  StringGrid1.Cells[0,16]:='Private Build Str :';
  StringGrid1.Cells[0,17]:='File Function :';
  StringGrid1.Cells[0,18]:='Debug Build :';
  StringGrid1.Cells[0,19]:='Pre Release :';
  StringGrid1.Cells[0,20]:='Private Build :';
  StringGrid1.Cells[0,21]:='Special Build :';
  StringGrid1.Cells[0,22]:='Comments :';

  // PE Architecture
  StringGrid2.Cells[0,0]:='Magic Nummber :';
  StringGrid2.Cells[0,1]:='Last Page Bytes :';
  StringGrid2.Cells[0,2]:='Pages in file :';
  StringGrid2.Cells[0,3]:='Relocations :';
  StringGrid2.Cells[0,4]:='Size Header Parameters :';
  StringGrid2.Cells[0,5]:='Min Extra Paragraphs :';
  StringGrid2.Cells[0,6]:='Max Extra Paragraphs :';
  StringGrid2.Cells[0,7]:='Initial SS Value :';
  StringGrid2.Cells[0,8]:='Initial SP Value :';
  StringGrid2.Cells[0,9]:='Checksum :';
  StringGrid2.Cells[0,10]:='Initial IP Value :';
  StringGrid2.Cells[0,11]:='Initial CS Value :';
  StringGrid2.Cells[0,12]:='Address Relocation Table :';
  StringGrid2.Cells[0,13]:='Overlay Number :';
  StringGrid2.Cells[0,14]:='OEM identifier :';
  StringGrid2.Cells[0,15]:='OEM information :';
  StringGrid2.Cells[0,16]:='Address new EXE Header :';
  StringGrid2.Cells[0,17]:='Machine id :';
  StringGrid2.Cells[0,18]:='Machine Typ :';
  StringGrid2.Cells[0,19]:='Number Of Sections :';
  StringGrid2.Cells[0,20]:='Time Date Stamp :';
  StringGrid2.Cells[0,21]:='Date/Time of Creation :';
  StringGrid2.Cells[0,22]:='Pointer to Symbol Table :';
  StringGrid2.Cells[0,23]:='Number of Symbols :';
  StringGrid2.Cells[0,24]:='Size Optional Header :';
  StringGrid2.Cells[0,25]:='Characteristics :';
  StringGrid2.Cells[0,26]:='Image Optional Header32 :';
  StringGrid2.Cells[0,27]:='Major Linker Version :';
  StringGrid2.Cells[0,28]:='Minor Linker Version :';
  StringGrid2.Cells[0,29]:='Size of Code :';
  StringGrid2.Cells[0,30]:='Size Initialized Data :';
  StringGrid2.Cells[0,31]:='Size Uninitialized Data :';
  StringGrid2.Cells[0,32]:='Address of Entry Point :';
  StringGrid2.Cells[0,33]:='Base of Code :';
  StringGrid2.Cells[0,34]:='Base of Data :';
  StringGrid2.Cells[0,35]:='Image Base :';
  StringGrid2.Cells[0,36]:='Section Alignment :';
  StringGrid2.Cells[0,37]:='File Alignment :';
  StringGrid2.Cells[0,38]:='Major OS Version :';
  StringGrid2.Cells[0,39]:='Minor OS Version :';
  StringGrid2.Cells[0,40]:='Major Image Version :';
  StringGrid2.Cells[0,41]:='Minor Image Version :';
  StringGrid2.Cells[0,42]:='Major Subsystem Version :';
  StringGrid2.Cells[0,43]:='Minor Subsystem Version :';
  StringGrid2.Cells[0,44]:='Win32 Version Value :';
  StringGrid2.Cells[0,45]:='Size of Image :';
  StringGrid2.Cells[0,46]:='Size of Headers :';
  StringGrid2.Cells[0,47]:='Header32 CheckSum :';
  StringGrid2.Cells[0,48]:='Subsystem :';
  StringGrid2.Cells[0,49]:='Dll Characteristics :';
  StringGrid2.Cells[0,50]:='Size Stack Reserve :';
  StringGrid2.Cells[0,51]:='Size Stack Commit :';
  StringGrid2.Cells[0,52]:='Size Heap Reserve :';
  StringGrid2.Cells[0,53]:='Size Heap Commit :';
  StringGrid2.Cells[0,54]:='Loader Flags :';
  StringGrid2.Cells[0,55]:='Number Rva & Sizes :';

  TreeView1.FullExpand;
end;

procedure TForm1.Hide1Click(Sender: TObject);
begin
  ShowWindow(LongInt(TreeView1.Selected.Data^),SW_HIDE);
  Hide1.Enabled := false;
  Show1.Enabled := true;
  StatusBar1.Panels[1].Text := 'hide';
end;

procedure TForm1.Refresh1Click(Sender: TObject);
begin
  StringGrid1.Cells[1,0]:='';
  StringGrid1.Cells[1,1]:='';
  StringGrid1.Cells[1,2]:='';

  while TreeView1.items.Count<>0 do begin
    TreeView1.Items[0].Delete;
    Application.ProcessMessages;
  end;

  CreateProcessTree();
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  SaveStringGridToFile(StringGrid1, SaveDialog1.FileName + '.ini');
end;

procedure TForm1.Save2Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  SaveStringGridToFile(StringGrid2, SaveDialog1.FileName + '.ini');
end;

procedure TForm1.Save3Click(Sender: TObject);
var
  tif : TIniFile;
begin
  if SaveDialog2.Execute then
  Begin
    try
      tif := TIniFile.Create(SaveDialog2.FileName + '.ini');
      TreeToIni(TreeView1, tif , '');
    finally
      tif.Free;
    end;
  end;
end;

procedure TForm1.Show1Click(Sender: TObject);
begin
  ShowWindow(LongInt(TreeView1.Selected.Data^),SW_SHOW);
 Hide1.Enabled:=true;
 Show1.Enabled:=false;
 StatusBar1.Panels[1].Text :='show';
end;

procedure TForm1.ShowModules1Click(Sender: TObject);
begin
  try
    Form2 := TForm2.Create(nil);
    form2.ShowModal;
    Form2.Caption := 'Module Address';
  finally
  end;
end;

procedure TForm1.Force1Click(Sender: TObject);
var
  priority: integer;
  HProc:Thandle;
  pr: byte;
begin
  HProc:=0;

  if IDLE1.Checked = true then
     begin
      priority:=IDLE_PRIORITY_CLASS;
      pr:=4;
     end;

  if NORMAL1.Checked = true then
     begin
      priority:=NORMAL_PRIORITY_CLASS;
      pr:=8;
     end;

  if HIGH1.Checked = true then
     begin
      priority:=HIGH_PRIORITY_CLASS;
      pr:=13;
     end;

  if REALTIME1.Checked = true then
     begin
      priority:=REALTIME_PRIORITY_CLASS;
      pr:=24;
     end;



  HProc:=OpenProcess(PROCESS_SET_INFORMATION,
          false, ppe(TreeView1.Selected.Data)^.th32ProcessID);

  if not SetPriorityClass(HProc,priority) then
  begin
    ShowMessage('SetPriorityClass failed');
    ppe(TreeView1.Selected.Data)^.pcPriClassBase:=pr;
    TreeView1Click(self);
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
 i: integer;
begin
  all := nil;
  Application.Terminate;
end;

end.

