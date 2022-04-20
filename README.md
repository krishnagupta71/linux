# CMPE283 : Virtualization
# Assignment 1 - Discovering VMX Features
Discover VMX features present in your processor by writing a Linux kernel module that queries these features. 
Create a Linux kernel module that will query various MSRs to determine virtualization features available in your CPU. This module will report (via the system message log) the features it discovers.

# Team members
1. Krishna Gupta - 015721199
2. Shereen Punnassery

# Contributions
1. Krishna Gupta: <br>
* Setup the environment in Windows 11 using VMWare Workstation (30 day trail) and then installed Linux Ubuntu in the VM.
* Built a VM successfully and allocated 50GB storage and 8GB RAM to it. Also turned on nested virtualization for the VM. 
* Downloaded and built the Linux Kernel modules and associated libraries to create a local copy of Linux Kernel.
* Discussed and researched about MSRs to be read in the SDM.
* Modified the cmpe283-1.c code by adding the custom logic to enable our system to read and give output for capabilities of the various MSRs. 
* Contribution also includes MSR code for controls- Primary and Secondary Procbased controls and discovering the VMX Features present in my processor (Intel) by writing a Linux kernel module that queries these features.
* Staged and committed the cmpe283-1.c code file and Makefile after inserting the module and printing out the buffer from the Kernel. 
* Generated a comprehensive diff file after committing the changes to the repository  

    
   
2. Shereen Punnassery: <br>
* Setup the environment in Windows OS using VMWare Workstation and downloaded the Linux ISO file. 
* Tested the machine to check its capability for VMX virtualization and feature recognition. 
* Researched and discussed MSRs to be read in the SDM and contributed to the writing and execution of the code.
* Contribution also includes MSR code for controls- Entry and Exit controls and determining the availability of secondary procbased controls.
* Tested and verified the proper working of the functionality of code by comparing it with the sample output given to us. 
* Updates in the README.md file.

All the work done above was reviewed by each other in order to proceed further.

# Machine Details

We used our windows based machine with the following config:

CPU: Intel i5-9300H @2.40 Ghz

RAM: 16 GB

OS: Windows 11


# Setting up virtual machine on VMware

1. Create a Linux virtual machine on VMWare Workstation.

2. Turn on virtualization settings on your machine (For windows based machines this is genrally present in BIOS settings)

3. Check the box for "Virtualize Intel Vt-x/EPT or AMD-V/RVI" under Processors in VM settings.

4. After everything is set-up. Run this command on ther terminal of your VM: ```cat /proc/cpuinfo```. Make sure that you have VMX flags in the output. This means that nested virtualization is configured as required.

# Setting up VM with the linux kernel and booting it

1. Fork the following repository into your personal github account <br><i> "https://github.com/torvalds/linux" </i> 
2. Clone the repository <br><i> "git clone https://github.com/krishnagupta71/linux.git" </i>
3. Install the required dependencies <br> ```sudo apt-get build-dep linux linux-image-$(uname -r)``` <br> ```sudo apt-get install libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf``` <br>
Refrence: https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel
4. Verify the OS and the hardware using the command <i> "uname -a" </i>
5. Cd into the cloned repository. Run the command ```make localmodconfig``` and accept all the default options.
7. Build the modules directory 
      <br> <i> "make -j 2 modules" </i>
8. Build the entire directory 
      <br> <i> "make -j 2" </i>
9. Install the module packages
      <br> <i> "sudo make INSTALL_MOD_STRIP=1 modules_install" </i> 
10. Install the module
      <br> <i> "sudo make install" </i>
16. Reboot the VM using the following command 
      <br> <i> "sudo reboot" </i>
17. Verify the current version of kernel using the command "uname -r" (Notice it is upgraded to 5.18.0-rc1+)


# Exploring the VMX Features 

1. CD into the assignment files directory by using command <br> ```cd assignemnt/```
2. Compile the C file by using command <br> ```make```. This will create a *.ko file which can be confirmed by ```ls``` command.
3. Install the module into the kernel using the command ```sudo insmod cmpe283-1.ko```
4. See the output of the VMX features by printing the system log using ```dmesg```. Or save output in text file using ```dmesg > output.text```

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
