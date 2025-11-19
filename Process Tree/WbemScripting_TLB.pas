unit WbemScripting_TLB;

// ************************************************************************ //
// WARNUNG                                                                    
// -------                                                                    
// Die in dieser Datei deklarierten Typen wurden aus Daten einer Typbibliothek
// generiert. Wenn diese Typbibliothek explizit oder indirekt (über eine     
// andere Typbibliothek) reimportiert wird oder wenn die Anweisung            
// 'Aktualisieren' im Typbibliotheks-Editor während des Bearbeitens der     
// Typbibliothek aktiviert ist, wird der Inhalt dieser Datei neu generiert und 
// alle manuell vorgenommenen Änderungen gehen verloren.                           
// ************************************************************************ //

// PASTLWTR : $Revision:   1.130.1.0.1.0.1.6  $
// Datei generiert am 2005-01-14 18:11:33 aus der unten beschriebenen Typbibliothek.

// ************************************************************************  //
// Type Lib: C:\WINNT\System32\wbem\wbemdisp.TLB (1)
// LIBID: {565783C6-CB41-11D1-8B02-00600806D9B6}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\system32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\system32\stdvcl40.dll)
// Fehler
//   Hinweis: Element 'Class' von 'ISWbemObjectPath' geändert in 'Class_'
//   Fehler beim Erzeugen von Palettenbitmap von (TSWbemLocator) : Server C:\WINNT\System32\wbem\wbemdisp.dll enthält keine Symbole
//   Fehler beim Erzeugen von Palettenbitmap von (TSWbemNamedValueSet) : Server C:\WINNT\System32\wbem\wbemdisp.dll enthält keine Symbole
//   Fehler beim Erzeugen von Palettenbitmap von (TSWbemObjectPath) : Server C:\WINNT\System32\wbem\wbemdisp.dll enthält keine Symbole
//   Fehler beim Erzeugen von Palettenbitmap von (TSWbemLastError) : Server C:\WINNT\System32\wbem\wbemdisp.dll enthält keine Symbole
//   Fehler beim Erzeugen von Palettenbitmap von (TSWbemSink) : Server C:\WINNT\System32\wbem\wbemdisp.dll enthält keine Symbole
// ************************************************************************ //
// *************************************************************************//              
// HINWEIS:                                                                                   
// Von $IFDEF_LIVE_SERVER_AT_DESIGN_TIME überwachte Einträge, werden von  
// Eigenschaften verwendet, die Objekte zurückgeben, die explizit mit einen Funktionsaufruf  
// vor dem Zugriff über die Eigenschaft erzeugt werden müssen. Diese Einträge wurden deaktiviert,  
// um deren unbeabsichtigte Benutzung im Objektinspektor zu verhindern. Sie können sie  
// aktivieren, indem Sie LIVE_SERVER_AT_DESIGN_TIME definieren oder sie selektiv  
// aus den $IFDEF-Blöcken entfernen. Solche Einträge müssen jedoch programmseitig 
// mit einer Methode der geeigneten CoClass vor der Verwendung  
// erzeugt werden.                                                                 
{$TYPEDADDRESS OFF} // Unit muß ohne Typüberprüfung für Zeiger compiliert werden. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// In dieser Typbibliothek deklarierte GUIDS . Es werden folgende         
// Präfixe verwendet:                                                     
//   Typbibliotheken     : LIBID_xxxx                                     
//   CoClasses           : CLASS_xxxx                                     
//   DISPInterfaces      : DIID_xxxx                                      
//   Nicht-DISP-Schnittstellen: IID_xxxx                                       
// *********************************************************************//
const
  // Haupt- und Nebenversionen der Typbibliothek
  WbemScriptingMajorVersion = 1;
  WbemScriptingMinorVersion = 1;

  LIBID_WbemScripting: TGUID = '{565783C6-CB41-11D1-8B02-00600806D9B6}';

  IID_ISWbemServices: TGUID = '{76A6415C-CB41-11D1-8B02-00600806D9B6}';
  IID_ISWbemObject: TGUID = '{76A6415A-CB41-11D1-8B02-00600806D9B6}';
  IID_ISWbemObjectPath: TGUID = '{5791BC27-CE9C-11D1-97BF-0000F81E849C}';
  IID_ISWbemNamedValueSet: TGUID = '{CF2376EA-CE8C-11D1-8B05-00600806D9B6}';
  IID_ISWbemNamedValue: TGUID = '{76A64164-CB41-11D1-8B02-00600806D9B6}';
  IID_ISWbemSecurity: TGUID = '{B54D66E6-2287-11D2-8B33-00600806D9B6}';
  IID_ISWbemPrivilegeSet: TGUID = '{26EE67BF-5804-11D2-8B4A-00600806D9B6}';
  IID_ISWbemPrivilege: TGUID = '{26EE67BD-5804-11D2-8B4A-00600806D9B6}';
  IID_ISWbemObjectSet: TGUID = '{76A6415F-CB41-11D1-8B02-00600806D9B6}';
  IID_ISWbemQualifierSet: TGUID = '{9B16ED16-D3DF-11D1-8B08-00600806D9B6}';
  IID_ISWbemQualifier: TGUID = '{79B05932-D3B7-11D1-8B06-00600806D9B6}';
  IID_ISWbemPropertySet: TGUID = '{DEA0A7B2-D4BA-11D1-8B09-00600806D9B6}';
  IID_ISWbemProperty: TGUID = '{1A388F98-D4BA-11D1-8B09-00600806D9B6}';
  IID_ISWbemMethodSet: TGUID = '{C93BA292-D955-11D1-8B09-00600806D9B6}';
  IID_ISWbemMethod: TGUID = '{422E8E90-D955-11D1-8B09-00600806D9B6}';
  IID_ISWbemEventSource: TGUID = '{27D54D92-0EBE-11D2-8B22-00600806D9B6}';
  IID_ISWbemLocator: TGUID = '{76A6415B-CB41-11D1-8B02-00600806D9B6}';
  IID_ISWbemLastError: TGUID = '{D962DB84-D4BB-11D1-8B09-00600806D9B6}';
  DIID_ISWbemSinkEvents: TGUID = '{75718CA0-F029-11D1-A1AC-00C04FB6C223}';
  IID_ISWbemSink: TGUID = '{75718C9F-F029-11D1-A1AC-00C04FB6C223}';
  CLASS_SWbemLocator: TGUID = '{76A64158-CB41-11D1-8B02-00600806D9B6}';
  CLASS_SWbemNamedValueSet: TGUID = '{9AED384E-CE8B-11D1-8B05-00600806D9B6}';
  CLASS_SWbemObjectPath: TGUID = '{5791BC26-CE9C-11D1-97BF-0000F81E849C}';
  CLASS_SWbemLastError: TGUID = '{C2FEEEAC-CFCD-11D1-8B05-00600806D9B6}';
  CLASS_SWbemSink: TGUID = '{75718C9A-F029-11D1-A1AC-00C04FB6C223}';
  CLASS_SWbemServices: TGUID = '{04B83D63-21AE-11D2-8B33-00600806D9B6}';
  CLASS_SWbemObject: TGUID = '{04B83D62-21AE-11D2-8B33-00600806D9B6}';
  CLASS_SWbemObjectSet: TGUID = '{04B83D61-21AE-11D2-8B33-00600806D9B6}';
  CLASS_SWbemNamedValue: TGUID = '{04B83D60-21AE-11D2-8B33-00600806D9B6}';
  CLASS_SWbemQualifier: TGUID = '{04B83D5F-21AE-11D2-8B33-00600806D9B6}';
  CLASS_SWbemQualifierSet: TGUID = '{04B83D5E-21AE-11D2-8B33-00600806D9B6}';
  CLASS_SWbemProperty: TGUID = '{04B83D5D-21AE-11D2-8B33-00600806D9B6}';
  CLASS_SWbemPropertySet: TGUID = '{04B83D5C-21AE-11D2-8B33-00600806D9B6}';
  CLASS_SWbemMethod: TGUID = '{04B83D5B-21AE-11D2-8B33-00600806D9B6}';
  CLASS_SWbemMethodSet: TGUID = '{04B83D5A-21AE-11D2-8B33-00600806D9B6}';
  CLASS_SWbemEventSource: TGUID = '{04B83D58-21AE-11D2-8B33-00600806D9B6}';
  CLASS_SWbemSecurity: TGUID = '{B54D66E9-2287-11D2-8B33-00600806D9B6}';
  CLASS_SWbemPrivilege: TGUID = '{26EE67BC-5804-11D2-8B4A-00600806D9B6}';
  CLASS_SWbemPrivilegeSet: TGUID = '{26EE67BE-5804-11D2-8B4A-00600806D9B6}';

// *********************************************************************//
// Deklaration von in der Typbibliothek definierten Enumerationen         
// *********************************************************************//
// Konstanten für enum WbemImpersonationLevelEnum
type
  WbemImpersonationLevelEnum = TOleEnum;
const
  wbemImpersonationLevelAnonymous = $00000001;
  wbemImpersonationLevelIdentify = $00000002;
  wbemImpersonationLevelImpersonate = $00000003;
  wbemImpersonationLevelDelegate = $00000004;

// Konstanten für enum WbemAuthenticationLevelEnum
type
  WbemAuthenticationLevelEnum = TOleEnum;
const
  wbemAuthenticationLevelDefault = $00000000;
  wbemAuthenticationLevelNone = $00000001;
  wbemAuthenticationLevelConnect = $00000002;
  wbemAuthenticationLevelCall = $00000003;
  wbemAuthenticationLevelPkt = $00000004;
  wbemAuthenticationLevelPktIntegrity = $00000005;
  wbemAuthenticationLevelPktPrivacy = $00000006;

// Konstanten für enum WbemPrivilegeEnum
type
  WbemPrivilegeEnum = TOleEnum;
const
  wbemPrivilegeCreateToken = $00000001;
  wbemPrivilegePrimaryToken = $00000002;
  wbemPrivilegeLockMemory = $00000003;
  wbemPrivilegeIncreaseQuota = $00000004;
  wbemPrivilegeMachineAccount = $00000005;
  wbemPrivilegeTcb = $00000006;
  wbemPrivilegeSecurity = $00000007;
  wbemPrivilegeTakeOwnership = $00000008;
  wbemPrivilegeLoadDriver = $00000009;
  wbemPrivilegeSystemProfile = $0000000A;
  wbemPrivilegeSystemtime = $0000000B;
  wbemPrivilegeProfileSingleProcess = $0000000C;
  wbemPrivilegeIncreaseBasePriority = $0000000D;
  wbemPrivilegeCreatePagefile = $0000000E;
  wbemPrivilegeCreatePermanent = $0000000F;
  wbemPrivilegeBackup = $00000010;
  wbemPrivilegeRestore = $00000011;
  wbemPrivilegeShutdown = $00000012;
  wbemPrivilegeDebug = $00000013;
  wbemPrivilegeAudit = $00000014;
  wbemPrivilegeSystemEnvironment = $00000015;
  wbemPrivilegeChangeNotify = $00000016;
  wbemPrivilegeRemoteShutdown = $00000017;
  wbemPrivilegeUndock = $00000018;
  wbemPrivilegeSyncAgent = $00000019;
  wbemPrivilegeEnableDelegation = $0000001A;

// Konstanten für enum WbemCimtypeEnum
type
  WbemCimtypeEnum = TOleEnum;
const
  wbemCimtypeSint8 = $00000010;
  wbemCimtypeUint8 = $00000011;
  wbemCimtypeSint16 = $00000002;
  wbemCimtypeUint16 = $00000012;
  wbemCimtypeSint32 = $00000003;
  wbemCimtypeUint32 = $00000013;
  wbemCimtypeSint64 = $00000014;
  wbemCimtypeUint64 = $00000015;
  wbemCimtypeReal32 = $00000004;
  wbemCimtypeReal64 = $00000005;
  wbemCimtypeBoolean = $0000000B;
  wbemCimtypeString = $00000008;
  wbemCimtypeDatetime = $00000065;
  wbemCimtypeReference = $00000066;
  wbemCimtypeChar16 = $00000067;
  wbemCimtypeObject = $0000000D;

// Konstanten für enum WbemErrorEnum
type
  WbemErrorEnum = TOleEnum;
const
  wbemNoErr = $00000000;
  wbemErrFailed = $80041001;
  wbemErrNotFound = $80041002;
  wbemErrAccessDenied = $80041003;
  wbemErrProviderFailure = $80041004;
  wbemErrTypeMismatch = $80041005;
  wbemErrOutOfMemory = $80041006;
  wbemErrInvalidContext = $80041007;
  wbemErrInvalidParameter = $80041008;
  wbemErrNotAvailable = $80041009;
  wbemErrCriticalError = $8004100A;
  wbemErrInvalidStream = $8004100B;
  wbemErrNotSupported = $8004100C;
  wbemErrInvalidSuperclass = $8004100D;
  wbemErrInvalidNamespace = $8004100E;
  wbemErrInvalidObject = $8004100F;
  wbemErrInvalidClass = $80041010;
  wbemErrProviderNotFound = $80041011;
  wbemErrInvalidProviderRegistration = $80041012;
  wbemErrProviderLoadFailure = $80041013;
  wbemErrInitializationFailure = $80041014;
  wbemErrTransportFailure = $80041015;
  wbemErrInvalidOperation = $80041016;
  wbemErrInvalidQuery = $80041017;
  wbemErrInvalidQueryType = $80041018;
  wbemErrAlreadyExists = $80041019;
  wbemErrOverrideNotAllowed = $8004101A;
  wbemErrPropagatedQualifier = $8004101B;
  wbemErrPropagatedProperty = $8004101C;
  wbemErrUnexpected = $8004101D;
  wbemErrIllegalOperation = $8004101E;
  wbemErrCannotBeKey = $8004101F;
  wbemErrIncompleteClass = $80041020;
  wbemErrInvalidSyntax = $80041021;
  wbemErrNondecoratedObject = $80041022;
  wbemErrReadOnly = $80041023;
  wbemErrProviderNotCapable = $80041024;
  wbemErrClassHasChildren = $80041025;
  wbemErrClassHasInstances = $80041026;
  wbemErrQueryNotImplemented = $80041027;
  wbemErrIllegalNull = $80041028;
  wbemErrInvalidQualifierType = $80041029;
  wbemErrInvalidPropertyType = $8004102A;
  wbemErrValueOutOfRange = $8004102B;
  wbemErrCannotBeSingleton = $8004102C;
  wbemErrInvalidCimType = $8004102D;
  wbemErrInvalidMethod = $8004102E;
  wbemErrInvalidMethodParameters = $8004102F;
  wbemErrSystemProperty = $80041030;
  wbemErrInvalidProperty = $80041031;
  wbemErrCallCancelled = $80041032;
  wbemErrShuttingDown = $80041033;
  wbemErrPropagatedMethod = $80041034;
  wbemErrUnsupportedParameter = $80041035;
  wbemErrMissingParameter = $80041036;
  wbemErrInvalidParameterId = $80041037;
  wbemErrNonConsecutiveParameterIds = $80041038;
  wbemErrParameterIdOnRetval = $80041039;
  wbemErrInvalidObjectPath = $8004103A;
  wbemErrOutOfDiskSpace = $8004103B;
  wbemErrBufferTooSmall = $8004103C;
  wbemErrUnsupportedPutExtension = $8004103D;
  wbemErrUnknownObjectType = $8004103E;
  wbemErrUnknownPacketType = $8004103F;
  wbemErrMarshalVersionMismatch = $80041040;
  wbemErrMarshalInvalidSignature = $80041041;
  wbemErrInvalidQualifier = $80041042;
  wbemErrInvalidDuplicateParameter = $80041043;
  wbemErrTooMuchData = $80041044;
  wbemErrServerTooBusy = $80041045;
  wbemErrInvalidFlavor = $80041046;
  wbemErrCircularReference = $80041047;
  wbemErrUnsupportedClassUpdate = $80041048;
  wbemErrCannotChangeKeyInheritance = $80041049;
  wbemErrCannotChangeIndexInheritance = $80041050;
  wbemErrTooManyProperties = $80041051;
  wbemErrUpdateTypeMismatch = $80041052;
  wbemErrUpdateOverrideNotAllowed = $80041053;
  wbemErrUpdatePropagatedMethod = $80041054;
  wbemErrMethodNotImplemented = $80041055;
  wbemErrMethodDisabled = $80041056;
  wbemErrRefresherBusy = $80041057;
  wbemErrUnparsableQuery = $80041058;
  wbemErrNotEventClass = $80041059;
  wbemErrMissingGroupWithin = $8004105A;
  wbemErrMissingAggregationList = $8004105B;
  wbemErrPropertyNotAnObject = $8004105C;
  wbemErrAggregatingByObject = $8004105D;
  wbemErrUninterpretableProviderQuery = $8004105F;
  wbemErrBackupRestoreWinmgmtRunning = $80041060;
  wbemErrQueueOverflow = $80041061;
  wbemErrPrivilegeNotHeld = $80041062;
  wbemErrInvalidOperator = $80041063;
  wbemErrLocalCredentials = $80041064;
  wbemErrCannotBeAbstract = $80041065;
  wbemErrAmendedObject = $80041066;
  wbemErrRegistrationTooBroad = $80042001;
  wbemErrRegistrationTooPrecise = $80042002;
  wbemErrTimedout = $80043001;
  wbemErrResetToDefault = $80043002;

// Konstanten für enum WbemChangeFlagEnum
type
  WbemChangeFlagEnum = TOleEnum;
const
  wbemChangeFlagCreateOrUpdate = $00000000;
  wbemChangeFlagUpdateOnly = $00000001;
  wbemChangeFlagCreateOnly = $00000002;
  wbemChangeFlagUpdateCompatible = $00000000;
  wbemChangeFlagUpdateSafeMode = $00000020;
  wbemChangeFlagUpdateForceMode = $00000040;

// Konstanten für enum WbemFlagEnum
type
  WbemFlagEnum = TOleEnum;
const
  wbemFlagReturnImmediately = $00000010;
  wbemFlagReturnWhenComplete = $00000000;
  wbemFlagBidirectional = $00000000;
  wbemFlagForwardOnly = $00000020;
  wbemFlagNoErrorObject = $00000040;
  wbemFlagReturnErrorObject = $00000000;
  wbemFlagSendStatus = $00000080;
  wbemFlagDontSendStatus = $00000000;
  wbemFlagUseAmendedQualifiers = $00020000;

// Konstanten für enum WbemQueryFlagEnum
type
  WbemQueryFlagEnum = TOleEnum;
const
  wbemQueryFlagDeep = $00000000;
  wbemQueryFlagShallow = $00000001;
  wbemQueryFlagPrototype = $00000002;

// Konstanten für enum WbemTextFlagEnum
type
  WbemTextFlagEnum = TOleEnum;
const
  wbemTextFlagNoFlavors = $00000001;

// Konstanten für enum WbemTimeout
type
  WbemTimeout = TOleEnum;
const
  wbemTimeoutInfinite = $FFFFFFFF;

// Konstanten für enum WbemComparisonFlagEnum
type
  WbemComparisonFlagEnum = TOleEnum;
const
  wbemComparisonFlagIncludeAll = $00000000;
  wbemComparisonFlagIgnoreQualifiers = $00000001;
  wbemComparisonFlagIgnoreObjectSource = $00000002;
  wbemComparisonFlagIgnoreDefaultValues = $00000004;
  wbemComparisonFlagIgnoreClass = $00000008;
  wbemComparisonFlagIgnoreCase = $00000010;
  wbemComparisonFlagIgnoreFlavor = $00000020;

type

// *********************************************************************//
// Forward-Deklaration von in der Typbibliothek definierten Typen         
// *********************************************************************//
  ISWbemServices = interface;
  ISWbemServicesDisp = dispinterface;
  ISWbemObject = interface;
  ISWbemObjectDisp = dispinterface;
  ISWbemObjectPath = interface;
  ISWbemObjectPathDisp = dispinterface;
  ISWbemNamedValueSet = interface;
  ISWbemNamedValueSetDisp = dispinterface;
  ISWbemNamedValue = interface;
  ISWbemNamedValueDisp = dispinterface;
  ISWbemSecurity = interface;
  ISWbemSecurityDisp = dispinterface;
  ISWbemPrivilegeSet = interface;
  ISWbemPrivilegeSetDisp = dispinterface;
  ISWbemPrivilege = interface;
  ISWbemPrivilegeDisp = dispinterface;
  ISWbemObjectSet = interface;
  ISWbemObjectSetDisp = dispinterface;
  ISWbemQualifierSet = interface;
  ISWbemQualifierSetDisp = dispinterface;
  ISWbemQualifier = interface;
  ISWbemQualifierDisp = dispinterface;
  ISWbemPropertySet = interface;
  ISWbemPropertySetDisp = dispinterface;
  ISWbemProperty = interface;
  ISWbemPropertyDisp = dispinterface;
  ISWbemMethodSet = interface;
  ISWbemMethodSetDisp = dispinterface;
  ISWbemMethod = interface;
  ISWbemMethodDisp = dispinterface;
  ISWbemEventSource = interface;
  ISWbemEventSourceDisp = dispinterface;
  ISWbemLocator = interface;
  ISWbemLocatorDisp = dispinterface;
  ISWbemLastError = interface;
  ISWbemLastErrorDisp = dispinterface;
  ISWbemSinkEvents = dispinterface;
  ISWbemSink = interface;
  ISWbemSinkDisp = dispinterface;

// *********************************************************************//
// Deklaration von in der Typbibliothek definierten CoClasses             
// (HINWEIS: Hier wird jede CoClass zu ihrer Standardschnittstelle        
// zugewiesen)                                                            
// *********************************************************************//
  SWbemLocator = ISWbemLocator;
  SWbemNamedValueSet = ISWbemNamedValueSet;
  SWbemObjectPath = ISWbemObjectPath;
  SWbemLastError = ISWbemLastError;
  SWbemSink = ISWbemSink;
  SWbemServices = ISWbemServices;
  SWbemObject = ISWbemObject;
  SWbemObjectSet = ISWbemObjectSet;
  SWbemNamedValue = ISWbemNamedValue;
  SWbemQualifier = ISWbemQualifier;
  SWbemQualifierSet = ISWbemQualifierSet;
  SWbemProperty = ISWbemProperty;
  SWbemPropertySet = ISWbemPropertySet;
  SWbemMethod = ISWbemMethod;
  SWbemMethodSet = ISWbemMethodSet;
  SWbemEventSource = ISWbemEventSource;
  SWbemSecurity = ISWbemSecurity;
  SWbemPrivilege = ISWbemPrivilege;
  SWbemPrivilegeSet = ISWbemPrivilegeSet;


// *********************************************************************// 
// Deklaration von  Strukturen, Unions und Aliasen.                        
// *********************************************************************// 
  POleVariant1 = ^OleVariant; {*}


// *********************************************************************//
// Schnittstelle: ISWbemServices
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {76A6415C-CB41-11D1-8B02-00600806D9B6}
// *********************************************************************//
  ISWbemServices = interface(IDispatch)
    ['{76A6415C-CB41-11D1-8B02-00600806D9B6}']
    function Get(const strObjectPath: WideString; iFlags: Integer; 
                 const objWbemNamedValueSet: IDispatch): ISWbemObject; safecall;
    procedure GetAsync(const objWbemSink: IDispatch; const strObjectPath: WideString; 
                       iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                       const objWbemAsyncContext: IDispatch); safecall;
    procedure Delete(const strObjectPath: WideString; iFlags: Integer; 
                     const objWbemNamedValueSet: IDispatch); safecall;
    procedure DeleteAsync(const objWbemSink: IDispatch; const strObjectPath: WideString; 
                          iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                          const objWbemAsyncContext: IDispatch); safecall;
    function InstancesOf(const strClass: WideString; iFlags: Integer; 
                         const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; safecall;
    procedure InstancesOfAsync(const objWbemSink: IDispatch; const strClass: WideString; 
                               iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch); safecall;
    function SubclassesOf(const strSuperclass: WideString; iFlags: Integer; 
                          const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; safecall;
    procedure SubclassesOfAsync(const objWbemSink: IDispatch; const strSuperclass: WideString; 
                                iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                                const objWbemAsyncContext: IDispatch); safecall;
    function ExecQuery(const strQuery: WideString; const strQueryLanguage: WideString; 
                       iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; safecall;
    procedure ExecQueryAsync(const objWbemSink: IDispatch; const strQuery: WideString; 
                             const strQueryLanguage: WideString; lFlags: Integer; 
                             const objWbemNamedValueSet: IDispatch; 
                             const objWbemAsyncContext: IDispatch); safecall;
    function AssociatorsOf(const strObjectPath: WideString; const strAssocClass: WideString; 
                           const strResultClass: WideString; const strResultRole: WideString; 
                           const strRole: WideString; bClassesOnly: WordBool; 
                           bSchemaOnly: WordBool; const strRequiredAssocQualifier: WideString; 
                           const strRequiredQualifier: WideString; iFlags: Integer; 
                           const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; safecall;
    procedure AssociatorsOfAsync(const objWbemSink: IDispatch; const strObjectPath: WideString; 
                                 const strAssocClass: WideString; const strResultClass: WideString; 
                                 const strResultRole: WideString; const strRole: WideString; 
                                 bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                                 const strRequiredAssocQualifier: WideString; 
                                 const strRequiredQualifier: WideString; iFlags: Integer; 
                                 const objWbemNamedValueSet: IDispatch; 
                                 const objWbemAsyncContext: IDispatch); safecall;
    function ReferencesTo(const strObjectPath: WideString; const strResultClass: WideString; 
                          const strRole: WideString; bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                          const strRequiredQualifier: WideString; iFlags: Integer; 
                          const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; safecall;
    procedure ReferencesToAsync(const objWbemSink: IDispatch; const strObjectPath: WideString; 
                                const strResultClass: WideString; const strRole: WideString; 
                                bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                                const strRequiredQualifier: WideString; iFlags: Integer; 
                                const objWbemNamedValueSet: IDispatch; 
                                const objWbemAsyncContext: IDispatch); safecall;
    function ExecNotificationQuery(const strQuery: WideString; const strQueryLanguage: WideString; 
                                   iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemEventSource; safecall;
    procedure ExecNotificationQueryAsync(const objWbemSink: IDispatch; const strQuery: WideString; 
                                         const strQueryLanguage: WideString; iFlags: Integer; 
                                         const objWbemNamedValueSet: IDispatch; 
                                         const objWbemAsyncContext: IDispatch); safecall;
    function ExecMethod(const strObjectPath: WideString; const strMethodName: WideString; 
                        const objWbemInParameters: IDispatch; iFlags: Integer; 
                        const objWbemNamedValueSet: IDispatch): ISWbemObject; safecall;
    procedure ExecMethodAsync(const objWbemSink: IDispatch; const strObjectPath: WideString; 
                              const strMethodName: WideString; 
                              const objWbemInParameters: IDispatch; iFlags: Integer; 
                              const objWbemNamedValueSet: IDispatch; 
                              const objWbemAsyncContext: IDispatch); safecall;
    function Get_Security_: ISWbemSecurity; safecall;
    property Security_: ISWbemSecurity read Get_Security_;
  end;

// *********************************************************************//
// DispIntf:  ISWbemServicesDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {76A6415C-CB41-11D1-8B02-00600806D9B6}
// *********************************************************************//
  ISWbemServicesDisp = dispinterface
    ['{76A6415C-CB41-11D1-8B02-00600806D9B6}']
    function Get(const strObjectPath: WideString; iFlags: Integer; 
                 const objWbemNamedValueSet: IDispatch): ISWbemObject; dispid 1;
    procedure GetAsync(const objWbemSink: IDispatch; const strObjectPath: WideString; 
                       iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                       const objWbemAsyncContext: IDispatch); dispid 2;
    procedure Delete(const strObjectPath: WideString; iFlags: Integer; 
                     const objWbemNamedValueSet: IDispatch); dispid 3;
    procedure DeleteAsync(const objWbemSink: IDispatch; const strObjectPath: WideString; 
                          iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                          const objWbemAsyncContext: IDispatch); dispid 4;
    function InstancesOf(const strClass: WideString; iFlags: Integer; 
                         const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 5;
    procedure InstancesOfAsync(const objWbemSink: IDispatch; const strClass: WideString; 
                               iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch); dispid 6;
    function SubclassesOf(const strSuperclass: WideString; iFlags: Integer; 
                          const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 7;
    procedure SubclassesOfAsync(const objWbemSink: IDispatch; const strSuperclass: WideString; 
                                iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                                const objWbemAsyncContext: IDispatch); dispid 8;
    function ExecQuery(const strQuery: WideString; const strQueryLanguage: WideString; 
                       iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 9;
    procedure ExecQueryAsync(const objWbemSink: IDispatch; const strQuery: WideString; 
                             const strQueryLanguage: WideString; lFlags: Integer; 
                             const objWbemNamedValueSet: IDispatch; 
                             const objWbemAsyncContext: IDispatch); dispid 10;
    function AssociatorsOf(const strObjectPath: WideString; const strAssocClass: WideString; 
                           const strResultClass: WideString; const strResultRole: WideString; 
                           const strRole: WideString; bClassesOnly: WordBool; 
                           bSchemaOnly: WordBool; const strRequiredAssocQualifier: WideString; 
                           const strRequiredQualifier: WideString; iFlags: Integer; 
                           const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 11;
    procedure AssociatorsOfAsync(const objWbemSink: IDispatch; const strObjectPath: WideString; 
                                 const strAssocClass: WideString; const strResultClass: WideString; 
                                 const strResultRole: WideString; const strRole: WideString; 
                                 bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                                 const strRequiredAssocQualifier: WideString; 
                                 const strRequiredQualifier: WideString; iFlags: Integer; 
                                 const objWbemNamedValueSet: IDispatch; 
                                 const objWbemAsyncContext: IDispatch); dispid 12;
    function ReferencesTo(const strObjectPath: WideString; const strResultClass: WideString; 
                          const strRole: WideString; bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                          const strRequiredQualifier: WideString; iFlags: Integer; 
                          const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 13;
    procedure ReferencesToAsync(const objWbemSink: IDispatch; const strObjectPath: WideString; 
                                const strResultClass: WideString; const strRole: WideString; 
                                bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                                const strRequiredQualifier: WideString; iFlags: Integer; 
                                const objWbemNamedValueSet: IDispatch; 
                                const objWbemAsyncContext: IDispatch); dispid 14;
    function ExecNotificationQuery(const strQuery: WideString; const strQueryLanguage: WideString; 
                                   iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemEventSource; dispid 15;
    procedure ExecNotificationQueryAsync(const objWbemSink: IDispatch; const strQuery: WideString; 
                                         const strQueryLanguage: WideString; iFlags: Integer; 
                                         const objWbemNamedValueSet: IDispatch; 
                                         const objWbemAsyncContext: IDispatch); dispid 16;
    function ExecMethod(const strObjectPath: WideString; const strMethodName: WideString; 
                        const objWbemInParameters: IDispatch; iFlags: Integer; 
                        const objWbemNamedValueSet: IDispatch): ISWbemObject; dispid 17;
    procedure ExecMethodAsync(const objWbemSink: IDispatch; const strObjectPath: WideString; 
                              const strMethodName: WideString; 
                              const objWbemInParameters: IDispatch; iFlags: Integer; 
                              const objWbemNamedValueSet: IDispatch; 
                              const objWbemAsyncContext: IDispatch); dispid 18;
    property Security_: ISWbemSecurity readonly dispid 19;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemObject
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {76A6415A-CB41-11D1-8B02-00600806D9B6}
// *********************************************************************//
  ISWbemObject = interface(IDispatch)
    ['{76A6415A-CB41-11D1-8B02-00600806D9B6}']
    function Put_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectPath; safecall;
    procedure PutAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                        const objWbemNamedValueSet: IDispatch; const objWbemAsyncContext: IDispatch); safecall;
    procedure Delete_(iFlags: Integer; const objWbemNamedValueSet: IDispatch); safecall;
    procedure DeleteAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                           const objWbemNamedValueSet: IDispatch; 
                           const objWbemAsyncContext: IDispatch); safecall;
    function Instances_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; safecall;
    procedure InstancesAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                              const objWbemNamedValueSet: IDispatch; 
                              const objWbemAsyncContext: IDispatch); safecall;
    function Subclasses_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; safecall;
    procedure SubclassesAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                               const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch); safecall;
    function Associators_(const strAssocClass: WideString; const strResultClass: WideString; 
                          const strResultRole: WideString; const strRole: WideString; 
                          bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                          const strRequiredAssocQualifier: WideString; 
                          const strRequiredQualifier: WideString; iFlags: Integer; 
                          const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; safecall;
    procedure AssociatorsAsync_(const objWbemSink: IDispatch; const strAssocClass: WideString; 
                                const strResultClass: WideString; const strResultRole: WideString; 
                                const strRole: WideString; bClassesOnly: WordBool; 
                                bSchemaOnly: WordBool; const strRequiredAssocQualifier: WideString; 
                                const strRequiredQualifier: WideString; iFlags: Integer; 
                                const objWbemNamedValueSet: IDispatch; 
                                const objWbemAsyncContext: IDispatch); safecall;
    function References_(const strResultClass: WideString; const strRole: WideString; 
                         bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                         const strRequiredQualifier: WideString; iFlags: Integer; 
                         const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; safecall;
    procedure ReferencesAsync_(const objWbemSink: IDispatch; const strResultClass: WideString; 
                               const strRole: WideString; bClassesOnly: WordBool; 
                               bSchemaOnly: WordBool; const strRequiredQualifier: WideString; 
                               iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch); safecall;
    function ExecMethod_(const strMethodName: WideString; const objWbemInParameters: IDispatch; 
                         iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObject; safecall;
    procedure ExecMethodAsync_(const objWbemSink: IDispatch; const strMethodName: WideString; 
                               const objWbemInParameters: IDispatch; iFlags: Integer; 
                               const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch); safecall;
    function Clone_: ISWbemObject; safecall;
    function GetObjectText_(iFlags: Integer): WideString; safecall;
    function SpawnDerivedClass_(iFlags: Integer): ISWbemObject; safecall;
    function SpawnInstance_(iFlags: Integer): ISWbemObject; safecall;
    function CompareTo_(const objWbemObject: IDispatch; iFlags: Integer): WordBool; safecall;
    function Get_Qualifiers_: ISWbemQualifierSet; safecall;
    function Get_Properties_: ISWbemPropertySet; safecall;
    function Get_Methods_: ISWbemMethodSet; safecall;
    function Get_Derivation_: OleVariant; safecall;
    function Get_Path_: ISWbemObjectPath; safecall;
    function Get_Security_: ISWbemSecurity; safecall;
    property Qualifiers_: ISWbemQualifierSet read Get_Qualifiers_;
    property Properties_: ISWbemPropertySet read Get_Properties_;
    property Methods_: ISWbemMethodSet read Get_Methods_;
    property Derivation_: OleVariant read Get_Derivation_;
    property Path_: ISWbemObjectPath read Get_Path_;
    property Security_: ISWbemSecurity read Get_Security_;
  end;

// *********************************************************************//
// DispIntf:  ISWbemObjectDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {76A6415A-CB41-11D1-8B02-00600806D9B6}
// *********************************************************************//
  ISWbemObjectDisp = dispinterface
    ['{76A6415A-CB41-11D1-8B02-00600806D9B6}']
    function Put_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectPath; dispid 1;
    procedure PutAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                        const objWbemNamedValueSet: IDispatch; const objWbemAsyncContext: IDispatch); dispid 2;
    procedure Delete_(iFlags: Integer; const objWbemNamedValueSet: IDispatch); dispid 3;
    procedure DeleteAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                           const objWbemNamedValueSet: IDispatch; 
                           const objWbemAsyncContext: IDispatch); dispid 4;
    function Instances_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 5;
    procedure InstancesAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                              const objWbemNamedValueSet: IDispatch; 
                              const objWbemAsyncContext: IDispatch); dispid 6;
    function Subclasses_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 7;
    procedure SubclassesAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                               const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch); dispid 8;
    function Associators_(const strAssocClass: WideString; const strResultClass: WideString; 
                          const strResultRole: WideString; const strRole: WideString; 
                          bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                          const strRequiredAssocQualifier: WideString; 
                          const strRequiredQualifier: WideString; iFlags: Integer; 
                          const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 9;
    procedure AssociatorsAsync_(const objWbemSink: IDispatch; const strAssocClass: WideString; 
                                const strResultClass: WideString; const strResultRole: WideString; 
                                const strRole: WideString; bClassesOnly: WordBool; 
                                bSchemaOnly: WordBool; const strRequiredAssocQualifier: WideString; 
                                const strRequiredQualifier: WideString; iFlags: Integer; 
                                const objWbemNamedValueSet: IDispatch; 
                                const objWbemAsyncContext: IDispatch); dispid 10;
    function References_(const strResultClass: WideString; const strRole: WideString; 
                         bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                         const strRequiredQualifier: WideString; iFlags: Integer; 
                         const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 11;
    procedure ReferencesAsync_(const objWbemSink: IDispatch; const strResultClass: WideString; 
                               const strRole: WideString; bClassesOnly: WordBool; 
                               bSchemaOnly: WordBool; const strRequiredQualifier: WideString; 
                               iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch); dispid 12;
    function ExecMethod_(const strMethodName: WideString; const objWbemInParameters: IDispatch; 
                         iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObject; dispid 13;
    procedure ExecMethodAsync_(const objWbemSink: IDispatch; const strMethodName: WideString; 
                               const objWbemInParameters: IDispatch; iFlags: Integer; 
                               const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch); dispid 14;
    function Clone_: ISWbemObject; dispid 15;
    function GetObjectText_(iFlags: Integer): WideString; dispid 16;
    function SpawnDerivedClass_(iFlags: Integer): ISWbemObject; dispid 17;
    function SpawnInstance_(iFlags: Integer): ISWbemObject; dispid 18;
    function CompareTo_(const objWbemObject: IDispatch; iFlags: Integer): WordBool; dispid 19;
    property Qualifiers_: ISWbemQualifierSet readonly dispid 20;
    property Properties_: ISWbemPropertySet readonly dispid 21;
    property Methods_: ISWbemMethodSet readonly dispid 22;
    property Derivation_: OleVariant readonly dispid 23;
    property Path_: ISWbemObjectPath readonly dispid 24;
    property Security_: ISWbemSecurity readonly dispid 25;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemObjectPath
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {5791BC27-CE9C-11D1-97BF-0000F81E849C}
// *********************************************************************//
  ISWbemObjectPath = interface(IDispatch)
    ['{5791BC27-CE9C-11D1-97BF-0000F81E849C}']
    function Get_Path: WideString; safecall;
    procedure Set_Path(const strPath: WideString); safecall;
    function Get_RelPath: WideString; safecall;
    procedure Set_RelPath(const strRelPath: WideString); safecall;
    function Get_Server: WideString; safecall;
    procedure Set_Server(const strServer: WideString); safecall;
    function Get_Namespace: WideString; safecall;
    procedure Set_Namespace(const strNamespace: WideString); safecall;
    function Get_ParentNamespace: WideString; safecall;
    function Get_DisplayName: WideString; safecall;
    procedure Set_DisplayName(const strDisplayName: WideString); safecall;
    function Get_Class_: WideString; safecall;
    procedure Set_Class_(const strClass: WideString); safecall;
    function Get_IsClass: WordBool; safecall;
    procedure SetAsClass; safecall;
    function Get_IsSingleton: WordBool; safecall;
    procedure SetAsSingleton; safecall;
    function Get_Keys: ISWbemNamedValueSet; safecall;
    function Get_Security_: ISWbemSecurity; safecall;
    function Get_Locale: WideString; safecall;
    procedure Set_Locale(const strLocale: WideString); safecall;
    function Get_Authority: WideString; safecall;
    procedure Set_Authority(const strAuthority: WideString); safecall;
    property Path: WideString read Get_Path write Set_Path;
    property RelPath: WideString read Get_RelPath write Set_RelPath;
    property Server: WideString read Get_Server write Set_Server;
    property Namespace: WideString read Get_Namespace write Set_Namespace;
    property ParentNamespace: WideString read Get_ParentNamespace;
    property DisplayName: WideString read Get_DisplayName write Set_DisplayName;
    property Class_: WideString read Get_Class_ write Set_Class_;
    property IsClass: WordBool read Get_IsClass;
    property IsSingleton: WordBool read Get_IsSingleton;
    property Keys: ISWbemNamedValueSet read Get_Keys;
    property Security_: ISWbemSecurity read Get_Security_;
    property Locale: WideString read Get_Locale write Set_Locale;
    property Authority: WideString read Get_Authority write Set_Authority;
  end;

// *********************************************************************//
// DispIntf:  ISWbemObjectPathDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {5791BC27-CE9C-11D1-97BF-0000F81E849C}
// *********************************************************************//
  ISWbemObjectPathDisp = dispinterface
    ['{5791BC27-CE9C-11D1-97BF-0000F81E849C}']
    property Path: WideString dispid 0;
    property RelPath: WideString dispid 1;
    property Server: WideString dispid 2;
    property Namespace: WideString dispid 3;
    property ParentNamespace: WideString readonly dispid 4;
    property DisplayName: WideString dispid 5;
    property Class_: WideString dispid 6;
    property IsClass: WordBool readonly dispid 7;
    procedure SetAsClass; dispid 8;
    property IsSingleton: WordBool readonly dispid 9;
    procedure SetAsSingleton; dispid 10;
    property Keys: ISWbemNamedValueSet readonly dispid 11;
    property Security_: ISWbemSecurity readonly dispid 12;
    property Locale: WideString dispid 13;
    property Authority: WideString dispid 14;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemNamedValueSet
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {CF2376EA-CE8C-11D1-8B05-00600806D9B6}
// *********************************************************************//
  ISWbemNamedValueSet = interface(IDispatch)
    ['{CF2376EA-CE8C-11D1-8B05-00600806D9B6}']
    function Get__NewEnum: IUnknown; safecall;
    function Item(const strName: WideString; iFlags: Integer): ISWbemNamedValue; safecall;
    function Get_Count: Integer; safecall;
    function Add(const strName: WideString; var varValue: OleVariant; iFlags: Integer): ISWbemNamedValue; safecall;
    procedure Remove(const strName: WideString; iFlags: Integer); safecall;
    function Clone: ISWbemNamedValueSet; safecall;
    procedure DeleteAll; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ISWbemNamedValueSetDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {CF2376EA-CE8C-11D1-8B05-00600806D9B6}
// *********************************************************************//
  ISWbemNamedValueSetDisp = dispinterface
    ['{CF2376EA-CE8C-11D1-8B05-00600806D9B6}']
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(const strName: WideString; iFlags: Integer): ISWbemNamedValue; dispid 0;
    property Count: Integer readonly dispid 1;
    function Add(const strName: WideString; var varValue: OleVariant; iFlags: Integer): ISWbemNamedValue; dispid 2;
    procedure Remove(const strName: WideString; iFlags: Integer); dispid 3;
    function Clone: ISWbemNamedValueSet; dispid 4;
    procedure DeleteAll; dispid 5;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemNamedValue
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {76A64164-CB41-11D1-8B02-00600806D9B6}
// *********************************************************************//
  ISWbemNamedValue = interface(IDispatch)
    ['{76A64164-CB41-11D1-8B02-00600806D9B6}']
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(var varValue: OleVariant); safecall;
    function Get_Name: WideString; safecall;
    property Name: WideString read Get_Name;
  end;

// *********************************************************************//
// DispIntf:  ISWbemNamedValueDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {76A64164-CB41-11D1-8B02-00600806D9B6}
// *********************************************************************//
  ISWbemNamedValueDisp = dispinterface
    ['{76A64164-CB41-11D1-8B02-00600806D9B6}']
    function Value: OleVariant; dispid 0;
    property Name: WideString readonly dispid 2;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemSecurity
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {B54D66E6-2287-11D2-8B33-00600806D9B6}
// *********************************************************************//
  ISWbemSecurity = interface(IDispatch)
    ['{B54D66E6-2287-11D2-8B33-00600806D9B6}']
    function Get_ImpersonationLevel: WbemImpersonationLevelEnum; safecall;
    procedure Set_ImpersonationLevel(iImpersonationLevel: WbemImpersonationLevelEnum); safecall;
    function Get_AuthenticationLevel: WbemAuthenticationLevelEnum; safecall;
    procedure Set_AuthenticationLevel(iAuthenticationLevel: WbemAuthenticationLevelEnum); safecall;
    function Get_Privileges: ISWbemPrivilegeSet; safecall;
    property ImpersonationLevel: WbemImpersonationLevelEnum read Get_ImpersonationLevel write Set_ImpersonationLevel;
    property AuthenticationLevel: WbemAuthenticationLevelEnum read Get_AuthenticationLevel write Set_AuthenticationLevel;
    property Privileges: ISWbemPrivilegeSet read Get_Privileges;
  end;

// *********************************************************************//
// DispIntf:  ISWbemSecurityDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {B54D66E6-2287-11D2-8B33-00600806D9B6}
// *********************************************************************//
  ISWbemSecurityDisp = dispinterface
    ['{B54D66E6-2287-11D2-8B33-00600806D9B6}']
    property ImpersonationLevel: WbemImpersonationLevelEnum dispid 1;
    property AuthenticationLevel: WbemAuthenticationLevelEnum dispid 2;
    property Privileges: ISWbemPrivilegeSet readonly dispid 3;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemPrivilegeSet
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {26EE67BF-5804-11D2-8B4A-00600806D9B6}
// *********************************************************************//
  ISWbemPrivilegeSet = interface(IDispatch)
    ['{26EE67BF-5804-11D2-8B4A-00600806D9B6}']
    function Get__NewEnum: IUnknown; safecall;
    function Item(iPrivilege: WbemPrivilegeEnum): ISWbemPrivilege; safecall;
    function Get_Count: Integer; safecall;
    function Add(iPrivilege: WbemPrivilegeEnum; bIsEnabled: WordBool): ISWbemPrivilege; safecall;
    procedure Remove(iPrivilege: WbemPrivilegeEnum); safecall;
    procedure DeleteAll; safecall;
    function AddAsString(const strPrivilege: WideString; bIsEnabled: WordBool): ISWbemPrivilege; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ISWbemPrivilegeSetDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {26EE67BF-5804-11D2-8B4A-00600806D9B6}
// *********************************************************************//
  ISWbemPrivilegeSetDisp = dispinterface
    ['{26EE67BF-5804-11D2-8B4A-00600806D9B6}']
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(iPrivilege: WbemPrivilegeEnum): ISWbemPrivilege; dispid 0;
    property Count: Integer readonly dispid 1;
    function Add(iPrivilege: WbemPrivilegeEnum; bIsEnabled: WordBool): ISWbemPrivilege; dispid 2;
    procedure Remove(iPrivilege: WbemPrivilegeEnum); dispid 3;
    procedure DeleteAll; dispid 4;
    function AddAsString(const strPrivilege: WideString; bIsEnabled: WordBool): ISWbemPrivilege; dispid 5;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemPrivilege
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {26EE67BD-5804-11D2-8B4A-00600806D9B6}
// *********************************************************************//
  ISWbemPrivilege = interface(IDispatch)
    ['{26EE67BD-5804-11D2-8B4A-00600806D9B6}']
    function Get_IsEnabled: WordBool; safecall;
    procedure Set_IsEnabled(bIsEnabled: WordBool); safecall;
    function Get_Name: WideString; safecall;
    function Get_DisplayName: WideString; safecall;
    function Get_Identifier: WbemPrivilegeEnum; safecall;
    property IsEnabled: WordBool read Get_IsEnabled write Set_IsEnabled;
    property Name: WideString read Get_Name;
    property DisplayName: WideString read Get_DisplayName;
    property Identifier: WbemPrivilegeEnum read Get_Identifier;
  end;

// *********************************************************************//
// DispIntf:  ISWbemPrivilegeDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {26EE67BD-5804-11D2-8B4A-00600806D9B6}
// *********************************************************************//
  ISWbemPrivilegeDisp = dispinterface
    ['{26EE67BD-5804-11D2-8B4A-00600806D9B6}']
    property IsEnabled: WordBool dispid 0;
    property Name: WideString readonly dispid 1;
    property DisplayName: WideString readonly dispid 2;
    property Identifier: WbemPrivilegeEnum readonly dispid 3;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemObjectSet
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {76A6415F-CB41-11D1-8B02-00600806D9B6}
// *********************************************************************//
  ISWbemObjectSet = interface(IDispatch)
    ['{76A6415F-CB41-11D1-8B02-00600806D9B6}']
    function Get__NewEnum: IUnknown; safecall;
    function Item(const strObjectPath: WideString; iFlags: Integer): ISWbemObject; safecall;
    function Get_Count: Integer; safecall;
    function Get_Security_: ISWbemSecurity; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Security_: ISWbemSecurity read Get_Security_;
  end;

// *********************************************************************//
// DispIntf:  ISWbemObjectSetDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {76A6415F-CB41-11D1-8B02-00600806D9B6}
// *********************************************************************//
  ISWbemObjectSetDisp = dispinterface
    ['{76A6415F-CB41-11D1-8B02-00600806D9B6}']
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(const strObjectPath: WideString; iFlags: Integer): ISWbemObject; dispid 0;
    property Count: Integer readonly dispid 1;
    property Security_: ISWbemSecurity readonly dispid 4;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemQualifierSet
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9B16ED16-D3DF-11D1-8B08-00600806D9B6}
// *********************************************************************//
  ISWbemQualifierSet = interface(IDispatch)
    ['{9B16ED16-D3DF-11D1-8B08-00600806D9B6}']
    function Get__NewEnum: IUnknown; safecall;
    function Item(const Name: WideString; iFlags: Integer): ISWbemQualifier; safecall;
    function Get_Count: Integer; safecall;
    function Add(const strName: WideString; var varVal: OleVariant; 
                 bPropagatesToSubclass: WordBool; bPropagatesToInstance: WordBool; 
                 bIsOverridable: WordBool; iFlags: Integer): ISWbemQualifier; safecall;
    procedure Remove(const strName: WideString; iFlags: Integer); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ISWbemQualifierSetDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {9B16ED16-D3DF-11D1-8B08-00600806D9B6}
// *********************************************************************//
  ISWbemQualifierSetDisp = dispinterface
    ['{9B16ED16-D3DF-11D1-8B08-00600806D9B6}']
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(const Name: WideString; iFlags: Integer): ISWbemQualifier; dispid 0;
    property Count: Integer readonly dispid 1;
    function Add(const strName: WideString; var varVal: OleVariant; 
                 bPropagatesToSubclass: WordBool; bPropagatesToInstance: WordBool; 
                 bIsOverridable: WordBool; iFlags: Integer): ISWbemQualifier; dispid 2;
    procedure Remove(const strName: WideString; iFlags: Integer); dispid 3;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemQualifier
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {79B05932-D3B7-11D1-8B06-00600806D9B6}
// *********************************************************************//
  ISWbemQualifier = interface(IDispatch)
    ['{79B05932-D3B7-11D1-8B06-00600806D9B6}']
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(var varValue: OleVariant); safecall;
    function Get_Name: WideString; safecall;
    function Get_IsLocal: WordBool; safecall;
    function Get_PropagatesToSubclass: WordBool; safecall;
    procedure Set_PropagatesToSubclass(bPropagatesToSubclass: WordBool); safecall;
    function Get_PropagatesToInstance: WordBool; safecall;
    procedure Set_PropagatesToInstance(bPropagatesToInstance: WordBool); safecall;
    function Get_IsOverridable: WordBool; safecall;
    procedure Set_IsOverridable(bIsOverridable: WordBool); safecall;
    function Get_IsAmended: WordBool; safecall;
    property Name: WideString read Get_Name;
    property IsLocal: WordBool read Get_IsLocal;
    property PropagatesToSubclass: WordBool read Get_PropagatesToSubclass write Set_PropagatesToSubclass;
    property PropagatesToInstance: WordBool read Get_PropagatesToInstance write Set_PropagatesToInstance;
    property IsOverridable: WordBool read Get_IsOverridable write Set_IsOverridable;
    property IsAmended: WordBool read Get_IsAmended;
  end;

// *********************************************************************//
// DispIntf:  ISWbemQualifierDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {79B05932-D3B7-11D1-8B06-00600806D9B6}
// *********************************************************************//
  ISWbemQualifierDisp = dispinterface
    ['{79B05932-D3B7-11D1-8B06-00600806D9B6}']
    function Value: OleVariant; dispid 0;
    property Name: WideString readonly dispid 1;
    property IsLocal: WordBool readonly dispid 2;
    property PropagatesToSubclass: WordBool dispid 3;
    property PropagatesToInstance: WordBool dispid 4;
    property IsOverridable: WordBool dispid 5;
    property IsAmended: WordBool readonly dispid 6;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemPropertySet
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {DEA0A7B2-D4BA-11D1-8B09-00600806D9B6}
// *********************************************************************//
  ISWbemPropertySet = interface(IDispatch)
    ['{DEA0A7B2-D4BA-11D1-8B09-00600806D9B6}']
    function Get__NewEnum: IUnknown; safecall;
    function Item(const strName: WideString; iFlags: Integer): ISWbemProperty; safecall;
    function Get_Count: Integer; safecall;
    function Add(const strName: WideString; iCimType: WbemCimtypeEnum; bIsArray: WordBool; 
                 iFlags: Integer): ISWbemProperty; safecall;
    procedure Remove(const strName: WideString; iFlags: Integer); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ISWbemPropertySetDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {DEA0A7B2-D4BA-11D1-8B09-00600806D9B6}
// *********************************************************************//
  ISWbemPropertySetDisp = dispinterface
    ['{DEA0A7B2-D4BA-11D1-8B09-00600806D9B6}']
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(const strName: WideString; iFlags: Integer): ISWbemProperty; dispid 0;
    property Count: Integer readonly dispid 1;
    function Add(const strName: WideString; iCimType: WbemCimtypeEnum; bIsArray: WordBool; 
                 iFlags: Integer): ISWbemProperty; dispid 2;
    procedure Remove(const strName: WideString; iFlags: Integer); dispid 3;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemProperty
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {1A388F98-D4BA-11D1-8B09-00600806D9B6}
// *********************************************************************//
  ISWbemProperty = interface(IDispatch)
    ['{1A388F98-D4BA-11D1-8B09-00600806D9B6}']
    function Get_Value: OleVariant; safecall;
    procedure Set_Value(var varValue: OleVariant); safecall;
    function Get_Name: WideString; safecall;
    function Get_IsLocal: WordBool; safecall;
    function Get_Origin: WideString; safecall;
    function Get_CIMType: WbemCimtypeEnum; safecall;
    function Get_Qualifiers_: ISWbemQualifierSet; safecall;
    function Get_IsArray: WordBool; safecall;
    property Name: WideString read Get_Name;
    property IsLocal: WordBool read Get_IsLocal;
    property Origin: WideString read Get_Origin;
    property CIMType: WbemCimtypeEnum read Get_CIMType;
    property Qualifiers_: ISWbemQualifierSet read Get_Qualifiers_;
    property IsArray: WordBool read Get_IsArray;
  end;

// *********************************************************************//
// DispIntf:  ISWbemPropertyDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {1A388F98-D4BA-11D1-8B09-00600806D9B6}
// *********************************************************************//
  ISWbemPropertyDisp = dispinterface
    ['{1A388F98-D4BA-11D1-8B09-00600806D9B6}']
    function Value: OleVariant; dispid 0;
    property Name: WideString readonly dispid 1;
    property IsLocal: WordBool readonly dispid 2;
    property Origin: WideString readonly dispid 3;
    property CIMType: WbemCimtypeEnum readonly dispid 4;
    property Qualifiers_: ISWbemQualifierSet readonly dispid 5;
    property IsArray: WordBool readonly dispid 6;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemMethodSet
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C93BA292-D955-11D1-8B09-00600806D9B6}
// *********************************************************************//
  ISWbemMethodSet = interface(IDispatch)
    ['{C93BA292-D955-11D1-8B09-00600806D9B6}']
    function Get__NewEnum: IUnknown; safecall;
    function Item(const strName: WideString; iFlags: Integer): ISWbemMethod; safecall;
    function Get_Count: Integer; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ISWbemMethodSetDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {C93BA292-D955-11D1-8B09-00600806D9B6}
// *********************************************************************//
  ISWbemMethodSetDisp = dispinterface
    ['{C93BA292-D955-11D1-8B09-00600806D9B6}']
    property _NewEnum: IUnknown readonly dispid -4;
    function Item(const strName: WideString; iFlags: Integer): ISWbemMethod; dispid 0;
    property Count: Integer readonly dispid 1;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemMethod
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {422E8E90-D955-11D1-8B09-00600806D9B6}
// *********************************************************************//
  ISWbemMethod = interface(IDispatch)
    ['{422E8E90-D955-11D1-8B09-00600806D9B6}']
    function Get_Name: WideString; safecall;
    function Get_Origin: WideString; safecall;
    function Get_InParameters: ISWbemObject; safecall;
    function Get_OutParameters: ISWbemObject; safecall;
    function Get_Qualifiers_: ISWbemQualifierSet; safecall;
    property Name: WideString read Get_Name;
    property Origin: WideString read Get_Origin;
    property InParameters: ISWbemObject read Get_InParameters;
    property OutParameters: ISWbemObject read Get_OutParameters;
    property Qualifiers_: ISWbemQualifierSet read Get_Qualifiers_;
  end;

// *********************************************************************//
// DispIntf:  ISWbemMethodDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {422E8E90-D955-11D1-8B09-00600806D9B6}
// *********************************************************************//
  ISWbemMethodDisp = dispinterface
    ['{422E8E90-D955-11D1-8B09-00600806D9B6}']
    property Name: WideString readonly dispid 1;
    property Origin: WideString readonly dispid 2;
    property InParameters: ISWbemObject readonly dispid 3;
    property OutParameters: ISWbemObject readonly dispid 4;
    property Qualifiers_: ISWbemQualifierSet readonly dispid 5;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemEventSource
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {27D54D92-0EBE-11D2-8B22-00600806D9B6}
// *********************************************************************//
  ISWbemEventSource = interface(IDispatch)
    ['{27D54D92-0EBE-11D2-8B22-00600806D9B6}']
    function NextEvent(iTimeoutMs: Integer): ISWbemObject; safecall;
    function Get_Security_: ISWbemSecurity; safecall;
    property Security_: ISWbemSecurity read Get_Security_;
  end;

// *********************************************************************//
// DispIntf:  ISWbemEventSourceDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {27D54D92-0EBE-11D2-8B22-00600806D9B6}
// *********************************************************************//
  ISWbemEventSourceDisp = dispinterface
    ['{27D54D92-0EBE-11D2-8B22-00600806D9B6}']
    function NextEvent(iTimeoutMs: Integer): ISWbemObject; dispid 1;
    property Security_: ISWbemSecurity readonly dispid 2;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemLocator
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {76A6415B-CB41-11D1-8B02-00600806D9B6}
// *********************************************************************//
  ISWbemLocator = interface(IDispatch)
    ['{76A6415B-CB41-11D1-8B02-00600806D9B6}']
    function ConnectServer(const strServer: WideString; const strNamespace: WideString; 
                           const strUser: WideString; const strPassword: WideString; 
                           const strLocale: WideString; const strAuthority: WideString; 
                           iSecurityFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemServices; safecall;
    function Get_Security_: ISWbemSecurity; safecall;
    property Security_: ISWbemSecurity read Get_Security_;
  end;

// *********************************************************************//
// DispIntf:  ISWbemLocatorDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {76A6415B-CB41-11D1-8B02-00600806D9B6}
// *********************************************************************//
  ISWbemLocatorDisp = dispinterface
    ['{76A6415B-CB41-11D1-8B02-00600806D9B6}']
    function ConnectServer(const strServer: WideString; const strNamespace: WideString; 
                           const strUser: WideString; const strPassword: WideString; 
                           const strLocale: WideString; const strAuthority: WideString; 
                           iSecurityFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemServices; dispid 1;
    property Security_: ISWbemSecurity readonly dispid 2;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemLastError
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D962DB84-D4BB-11D1-8B09-00600806D9B6}
// *********************************************************************//
  ISWbemLastError = interface(ISWbemObject)
    ['{D962DB84-D4BB-11D1-8B09-00600806D9B6}']
  end;

// *********************************************************************//
// DispIntf:  ISWbemLastErrorDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D962DB84-D4BB-11D1-8B09-00600806D9B6}
// *********************************************************************//
  ISWbemLastErrorDisp = dispinterface
    ['{D962DB84-D4BB-11D1-8B09-00600806D9B6}']
    function Put_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectPath; dispid 1;
    procedure PutAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                        const objWbemNamedValueSet: IDispatch; const objWbemAsyncContext: IDispatch); dispid 2;
    procedure Delete_(iFlags: Integer; const objWbemNamedValueSet: IDispatch); dispid 3;
    procedure DeleteAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                           const objWbemNamedValueSet: IDispatch; 
                           const objWbemAsyncContext: IDispatch); dispid 4;
    function Instances_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 5;
    procedure InstancesAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                              const objWbemNamedValueSet: IDispatch; 
                              const objWbemAsyncContext: IDispatch); dispid 6;
    function Subclasses_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 7;
    procedure SubclassesAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                               const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch); dispid 8;
    function Associators_(const strAssocClass: WideString; const strResultClass: WideString; 
                          const strResultRole: WideString; const strRole: WideString; 
                          bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                          const strRequiredAssocQualifier: WideString; 
                          const strRequiredQualifier: WideString; iFlags: Integer; 
                          const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 9;
    procedure AssociatorsAsync_(const objWbemSink: IDispatch; const strAssocClass: WideString; 
                                const strResultClass: WideString; const strResultRole: WideString; 
                                const strRole: WideString; bClassesOnly: WordBool; 
                                bSchemaOnly: WordBool; const strRequiredAssocQualifier: WideString; 
                                const strRequiredQualifier: WideString; iFlags: Integer; 
                                const objWbemNamedValueSet: IDispatch; 
                                const objWbemAsyncContext: IDispatch); dispid 10;
    function References_(const strResultClass: WideString; const strRole: WideString; 
                         bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                         const strRequiredQualifier: WideString; iFlags: Integer; 
                         const objWbemNamedValueSet: IDispatch): ISWbemObjectSet; dispid 11;
    procedure ReferencesAsync_(const objWbemSink: IDispatch; const strResultClass: WideString; 
                               const strRole: WideString; bClassesOnly: WordBool; 
                               bSchemaOnly: WordBool; const strRequiredQualifier: WideString; 
                               iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch); dispid 12;
    function ExecMethod_(const strMethodName: WideString; const objWbemInParameters: IDispatch; 
                         iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObject; dispid 13;
    procedure ExecMethodAsync_(const objWbemSink: IDispatch; const strMethodName: WideString; 
                               const objWbemInParameters: IDispatch; iFlags: Integer; 
                               const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch); dispid 14;
    function Clone_: ISWbemObject; dispid 15;
    function GetObjectText_(iFlags: Integer): WideString; dispid 16;
    function SpawnDerivedClass_(iFlags: Integer): ISWbemObject; dispid 17;
    function SpawnInstance_(iFlags: Integer): ISWbemObject; dispid 18;
    function CompareTo_(const objWbemObject: IDispatch; iFlags: Integer): WordBool; dispid 19;
    property Qualifiers_: ISWbemQualifierSet readonly dispid 20;
    property Properties_: ISWbemPropertySet readonly dispid 21;
    property Methods_: ISWbemMethodSet readonly dispid 22;
    property Derivation_: OleVariant readonly dispid 23;
    property Path_: ISWbemObjectPath readonly dispid 24;
    property Security_: ISWbemSecurity readonly dispid 25;
  end;

// *********************************************************************//
// DispIntf:  ISWbemSinkEvents
// Flags:     (4240) Hidden NonExtensible Dispatchable
// GUID:      {75718CA0-F029-11D1-A1AC-00C04FB6C223}
// *********************************************************************//
  ISWbemSinkEvents = dispinterface
    ['{75718CA0-F029-11D1-A1AC-00C04FB6C223}']
    procedure OnObjectReady(const objWbemObject: ISWbemObject; 
                            const objWbemAsyncContext: ISWbemNamedValueSet); dispid 1;
    procedure OnCompleted(iHResult: WbemErrorEnum; const objWbemErrorObject: ISWbemObject; 
                          const objWbemAsyncContext: ISWbemNamedValueSet); dispid 2;
    procedure OnProgress(iUpperBound: Integer; iCurrent: Integer; const strMessage: WideString; 
                         const objWbemAsyncContext: ISWbemNamedValueSet); dispid 3;
    procedure OnObjectPut(const objWbemObjectPath: ISWbemObjectPath; 
                          const objWbemAsyncContext: ISWbemNamedValueSet); dispid 4;
  end;

// *********************************************************************//
// Schnittstelle: ISWbemSink
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {75718C9F-F029-11D1-A1AC-00C04FB6C223}
// *********************************************************************//
  ISWbemSink = interface(IDispatch)
    ['{75718C9F-F029-11D1-A1AC-00C04FB6C223}']
    procedure Cancel; safecall;
  end;

// *********************************************************************//
// DispIntf:  ISWbemSinkDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {75718C9F-F029-11D1-A1AC-00C04FB6C223}
// *********************************************************************//
  ISWbemSinkDisp = dispinterface
    ['{75718C9F-F029-11D1-A1AC-00C04FB6C223}']
    procedure Cancel; dispid 1;
  end;

// *********************************************************************//
// Die Klasse CoSWbemLocator stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemLocator, dargestellt von
// CoClass SWbemLocator, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemLocator = class
    class function Create: ISWbemLocator;
    class function CreateRemote(const MachineName: string): ISWbemLocator;
  end;


// *********************************************************************//
// OLE-Server-Proxy-Klassendeklaration
// Server-Objekt    : TSWbemLocator
// Hilfe-String     : Used to obtain Namespace connections
// Standardschnittstelle: ISWbemLocator
// Def. Intf. DISP? : No
// Ereignisschnittstelle: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSWbemLocatorProperties= class;
{$ENDIF}
  TSWbemLocator = class(TOleServer)
  private
    FIntf:        ISWbemLocator;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSWbemLocatorProperties;
    function      GetServerProperties: TSWbemLocatorProperties;
{$ENDIF}
    function      GetDefaultInterface: ISWbemLocator;
  protected
    procedure InitServerData; override;
    function Get_Security_: ISWbemSecurity;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISWbemLocator);
    procedure Disconnect; override;
    function ConnectServer(const strServer: WideString; const strNamespace: WideString; 
                           const strUser: WideString; const strPassword: WideString; 
                           const strLocale: WideString; const strAuthority: WideString; 
                           iSecurityFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemServices;
    property DefaultInterface: ISWbemLocator read GetDefaultInterface;
    property Security_: ISWbemSecurity read Get_Security_;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSWbemLocatorProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE-Server-Properties-Proxy-Klasse
// Server-Objekt    : TSWbemLocator
// (Dieses Objekt wird vom Eigenschaftsinspektor der IDE verwendet,
//  um die Eigenschaften dieses Servers zu bearbeiten)
// *********************************************************************//
 TSWbemLocatorProperties = class(TPersistent)
  private
    FServer:    TSWbemLocator;
    function    GetDefaultInterface: ISWbemLocator;
    constructor Create(AServer: TSWbemLocator);
  protected
    function Get_Security_: ISWbemSecurity;
  public
    property DefaultInterface: ISWbemLocator read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// Die Klasse CoSWbemNamedValueSet stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemNamedValueSet, dargestellt von
// CoClass SWbemNamedValueSet, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemNamedValueSet = class
    class function Create: ISWbemNamedValueSet;
    class function CreateRemote(const MachineName: string): ISWbemNamedValueSet;
  end;


// *********************************************************************//
// OLE-Server-Proxy-Klassendeklaration
// Server-Objekt    : TSWbemNamedValueSet
// Hilfe-String     : A collection of Named Values
// Standardschnittstelle: ISWbemNamedValueSet
// Def. Intf. DISP? : No
// Ereignisschnittstelle: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSWbemNamedValueSetProperties= class;
{$ENDIF}
  TSWbemNamedValueSet = class(TOleServer)
  private
    FIntf:        ISWbemNamedValueSet;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSWbemNamedValueSetProperties;
    function      GetServerProperties: TSWbemNamedValueSetProperties;
{$ENDIF}
    function      GetDefaultInterface: ISWbemNamedValueSet;
  protected
    procedure InitServerData; override;
    function Get_Count: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISWbemNamedValueSet);
    procedure Disconnect; override;
    function Item(const strName: WideString; iFlags: Integer): ISWbemNamedValue;
    function Add(const strName: WideString; var varValue: OleVariant; iFlags: Integer): ISWbemNamedValue;
    procedure Remove(const strName: WideString; iFlags: Integer);
    function Clone: ISWbemNamedValueSet;
    procedure DeleteAll;
    property DefaultInterface: ISWbemNamedValueSet read GetDefaultInterface;
    property Count: Integer read Get_Count;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSWbemNamedValueSetProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE-Server-Properties-Proxy-Klasse
// Server-Objekt    : TSWbemNamedValueSet
// (Dieses Objekt wird vom Eigenschaftsinspektor der IDE verwendet,
//  um die Eigenschaften dieses Servers zu bearbeiten)
// *********************************************************************//
 TSWbemNamedValueSetProperties = class(TPersistent)
  private
    FServer:    TSWbemNamedValueSet;
    function    GetDefaultInterface: ISWbemNamedValueSet;
    constructor Create(AServer: TSWbemNamedValueSet);
  protected
    function Get_Count: Integer;
  public
    property DefaultInterface: ISWbemNamedValueSet read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// Die Klasse CoSWbemObjectPath stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemObjectPath, dargestellt von
// CoClass SWbemObjectPath, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemObjectPath = class
    class function Create: ISWbemObjectPath;
    class function CreateRemote(const MachineName: string): ISWbemObjectPath;
  end;


// *********************************************************************//
// OLE-Server-Proxy-Klassendeklaration
// Server-Objekt    : TSWbemObjectPath
// Hilfe-String     : Object Path
// Standardschnittstelle: ISWbemObjectPath
// Def. Intf. DISP? : No
// Ereignisschnittstelle: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSWbemObjectPathProperties= class;
{$ENDIF}
  TSWbemObjectPath = class(TOleServer)
  private
    FIntf:        ISWbemObjectPath;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSWbemObjectPathProperties;
    function      GetServerProperties: TSWbemObjectPathProperties;
{$ENDIF}
    function      GetDefaultInterface: ISWbemObjectPath;
  protected
    procedure InitServerData; override;
    function Get_Path: WideString;
    procedure Set_Path(const strPath: WideString);
    function Get_RelPath: WideString;
    procedure Set_RelPath(const strRelPath: WideString);
    function Get_Server: WideString;
    procedure Set_Server(const strServer: WideString);
    function Get_Namespace: WideString;
    procedure Set_Namespace(const strNamespace: WideString);
    function Get_ParentNamespace: WideString;
    function Get_DisplayName: WideString;
    procedure Set_DisplayName(const strDisplayName: WideString);
    function Get_Class_: WideString;
    procedure Set_Class_(const strClass: WideString);
    function Get_IsClass: WordBool;
    function Get_IsSingleton: WordBool;
    function Get_Keys: ISWbemNamedValueSet;
    function Get_Security_: ISWbemSecurity;
    function Get_Locale: WideString;
    procedure Set_Locale(const strLocale: WideString);
    function Get_Authority: WideString;
    procedure Set_Authority(const strAuthority: WideString);
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISWbemObjectPath);
    procedure Disconnect; override;
    procedure SetAsClass;
    procedure SetAsSingleton;
    property DefaultInterface: ISWbemObjectPath read GetDefaultInterface;
    property ParentNamespace: WideString read Get_ParentNamespace;
    property IsClass: WordBool read Get_IsClass;
    property IsSingleton: WordBool read Get_IsSingleton;
    property Keys: ISWbemNamedValueSet read Get_Keys;
    property Security_: ISWbemSecurity read Get_Security_;
    property Path: WideString read Get_Path write Set_Path;
    property RelPath: WideString read Get_RelPath write Set_RelPath;
    property Server: WideString read Get_Server write Set_Server;
    property Namespace: WideString read Get_Namespace write Set_Namespace;
    property DisplayName: WideString read Get_DisplayName write Set_DisplayName;
    property Class_: WideString read Get_Class_ write Set_Class_;
    property Locale: WideString read Get_Locale write Set_Locale;
    property Authority: WideString read Get_Authority write Set_Authority;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSWbemObjectPathProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE-Server-Properties-Proxy-Klasse
// Server-Objekt    : TSWbemObjectPath
// (Dieses Objekt wird vom Eigenschaftsinspektor der IDE verwendet,
//  um die Eigenschaften dieses Servers zu bearbeiten)
// *********************************************************************//
 TSWbemObjectPathProperties = class(TPersistent)
  private
    FServer:    TSWbemObjectPath;
    function    GetDefaultInterface: ISWbemObjectPath;
    constructor Create(AServer: TSWbemObjectPath);
  protected
    function Get_Path: WideString;
    procedure Set_Path(const strPath: WideString);
    function Get_RelPath: WideString;
    procedure Set_RelPath(const strRelPath: WideString);
    function Get_Server: WideString;
    procedure Set_Server(const strServer: WideString);
    function Get_Namespace: WideString;
    procedure Set_Namespace(const strNamespace: WideString);
    function Get_ParentNamespace: WideString;
    function Get_DisplayName: WideString;
    procedure Set_DisplayName(const strDisplayName: WideString);
    function Get_Class_: WideString;
    procedure Set_Class_(const strClass: WideString);
    function Get_IsClass: WordBool;
    function Get_IsSingleton: WordBool;
    function Get_Keys: ISWbemNamedValueSet;
    function Get_Security_: ISWbemSecurity;
    function Get_Locale: WideString;
    procedure Set_Locale(const strLocale: WideString);
    function Get_Authority: WideString;
    procedure Set_Authority(const strAuthority: WideString);
  public
    property DefaultInterface: ISWbemObjectPath read GetDefaultInterface;
  published
    property Path: WideString read Get_Path write Set_Path;
    property RelPath: WideString read Get_RelPath write Set_RelPath;
    property Server: WideString read Get_Server write Set_Server;
    property Namespace: WideString read Get_Namespace write Set_Namespace;
    property DisplayName: WideString read Get_DisplayName write Set_DisplayName;
    property Class_: WideString read Get_Class_ write Set_Class_;
    property Locale: WideString read Get_Locale write Set_Locale;
    property Authority: WideString read Get_Authority write Set_Authority;
  end;
{$ENDIF}


// *********************************************************************//
// Die Klasse CoSWbemLastError stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemLastError, dargestellt von
// CoClass SWbemLastError, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemLastError = class
    class function Create: ISWbemLastError;
    class function CreateRemote(const MachineName: string): ISWbemLastError;
  end;


// *********************************************************************//
// OLE-Server-Proxy-Klassendeklaration
// Server-Objekt    : TSWbemLastError
// Hilfe-String     : The last error on the current thread
// Standardschnittstelle: ISWbemLastError
// Def. Intf. DISP? : No
// Ereignisschnittstelle: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSWbemLastErrorProperties= class;
{$ENDIF}
  TSWbemLastError = class(TOleServer)
  private
    FIntf:        ISWbemLastError;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSWbemLastErrorProperties;
    function      GetServerProperties: TSWbemLastErrorProperties;
{$ENDIF}
    function      GetDefaultInterface: ISWbemLastError;
  protected
    procedure InitServerData; override;
    function Get_Qualifiers_: ISWbemQualifierSet;
    function Get_Properties_: ISWbemPropertySet;
    function Get_Methods_: ISWbemMethodSet;
    function Get_Derivation_: OleVariant;
    function Get_Path_: ISWbemObjectPath;
    function Get_Security_: ISWbemSecurity;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISWbemLastError);
    procedure Disconnect; override;
    function Put_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectPath;
    procedure PutAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                        const objWbemNamedValueSet: IDispatch; const objWbemAsyncContext: IDispatch);
    procedure Delete_(iFlags: Integer; const objWbemNamedValueSet: IDispatch);
    procedure DeleteAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                           const objWbemNamedValueSet: IDispatch; 
                           const objWbemAsyncContext: IDispatch);
    function Instances_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectSet;
    procedure InstancesAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                              const objWbemNamedValueSet: IDispatch; 
                              const objWbemAsyncContext: IDispatch);
    function Subclasses_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectSet;
    procedure SubclassesAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                               const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch);
    function Associators_(const strAssocClass: WideString; const strResultClass: WideString; 
                          const strResultRole: WideString; const strRole: WideString; 
                          bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                          const strRequiredAssocQualifier: WideString; 
                          const strRequiredQualifier: WideString; iFlags: Integer; 
                          const objWbemNamedValueSet: IDispatch): ISWbemObjectSet;
    procedure AssociatorsAsync_(const objWbemSink: IDispatch; const strAssocClass: WideString; 
                                const strResultClass: WideString; const strResultRole: WideString; 
                                const strRole: WideString; bClassesOnly: WordBool; 
                                bSchemaOnly: WordBool; const strRequiredAssocQualifier: WideString; 
                                const strRequiredQualifier: WideString; iFlags: Integer; 
                                const objWbemNamedValueSet: IDispatch; 
                                const objWbemAsyncContext: IDispatch);
    function References_(const strResultClass: WideString; const strRole: WideString; 
                         bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                         const strRequiredQualifier: WideString; iFlags: Integer; 
                         const objWbemNamedValueSet: IDispatch): ISWbemObjectSet;
    procedure ReferencesAsync_(const objWbemSink: IDispatch; const strResultClass: WideString; 
                               const strRole: WideString; bClassesOnly: WordBool; 
                               bSchemaOnly: WordBool; const strRequiredQualifier: WideString; 
                               iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch);
    function ExecMethod_(const strMethodName: WideString; const objWbemInParameters: IDispatch; 
                         iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObject;
    procedure ExecMethodAsync_(const objWbemSink: IDispatch; const strMethodName: WideString; 
                               const objWbemInParameters: IDispatch; iFlags: Integer; 
                               const objWbemNamedValueSet: IDispatch; 
                               const objWbemAsyncContext: IDispatch);
    function Clone_: ISWbemObject;
    function GetObjectText_(iFlags: Integer): WideString;
    function SpawnDerivedClass_(iFlags: Integer): ISWbemObject;
    function SpawnInstance_(iFlags: Integer): ISWbemObject;
    function CompareTo_(const objWbemObject: IDispatch; iFlags: Integer): WordBool;
    property DefaultInterface: ISWbemLastError read GetDefaultInterface;
    property Qualifiers_: ISWbemQualifierSet read Get_Qualifiers_;
    property Properties_: ISWbemPropertySet read Get_Properties_;
    property Methods_: ISWbemMethodSet read Get_Methods_;
    property Derivation_: OleVariant read Get_Derivation_;
    property Path_: ISWbemObjectPath read Get_Path_;
    property Security_: ISWbemSecurity read Get_Security_;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSWbemLastErrorProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE-Server-Properties-Proxy-Klasse
// Server-Objekt    : TSWbemLastError
// (Dieses Objekt wird vom Eigenschaftsinspektor der IDE verwendet,
//  um die Eigenschaften dieses Servers zu bearbeiten)
// *********************************************************************//
 TSWbemLastErrorProperties = class(TPersistent)
  private
    FServer:    TSWbemLastError;
    function    GetDefaultInterface: ISWbemLastError;
    constructor Create(AServer: TSWbemLastError);
  protected
    function Get_Qualifiers_: ISWbemQualifierSet;
    function Get_Properties_: ISWbemPropertySet;
    function Get_Methods_: ISWbemMethodSet;
    function Get_Derivation_: OleVariant;
    function Get_Path_: ISWbemObjectPath;
    function Get_Security_: ISWbemSecurity;
  public
    property DefaultInterface: ISWbemLastError read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// Die Klasse CoSWbemSink stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemSink, dargestellt von
// CoClass SWbemSink, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemSink = class
    class function Create: ISWbemSink;
    class function CreateRemote(const MachineName: string): ISWbemSink;
  end;

  TSWbemSinkOnObjectReady = procedure(Sender: TObject; var objWbemObject: OleVariant;
                                                       var objWbemAsyncContext: OleVariant) of object;
  TSWbemSinkOnCompleted = procedure(Sender: TObject; iHResult: WbemErrorEnum; 
                                                     var objWbemErrorObject: OleVariant;
                                                     var objWbemAsyncContext: OleVariant) of object;
  TSWbemSinkOnProgress = procedure(Sender: TObject; iUpperBound: Integer; iCurrent: Integer; 
                                                    var strMessage: OleVariant;
                                                    var objWbemAsyncContext: OleVariant) of object;
  TSWbemSinkOnObjectPut = procedure(Sender: TObject; var objWbemObjectPath: OleVariant;
                                                     var objWbemAsyncContext: OleVariant) of object;


// *********************************************************************//
// OLE-Server-Proxy-Klassendeklaration
// Server-Objekt    : TSWbemSink
// Hilfe-String     : A sink for events arising from asynchronous operations
// Standardschnittstelle: ISWbemSink
// Def. Intf. DISP? : No
// Ereignisschnittstelle: ISWbemSinkEvents
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TSWbemSinkProperties= class;
{$ENDIF}
  TSWbemSink = class(TOleServer)
  private
    FOnObjectReady: TSWbemSinkOnObjectReady;
    FOnCompleted: TSWbemSinkOnCompleted;
    FOnProgress: TSWbemSinkOnProgress;
    FOnObjectPut: TSWbemSinkOnObjectPut;
    FIntf:        ISWbemSink;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TSWbemSinkProperties;
    function      GetServerProperties: TSWbemSinkProperties;
{$ENDIF}
    function      GetDefaultInterface: ISWbemSink;
  protected
    procedure InitServerData; override;
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: ISWbemSink);
    procedure Disconnect; override;
    procedure Cancel;
    property DefaultInterface: ISWbemSink read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TSWbemSinkProperties read GetServerProperties;
{$ENDIF}
    property OnObjectReady: TSWbemSinkOnObjectReady read FOnObjectReady write FOnObjectReady;
    property OnCompleted: TSWbemSinkOnCompleted read FOnCompleted write FOnCompleted;
    property OnProgress: TSWbemSinkOnProgress read FOnProgress write FOnProgress;
    property OnObjectPut: TSWbemSinkOnObjectPut read FOnObjectPut write FOnObjectPut;
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE-Server-Properties-Proxy-Klasse
// Server-Objekt    : TSWbemSink
// (Dieses Objekt wird vom Eigenschaftsinspektor der IDE verwendet,
//  um die Eigenschaften dieses Servers zu bearbeiten)
// *********************************************************************//
 TSWbemSinkProperties = class(TPersistent)
  private
    FServer:    TSWbemSink;
    function    GetDefaultInterface: ISWbemSink;
    constructor Create(AServer: TSWbemSink);
  protected
  public
    property DefaultInterface: ISWbemSink read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// Die Klasse CoSWbemServices stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemServices, dargestellt von
// CoClass SWbemServices, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemServices = class
    class function Create: ISWbemServices;
    class function CreateRemote(const MachineName: string): ISWbemServices;
  end;

// *********************************************************************//
// Die Klasse CoSWbemObject stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemObject, dargestellt von
// CoClass SWbemObject, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemObject = class
    class function Create: ISWbemObject;
    class function CreateRemote(const MachineName: string): ISWbemObject;
  end;

// *********************************************************************//
// Die Klasse CoSWbemObjectSet stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemObjectSet, dargestellt von
// CoClass SWbemObjectSet, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemObjectSet = class
    class function Create: ISWbemObjectSet;
    class function CreateRemote(const MachineName: string): ISWbemObjectSet;
  end;

// *********************************************************************//
// Die Klasse CoSWbemNamedValue stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemNamedValue, dargestellt von
// CoClass SWbemNamedValue, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemNamedValue = class
    class function Create: ISWbemNamedValue;
    class function CreateRemote(const MachineName: string): ISWbemNamedValue;
  end;

// *********************************************************************//
// Die Klasse CoSWbemQualifier stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemQualifier, dargestellt von
// CoClass SWbemQualifier, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemQualifier = class
    class function Create: ISWbemQualifier;
    class function CreateRemote(const MachineName: string): ISWbemQualifier;
  end;

// *********************************************************************//
// Die Klasse CoSWbemQualifierSet stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemQualifierSet, dargestellt von
// CoClass SWbemQualifierSet, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemQualifierSet = class
    class function Create: ISWbemQualifierSet;
    class function CreateRemote(const MachineName: string): ISWbemQualifierSet;
  end;

// *********************************************************************//
// Die Klasse CoSWbemProperty stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemProperty, dargestellt von
// CoClass SWbemProperty, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemProperty = class
    class function Create: ISWbemProperty;
    class function CreateRemote(const MachineName: string): ISWbemProperty;
  end;

// *********************************************************************//
// Die Klasse CoSWbemPropertySet stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemPropertySet, dargestellt von
// CoClass SWbemPropertySet, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemPropertySet = class
    class function Create: ISWbemPropertySet;
    class function CreateRemote(const MachineName: string): ISWbemPropertySet;
  end;

// *********************************************************************//
// Die Klasse CoSWbemMethod stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemMethod, dargestellt von
// CoClass SWbemMethod, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemMethod = class
    class function Create: ISWbemMethod;
    class function CreateRemote(const MachineName: string): ISWbemMethod;
  end;

// *********************************************************************//
// Die Klasse CoSWbemMethodSet stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemMethodSet, dargestellt von
// CoClass SWbemMethodSet, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemMethodSet = class
    class function Create: ISWbemMethodSet;
    class function CreateRemote(const MachineName: string): ISWbemMethodSet;
  end;

// *********************************************************************//
// Die Klasse CoSWbemEventSource stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemEventSource, dargestellt von
// CoClass SWbemEventSource, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemEventSource = class
    class function Create: ISWbemEventSource;
    class function CreateRemote(const MachineName: string): ISWbemEventSource;
  end;

// *********************************************************************//
// Die Klasse CoSWbemSecurity stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemSecurity, dargestellt von
// CoClass SWbemSecurity, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemSecurity = class
    class function Create: ISWbemSecurity;
    class function CreateRemote(const MachineName: string): ISWbemSecurity;
  end;

// *********************************************************************//
// Die Klasse CoSWbemPrivilege stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemPrivilege, dargestellt von
// CoClass SWbemPrivilege, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemPrivilege = class
    class function Create: ISWbemPrivilege;
    class function CreateRemote(const MachineName: string): ISWbemPrivilege;
  end;

// *********************************************************************//
// Die Klasse CoSWbemPrivilegeSet stellt die Methoden Create und CreateRemote zur      
// Verfügung, um Instanzen der Standardschnittstelle ISWbemPrivilegeSet, dargestellt von
// CoClass SWbemPrivilegeSet, zu erzeugen. Diese Funktionen können                     
// von einem Client verwendet werden, der die CoClasses automatisieren    
// möchte, die von dieser Typbibliothek dargestellt werden.               
// *********************************************************************//
  CoSWbemPrivilegeSet = class
    class function Create: ISWbemPrivilegeSet;
    class function CreateRemote(const MachineName: string): ISWbemPrivilegeSet;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

class function CoSWbemLocator.Create: ISWbemLocator;
begin
  Result := CreateComObject(CLASS_SWbemLocator) as ISWbemLocator;
end;

class function CoSWbemLocator.CreateRemote(const MachineName: string): ISWbemLocator;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemLocator) as ISWbemLocator;
end;

procedure TSWbemLocator.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{76A64158-CB41-11D1-8B02-00600806D9B6}';
    IntfIID:   '{76A6415B-CB41-11D1-8B02-00600806D9B6}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSWbemLocator.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ISWbemLocator;
  end;
end;

procedure TSWbemLocator.ConnectTo(svrIntf: ISWbemLocator);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSWbemLocator.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSWbemLocator.GetDefaultInterface: ISWbemLocator;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface ist NULL. Die Komponente ist nicht mit dem Server verbunden. Sie müssen vor dieser Operation ''Connect'' oder ''ConnectTo'' aufrufen');
  Result := FIntf;
end;

constructor TSWbemLocator.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSWbemLocatorProperties.Create(Self);
{$ENDIF}
end;

destructor TSWbemLocator.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSWbemLocator.GetServerProperties: TSWbemLocatorProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TSWbemLocator.Get_Security_: ISWbemSecurity;
begin
    Result := DefaultInterface.Security_;
end;

function TSWbemLocator.ConnectServer(const strServer: WideString; const strNamespace: WideString; 
                                     const strUser: WideString; const strPassword: WideString; 
                                     const strLocale: WideString; const strAuthority: WideString; 
                                     iSecurityFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemServices;
begin
  Result := DefaultInterface.ConnectServer(strServer, strNamespace, strUser, strPassword, 
                                           strLocale, strAuthority, iSecurityFlags, 
                                           objWbemNamedValueSet);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSWbemLocatorProperties.Create(AServer: TSWbemLocator);
begin
  inherited Create;
  FServer := AServer;
end;

function TSWbemLocatorProperties.GetDefaultInterface: ISWbemLocator;
begin
  Result := FServer.DefaultInterface;
end;

function TSWbemLocatorProperties.Get_Security_: ISWbemSecurity;
begin
    Result := DefaultInterface.Security_;
end;

{$ENDIF}

class function CoSWbemNamedValueSet.Create: ISWbemNamedValueSet;
begin
  Result := CreateComObject(CLASS_SWbemNamedValueSet) as ISWbemNamedValueSet;
end;

class function CoSWbemNamedValueSet.CreateRemote(const MachineName: string): ISWbemNamedValueSet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemNamedValueSet) as ISWbemNamedValueSet;
end;

procedure TSWbemNamedValueSet.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{9AED384E-CE8B-11D1-8B05-00600806D9B6}';
    IntfIID:   '{CF2376EA-CE8C-11D1-8B05-00600806D9B6}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSWbemNamedValueSet.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ISWbemNamedValueSet;
  end;
end;

procedure TSWbemNamedValueSet.ConnectTo(svrIntf: ISWbemNamedValueSet);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSWbemNamedValueSet.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSWbemNamedValueSet.GetDefaultInterface: ISWbemNamedValueSet;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface ist NULL. Die Komponente ist nicht mit dem Server verbunden. Sie müssen vor dieser Operation ''Connect'' oder ''ConnectTo'' aufrufen');
  Result := FIntf;
end;

constructor TSWbemNamedValueSet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSWbemNamedValueSetProperties.Create(Self);
{$ENDIF}
end;

destructor TSWbemNamedValueSet.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSWbemNamedValueSet.GetServerProperties: TSWbemNamedValueSetProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TSWbemNamedValueSet.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

function TSWbemNamedValueSet.Item(const strName: WideString; iFlags: Integer): ISWbemNamedValue;
begin
  Result := DefaultInterface.Item(strName, iFlags);
end;

function TSWbemNamedValueSet.Add(const strName: WideString; var varValue: OleVariant; 
                                 iFlags: Integer): ISWbemNamedValue;
begin
  Result := DefaultInterface.Add(strName, varValue, iFlags);
end;

procedure TSWbemNamedValueSet.Remove(const strName: WideString; iFlags: Integer);
begin
  DefaultInterface.Remove(strName, iFlags);
end;

function TSWbemNamedValueSet.Clone: ISWbemNamedValueSet;
begin
  Result := DefaultInterface.Clone;
end;

procedure TSWbemNamedValueSet.DeleteAll;
begin
  DefaultInterface.DeleteAll;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSWbemNamedValueSetProperties.Create(AServer: TSWbemNamedValueSet);
begin
  inherited Create;
  FServer := AServer;
end;

function TSWbemNamedValueSetProperties.GetDefaultInterface: ISWbemNamedValueSet;
begin
  Result := FServer.DefaultInterface;
end;

function TSWbemNamedValueSetProperties.Get_Count: Integer;
begin
    Result := DefaultInterface.Count;
end;

{$ENDIF}

class function CoSWbemObjectPath.Create: ISWbemObjectPath;
begin
  Result := CreateComObject(CLASS_SWbemObjectPath) as ISWbemObjectPath;
end;

class function CoSWbemObjectPath.CreateRemote(const MachineName: string): ISWbemObjectPath;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemObjectPath) as ISWbemObjectPath;
end;

procedure TSWbemObjectPath.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{5791BC26-CE9C-11D1-97BF-0000F81E849C}';
    IntfIID:   '{5791BC27-CE9C-11D1-97BF-0000F81E849C}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSWbemObjectPath.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ISWbemObjectPath;
  end;
end;

procedure TSWbemObjectPath.ConnectTo(svrIntf: ISWbemObjectPath);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSWbemObjectPath.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSWbemObjectPath.GetDefaultInterface: ISWbemObjectPath;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface ist NULL. Die Komponente ist nicht mit dem Server verbunden. Sie müssen vor dieser Operation ''Connect'' oder ''ConnectTo'' aufrufen');
  Result := FIntf;
end;

constructor TSWbemObjectPath.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSWbemObjectPathProperties.Create(Self);
{$ENDIF}
end;

destructor TSWbemObjectPath.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSWbemObjectPath.GetServerProperties: TSWbemObjectPathProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TSWbemObjectPath.Get_Path: WideString;
begin
    Result := DefaultInterface.Path;
end;

procedure TSWbemObjectPath.Set_Path(const strPath: WideString);
  { Warnung: Die Eigenschaft Path hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Path := strPath;
end;

function TSWbemObjectPath.Get_RelPath: WideString;
begin
    Result := DefaultInterface.RelPath;
end;

procedure TSWbemObjectPath.Set_RelPath(const strRelPath: WideString);
  { Warnung: Die Eigenschaft RelPath hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.RelPath := strRelPath;
end;

function TSWbemObjectPath.Get_Server: WideString;
begin
    Result := DefaultInterface.Server;
end;

procedure TSWbemObjectPath.Set_Server(const strServer: WideString);
  { Warnung: Die Eigenschaft Server hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Server := strServer;
end;

function TSWbemObjectPath.Get_Namespace: WideString;
begin
    Result := DefaultInterface.Namespace;
end;

procedure TSWbemObjectPath.Set_Namespace(const strNamespace: WideString);
  { Warnung: Die Eigenschaft Namespace hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Namespace := strNamespace;
end;

function TSWbemObjectPath.Get_ParentNamespace: WideString;
begin
    Result := DefaultInterface.ParentNamespace;
end;

function TSWbemObjectPath.Get_DisplayName: WideString;
begin
    Result := DefaultInterface.DisplayName;
end;

procedure TSWbemObjectPath.Set_DisplayName(const strDisplayName: WideString);
  { Warnung: Die Eigenschaft DisplayName hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.DisplayName := strDisplayName;
end;

function TSWbemObjectPath.Get_Class_: WideString;
begin
    Result := DefaultInterface.Class_;
end;

procedure TSWbemObjectPath.Set_Class_(const strClass: WideString);
  { Warnung: Die Eigenschaft Class_ hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Class_ := strClass;
end;

function TSWbemObjectPath.Get_IsClass: WordBool;
begin
    Result := DefaultInterface.IsClass;
end;

function TSWbemObjectPath.Get_IsSingleton: WordBool;
begin
    Result := DefaultInterface.IsSingleton;
end;

function TSWbemObjectPath.Get_Keys: ISWbemNamedValueSet;
begin
    Result := DefaultInterface.Keys;
end;

function TSWbemObjectPath.Get_Security_: ISWbemSecurity;
begin
    Result := DefaultInterface.Security_;
end;

function TSWbemObjectPath.Get_Locale: WideString;
begin
    Result := DefaultInterface.Locale;
end;

procedure TSWbemObjectPath.Set_Locale(const strLocale: WideString);
  { Warnung: Die Eigenschaft Locale hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Locale := strLocale;
end;

function TSWbemObjectPath.Get_Authority: WideString;
begin
    Result := DefaultInterface.Authority;
end;

procedure TSWbemObjectPath.Set_Authority(const strAuthority: WideString);
  { Warnung: Die Eigenschaft Authority hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Authority := strAuthority;
end;

procedure TSWbemObjectPath.SetAsClass;
begin
  DefaultInterface.SetAsClass;
end;

procedure TSWbemObjectPath.SetAsSingleton;
begin
  DefaultInterface.SetAsSingleton;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSWbemObjectPathProperties.Create(AServer: TSWbemObjectPath);
begin
  inherited Create;
  FServer := AServer;
end;

function TSWbemObjectPathProperties.GetDefaultInterface: ISWbemObjectPath;
begin
  Result := FServer.DefaultInterface;
end;

function TSWbemObjectPathProperties.Get_Path: WideString;
begin
    Result := DefaultInterface.Path;
end;

procedure TSWbemObjectPathProperties.Set_Path(const strPath: WideString);
  { Warnung: Die Eigenschaft Path hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Path := strPath;
end;

function TSWbemObjectPathProperties.Get_RelPath: WideString;
begin
    Result := DefaultInterface.RelPath;
end;

procedure TSWbemObjectPathProperties.Set_RelPath(const strRelPath: WideString);
  { Warnung: Die Eigenschaft RelPath hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.RelPath := strRelPath;
end;

function TSWbemObjectPathProperties.Get_Server: WideString;
begin
    Result := DefaultInterface.Server;
end;

procedure TSWbemObjectPathProperties.Set_Server(const strServer: WideString);
  { Warnung: Die Eigenschaft Server hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Server := strServer;
end;

function TSWbemObjectPathProperties.Get_Namespace: WideString;
begin
    Result := DefaultInterface.Namespace;
end;

procedure TSWbemObjectPathProperties.Set_Namespace(const strNamespace: WideString);
  { Warnung: Die Eigenschaft Namespace hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Namespace := strNamespace;
end;

function TSWbemObjectPathProperties.Get_ParentNamespace: WideString;
begin
    Result := DefaultInterface.ParentNamespace;
end;

function TSWbemObjectPathProperties.Get_DisplayName: WideString;
begin
    Result := DefaultInterface.DisplayName;
end;

procedure TSWbemObjectPathProperties.Set_DisplayName(const strDisplayName: WideString);
  { Warnung: Die Eigenschaft DisplayName hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.DisplayName := strDisplayName;
end;

function TSWbemObjectPathProperties.Get_Class_: WideString;
begin
    Result := DefaultInterface.Class_;
end;

procedure TSWbemObjectPathProperties.Set_Class_(const strClass: WideString);
  { Warnung: Die Eigenschaft Class_ hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Class_ := strClass;
end;

function TSWbemObjectPathProperties.Get_IsClass: WordBool;
begin
    Result := DefaultInterface.IsClass;
end;

function TSWbemObjectPathProperties.Get_IsSingleton: WordBool;
begin
    Result := DefaultInterface.IsSingleton;
end;

function TSWbemObjectPathProperties.Get_Keys: ISWbemNamedValueSet;
begin
    Result := DefaultInterface.Keys;
end;

function TSWbemObjectPathProperties.Get_Security_: ISWbemSecurity;
begin
    Result := DefaultInterface.Security_;
end;

function TSWbemObjectPathProperties.Get_Locale: WideString;
begin
    Result := DefaultInterface.Locale;
end;

procedure TSWbemObjectPathProperties.Set_Locale(const strLocale: WideString);
  { Warnung: Die Eigenschaft Locale hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Locale := strLocale;
end;

function TSWbemObjectPathProperties.Get_Authority: WideString;
begin
    Result := DefaultInterface.Authority;
end;

procedure TSWbemObjectPathProperties.Set_Authority(const strAuthority: WideString);
  { Warnung: Die Eigenschaft Authority hat eine Zuweisungs- und eine Zugriffsmethode, deren
  Typen nicht übereinstimmen. Delphi konnte keine Eigenschaft dieser Art
  erzeugen. Daher wird eine Variante zum Setzen der Eigenschaft verwendet. }
var
  InterfaceVariant: OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  InterfaceVariant.Authority := strAuthority;
end;

{$ENDIF}

class function CoSWbemLastError.Create: ISWbemLastError;
begin
  Result := CreateComObject(CLASS_SWbemLastError) as ISWbemLastError;
end;

class function CoSWbemLastError.CreateRemote(const MachineName: string): ISWbemLastError;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemLastError) as ISWbemLastError;
end;

procedure TSWbemLastError.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{C2FEEEAC-CFCD-11D1-8B05-00600806D9B6}';
    IntfIID:   '{D962DB84-D4BB-11D1-8B09-00600806D9B6}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSWbemLastError.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as ISWbemLastError;
  end;
end;

procedure TSWbemLastError.ConnectTo(svrIntf: ISWbemLastError);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TSWbemLastError.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TSWbemLastError.GetDefaultInterface: ISWbemLastError;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface ist NULL. Die Komponente ist nicht mit dem Server verbunden. Sie müssen vor dieser Operation ''Connect'' oder ''ConnectTo'' aufrufen');
  Result := FIntf;
end;

constructor TSWbemLastError.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSWbemLastErrorProperties.Create(Self);
{$ENDIF}
end;

destructor TSWbemLastError.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSWbemLastError.GetServerProperties: TSWbemLastErrorProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TSWbemLastError.Get_Qualifiers_: ISWbemQualifierSet;
begin
    Result := DefaultInterface.Qualifiers_;
end;

function TSWbemLastError.Get_Properties_: ISWbemPropertySet;
begin
    Result := DefaultInterface.Properties_;
end;

function TSWbemLastError.Get_Methods_: ISWbemMethodSet;
begin
    Result := DefaultInterface.Methods_;
end;

function TSWbemLastError.Get_Derivation_: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Derivation_;
end;

function TSWbemLastError.Get_Path_: ISWbemObjectPath;
begin
    Result := DefaultInterface.Path_;
end;

function TSWbemLastError.Get_Security_: ISWbemSecurity;
begin
    Result := DefaultInterface.Security_;
end;

function TSWbemLastError.Put_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectPath;
begin
  Result := DefaultInterface.Put_(iFlags, objWbemNamedValueSet);
end;

procedure TSWbemLastError.PutAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                                    const objWbemNamedValueSet: IDispatch; 
                                    const objWbemAsyncContext: IDispatch);
begin
  DefaultInterface.PutAsync_(objWbemSink, iFlags, objWbemNamedValueSet, objWbemAsyncContext);
end;

procedure TSWbemLastError.Delete_(iFlags: Integer; const objWbemNamedValueSet: IDispatch);
begin
  DefaultInterface.Delete_(iFlags, objWbemNamedValueSet);
end;

procedure TSWbemLastError.DeleteAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                                       const objWbemNamedValueSet: IDispatch; 
                                       const objWbemAsyncContext: IDispatch);
begin
  DefaultInterface.DeleteAsync_(objWbemSink, iFlags, objWbemNamedValueSet, objWbemAsyncContext);
end;

function TSWbemLastError.Instances_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectSet;
begin
  Result := DefaultInterface.Instances_(iFlags, objWbemNamedValueSet);
end;

procedure TSWbemLastError.InstancesAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                                          const objWbemNamedValueSet: IDispatch; 
                                          const objWbemAsyncContext: IDispatch);
begin
  DefaultInterface.InstancesAsync_(objWbemSink, iFlags, objWbemNamedValueSet, objWbemAsyncContext);
end;

function TSWbemLastError.Subclasses_(iFlags: Integer; const objWbemNamedValueSet: IDispatch): ISWbemObjectSet;
begin
  Result := DefaultInterface.Subclasses_(iFlags, objWbemNamedValueSet);
end;

procedure TSWbemLastError.SubclassesAsync_(const objWbemSink: IDispatch; iFlags: Integer; 
                                           const objWbemNamedValueSet: IDispatch; 
                                           const objWbemAsyncContext: IDispatch);
begin
  DefaultInterface.SubclassesAsync_(objWbemSink, iFlags, objWbemNamedValueSet, objWbemAsyncContext);
end;

function TSWbemLastError.Associators_(const strAssocClass: WideString; 
                                      const strResultClass: WideString; 
                                      const strResultRole: WideString; const strRole: WideString; 
                                      bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                                      const strRequiredAssocQualifier: WideString; 
                                      const strRequiredQualifier: WideString; iFlags: Integer; 
                                      const objWbemNamedValueSet: IDispatch): ISWbemObjectSet;
begin
  Result := DefaultInterface.Associators_(strAssocClass, strResultClass, strResultRole, strRole, 
                                          bClassesOnly, bSchemaOnly, strRequiredAssocQualifier, 
                                          strRequiredQualifier, iFlags, objWbemNamedValueSet);
end;

procedure TSWbemLastError.AssociatorsAsync_(const objWbemSink: IDispatch; 
                                            const strAssocClass: WideString; 
                                            const strResultClass: WideString; 
                                            const strResultRole: WideString; 
                                            const strRole: WideString; bClassesOnly: WordBool; 
                                            bSchemaOnly: WordBool; 
                                            const strRequiredAssocQualifier: WideString; 
                                            const strRequiredQualifier: WideString; 
                                            iFlags: Integer; const objWbemNamedValueSet: IDispatch; 
                                            const objWbemAsyncContext: IDispatch);
begin
  DefaultInterface.AssociatorsAsync_(objWbemSink, strAssocClass, strResultClass, strResultRole, 
                                     strRole, bClassesOnly, bSchemaOnly, strRequiredAssocQualifier, 
                                     strRequiredQualifier, iFlags, objWbemNamedValueSet, 
                                     objWbemAsyncContext);
end;

function TSWbemLastError.References_(const strResultClass: WideString; const strRole: WideString; 
                                     bClassesOnly: WordBool; bSchemaOnly: WordBool; 
                                     const strRequiredQualifier: WideString; iFlags: Integer; 
                                     const objWbemNamedValueSet: IDispatch): ISWbemObjectSet;
begin
  Result := DefaultInterface.References_(strResultClass, strRole, bClassesOnly, bSchemaOnly, 
                                         strRequiredQualifier, iFlags, objWbemNamedValueSet);
end;

procedure TSWbemLastError.ReferencesAsync_(const objWbemSink: IDispatch; 
                                           const strResultClass: WideString; 
                                           const strRole: WideString; bClassesOnly: WordBool; 
                                           bSchemaOnly: WordBool; 
                                           const strRequiredQualifier: WideString; iFlags: Integer; 
                                           const objWbemNamedValueSet: IDispatch; 
                                           const objWbemAsyncContext: IDispatch);
begin
  DefaultInterface.ReferencesAsync_(objWbemSink, strResultClass, strRole, bClassesOnly, 
                                    bSchemaOnly, strRequiredQualifier, iFlags, 
                                    objWbemNamedValueSet, objWbemAsyncContext);
end;

function TSWbemLastError.ExecMethod_(const strMethodName: WideString; 
                                     const objWbemInParameters: IDispatch; iFlags: Integer; 
                                     const objWbemNamedValueSet: IDispatch): ISWbemObject;
begin
  Result := DefaultInterface.ExecMethod_(strMethodName, objWbemInParameters, iFlags, 
                                         objWbemNamedValueSet);
end;

procedure TSWbemLastError.ExecMethodAsync_(const objWbemSink: IDispatch; 
                                           const strMethodName: WideString; 
                                           const objWbemInParameters: IDispatch; iFlags: Integer; 
                                           const objWbemNamedValueSet: IDispatch; 
                                           const objWbemAsyncContext: IDispatch);
begin
  DefaultInterface.ExecMethodAsync_(objWbemSink, strMethodName, objWbemInParameters, iFlags, 
                                    objWbemNamedValueSet, objWbemAsyncContext);
end;

function TSWbemLastError.Clone_: ISWbemObject;
begin
  Result := DefaultInterface.Clone_;
end;

function TSWbemLastError.GetObjectText_(iFlags: Integer): WideString;
begin
  Result := DefaultInterface.GetObjectText_(iFlags);
end;

function TSWbemLastError.SpawnDerivedClass_(iFlags: Integer): ISWbemObject;
begin
  Result := DefaultInterface.SpawnDerivedClass_(iFlags);
end;

function TSWbemLastError.SpawnInstance_(iFlags: Integer): ISWbemObject;
begin
  Result := DefaultInterface.SpawnInstance_(iFlags);
end;

function TSWbemLastError.CompareTo_(const objWbemObject: IDispatch; iFlags: Integer): WordBool;
begin
  Result := DefaultInterface.CompareTo_(objWbemObject, iFlags);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSWbemLastErrorProperties.Create(AServer: TSWbemLastError);
begin
  inherited Create;
  FServer := AServer;
end;

function TSWbemLastErrorProperties.GetDefaultInterface: ISWbemLastError;
begin
  Result := FServer.DefaultInterface;
end;

function TSWbemLastErrorProperties.Get_Qualifiers_: ISWbemQualifierSet;
begin
    Result := DefaultInterface.Qualifiers_;
end;

function TSWbemLastErrorProperties.Get_Properties_: ISWbemPropertySet;
begin
    Result := DefaultInterface.Properties_;
end;

function TSWbemLastErrorProperties.Get_Methods_: ISWbemMethodSet;
begin
    Result := DefaultInterface.Methods_;
end;

function TSWbemLastErrorProperties.Get_Derivation_: OleVariant;
var
  InterfaceVariant : OleVariant;
begin
  InterfaceVariant := DefaultInterface;
  Result := InterfaceVariant.Derivation_;
end;

function TSWbemLastErrorProperties.Get_Path_: ISWbemObjectPath;
begin
    Result := DefaultInterface.Path_;
end;

function TSWbemLastErrorProperties.Get_Security_: ISWbemSecurity;
begin
    Result := DefaultInterface.Security_;
end;

{$ENDIF}

class function CoSWbemSink.Create: ISWbemSink;
begin
  Result := CreateComObject(CLASS_SWbemSink) as ISWbemSink;
end;

class function CoSWbemSink.CreateRemote(const MachineName: string): ISWbemSink;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemSink) as ISWbemSink;
end;

procedure TSWbemSink.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{75718C9A-F029-11D1-A1AC-00C04FB6C223}';
    IntfIID:   '{75718C9F-F029-11D1-A1AC-00C04FB6C223}';
    EventIID:  '{75718CA0-F029-11D1-A1AC-00C04FB6C223}';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TSWbemSink.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    ConnectEvents(punk);
    Fintf:= punk as ISWbemSink;
  end;
end;

procedure TSWbemSink.ConnectTo(svrIntf: ISWbemSink);
begin
  Disconnect;
  FIntf := svrIntf;
  ConnectEvents(FIntf);
end;

procedure TSWbemSink.DisConnect;
begin
  if Fintf <> nil then
  begin
    DisconnectEvents(FIntf);
    FIntf := nil;
  end;
end;

function TSWbemSink.GetDefaultInterface: ISWbemSink;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface ist NULL. Die Komponente ist nicht mit dem Server verbunden. Sie müssen vor dieser Operation ''Connect'' oder ''ConnectTo'' aufrufen');
  Result := FIntf;
end;

constructor TSWbemSink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TSWbemSinkProperties.Create(Self);
{$ENDIF}
end;

destructor TSWbemSink.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TSWbemSink.GetServerProperties: TSWbemSinkProperties;
begin
  Result := FProps;
end;
{$ENDIF}

procedure TSWbemSink.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  case DispID of
    -1: Exit;  // DISPID_UNKNOWN
   1: if Assigned(FOnObjectReady) then
            FOnObjectReady(Self, Params[1] {const ISWbemNamedValueSet}, Params[0] {const ISWbemObject});
   2: if Assigned(FOnCompleted) then
            FOnCompleted(Self, Params[2] {const ISWbemNamedValueSet}, Params[1] {const ISWbemObject}, Params[0] {WbemErrorEnum});
   3: if Assigned(FOnProgress) then
            FOnProgress(Self, Params[3] {const ISWbemNamedValueSet}, Params[2] {const WideString}, Params[1] {Integer}, Params[0] {Integer});
   4: if Assigned(FOnObjectPut) then
            FOnObjectPut(Self, Params[1] {const ISWbemNamedValueSet}, Params[0] {const ISWbemObjectPath});
  end; {case DispID}
end;

procedure TSWbemSink.Cancel;
begin
  DefaultInterface.Cancel;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TSWbemSinkProperties.Create(AServer: TSWbemSink);
begin
  inherited Create;
  FServer := AServer;
end;

function TSWbemSinkProperties.GetDefaultInterface: ISWbemSink;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoSWbemServices.Create: ISWbemServices;
begin
  Result := CreateComObject(CLASS_SWbemServices) as ISWbemServices;
end;

class function CoSWbemServices.CreateRemote(const MachineName: string): ISWbemServices;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemServices) as ISWbemServices;
end;

class function CoSWbemObject.Create: ISWbemObject;
begin
  Result := CreateComObject(CLASS_SWbemObject) as ISWbemObject;
end;

class function CoSWbemObject.CreateRemote(const MachineName: string): ISWbemObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemObject) as ISWbemObject;
end;

class function CoSWbemObjectSet.Create: ISWbemObjectSet;
begin
  Result := CreateComObject(CLASS_SWbemObjectSet) as ISWbemObjectSet;
end;

class function CoSWbemObjectSet.CreateRemote(const MachineName: string): ISWbemObjectSet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemObjectSet) as ISWbemObjectSet;
end;

class function CoSWbemNamedValue.Create: ISWbemNamedValue;
begin
  Result := CreateComObject(CLASS_SWbemNamedValue) as ISWbemNamedValue;
end;

class function CoSWbemNamedValue.CreateRemote(const MachineName: string): ISWbemNamedValue;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemNamedValue) as ISWbemNamedValue;
end;

class function CoSWbemQualifier.Create: ISWbemQualifier;
begin
  Result := CreateComObject(CLASS_SWbemQualifier) as ISWbemQualifier;
end;

class function CoSWbemQualifier.CreateRemote(const MachineName: string): ISWbemQualifier;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemQualifier) as ISWbemQualifier;
end;

class function CoSWbemQualifierSet.Create: ISWbemQualifierSet;
begin
  Result := CreateComObject(CLASS_SWbemQualifierSet) as ISWbemQualifierSet;
end;

class function CoSWbemQualifierSet.CreateRemote(const MachineName: string): ISWbemQualifierSet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemQualifierSet) as ISWbemQualifierSet;
end;

class function CoSWbemProperty.Create: ISWbemProperty;
begin
  Result := CreateComObject(CLASS_SWbemProperty) as ISWbemProperty;
end;

class function CoSWbemProperty.CreateRemote(const MachineName: string): ISWbemProperty;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemProperty) as ISWbemProperty;
end;

class function CoSWbemPropertySet.Create: ISWbemPropertySet;
begin
  Result := CreateComObject(CLASS_SWbemPropertySet) as ISWbemPropertySet;
end;

class function CoSWbemPropertySet.CreateRemote(const MachineName: string): ISWbemPropertySet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemPropertySet) as ISWbemPropertySet;
end;

class function CoSWbemMethod.Create: ISWbemMethod;
begin
  Result := CreateComObject(CLASS_SWbemMethod) as ISWbemMethod;
end;

class function CoSWbemMethod.CreateRemote(const MachineName: string): ISWbemMethod;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemMethod) as ISWbemMethod;
end;

class function CoSWbemMethodSet.Create: ISWbemMethodSet;
begin
  Result := CreateComObject(CLASS_SWbemMethodSet) as ISWbemMethodSet;
end;

class function CoSWbemMethodSet.CreateRemote(const MachineName: string): ISWbemMethodSet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemMethodSet) as ISWbemMethodSet;
end;

class function CoSWbemEventSource.Create: ISWbemEventSource;
begin
  Result := CreateComObject(CLASS_SWbemEventSource) as ISWbemEventSource;
end;

class function CoSWbemEventSource.CreateRemote(const MachineName: string): ISWbemEventSource;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemEventSource) as ISWbemEventSource;
end;

class function CoSWbemSecurity.Create: ISWbemSecurity;
begin
  Result := CreateComObject(CLASS_SWbemSecurity) as ISWbemSecurity;
end;

class function CoSWbemSecurity.CreateRemote(const MachineName: string): ISWbemSecurity;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemSecurity) as ISWbemSecurity;
end;

class function CoSWbemPrivilege.Create: ISWbemPrivilege;
begin
  Result := CreateComObject(CLASS_SWbemPrivilege) as ISWbemPrivilege;
end;

class function CoSWbemPrivilege.CreateRemote(const MachineName: string): ISWbemPrivilege;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemPrivilege) as ISWbemPrivilege;
end;

class function CoSWbemPrivilegeSet.Create: ISWbemPrivilegeSet;
begin
  Result := CreateComObject(CLASS_SWbemPrivilegeSet) as ISWbemPrivilegeSet;
end;

class function CoSWbemPrivilegeSet.CreateRemote(const MachineName: string): ISWbemPrivilegeSet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SWbemPrivilegeSet) as ISWbemPrivilegeSet;
end;

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TSWbemLocator, TSWbemNamedValueSet, TSWbemObjectPath, TSWbemLastError, 
    TSWbemSink]);
end;

end.
