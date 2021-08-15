# Born2BeRoot
## 기본 개요
* virtualBox를 이용하여 운영체제를 설치해본다.

## Subject
https://github.com/zhy2on/42cursus_01_Born2beroot/blob/main/Subject.md

## 평가지
https://github.com/wshloic/born2beroot_correction/blob/master/correction_born2beroot.pdf

## 자료 정리
### Virtual Machine
컴퓨터 안에 또 다른 컴퓨터를 동작 시키는 것이다.  
한 컴퓨터 안에서 자원을 독립적으로 사용자에게 나눠주고 싶을 때, 서로 다른 운영체제를 한 컴퓨터 안에서 실행하고 싶을 때, 악성코드를 분석할 때 등등 다양한 목적으로 사용된다.

### Debian / CentOS
  | Debian | CentOS|
  |--------|-------|
  |데비안(영어: Debian)은 데비안 프로젝트가 개발한 자유(free) 컴퓨터 운영 체제이다.| 센트OS(영어: CentOS)는 센트OS 프로젝트에서 레드햇 제휴로 개발한 컴퓨터 운영 체제이다. |
  |데비안은 안정성과 보안에 중점을 두며 사용자 편리성이 강한 우분투등 다른 많은 리눅스 배포판의 기반으로 쓰이고 있다. | 업스트림 소스인 레드햇 엔터프라이즈 리눅스와 완벽하게 호환되는 무료 기업용 컴퓨팅 플랫폼을 제공할 목적으로 만들어진 리눅스계 운영 체제 가운데 하나다. |
  | deb라는 패키지를 쓴다. 패키지툴 : dpkg, apt, aptitude, dselect등 | rpm이라는 패키지를 쓴다. 패키지툴 : rpm |
  | 현재 버전: 10.0	커널: 4.19 | 현재 버전: 8.0-1905	커널: 4.18.0-80|

### aptitude / apt 차이
패키지관리 프로그램(apt, dpkg, aptitude)의 한 유형이다.
* 패키지란? - 커널 및 라이브러리 버전의 배포판 환경에 맞추어 빌드한 실행파일을 압축한 것이다. https://elandda.tistory.com/47
* 빌드까지 완료된 상태로 압축한 것이기 때문에 사용하기 편하다는 장점이 있지만, 빌드된 상태와 같은 환경으로 만들어줘야 한다는 단점이 있다. 이를 의존성 패키지라고 하는데, 데비안의 apt, aptitude와 같은 패키지 툴은 의존성 패키지를 자동으로 검사하고 필요한 패키지를 설치해주는 역할을 한다. - https://koikebox.tistory.com/67  
  |apt(Advanced Packaging Tool)|aptitude|
  |-----|------|
  |데비안 GNU/리눅스 계열 배포판에서 소프트웨어를 설치하고 제거하는 일을 한다.|APT의 프론트엔드 프로그램이다. 앱티튜드는 소프트웨어 패키지의 목록을 보여주고, 사용자가 패키지를 능동적으로 설치 혹은 삭제하도록 허용한다.|
  |![image](https://user-images.githubusercontent.com/52701529/128638891-8414af36-226f-4c4b-90bb-3ea35095c7c5.png)| ![image](https://user-images.githubusercontent.com/52701529/128633574-3b4eaaaf-6909-40ae-b86b-98b4b4f3b901.png)|
  
### AppArmor
Application Armor. 시스템 관리자가 프로그램 프로필 별로 프로그램의 역량을 제한할 수 있게 해주는 리눅스 커널 보안 모듈이다. 각각의 어플들의 권한을 제한해서, 보안을 강화한다.  
AppArmor는 Enforce, Complain 2개의 Mode로 동작한다.
* Enforce : Program의 허용되지 않은 동작을 제한하고 Log에 남긴다. 실제 Program을 운영하면서 동작을 제한 할 때 이용하는 Mode이다.
* Complain : Program의 허용되지 않은 동작을 제한하지는 않고 Log만 남긴다.
* https://ssup2.github.io/theory_analysis/AppArmor/

### LVM
Logical Volume Manager. 리눅스의 하드디스크 관리 기술이다. (리눅스에서는 RAID와 LVM을 사용한다고 한다.)
*  LVM은 디스크를 좀 더 유연하게 사용하기 위해 물리적인 파티션을 논리적인 볼륨으로 바꿔 사용한다.
*  LVM에선 여러 파티션을 하나의 논리적인 볼륨으로 묶은 뒤, 다시 필요한 크기만큼 나눠서 사용할 수 있다.
*  https://wiseworld.tistory.com/32
*  https://mamu2830.blogspot.com/2019/12/lvmpv-vg-lv-pe-lvm.html
<img src="https://user-images.githubusercontent.com/52701529/128667623-9574c6cb-8898-43b3-8ded-540180a77575.png" width="400">

### SSH
Secure Shell Protocol. 네트워크 프로토콜 중 하나로 컴퓨터와 컴퓨터가 인터넷과 같은 Public Network를 통해 서로 통신을 할 때 보안적으로 안전하게 통신을 하기 위해 사용하는 프로토콜이다. - https://baked-corn.tistory.com/52
* SSH 사용법 - http://programmingskills.net/archives/315
* PC에서 VM 서버 ssh로 접속하기 - https://sancs.tistory.com/110

```shell
$ apt install openssh-server #ssh 설치
$ systemctl status ssh #ssh 상태 보기
$ sudo vim /etc/ssh/sshd_config -> Port 4242 #4242 포트 활성화
$ sudo systemctl restart ssh #ssh 재시작
```

<img src="https://user-images.githubusercontent.com/52701529/128667562-48223a4c-081f-4086-95df-ade836be187f.png" width="500">

### UFW
Uncomplicated Firewall. UFW는 데비안 계열 및 다양한 리눅스 환경에서 작동되는 사용하기 쉬운 방화벽 관리 프로그램이다.
* UFW 사용법 - https://webdir.tistory.com/206
* 방화벽이란? - 미리 정의된 보안 규칙에 기반한, 들어오고 나가는 네트워크 트래픽을 모니터링하고 제어하는 네트워크 보안 시스템이다. 방화벽은 일반적으로 신뢰할 수 있는 내부 네트워크, 신뢰할 수 없는 외부 네트워크 간의 장벽을 구성한다.

```shell
$ sudo apt install ufw #ufw 설치
$ sudo ufw status verbose #ufw 상태 보기
$ sudo ufw enable #ufw 활성화
$ sudo ufw default deny #기본 incoming deny
$ sudo ufw allow 4242 #4242포트 ssh연결 허용
$ sudo ufw status numbered #rule 리스트
$ sudo ufw delete [rule number] #rule 삭제
```

<img src="https://user-images.githubusercontent.com/52701529/128667359-6c0559d5-6bc9-4a7e-9679-f957afee3f15.png" width="300">

### hostname 변경
* hostname이란? - 인터넷에 접속된 수많은 컴퓨터들이 자신을 구별하기 위해 가지고 있는 것이 IP주소인데, IP대신 기억하기 쉽게 사용하는 것이 호스트네임이다. 
* hostnamectl - https://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_hostnamectl

```shell
$ hostname #현재 호스트네임 확인
$ sudo hostnamectl set-hostname wil42 #호스트네임 변경
$ hostname #바뀐 호스트네임 확인
$ sudo reoobt #재부팅 시 바뀐 호스트네임을 확인 가능하다.
```

![image](https://user-images.githubusercontent.com/52701529/128824567-42df6165-472a-444b-a090-3c59fc5a2592.png)

### group 추가
* https://linuxize.com/post/how-to-add-user-to-group-in-linux/
* Primary Group: 1개만 존재 해야 한다. 사용자가 로그인할 때, 파일 또는 디렉토리를 생성할 때 부여되는 기본 그룹이다.
* Secondary Groups: 없거나 여러 개 존재할 수 있다. 사용자가 파일 또는 디렉토리를 읽거나 쓰거나 실행할 때 지정된 그룹들의 권한을 받는다.

```shell
$ sudo useradd user
$ sudo passwd user
$ cat /etc/passwd
$ cat /etc/shadow
$ sudo deluser user

$ groupadd user42 #user42라는 그룹 추가
$ sudo usermod -G sudo,user42 jihoh #jihoh가 속한 그룹을 sudo, user42로 변경. (-a(append)옵션 사용시 기존에 추가. 없이 사용시 그대로 변경)
$ sudo usermod -g user42 jihoh #user42를 primary group으로 설정
$ id jihoh #계정 정보 확인
```

<img src="https://user-images.githubusercontent.com/52701529/128673701-f78ef65a-4f08-4bd4-b89a-d58911b9a47c.png" width="450">

### 비밀번호 정책
* https://dgblog.tistory.com/121

```shell
$ sudo vi /etc/login.defs
PASS_MAX_DAYS 30 #만료일
PASS_MIN_DAYS 2 #최소 사용일
PASS_WARN_AGE 7 #경고 메세지
PASS_MIN_LEN 10 #최소 글자수
```

<img src="https://user-images.githubusercontent.com/52701529/129348839-acbeace8-9d56-4ee8-8b79-500d23bde96f.png" width="150">

* https://computingforgeeks.com/enforce-strong-user-password-policy-ubuntu-debian/

```shell
$ sudo apt install libpam-pwquality cracklib-runtime #libpam-pwquality 설치
$ sudo vim /etc/pam.d/common-password
password    requisite      pam_pwquality.so minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 difok=7 reject_username enforce_for_root
#minlen 최소길이 ucredit 대문자 =-1 최소 하나이상 dcredit 숫자 =-1 최소 하나 이상 maxrepeat 반복제한 difok 이전 비밀번호와 겹치는 글자 제한 reject_username 유저네임 그대로 of 거꾸로 포함 제한 enforce_for_root 루트에도 적용
```

<img src="https://user-images.githubusercontent.com/52701529/128835736-47923e4d-4782-497c-8d9b-d33ed8ebe04c.png" width="700">

* 비밀번호 정책은 정책이 변경된 이후 생성된 계정부터 적용된다. 기존 계정들에 적용하기 위해 비밀번호를 만료시켜버린다.

```shell
$ passwd -e [username] #passwd -e (expire) 비밀번호 만료 옵션.
``` 

* /etc/login.defs 내용도 기존 계정들은 따로 적용해줘야 한다.

```shell
$ sudo chage -m 2 -M 30 -W 7 [username]  #-m MIN_DAYS -M MAX_DAYS -W WARN_DAYS
```

<img src="https://user-images.githubusercontent.com/52701529/128839281-cd0742ce-23fa-4f4e-9ae7-ba53b682994f.png" width="400">
  
### sudo configuration
* securepath : sudo 명령은 현재 계정의 쉘이 아닌 가상 쉘을 생성하고 그 안에서 실행된다. 이때 이 가상 쉘의 환경변수 PATH의 값을  secure_path 옵션을 통해 지정한다.
* https://www.sudo.ws/man/1.8.15/sudoers.man.html#mail_no_user
* https://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
* log file이란? - 운영 체제나 다른 소프트웨어가 실행 중에 발생하는 이벤트나 각기 다른 사용자의 통신 소프트웨어 간의 메시지를 기록한 파일이다. 로그를 기록하는 행위는 로깅(logging)이라고 한다.
* visudo - /etc/sudoers 파일을 수정하는 명령어이다. /etc/sudoers 파일은 기본적으로 쓰기 권한이 없기 때문에 기존에 있는 리눅스 편집기인 'vi'나 'nano'를 사용하지 않고 visudo 명령어를 사용한다. 권한을 바꾸고 다시 돌려놓는 방법도 있지만 /etc/sudoers에서도 애초에 visudo를 권장한다.
* tty / pts
    * https://codedragon.tistory.com/4211 
    <img src="https://user-images.githubusercontent.com/52701529/128916391-42dccb1f-7de8-408a-9bfc-3f2fa039b818.png" width="400">
    
```shell
$ su #root 계정 전환
$ apt install sudo #sudo 설치
$ dpkg -l | grep sudo #sudo 설치 여부 확인
$ mkdir /var/log/sudo #log file을 저장할 디렉토리 생성
$ export EDITOR=vim #EDITOR 환경 변수를 설정하여 visudo를 사용할 편집기를 vim으로 수정한다.
$ sudo -E visudo #visudo 명령어를 이용하여 /etc/sudoers 파일 변경 -E옵션을 이용해 sudo에서 현재 환경변수를 그대로 사용.
```

```shell
Defaults    env_reset #기본 설정. sudo 권한으로 실행시 HOME, PATH, SHELL, TERM, USER를 제외한 모든 환경 변수를 reset시킨다. 현재 실행중인 환경 변수를 그대로 사용하자고 한다면 주석처리 하면 되지만, 더 안전한 env_keep이 권장된다.
Defaults    mail_badpass #기본 설정. sudo를 실행중인 사용자가 잘못된 암호 입력시 malito 사용자에게 메일을 보낸다. 기본적으로 이 기능은 꺼져있다.
Defaults    secure_path"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" #sudo로 실행되는 명령어 경로 제한.
Defaults    passwd_tries=3 #sudo 비밀번호 시도 제한
Defaults    badpass_message="Pa55w0rd i5 wr0ng, p1ea5e try a9ain" #잘못된 sudo 비밀번호 입력시 custom message 출력
Defaults    authfail_message="Authenticati0n attempti0n i5 fai1ed, p1ea5e try a9ain" #연속으로 잘못된 비밀번호 입력으로 인증 실패시 custom message 출력
Defaults    log_input, log_output #sudo 이용한 user input과 output을 저장. default I/O log dir은 /var/log/sudo-io
Defaults    iolog_dir="/var/log/sudo/" #I/O log directory 변경
Defaults    requiretty #사용자가 실제 tty로 로그인한 경우에만 실행을 허용한다.
```

<img visudo src="https://user-images.githubusercontent.com/52701529/128920520-b4053054-4e9e-4c5a-94ed-7fab93b06f51.png" width="600">
<img visudo src="https://user-images.githubusercontent.com/52701529/128919723-f81970b3-d44b-4363-be95-18aa69c68640.png" width="400">

* log파일은 /var/log/sudo/00/00에 명령어당 한 폴더씩 생성되어 저장된다.
  * log - sudo 명령어 실행 위치가 저장된다.
  * stderr - 표준 에러 발생시 기록된다.
  * stdin, stdout - 표준 입출력 발생시 기록된다.
  * ttyin, ttyout - tty 입출력 발생시 기록된다.
  * timing - 명령어 실행시간과 관련 있는 것 같다.
<img visudo src="https://user-images.githubusercontent.com/52701529/128922526-581e92fa-e417-4b09-9a26-27e2de3e896a.png" width="300">

### monitoring.sh
서브젝트에서 요구하는대로 출력할 monitoring 스크립트를 만든다.

```shell
arc=$(uname -a)
```  

* a옵션의 내용은 아래와 같다.  
* https://hippogrammer.tistory.com/79  
<img visudo src="https://user-images.githubusercontent.com/52701529/129062145-14f94c0f-ddf3-4c95-974b-e482a6b94fa3.png" width="600"> 커널 릴리즈와 커널 버전 순서가 바뀐 것 같다.. 제타위키에도 주석이 달려있다.

```shell
pcpu=$(grep 'physical id' /proc/cpuinfo | sort -u | wc -l)
vcpu=$(grep 'processor' /proc/cpuinfo | wc -l)
```  

* /proc/cupinfo에서 physical id를 찾아 중복을 제외하고 세어 주면 물리 cpu수를 구할 수 있다.
* 가상 CPU는 /proc/cpuinfo에서 processor를 찾아 세어 주면 구할 수 있다. 물리 CPU와 가상 CPU수는 같을 수도, 다를 수도 있는데 이는 하이퍼스레딩에 따라 달라진다고 한다. 아래 블로그 참고.
* physical vs virtual processor : 하이퍼스레딩을 통해 각 물리적 코어에서 실행할 수 있는 스레드 수를 곱한 것이 논리적 코어라고 한다. 예를 들어 4코어 프로세서에서 코어당 2개의 스레드를 실행하면 8개의 논리 프로세서가 있다고 생각한다. virtual processor = logical processor 같은 의미로 사용되는 것 같다.
* https://unix.stackexchange.com/questions/88283/so-what-are-logical-cpu-cores-as-opposed-to-physical-cpu-cores
* https://developpaper.com/how-to-view-the-physical-cpu-logical-cpu-and-cpu-number-of-linux-servers/

```shell
fram=$(free -m | awk '$1 == "Mem:" {print $2}') #전체 메모리 용량
uram=$(free -m | awk '$1 == "Mem:" {print $3}') #사용중인 메모리 용량
pram=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}') #백분율
```
* Check RAM on Linux using free - https://devconnected.com/how-to-check-ram-on-linux/
* free는 메모리 사용량을 알 수 있는 명령어다. -m 옵션을 통해 메가바이트 단위로 출력한다.
* awk를 이용하여 데이터를 적절하게 조작한다. $2, $3은 두 번째 필드, 세 번째 필드를 뜻한다.

```shell
fdisk=$(df -Bg | grep '^/dev/mapper' | awk '{ft += $2} END {print ft}') #전체 디스크 용량
udisk=$(df -Bm | grep '^/dev/mapper' | awk '{ut += $3} END {print ut}') #사용중인 디스크 용량
pdisk=$(df -Bm | grep '^/dev/mapper' | awk '{ut += $3} {ft+= $2} END {printf("%d"), ut/ft*100}') #백분율
```

* https://en.wikipedia.org/wiki/Df_(Unix)
* df(disk free)는 디스크 사용량을 알 수 있는 명령어다. -B옵션을 통해 블럭단위를 조정한다.
* df 명령어로 디스크 사용량을 보면 처음 설정했던 디스크들의 file systemname이 모두 /dev/mapper로 시작하는 것을 알 수 있다. grep을 사용하여 해당 줄만 찾아준다. 이후 awk를 통해 각 필드의 합을 구해준다.

```shell
cpul=$(mpstat | grep 'all' | awk '{printf("%.1f%%"), 100 - $13}')
```

* sysstat 패키지를 설치하고 mpstat 명령어를 이용하여 CPU에 대한 정보를 출력한다.
* 13번째 필드인 유휴 사용량을 100에서 빼주어 현재 사용량을 구한다.

```shell
lb=$(who -b | awk '$1 == "system" {print $3 " " $4}')
```

* who명령어는 현재 접속한 사용자 정보를 /var/run/utmp 파일에서 가져오며, 이 utmp파일은 사용자가 원격으로 서버에 호그인할 때 사용자 정보를 저장하고, 사용자가 원격 호스트에서 로그아웃할 때 저장되어 있는 정보를 제거한다.
* -b 옵션으로 마지막 부팅시간을 출력한다.

```shell
lvmu=$(if [ $(sudo lvscan | grep 'ACTIVE' | wc -l) -gt 0 ]; then echo yes; else echo no; fi)
```

* lvscan을 이용해 lvm 활성상태를 출력하고 활성화된 lvm 개수를 세어 준다. 개수가 0보다 크면 yes, 아니면 no를 출력한다. ``if [값1 조건 값2]; the 수행문 fi`` 이기 때문에 이에 맞춰 작성해준다.

```shell
ctcp=$(ss -t | grep -i 'ESTAB' | wc -l | tr -d '\n')
```

* ss(Socket Statistics) -t 옵션을 이용해 tcp 정보를 출력한다. grep -i 옵션을 이용해 대소문자 상관 없이 ESTAB을 찾고 카운트 한다.
* TCP 상태는 ss -s 옵션으로도 확인해볼 수 있다. 상태별 의미는 다음 블로그를 참고. https://startingpitcher.tistory.com/12

```shell
ulog=$(users | wc -w)
```

* users 명령어를 통해 사용자를 출력하고 wc -w 옵션을 통해 단어별로 카운트한다.

```shell
ip=$(hostname -I)
mac=$(ip link | awk '$1 == "link/ether" {print $2}')
```

* hostname -I 옵션을 통해 ip주소를 출력한다.
* ip link를 통해 모든 네트워크 인터페이스 상태를 출력한다. 이후 link/ether로 시작하는 줄의 두 번째 필드를 출력한다. MAC주소(Media Access Control address)는 다른 말로 EHA 주소(Ethernet Hardware address)라 불리기도 한다.

```shell
cmds=$(sudo cat /var/log/auth.log | grep 'sudo: ' | grep 'COMMAND=' | wc -l | tr -d '\n')
```

* /var/log/auth.log 파일은 사용된 사용자 로그인 및 인증 기계를 포함하여 시스템 권한 부여 정보를 포함한다. sudo 권한이 부여된 정보를 찾기 위해 'sudo:'를 찾아주고 그 중에서 'COMMAND='를 찾아 세어준다.
* https://www.thegeekstuff.com/2011/08/linux-var-log-files/

마지막으로 wall명령어를 이용해 서버와 연결된 모든 사용자의 터미널로 메세지를 보내준다.  
이후 cron을 이용하여 10분마다 monitoring script가 실행될 수 있게 한다.

* cron이란? - Cron은 간단한게 말해서 unix 운영체제에서 어떤 작업을 특정 시간에 실행시키기 위한 데몬이다. cron 작업을 설정하는 파일을 바로 crontab 파일이라고 부른다.

```shell
*/10 * * * * /monitoring.sh #10분마다 실행
* * * * * /monitoring.sh ; sleep 30; /monitoring.sh #30초 마다 실행
```

## Bonus
### lighttpd, php, mariaDB, phpMyAdmin
https://www.tecmint.com/install-lighttpd-in-ubuntu/   
https://websiteforstudents.com/install-wordpress-on-ubuntu-16-04-lts-with-lighttpd-mariadb-and-php-7-1-support/  
https://phoenixnap.com/kb/how-to-install-phpmyadmin-on-debian-10#ftoc-heading-8

<img src="https://user-images.githubusercontent.com/52701529/129450904-2007a132-19bf-4e4c-a427-a85a185388ad.png" width="500">
<img src="https://user-images.githubusercontent.com/52701529/129450939-02c836b7-d72f-40f3-b655-9f9406ce4c83.png" width="500">

```shell
$ sudo mysql -u root -p
```

<img src="https://user-images.githubusercontent.com/52701529/129451084-d26555e3-03dc-4b75-bb90-be3f44b67205.png" width="200">
<img src="https://user-images.githubusercontent.com/52701529/129451106-60888313-6e97-4813-bb4a-7bbd9f677dbf.png" width="600">
<img src="https://user-images.githubusercontent.com/52701529/129457500-2daf6173-0330-4af0-a947-36d1cfadf968.png" width="600">

웹서버 관련 설치가 끝나고 나면 연동된 db에 워드프레스 내용이 잘 담겨 있는 것을 볼 수 있다.

정적 웹페이지 vs 동적 웹페이지  
* https://snowdeer.github.io/blog/2016/03/21/static-dynamic-webpage/ - "이름에서 눈치를 챌 수 있듯이 사용자의 인터랙션에 따라 웹페이지가 바뀌어가는 것을 동적 웹페이지, 그렇지 않고 항상 같은 내용을 보여주는 웹페이지를 정적 웹페이지라고 합니다. 일반적인 게시판 형태의 사이트들은 데이터베이스(DB, Database)를 활용한 동적 웹페이지 방식을 사용하고 있고, 정적 웹페이지 방식의 경우에는 DB를 사용하지 않습니다. 정적 웹페이지 방식은 글 자체가 전부 html 단위의 파일들로 이루어져 있습니다." 
