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
* Contribution also includes collaborating with teammate to update cpuid.c and vmx.c files.
* Modified the function kvm_emulate_cpuid in the following file: linux/arch/x86/kvm -> cpuid.c and vmx_handle_exit in the following file: linux/arch/x86/kvm/vmx -> vmx.c 


### Shereen Punnassery

* Collaborate with team member to setup the environment in Windows OS using VMWare Workstation. 
* Tested the machine to check its capability for VMX virtualization and feature recognition.  
* Researched and discussed MSRs to be read in the SDM and contributed to the testing of the code.
* Contribution also includes collaborating with teammate to update cpuid.c and vmx.c files.
* Updating the answers for the questions in the README.md file

## Q2. Describe in detail the steps you used to complete the assignment. 

**Prerequisite:** Follow the [steps here](https://github.com/krishnagupta71/linux#setting-up-vm-with-the-linux-kernel-and-booting-it) to configure VM and build linux kernel and boot it.

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
![image](https://user-images.githubusercontent.com/20012695/166087760-3ca5888e-9967-43db-a20c-dec9063416d9.png)

9. If we want we can also see ```dmesg``` in the outer vm
