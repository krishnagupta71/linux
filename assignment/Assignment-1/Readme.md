# Assignment 1 - Discover VMX features 
Discover VMX features present in your processor by writing a Linux kernel module that queries these features. Create a Linux kernel module that will query various MSRs to determine virtualization features available in your CPU. This module will report (via the system message log) the features it discovers.

## Team Members: 
* Krishna Gupta - 015721199
* Shereen Punnassery - 015312128

## Q1. For each member in your team, provide 1 paragraph detailing what parts of the lab that member implemented/researched.

### Krishna Gupta (SJSU ID: 015721199)

* Setup the environment in Windows 11 using VMWare Workstation (30 day trail) and then installed Linux Ubuntu in the VM.
* Built a VM successfully and allocated 50GB storage and 8GB RAM to it. Also turned on nested virtualization for the VM.
* Downloaded and built the Linux Kernel modules and associated libraries to create a local copy of Linux Kernel.
* Discussed and researched about MSRs to be read in the SDM.
* Modified the cmpe283-1.c code by adding the custom logic to enable our system to read and give output for capabilities of the various MSRs. 
* Contribution also includes MSR code for controls- Primary and Secondary Procbased controls and discovering the VMX Features present in my processor (Intel) by writing a Linux kernel module that queries these features.
* Tested and verified the proper working of the functionality of code by comparing it with the sample output given to us. 

### Shereen Punnassery (SJSU ID: 015312128)

* Collaborate with team member to setup the environment in Windows OS using VMWare Workstation. 
* Tested the machine to check its capability for VMX virtualization and feature recognition. 
* Researched and discussed MSRs to be read in the SDM and contributed to the writing and execution of the code.
* Contribution also includes MSR code for controls- Entry and Exit controls and determining the availability of secondary procbased controls. 
* Verified the proper working of the functionality of code by comparing it with the sample output given to us.
* Updating the answers for the questions in the README.md file.

## Q2. Describe in detail the steps you used to complete the assignment. 

# Steps to complete Assignment 1:
1. Setup VM with Linux kernel build as in steps above
2. CD into the assignment files directory by using command <br> ```cd assignment/```
3. Compile the C file by using command <br> ```make```. This will create a *.ko file which can be confirmed by ```ls``` command.
4. Install the module into the kernel using the command ```sudo insmod cmpe283-1.ko```
5. See the output of the VMX features by printing the system log using ```dmesg```. Or save output in text file using ```dmesg > output.text```

# Output
```[22767.343417] cmpe283_1: loading out-of-tree module taints kernel.
[22767.343840] cmpe283_1: module verification failed: signature and/or required key missing - tainting kernel
[22767.345236] CMPE 283 Assignment 1 Module Start
[22767.345238] Pinbased Controls MSR: 0x3f00000016
[22767.345239]   External Interrupt Exiting: Can set=Yes, Can clear=Yes
[22767.345240]   NMI Exiting: Can set=Yes, Can clear=Yes
[22767.345240]   Virtual NMIs: Can set=Yes, Can clear=Yes
[22767.345254]   Activate VMX Preemption Timer: Can set=No, Can clear=Yes
[22767.345255]   Process Posted Interrupts: Can set=No, Can clear=Yes
[22767.345255] Primary Process based Controls MSR: 0xfff9fffe0401e172
[22767.345256]    Interrupt-window exiting: Can set=Yes, Can clear=Yes
[22767.345257]   Use TSC offsetting : Can set=Yes, Can clear=Yes
[22767.345257]   HLT exiting : Can set=Yes, Can clear=Yes
[22767.345258]   INVLPG exiting : Can set=Yes, Can clear=Yes
[22767.345258]   MWAIT exiting: Can set=Yes, Can clear=Yes
[22767.345259]   RDPMC exiting: Can set=Yes, Can clear=Yes
[22767.345259]   RDTSC exiting: Can set=Yes, Can clear=Yes
[22767.345260]   CR3-load exiting: Can set=Yes, Can clear=No
[22767.345260]   CR3-store exiting: Can set=Yes, Can clear=No
[22767.345261]   CR8-load exiting: Can set=Yes, Can clear=Yes
[22767.345261]   CR8-store exiting: Can set=Yes, Can clear=Yes
[22767.345262]   Use TPR shadow : Can set=Yes, Can clear=Yes
[22767.345262]   NMI-window exiting: Can set=Yes, Can clear=Yes
[22767.345262]   MOV-DR exiting: Can set=Yes, Can clear=Yes
[22767.345263]   Unconditional I/O exiting: Can set=Yes, Can clear=Yes
[22767.345264]   Use I/O bitmaps : Can set=Yes, Can clear=Yes
[22767.345264]   Monitor trap flag : Can set=Yes, Can clear=Yes
[22767.345264]   Use MSR bitmaps: Can set=Yes, Can clear=Yes
[22767.345265]   MONITOR exiting: Can set=Yes, Can clear=Yes
[22767.345266]   PAUSE exiting: Can set=Yes, Can clear=Yes
[22767.345266]   Activate secondary controls: Can set=Yes, Can clear=Yes
[22767.345267] Secondary Process based Controls MSR: 0x553cfe00000000
[22767.345268]   Virtualize APIC accesses: Can set=No, Can clear=Yes
[22767.345268]   Enable EPT : Can set=Yes, Can clear=Yes
[22767.345269]   Descriptor-table exiting: Can set=Yes, Can clear=Yes
[22767.345269]   Enable RDTSCP: Can set=Yes, Can clear=Yes
[22767.345270]   Virtualize x2APIC mode: Can set=Yes, Can clear=Yes
[22767.345270]   Enable VPID: Can set=Yes, Can clear=Yes
[22767.345271]   WBINVD exiting: Can set=Yes, Can clear=Yes
[22767.345271]   Unrestricted guest: Can set=Yes, Can clear=Yes
[22767.345272]   APIC-register virtualization: Can set=No, Can clear=Yes
[22767.345272]   Virtual-interrupt delivery: Can set=No, Can clear=Yes
[22767.345273]   PAUSE-loop exiting: Can set=Yes, Can clear=Yes
[22767.345273]   RDRAND exiting : Can set=Yes, Can clear=Yes
[22767.345273]   Enable INVPCID: Can set=Yes, Can clear=Yes
[22767.345274]   Enable VM functions: Can set=Yes, Can clear=Yes
[22767.345274]   VMCS shadowing: Can set=No, Can clear=Yes
[22767.345275]   Enable ENCLS exiting : Can set=No, Can clear=Yes
[22767.356136]   RDSEED exiting : Can set=Yes, Can clear=Yes
[22767.356140]   Enable PML: Can set=No, Can clear=Yes
[22767.356141]   EPT-violation #VE: Can set=Yes, Can clear=Yes
[22767.356141]   Conceal VMX non-root operation from Intel PT: Can set=No, Can clear=Yes
[22767.356142]   Enable XSAVES/XRSTORS: Can set=Yes, Can clear=Yes
[22767.356142]   Mode-based execution control for EPT: Can set=Yes, Can clear=Yes
[22767.356143]   Use TSC scaling: Can set=No, Can clear=Yes
[22767.356143]   Enable user wait and pause: Can set=No, Can clear=Yes
[22767.356144]    Enable ENCLV exiting: Can set=No, Can clear=Yes
[22767.356145] VM Entry based Controls MSR: 0xf3ff000011ff
[22767.356146]   Load debug controls: Can set=Yes, Can clear=No
[22767.356147]   IA-32e mode guest: Can set=Yes, Can clear=Yes
[22767.356147]   Entry to SMM: Can set=No, Can clear=Yes
[22767.356148]   Deactivate dual-monitor treatment : Can set=No, Can clear=Yes
[22767.356148]   Load IA32_PERF_GLOBAL_CTRL: Can set=Yes, Can clear=Yes
[22767.356149]   Load IA32_PAT: Can set=Yes, Can clear=Yes
[22767.356149]   Load IA32_EFER: Can set=Yes, Can clear=Yes
[22767.356150]   Load IA32_BNDCFGS: Can set=No, Can clear=Yes
[22767.356150]   Conceal VM entries from intel PT: Can set=No, Can clear=Yes
[22767.356151]   Load IA32_RTIT_CTL: Can set=No, Can clear=Yes
[22767.356151]   Load CET state: Can set=No, Can clear=Yes
[22767.356152]   Load guest IA32_LBR_CTL: Can set=No, Can clear=Yes
[22767.356152]   Load PKRS: Can set=No, Can clear=Yes
[22767.356153] VM Exit based Controls MSR: 0x3fffff00036dff
[22767.356154]   Save debug controls: Can set=Yes, Can clear=No
[22767.356154]   Host address-space size: Can set=Yes, Can clear=Yes
[22767.356155]   Load IA32_PERF_GLOB AL_CTRL: Can set=Yes, Can clear=Yes
[22767.356155]   Acknowledge interrupt on exit : Can set=Yes, Can clear=Yes
[22767.356156]   Save IA32_PAT: Can set=Yes, Can clear=Yes
[22767.356156]   Load IA32_PAT: Can set=Yes, Can clear=Yes
[22767.356157]   Save IA32_EFER: Can set=Yes, Can clear=Yes
[22767.356157]   Load IA32_EFER: Can set=Yes, Can clear=Yes
[22767.356158]   Save VMX-preemption timer value: Can set=No, Can clear=Yes
[22767.356158]   Clear IA32_BNDCFGS: Can set=No, Can clear=Yes
[22767.356159]   Conceal VM exits from Intel PT: Can set=No, Can clear=Yes
[22767.356159]   Clear IA32_RTIT_CTL: Can set=No, Can clear=Yes
[22767.356160]   Clear IA32_LBR_CTL: Can set=No, Can clear=Yes
[22767.356160]   Load CET state: Can set=No, Can clear=Yes
[22767.356160]   Load PKRS: Can set=No, Can clear=Yes
[22767.356161]   Activate secondary controls: Can set=No, Can clear=Yes
```
