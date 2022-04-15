# CMPE283 : Virtualization
# Assignment 1 - Discovering VMX Features

# Team members
1. Krishna Gupta
2. SHereen Punnassery

# Contributions
1. Krishna Gupta- <br>
    
   
2. Shereen Punnassery - <br>
    

All the work done above was reviewed by each other in order to proceed further.

# Steps 


<h2> Setting up the VM with the latest linux kernel </h2>

1. Fork the following repository into your personal github account <br><i> "https://github.com/torvalds/linux" </i> 
2. SSH into the VM using ssh-keygen or the gcloud shell
3. Clone the repository <br><i> "git clone https://github.com/krishna201294/linux.git" </i>
4. Install the following packages and dependencies 
    a. sudo apt-get install make
    b. sudo apt-get install gcc
    c. sudo apt-get install libncurses-dev
    d. sudo apt-get install flex
    e. sudo apt-get install bison
5. Verify the OS and the hardware using the command <i> "uname -a" </i>
6. Copy the config file corresponding to your linux os from the following path into a file called ".config" 
      <br><i> "cp /boot/config-5.11.0-1021-gcp .config"</i>
7. Under the .config file modify the CONFIG_SYSTEM_TRUSTED_KEYS variable value to CONFIG_SYSTEM_TRUSTED_KEYS=""
8. Compile the oldconfig using the following command 
      <br><i> make oldconfig </i>
9. Install the below packages
    a. sudo apt-get install openssl
    b. sudo apt-get install libssl-dev
    c. sudo apt-get install libelf-dev
10. Execute <i> "make prepare" </i>
11. Verify the current version of kernel using the command "uname -r" ( Currently set to 5.11.0 ) 
12. Build the modules directory (8 corresponds to the vCPU's in the VM)
      <br> <i> "make -j 8 modules" </i>
13. Build the entire directory 
      <br> <i> "make -j 8" </i>
14. Install the module packages
      <br> <i> "sudo make INSTALL_MOD_STRIP=1 modules_install" </i> 
15. Install the module
      <br> <i> "sudo make install" </i>
16. Reboot the VM using the following command and reconnect using SSH
      <br> <i> "sudo reboot" </i>
17. Verify the current version of kernel using the command "uname -r" (Notice it is upgraded to 5.15.0+)


<h2> Exploring the VMX Features </h2>
