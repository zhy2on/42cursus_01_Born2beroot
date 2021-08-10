# Born2BeRoot
## 기본 개요
* virtualBox를 이용하여 운영체제를 설치해본다.

## Mandatory part
* 가장 최신의 안정적 버전의 Debian 혹은 CentOS를 설치해야 합니다.
> CentOS가 좀 더 어렵습니다. SELinux(for CentOS) AppArmor(for Debian)도 시작시 실행되어야 합니다.
* LVM을 사용하여 암호화 된 파티션을 2개 이상 만들어야 합니다.
> 디펜스를 할 때 선택한 os에 대해 질문받을 수 있습니다. 예를 들어 aptitude와 apt의 차이, SELinux 또는 AppArmor이 무엇인지. 본인이 사용한 것을 이해해야 합니다.
* SSH는 4242 port로만 실행합니다. 보안상의 이유로 SSH를 루트로 사용하여 연결할 수 없어야합니다.
> 디펜스하면서 새 계정을 설정하여 SSH를 사용해야 합니다. 따라서 작동 방식을 이해해야 합니다.
* UFW 방화벽으로 운영체제를 구성해야하므로 4242 port만 열어둬야 합니다.
> 가상머신을 시작할 때 방화벽이 무조건 실행돼야 합니다.(CentOS의 경우 기본 방화벽 말고 UFW를 설치해야 합니다. DNF가 필요합니다.)
* hostname은 42로 끝나야 합니다. 평가하는 동안 이 hostname을 수정해야 합니다.
* root user외에 username으로 로그인한 사용자가 있어야 합니다.
* 이 사용자는 user42 및 sudo 그룹에 속해야합니다.
> 디펜스하는 동안 새로운 user를 만들고 그룹을 할당해야 합니다.
* 강력한 암호정책을 설정하기 위해 다음을 따라야 합니다.
   1. 30일마다 만기돼야 합니다.
   2. 비밀번호를 다시 수정하기까지 최소 2일 이상 기다려야합니다.
   3. user는 비밀번호 만기 7일 전 경고 메세지를 받아야 합니다.
   4. 비밀번호는 10자 이상, 대문자와 숫자를 포함해야 합니다. 또한 3개 이상의 연속된 문자를 포함할 수 없습니다.
   5. user의 이름을 포함할 수 없습니다.
   6. 다음 규칙은 root 비밀번호에는 적용되지 않습니다.: 비밀번호는 최소 이전 비밀번호와 다른 문자가 7자 이상이어야 합니다.
   7. root 또한 동일한 비밀번호 정책이 적용됩니다.
> configuring files를 세팅한 다음에는 root를 포함한 모든 계정의 비밀번호를 바꿔야 합니다.


## 평가지
https://github.com/wshloic/born2beroot_correction/blob/master/correction_born2beroot.pdf

## 자료 정리
* Debian / CentOS
  * | Debian | CentOS|
    |--------|-------|
    |데비안(영어: Debian)은 데비안 프로젝트가 개발한 자유(free) 컴퓨터 운영 체제이다.| 센트OS(영어: CentOS)는 센트OS 프로젝트에서 레드햇 제휴로 개발한 컴퓨터 운영 체제이다. |
    |데비안은 안정성과 보안에 중점을 두며 사용자 편리성이 강한 우분투등 다른 많은 리눅스 배포판의 기반으로 쓰이고 있다. | 업스트림 소스인 레드햇 엔터프라이즈 리눅스와 완벽하게 호환되는 무료 기업용 컴퓨팅 플랫폼을 제공할 목적으로 만들어진 리눅스계 운영 체제 가운데 하나다. |
    | 현재 버전: 10.0	커널: 4.19 | 현재 버전: 8.0-1905	커널: 4.18.0-80|

* aptitude / apt 차이
  * 패키지관리 프로그램(apt, dpkg, aptitude)의 한 유형이다.
  * 패키지란? - 커널 및 라이브러리 버전의 배포판 환경에 맞추어 빌드한 실행파일을 압축한 것이다. https://elandda.tistory.com/47
  * "왜 데비안, 우분투를 더 선호하게 되느냐는 것은 패키지 관리 시스템의 우수성 때문입니다. 데비안 패키지 방식은 메인테이너들에 의해서 패키지가 관리되고 있어서 패키지를 네트워크를 통해 다운받을 때 의존성 패키지가 있는지를 검사하고 의존성 패키지가 자신의 환경에 설치되어 있지 않다면 자동으로 의존성 패키지까지 같이 설치할 수 있도록 지원하고 있습니다." https://koikebox.tistory.com/67
  * |apt(Advanced Packaging Tool)|aptitude|
    |-----|------|
    |코어 라이브러리와 함께 동작하는 자유 사용자 인터페이스로, 데비안 GNU/리눅스 배포판 계열 배포판에서 소프트웨어를 설치하고 제거하는 일을 한다.|APT의 프론트엔드 프로그램이다. 앱티튜드는 소프트웨어 패키지의 목록을 보여주고, 사용자가 패키지를 능동적으로 설치 혹은 삭제하도록 허용한다.|
    |APT는 이진 파일로부터나 소스 코드 컴파일을 통하여 소프트웨어 패키지의 확인·구성·설치를 자동화함으로써 유닉스 계열 컴퓨터 시스템 상의 소프트웨어를 관리하는 작업을 단순하게 만든다.|앱티튜드는 특히 유연한 검색 패턴을 지원하는 검색 기능을 가지고 있다. 원래 데비안을 위해 개발되었지만, RPM 패키지 매니저 (RPM) 기반 배포판에서도 등장한다.|
    |![image](https://user-images.githubusercontent.com/52701529/128638891-8414af36-226f-4c4b-90bb-3ea35095c7c5.png)| ![image](https://user-images.githubusercontent.com/52701529/128633574-3b4eaaaf-6909-40ae-b86b-98b4b4f3b901.png)|
    | apt 이스터에그ㅎㅎ | ㅇㅎ 가장 큰 차이가 프론트엔드 지원하는지! aptitude는 명령어 실행시키면 이렇게 프론트엔드 프로그램으로 실행할 수 있다. |
  * dpkg와 APT의 경우 제대로 사용하기 위해서는 좀더 많은 지식을 요구한다. 그에 비하여 aptitude의 경우 주요 패키지 작업 과정을 자동화하여 가능한 쉽게 작업할 수 있도록 해주므로 보다 쉽게 할 수 있다.
  * http://taewan.kim/tip/apt-apt-get/ - 정리 잘 돼있음!
  
* AppArmor
  * AppArmor ("Application Armor")는 시스템 관리자가 프로그램 프로필 별로 프로그램의 역량을 제한할 수 있게 해주는 리눅스 커널 보안 모듈이다.
  * APPArmor가 뭔가요? - https://forum.ubuntu-kr.org/viewtopic.php?t=22432
  * | 설치 오류 | 해결 |
    |-----------|-----|
    | ![image](https://user-images.githubusercontent.com/52701529/128634425-95790cf2-b901-4a37-aa99-f9c587deeec7.png) | https://m.blog.naver.com/nkkh159/220832107076 |
  * apparmor tutorial - https://wiki.debian.org/AppArmor/HowToUse#Install_AppArmor https://linuxhint.com/debian_apparmor_tutorial/

* LVM
  *  LVM이란? - Logical Volume Manager. 리눅스의 하드디스크 관리 기술이다. (리눅스에서는 RAID와 LVM을 사용한다고 한다.)
  *  LVM은 디스크를 좀 더 유연하게 사용하기 위해 물리적인 파티션을 논리적인 볼륨으로 바꿔 사용한다.
  *  LVM에선 여러 파티션을 하나의 논리적인 볼륨으로 묶은 뒤, 다시 필요한 크기만큼 나눠서 사용할 수 있다.
  *  https://wiseworld.tistory.com/32
  *  https://mamu2830.blogspot.com/2019/12/lvmpv-vg-lv-pe-lvm.html - 완전 쉽게 정리된 블로그!

* LVM의 목적
  * 여러 개의 디스크 공간을 합쳐 하나인양 사용하기 위해
  * 사용하기 애매한 공간의 디스크 파티션들을 활용하기 위해
  * 기존에 사용중인 디스크의 공간을 확장할 수 있어서(!!!)
  * <img src="https://user-images.githubusercontent.com/52701529/128667623-9574c6cb-8898-43b3-8ded-540180a77575.png" width="400">

* SSH
  * SSH란? - Secure Shell Protocol. 네트워크 프로토콜 중 하나로 컴퓨터와 컴퓨터가 인터넷과 같은 Public Network를 통해 서로 통신을 할 때 보안적으로 안전하게 통신을 하기 위해 사용하는 프로토콜이다. https://baked-corn.tistory.com/52
  * SSH 사용법 - http://programmingskills.net/archives/315
  ```shell
  $ apt install openssh-server #ssh 설치
  $ systemctl status ssh #ssh 상태 보기
  $ sudo vim /etc/ssh/sshd_config -> Port 4242 #4242 포트 활성화
  $ sudo systemctl restart ssh #ssh 재시작
  ```
  * <img src="https://user-images.githubusercontent.com/52701529/128667562-48223a4c-081f-4086-95df-ade836be187f.png" width="500">

* UFW
  * UFW란? - Uncomplicated Firewall. UFW는 데비안 계열 및 다양한 리눅스 환경에서 작동되는 사용하기 쉬운 방화벽 관리 프로그램이다.
  * UFW 사용법 - https://webdir.tistory.com/206
  ```shell
  $ sudo apt install ufw #ufw 설치
  $ sudo ufw status verbose #ufw 상태 보기
  $ sudo ufw enable #ufw 활성화
  $ sudo ufw default deny #기본 incoming deny
  $ sudo ufw allow 4242 #4242포트 ssh연결 허용
  ```
  * ![image](https://user-images.githubusercontent.com/52701529/128667359-6c0559d5-6bc9-4a7e-9679-f957afee3f15.png)

* hostname 변경
  * hostname이란? - 인터넷에 접속된 수많은 컴퓨터들이 자신을 구별하기 위해 가지고 있는 것이 IP주소인데, IP대신 기억하기 쉽게 사용하는 것이 호스트네임이다. 
  * hostnamectl - https://zetawiki.com/wiki/%EB%A6%AC%EB%88%85%EC%8A%A4_hostnamectl
  ```shell
  $ hostname #현재 호스트네임 확인
  $ sudo hostnamectl set-hostname wil42 #호스트네임 변경
  $ hostname #바뀐 호스트네임 확인
  $ sudo reoobt #재부팅 시 바뀐 호스트네임을 확인 가능하다.
  ```
  * ![image](https://user-images.githubusercontent.com/52701529/128824567-42df6165-472a-444b-a090-3c59fc5a2592.png)

* group 추가
  * https://linuxize.com/post/how-to-add-user-to-group-in-linux/
  * Primary Group: 1개만 존재 해야 한다. 사용자가 로그인할 때, 파일 또는 디렉토리를 생성할 때 부여되는 기본 그룹이다.
  * Secondary Groups: 없거나 여러 개 존재할 수 있다. 사용자가 파일 또는 디렉토리를 읽거나 쓰거나 실행할 때 지정된 그룹들의 권한을 받는다.
  ```shell
  $ groupadd user42 #user42라는 그룹 추가
  $ sudo usermod -G sudo,user42 jihoh #jihoh가 속한 그룹을 sudo, user42로 변경. (-a(append)옵션 사용시 기존에 추가. 없이 사용시 그대로 변경)
  $ sudo usermod -g user42 jihoh #user42를 primary group으로 설정
  $ id jihoh #계정 정보 확인
  ```
  * ![image](https://user-images.githubusercontent.com/52701529/128673701-f78ef65a-4f08-4bd4-b89a-d58911b9a47c.png)

* 비밀번호 정책
  1. 30일 만료일
  2. 한 번 바꾸고 나면 2일 뒤에 변경 가능
  3. 만료 7일 전 경고메세지
  4. 최소 10자리 이상, 대문자 숫자 필수, 3개 이상 연속 문자X
  5. 유저 이름 포함X
  6. 이전 비밀번호와 최소 7자 이상 다르게
  7. root또한 동일한 정책 적용

* 비밀번호 정책 설정
  * /etc/login.defs - https://dgblog.tistory.com/121
  ```shell
  $ sudo vi /etc/login.defs
  PASS_MAX_DAYS 30 #만료일
  PASS_MIN_DAYS 2 #최소 사용일
  PASS_WARN_AGE 7 #경고 메세지
  PASS_MIN_LEN 10 #최소 글자수
  ```
  * ![image](https://user-images.githubusercontent.com/52701529/128830126-21314416-00e9-4e27-b710-2283b9fb1639.png)
  * /etc/pam.d/common-password - https://computingforgeeks.com/enforce-strong-user-password-policy-ubuntu-debian/
  ```shell
  $ sudo apt install libpam-pwquality cracklib-runtime #libpam-pwquality 설치
  $ sudo vim /etc/pam.d/common-password
  password    requisite      pam_pwquality.so minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 difok=7 reject_username enforce_for_root
  #minlen 최소길이 ucredit 대문자 =-1 최소 하나이상 dcredit 숫자 =-1 최소 하나 이상 maxrepeat 반복제한 difok 이전 비밀번호와 겹치는 글자 제한 reject_username 유저네임 포함 제한 enforce_for_root 루트에도 적용
  ```
  * <img src="https://user-images.githubusercontent.com/52701529/128835736-47923e4d-4782-497c-8d9b-d33ed8ebe04c.png" width="700">
  * 비밀번호 정책은 변경된 이후 계정부터 적용된다. 기존 계정들에 적용하기 위해 비밀번호를 만료시켜버린다.
  ```shell
  $ passwd -e [username] #passwd -e (expire) 비밀번호 만료 옵션.
  ```
  * /etc/login.defs 내용도 기존 계정들은 따로 적용해줘야 한다.
  ```shell
  $ sudo chage -m 2 -M 30 -W 7 [username]  #-m MIN_DAYS -M MAX_DAYS -W WARN_DAYS
  ```
  * <img src="https://user-images.githubusercontent.com/52701529/128839281-cd0742ce-23fa-4f4e-9ae7-ba53b682994f.png" width="400">

* 
  
  
