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


# [Assignment 1 - Discover VMX features](https://github.com/krishnagupta71/linux/tree/master/assignment/Assignment-1)
Discover VMX features present in your processor by writing a Linux kernel module that queries these features. Create a Linux kernel module that will query various MSRs to determine virtualization features available in your CPU. This module will report (via the system message log) the features it discovers.



# [Assignment 2: Instrumentation via hypercall](https://github.com/krishnagupta71/linux/tree/master/assignment/Assignment-2)
The assignment is to modify the CPUID emulation code in KVM to report back additional information when special CPUID leaf nodes are requested.

* For CPUID leaf node %eax=0x4FFFFFFF:<br />
  ◦ Return the total number of exits (all types) in %eax
* For CPUID leaf node %eax=0x4FFFFFFE:<br />
  ◦ Return the high 32 bits of the total time spent processing all exits in %ebx<br />
  ◦ Return the low 32 bits of the total time spent processing all exits in %ecx<br />
      %ebx and %ecx return values are measured in processor cycles, across all VCPUs


 # [Assignment 3: Instrumentation via hypercall](https://github.com/krishnagupta71/linux/tree/master/assignment/Assignment-3)
The assignment is to modify the CPUID emulation code in KVM to report back additional information when special CPUID leaf nodes are requested.

* For CPUID leaf node %eax=0x4FFFFFFD:
  ◦ Return the number of exits for the exit number provided (on input) in %ecx
      This value should be returned in %eax
* For CPUID leaf node %eax=0x4FFFFFFC:
 ◦ Return the time spent processing the exit number provided (on input) in %ecx
 ◦ Return the high 32 bits of the total time spent for that exit in %ebx
 ◦  the low 32 bits of the total time spent for that exit in %ecx


# [Assignment 4: Nested Paging vs. Shadow Paging](https://github.com/krishnagupta71/linux/tree/master/assignment/Assignment-4)
This assignment builds upon assignment-3. The purpose of this assignment is to illustrate the difference in performance when using nested paging versus shadow paging and to illustrate the different exit frequencies and types. 

NOTE – there is no coding required for this assignment. We are just running assignment-3 again in a different configuration. 




