# Assignment 4: Nested Paging vs. Shadow Paging
This assignment builds upon assignment-3. The purpose of this assignment is to illustrate the difference in performance when using nested paging versus shadow paging and to find the different exit frequencies and types. 

NOTE – there is no coding required for this assignment. We are just running assignment-3 again in a different configuration. 

## Team Members: 
* Krishna Gupta - 015721199
* Shereen Punnassery - 015312128

## Q1. For each member in your team, provide 1 paragraph detailing what parts of the lab that member implemented/researched.

### Krishna Gupta (SJSU ID: 015721199)
- Collaborated with my teammate over the zoom call.
- Ran the program with ept = 0, observed the results and captured screenshot.
- With ept != 0, executed the code, made observations and captured screenshot.
- Discussed with teammate to conclude the observations made.

### Shereen Punnassery (SJSU ID: 015312128)
- Collaborated with my teammate over the zoom call.
- Verified results in both nested paging and shadow paging.
- Discussed with teammate to conclude the observations made.
- Updated the answers for the questions in the README.md file.

## Steps for completing the assignment:
**Prerequisite:** A working assignment-3.<br />

**Environment Setup:** We build this homework assignment on assignment-3 and hence used the same environment setup.

**Steps Followed:**

* Run assignment 3 code and boot a nested/test VM using that code. 
* After VM is booted, record total exit count information.. 
* Shutdown the inner VM.
* Remove the ‘kvm-intel’ module from your running kernel:
```
rmmod kvm-intel
```
* Reload the kvm-intel module with the parameter ept=0 which will disable nested paging and force KVM to use shadow paging.
```
insmod /lib/modules/5/kernel/arch/x86/kvm/kvm-intel.ko ept=0 
```
* Boot the same test VM again, and record the same output as you did in the second step. 
* Through above steps, we were able to boot the VM by enabling Shadow paging.

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
In shadow paging, the number of exits increases when compared to nested paging. The count increase is expected in shadow paging because, during nested paging VM exit occurs when an EPT violation occurs. But in the case of shadow paging, it could exit every time the VM attempts any CR3 changes, when a page fault happens and during explicit TLB invalidations. So, shadow paging increases the the number of exits compared to nested paging. 

## Q4. What changed between the two runs (ept vs no-ept)?
- **EPT Mode:** Because of nested paging, the exit count is less.

- **No EPT Mode:** Because of shadow paging, the exit count has been increased.
