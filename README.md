# Born2BeRoot
## 기본 개요
* virtualBox를 이용하여 운영체제를 설치해본다.

## Mandatory part
* 가장 최신의 안정적 버전의 Debian 혹은 CentOS를 설치해야 합니다.
> CentOS가 좀 더 어렵습니다. SELinux(for CentOS) AppArmor(for Debian)도 시작시 실행되어야 합니다.
* LVM을 사용하여 암호화 된 파티션을 2개 이상 만들어야 합니다.
> 디펜스를 할 때 선택한 os에 대해 질문받을 수 있습니다. 예를 들어 aptitude와 apt의 차이, SELinux 또는 AppArmor이 무엇인지. 본인이 사용한 것을 이해해야 합니다.
* SSH는 4242 port로만 실행합니다.
> 디펜스하면서 새 계정을 설정하여 SSH를 사용해야 합니다. 따라서 작동 방식을 이해해야 합니다.
* UFW 방화벽으로 운영체제를 구성해야하므로 4242 port만 열어둬야 합니다.
> 가상머신을 돌릴 때 방화벽이 무조건 실행돼야 합니다.(CentOS의 경우 기본 방화벽 말고 UFW를 설치해야 한다. DNF가 필요합니다.)
* hostname은 42로 끝나야 합니다. 평가하는 동안 이 hostname을 수정해야 합니다.
* root user외에 username으로 로그인한 사용자가 있어야 합니다.
* 이 사용자는 user42 및 sudo 그룹에 속해야합니다.

## 평가지
https://github.com/wshloic/born2beroot_correction/blob/master/correction_born2beroot.pdf
* Project overview
  * The student evaluated should simply explain to you:
  * [ ] The basic functioning of is virtual machine.
  * [ ] His choice of operating system.
  * [ ] The basic differences between Centos and Debian.
  * [ ] The interest of virtual machines.
  * [ ] defference between aptitude and apt and what APPArmor is.

* Simple setup
  * [ ] Ensure that the machine does not have a graphical environment at launch. A password will be requested before attempting to connect to this machine. Finally, connec with a user with the help of the student evaluated. This user must not be root. Pay attention to the password chosen, it must follow the rules imposed in the subject.
  * [ ] Check that the UFW service is started with the help of evaluator.
  * [ ] Check that the SSH service is started with the help of the evaluator.
  * [ ] Chck that the chosen operating system is Debian or Centos with the help of the reviewer. If something does not work as expected or is not clearly explaned, the evaluation stops here.

* User
  * The subject requests that a user with the login of the evaluated student is present on the virtual machine. Check that it has been added and that it belongs to the "sudo" and "user42" groups.
  * Make sure the rules imposed in the subject concerning the password policy have been put in place by following the following steps.
  * First, create a new user. Assign it a password of your choice, respecting the subject rules. The evaluated student must now explain to you how he was able to set up the rules requested in the subject on their virtual machine.
  * Normally there should be one or two modified files. If there is any problem, the evaluation stops here.
  * [ ] Now that you have a new user, ask the student being evaluated to create a group named "evaluatig" in front of you and assign it to this user. Finally, check that this user belongs to "evaluating" group.
  * [ ] Finally, ask the student evaluated to explain the advantages of this password policy, as well as the advantaged and disadvantageds of tis implementation. Of course, answering that it is because the subject asks for it does not count.

* Hostname and partitions
  * [ ] Check that the hostname of the machine is correctly formatted as follows: login42(login of the student evaluated).
  * [ ] Modify this hostname by replacing the login with yours, then restart the machine. If on restart, the hostname has not been updated, the evaluation stops here.
  * [ ] You can now restore the machine to the original hostname.
  * [ ] Compare the output with the example given in the subject. Please note: if the student evaluated makes the bonuses, it will be necessary to refer to bonus example.
  * This part is an opportunity to discuss the scores! The student being evaluated should give you a breif explanation of how LVM works and what it is all about. If something does not work as expected or is not clearly explained, the evaluation stops here.

* SUDO

## 자료 정리
* Debian
  * 데비안(영어: Debian)는 데비안 프로젝트가 개발한 자유(free) 컴퓨터 운영 체제이다.
  * 데비안은 안정성과 보안에 중점을 두며 사용자 편리성이 강한 우분투등 다른 많은 리눅스 배포판의 기반으로 쓰이고 있다.
  * 현재 버전: 10.0	커널: 4.19
* CentOS
  * 센트OS(영어: CentOS)는 센트OS 프로젝트에서 레드햇 제휴로 개발한 컴퓨터 운영 체제이다.
  * 업스트림 소스인 레드햇 엔터프라이즈 리눅스와 완벽하게 호환되는 무료 기업용 컴퓨팅 플랫폼을 제공할 목적으로 만들어진 리눅스계 운영 체제 가운데 하나다.
  * 현재 버전: 8.0-1905	커널: 4.18.0-80
* LVM
  *  Logical Volume Manager. 리눅스의 하드디스크 관리 기술. (리눅스에서는 RAID와 LVM을 사용한다고 한다.) (오.. 운체에서 배운 내용)
  *  LVM은 디스크를 좀 더 유연하게 사용하기 위해 물리적인 파티션을 논리적인 볼륨으로 바꿔 사용한다.
  *  LVM에선 여러 파티션을 하나의 논리적인 볼륨으로 묶은 뒤, 다시 필요한 크기만큼 나눠서 사용할 수 있다.
  *  <https://wiseworld.tistory.com/32>
  *  <https://mamu2830.blogspot.com/2019/12/lvmpv-vg-lv-pe-lvm.html> - 완전 쉽게 정리된 블로그!
* LVM의 목적
  1. 여러 개의 디스크 공간을 합쳐 하나인양 사용하기 위해
  2. 사용하기 애매한 공간의 디스크 파티션들을 활용하기 위해
  3. 기존에 사용중인 디스크의 공간을 확장할 수 있어서(!!!)
 
![image](https://user-images.githubusercontent.com/52701529/128603443-654431ba-acb7-411e-8653-8356852a4e5d.png)
