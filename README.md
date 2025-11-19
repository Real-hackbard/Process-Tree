# Process-Tree:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) : ![WbemScripting_TLB](https://github.com/user-attachments/assets/ee2b0a49-ea51-4912-88cb-d80edd2dd6db)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) &nbsp;&nbsp;: ![Process Tree](https://github.com/user-attachments/assets/37d619c1-ffb3-488e-ac76-29db0e9fee9a)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) &nbsp;: ![112025](https://github.com/user-attachments/assets/6c049038-ad2c-4fe3-9b7e-1ca8154910c2)  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)

</br>


A process is a program in execution, and an integral part of any modern-day [operating system](https://en.wikipedia.org/wiki/Operating_system) (OS). The OS must allocate resources to processes, enable [processes](https://en.wikipedia.org/wiki/Process_(computing)) to share and exchange information, protect the resources of each process from other processes and enable synchronization among processes. To meet these requirements, The OS must maintain a [data structure](https://en.wikipedia.org/wiki/Data_structure) for each process, which describes the state and resource ownership of that process, and which enables the operating system to exert control over each process.

</br>

![Process Tree](https://github.com/user-attachments/assets/0824ce2d-d98d-46b1-8e3b-43ca7e1eab78)

</br>

In any modern operating system, there can be more than one instance of a program loaded in memory at the same time. For example, more than one user can be executing the same program, with each user having separate copies of the program loaded into memory. With some programs, it is possible to have one copy loaded into memory, while several users have shared access to it so that they can each execute the same program-code. Such a program is called [re-entrant](https://en.wikipedia.org/wiki/Reentrancy_(computing)). At a given instant, the processor can only be executing one instruction from one program, but several processes can be sustained over a period of time by assigning each process to the [processor](https://en.wikipedia.org/wiki/Central_processing_unit) at intervals while the remainder become temporarily inactive. The execution of multiple processes over a period of time, rather than simultaneously, is known as concurrent execution.

A [multiprogramming](https://en.wikipedia.org/wiki/Computer_multitasking#Multiprogramming) or [multitasking](https://en.wikipedia.org/wiki/Computer_multitasking) O.S. is a Operating System that can execute many processes concurrently. Multiprogramming requires that the processor be allocated to each process for a period of time and de-allocated or issued at an appropriate moment. If the processor is de-allocated during the execution of a process, it must be done in a way that the process can restart later as efficiently as possible.

There are two ways for an OS to regain control of the processor during a program's execution in order for the OS to perform de-allocation or allocation:

* The process issues a [system call](https://en.wikipedia.org/wiki/System_call) (sometimes called a software [interrupt](https://en.wikipedia.org/wiki/Interrupt); for example, an I/O request occurs requesting to access a file on a hard disk.
* A hardware interrupt occurs; for example, a key was pressed on the keyboard, or a timer runs out (used in [preemptive multitasking](https://en.wikipedia.org/wiki/Preemption_(computing))).

The stopping of one process and starting (or restarting) of another process is called a [context switch](https://en.wikipedia.org/wiki/Context_switch) or context change. In many modern operating systems, processes can consist of many sub-processes. This introduces the concept of a [thread](https://en.wikipedia.org/wiki/Thread_(computing)). A thread may be viewed as a sub-process; that is, a separate, independent sequence of execution within the code of one process. Threads are becoming increasingly important in the design of distributed and [client–server](https://en.wikipedia.org/wiki/Client%E2%80%93server_model) systems and in software run on [multi-processor](https://en.wikipedia.org/wiki/Parallel_computing) systems.

# Process:
In [computing](https://en.wikipedia.org/wiki/Computing), a process is the [instance](https://en.wikipedia.org/wiki/Instance_(computer_science)) of a [computer program](https://en.wikipedia.org/wiki/Computer_program) that is being executed by one or many threads. There are many different process models, some of which are light weight, but almost all processes (even entire [virtual machines](https://en.wikipedia.org/wiki/Virtual_machine)) are rooted in an [operating system](https://en.wikipedia.org/wiki/Operating_system) (OS) process which comprises the program code, assigned system resources, physical and logical access permissions, and data structures to initiate, control and coordinate execution activity. Depending on the OS, a process may be made up of multiple threads of execution that execute instructions [concurrently](https://en.wikipedia.org/wiki/Concurrency_(computer_science)).

</br>

![Process_vs _Thread](https://github.com/user-attachments/assets/1a656589-6968-4064-8539-2d41704b9716)

</br>

In general, a computer system process consists of (or is said to own) the following resources:

* An image of the executable [machine code](https://en.wikipedia.org/wiki/Machine_code) associated with a program.
* Memory (typically some region of [virtual memory](https://en.wikipedia.org/wiki/Virtual_memory)); which includes the executable code, process-specific data (input and output), a [call stack](https://en.wikipedia.org/wiki/Call_stack) (to keep track of active [subroutines](https://en.wikipedia.org/wiki/Function_(computer_programming)#Jump_to_subroutine) and/or other events), and a [heap](https://en.wikipedia.org/wiki/Memory_management#HEAP) to hold intermediate computation data generated during run time.
* Operating system descriptors of resources that are allocated to the process, such as [file descriptors](https://en.wikipedia.org/wiki/File_descriptor) ([Unix](https://en.wikipedia.org/wiki/Unix) terminology) or [handles](https://en.wikipedia.org/wiki/Handle_(computing)) (Windows), and data sources and sinks.
* [Security](https://en.wikipedia.org/wiki/Computer_security) attributes, such as the process owner and the process' set of permissions (allowable operations).
* [Processor](https://en.wikipedia.org/wiki/Central_processing_unit) state ([context](https://en.wikipedia.org/wiki/Context_(computing))), such as the content of registers and physical memory addressing. The state is typically stored in computer [registers](https://en.wikipedia.org/wiki/Processor_register) when the process is executing, and in memory otherwise.

</br>

# Dump DOS Header:
The file can be identified by the ASCII string "MZ" (hexadecimal: 4D 5A) at the beginning of the file (the "[magic number](https://en.wikipedia.org/wiki/Magic_number_(programming))"). "MZ" are the initials of [Mark Zbikowski](https://en.wikipedia.org/wiki/Mark_Zbikowski), one of the leading developers of [MS-DOS](https://en.wikipedia.org/wiki/MS-DOS).

### Segment handling:
EXE files normally have separate segments for the code, data, and stack. Program execution begins at address 0 of the code segment, and the stack pointer register is set to whatever value is contained in the header information (thus if the header specifies a 512 byte stack, the stack pointer is set to 200h). It is possible to not use a separate stack segment and simply use the [code segment](https://en.wikipedia.org/wiki/Code_segment) for the stack if desired.

The DS ([data segment](https://en.wikipedia.org/wiki/Data_segment)) register normally contains the same value as the CS (code segment) register and is not loaded with the actual segment address of the data segment when an EXE file is initialized; it is necessary for the programmer to set it themselves, generally done via the following instructions:

```asm
    MOV AX, @DATA
    MOV DS, AX
```

### Termination:
In the original [DOS 1.x API](https://en.wikipedia.org/wiki/DOS_API), it was also necessary to have the CS register pointing to the segment with the PSP at program termination; this was done via the following instructions:

```asm
    PUSH DS
    XOR AX, AX
    PUSH AX
```

Program termination would then be performed by a RETF instruction, which would retrieve the original segment address with the PSP from the stack and then jump to address 0, which contained an INT 20h instruction.

The [DOS 2.x API](https://en.wikipedia.org/wiki/DOS_API) introduced a new program termination function, INT 21h Function 4Ch which does not require saving the PSP segment address at the start of the program, and Microsoft advised against the use of the older DOS 1.x method.

</br>

# PE-Executable Structure Information:
A PE file consists of several headers and sections that instruct the [dynamic linker](https://en.wikipedia.org/wiki/Dynamic_linker) about on how to map the file into memory. An executable image consists of several different regions, each requiring different [memory protection](https://en.wikipedia.org/wiki/Memory_protection) attributes. To ensure proper alignment, the start of each section must align to a page boundary.[8] For instance, the .text section, which contains program code, is typically mapped as an execute/read-only. Conversely, the .data section, which holds global variables, is mapped as no-execute/read write. However, to conserve space, sections are not aligned on disk in this manner. The dynamic linker maps each section to memory individually and assigns the correct permissions based on the information in the headers.

</br>

![Portable-executable-file-format](https://github.com/user-attachments/assets/bef8044b-47e5-4521-8894-91495132f38a)

</br>

# Process module:
Process module info generally refers to details about the executable files and dynamic link libraries (DLLs) loaded within a running process. This information can be retrieved using various programming APIs depending on the operating system or programming environment.

* The term "process module info" is often used in the context of:
    * Operating System APIs (Windows, Linux): For system management tools and debuggers to inspect other processes.
    * Details available: Module name, file name (full path), base address (memory location), entry point address, and memory size.
      * API examples:
      * Windows: Functions like EnumProcessModules, GetModuleInformation, and structures like ```MODULEINFO``` and ```RTL_PROCESS_MODULE_INFORMATION``` are used to access this data.
      * C# (.NET): The ```System.Diagnostics.ProcessModule``` class provides properties to access this information programmatically, such as ModuleName, FileName, and FileVersionInfo.

* Programming Language Specifics (Node.js, Java): The term can also refer to environment-specific functionality.
    * Node.js: The built-in process module provides information and control over the current Node.js runtime process, rather than other processes on the system.
    * Java (JPMS): In Java 9 and later, the module-info.java file defines a module's name, its dependencies (requires), and which packages it makes available (exports).
* Software Engineering (V-Modell XT): In process modeling, a "process module" defines encapsulated work products, activities, roles, and dependencies, which can be tailored for specific project needs. 

* Key Information Typically Included The specific information returned for a process module includes:
    * ModuleName: The name of the module (e.g., kernel32.dll, notepad.exe).
    * FileName: The full path to the executable or DLL file on disk.
    * BaseAddress: The memory address where the module is loaded in the process's virtual memory space.
    * ModuleMemorySize / SizeOfImage: The amount of static memory required to load the module's code and data.
    * EntryPointAddress: The initial instruction address for the module.
    * FileVersionInfo: Details like the version number, product name, and other metadata embedded in the file. 

</br>

![Process_Module](https://github.com/user-attachments/assets/a8016108-1c41-4fa3-a391-3520deb9101f)

</br>

In summary, "process module info" typically serves the purpose of inspecting the components and memory layout of an active application or system process.
