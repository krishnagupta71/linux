# CMPE283 : Virtualization Technologies Assignments

# Team members
1. Krishna Gupta - 015721199
2. Shereen Punnassery - 015312128

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


# Assignment 1 - Discover VMX features 
Discover VMX features present in your processor by writing a Linux kernel module that queries these features. Create a Linux kernel module that will query various MSRs to determine virtualization features available in your CPU. This module will report (via the system message log) the features it discovers.

# Steps to complete Assignment 1:
1. Setup VM with Linux kernel build as in steps above
2. CD into the assignment files directory by using command <br> ```cd assignemnt/```
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

# Assignment 2: Instrumentation via hypercall
The assignment is to modify the CPUID emulation code in KVM to report back additional information when special CPUID leaf nodes are requested.

* For CPUID leaf node %eax=0x4FFFFFFF:<br />
  ◦ Return the total number of exits (all types) in %eax
* For CPUID leaf node %eax=0x4FFFFFFE:<br />
  ◦ Return the high 32 bits of the total time spent processing all exits in %ebx<br />
  ◦ Return the low 32 bits of the total time spent processing all exits in %ecx<br />
      %ebx and %ecx return values are measured in processor cycles, across all VCPUs

## Team Members: 
1. Krishna Gupta - 015721199
2. Shereen Punnassery - 015312128

## Q1. For each member in your team, provide 1 paragraph detailing what parts of the lab that member implemented/researched.

### Krishna Gupta

* Setup the environment in Windows 11 using VMWare Workstation (30 day trail) and then installed Linux Ubuntu in the VM.
* Built a VM successfully and allocated 50GB storage and 8GB RAM to it. Also turned on nested virtualization for the VM. 
* Downloaded and built the Linux Kernel modules and associated libraries to create a local copy of Linux Kernel.
* Researched and discussed the exits and interrupts by referring to the Intel SDM.
* Contribution also includes writing code for returning the total number of exits and the total time spent processing all exits. 
* Modified the function kvm_emulate_cpuid in the following file: linux/arch/x86/kvm -> cpuid.c and vmx_handle_exit in the following file: linux/arch/x86/kvm/vmx -> vmx.c 
* Simulating the answers for the questions in the README.md file.

### Shereen Punnassery

* Setup the environment in Windows OS using VMWare Workstation and downloaded the Linux ISO file. 
* Tested the machine to check its capability for VMX virtualization and feature recognition. 
* Tested the machine to check its capability for VMX virtualization. 
* Researched and discussed MSRs to be read in the SDM and contributed to the testing of the code.
* Contribution also includes writing code for the test program that exercises the functionality in the hypervisor's modification.

## Q2. Describe in detail the steps you used to complete the assignment. 

**Prerequisite:** Follow the steps to configure VM and build linux kernel and boot it.

<br />

### Implement the Assignment Functionalities:

We edited cpuid.c and vmx.c for implementing code for calculating total number of exits and the total time spent processing all exits.

We modified function kvm_emulate_cpuid in the following file: linux/arch/x86/kvm/cupid.c, 
and vmx_handle_exit in the following file: linux/arch/x86/kvm/vmx/vmx.c

### Build the updated code: 

1. After changing the code in KVM use the below command.
```
sudo make -j 2 modules 
```
2. Load and unload the kvm kernel module (kvm.ko) and kvm-intel module (kvm-intel.ko) using the following commands:
```
sudo rmmod arch/x86/kvm/kvm-intel.ko
```
```
sudo rmmod arch/x86/kvm/kvm.ko
```
```
sudo insmod arch/x86/kvm/kvm.ko
```
```
sudo insmod arch/x86/kvm/kvm-intel.ko
```
3. To test changes, we need to create a VM using virt manager.
Use the following command to install KVM, supporting packages and virt manager.
```
sudo apt-get update
```
```
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager 
```
4. Verify KVM Installation using the below command. You should see an empty list of virtual machines. This indicates that everything is working correctly.
```
virsh -c qemu:///system list
```
5. Now open virtual machine manager and using Ubuntu ISO file create inner vm.

6. Open terminal and install cpuid using below command:
```
sudo apt-get update
```
```
sudo apt-get install cpuid
```
7. Create test program code in inner VM.

8. Once the Guest VM is up, Run the below commands in the inner VM (which is inside a VM):<br />  
```
  cpuid -l 0X4fffffff -s exit_number
  cpuid -l 0X4ffffffe -s exit_number
``` 

  
 # Assignment 3: Instrumentation via hypercall
The assignment is to modify the CPUID emulation code in KVM to report back additional information when special CPUID leaf nodes are requested.

* For CPUID leaf node %eax=0x4FFFFFFD:
  ◦ Return the number of exits for the exit number provided (on input) in %ecx
      This value should be returned in %eax
* For CPUID leaf node %eax=0x4FFFFFFC:
 ◦ Return the time spent processing the exit number provided (on input) in %ecx
 ◦ Return the high 32 bits of the total time spent for that exit in %ebx
 ◦  the low 32 bits of the total time spent for that exit in %ecx

## Team Members: 
1. Krishna Gupta - 015721199
2. Shereen Punnassery - 015312128

## Q1. For each member in your team, provide 1 paragraph detailing what parts of the lab that member implemented/researched.

### Krishna Gupta

* Setup the environment in Windows 11 using VMWare Workstation (30 day trail) and then installed Linux Ubuntu in the VM.
* Built a VM successfully and allocated 50GB storage and 8GB RAM to it. Also turned on nested virtualization for the VM. 
* Downloaded and built the Linux Kernel modules and associated libraries to create a local copy of Linux Kernel.
* Researched and discussed the exits and interrupts by referring to the Intel SDM.
* Contribution also includes writing code for returning the total number of exits and the total time spent processing all exits. 
* Modified the function kvm_emulate_cpuid in the following file: linux/arch/x86/kvm -> cpuid.c and vmx_handle_exit in the following file: linux/arch/x86/kvm/vmx -> vmx.c 
* Simulating the answers for the questions in the README.md file.

### Shereen Punnassery

* Setup the environment in Windows OS using VMWare Workstation and downloaded the Linux ISO file. 
* Tested the machine to check its capability for VMX virtualization and feature recognition. 
* Tested the machine to check its capability for VMX virtualization. 
* Researched and discussed MSRs to be read in the SDM and contributed to the testing of the code.
* Contribution also includes writing code for the test program that exercises the functionality in the hypervisor's modification.

## Q2. Describe in detail the steps you used to complete the assignment. 

**Prerequisite:** Follow the steps to configure VM and build linux kernel and boot it.

<br />

### Implement the Assignment Functionalities:

We edited cpuid.c and vmx.c for implementing code for calculating total number of exits and the total time spent processing all exits.

We modified function kvm_emulate_cpuid in the following file: linux/arch/x86/kvm/cupid.c, 
and vmx_handle_exit in the following file: linux/arch/x86/kvm/vmx/vmx.c

### Build the updated code: 

1. After changing the code in KVM use the below command.
```
sudo make -j 2 modules 
```
2. Load and unload the kvm kernel module (kvm.ko) and kvm-intel module (kvm-intel.ko) using the following commands:
```
sudo rmmod arch/x86/kvm/kvm-intel.ko
```
```
sudo rmmod arch/x86/kvm/kvm.ko
```
```
sudo insmod arch/x86/kvm/kvm.ko
```
```
sudo insmod arch/x86/kvm/kvm-intel.ko
```
3. To test changes, we need to create a VM using virt manager.
Use the following command to install KVM, supporting packages and virt manager.
```
sudo apt-get update
```
```
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager 
```
4. Verify KVM Installation using the below command. You should see an empty list of virtual machines. This indicates that everything is working correctly.
```
virsh -c qemu:///system list
```
5. Now open virtual machine manager and using Ubuntu ISO file create inner vm.

6. Open terminal and install cpuid using below command:
```
sudo apt-get update
```
```
sudo apt-get install cpuid
```
7. Create test program code in inner VM.

8. Once the Guest VM is up, Run the below commands in the inner VM (which is inside a VM):<br />  
```
  cpuid -l 0X4ffffffd -s exit_number
  cpuid -l 0X4ffffffc -s exit_number
``` 


# CMPE 283: Virtualization Technologies 
# Assignment 4: Nested Paging vs. Shadow Paging
This assignment builds upon assignment-3. The purpose of this assignment is to illustrate the difference in performance when using nested paging versus shadow paging and to illustrate the different exit frequencies and types. 

NOTE – there is no coding required for this assignment. We are just running assignment-3 again in a different configuration. 

## Team Members: 
* Krishna Gupta - 015721199
* Shereen Punnassery - 015312128

## Q1. For each member in your team, provide 1 paragraph detailing what parts of the lab that member implemented/researched.

### Krishna Gupta (SJSU ID: 015721199)
- Collaborated with my teammate over the zoom call.
- Scripted the test file for the scenario posted in the assignment-4 instruction pdf.
- Ran the program with ept = 0, observed the results and captured the screenshots.
- Simulating the answers for the questions in the README.md file.

### Shereen Punnassery (SJSU ID: 015312128)
- Collaborated with my teammate over the zoom call.
- With ept != 0, executed the code, made observations and captured a screenshot.
- Verified results in both nested paging and shadow paging.
- Discussed with my teammate to conclude the observations made.

## Steps for completing the assignment:
**Prerequisite:** A working assignment-3.<br />

**Environment Setup:** We build this homework assignment on assignment-3 and hence used the same environment setup.

**Steps Followed:**

* Run your assignment 3 code and boot a test VM using that code. 
* Once the VM has booted, record total exit count information (total count for each type of exit handled by KVM). 
* Shutdown the test (inner) VM.
* Remove the ‘kvm-intel’ module from your running kernel:
```
rmmod kvm-intel
```
* Reload the kvm-intel module with the parameter ept=0 (this will disable nested paging and force KVM to use shadow paging instead).
```
insmod /lib/modules/5/kernel/arch/x86/kvm/kvm-intel.ko ept=0 
```
* Boot the same test VM again, and capture the same output as you did in the second step. 
* On performing the above steps, we were successfully able to boot the VM by enabling Shadow paging.

## Q2. Include a sample of your print of exit count output from dmesg from “with ept” and “without ept”.
### Screenshots: 
#### Nested paging:
<img width="976" alt="np" src="https://user-images.githubusercontent.com/78829969/145340872-206f0172-8109-41b7-9398-a7065be001ff.png">

#### Shadow paging:
Boot:
<img width="978" alt="sp_1" src="https://user-images.githubusercontent.com/78829969/145341508-87e9828d-72a7-4700-939f-df946f1c1674.png">

After reboot:
![image](https://user-images.githubusercontent.com/78829969/145341940-afb68b66-58dc-48c8-a8e9-751a43c79993.png)

## Q3. What did you learn from the count of exits? Was the count what you expected? If not, why not?
In shadow paging, the number of exits increases when compared to nested paging. This is expected because during nested paging VM exit occurs when an EPT violation occurs. But in the case of shadow paging, it could exit every time the VM attempts to execute CR0, CR3, CR4 or any exits which are related to paging such as a page fault. 

## Q4. What changed between the two runs (ept vs no-ept)?
- **EPT Mode:** In this mode, we have two-layers of page tables which are used to translate from Guest VA to Guest PA and then to Host PA, and more page accesses are required, the guest VM should own page table and hence all the operations on CR3 is done in the same environment, i.e. no need to exit.

- **No EPT Mode:** Guest VM does not own the page table in shadow paging mode, for it, the VMM must simulate CR3.














    
    


