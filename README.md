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

## 자료 정리
* Debian
  * 데비안(영어: Debian)는 데비안 프로젝트가 개발한 자유(free) 컴퓨터 운영 체제이다.
  * 데비안은 안정성과 보안에 중점을 두며 사용자 편리성이 강한 우분투등 다른 많은 리눅스 배포판의 기반으로 쓰이고 있다.
  * 현재 버전: 10.0	커널: 4.19

* CentOS
  * 센트OS(영어: CentOS)는 센트OS 프로젝트에서 레드햇 제휴로 개발한 컴퓨터 운영 체제이다.
  * 업스트림 소스인 레드햇 엔터프라이즈 리눅스와 완벽하게 호환되는 무료 기업용 컴퓨팅 플랫폼을 제공할 목적으로 만들어진 리눅스계 운영 체제 가운데 하나다.
  * 현재 버전: 8.0-1905	커널: 4.18.0-80

* AppArmor

* aptitude / apt 차이
  * 패키지관리 프로그램(apt, dpkg, aptitude)의 한 유형이다.
  * |apt(Advanced Packaging Tool)|aptitude|
    |-----|------|
    |코어 라이브러리와 함께 동작하는 자유 사용자 인터페이스로, 데비안 GNU/리눅스 배포판 계열 배포판에서 소프트웨어를 설치하고 제거하는 일을 한다.|APT의 프론트엔드 프로그램이다. 앱티튜드는 소프트웨어 패키지의 목록을 보여주고, 사용자가 패키지를 능동적으로 설치 혹은 삭제하도록 허용한다.|
    |APT는 이진 파일로부터나 소스 코드 컴파일을 통하여 소프트웨어 패키지의 확인·구성·설치를 자동화함으로써 유닉스 계열 컴퓨터 시스템 상의 소프트웨어를 관리하는 작업을 단순하게 만든다.|앱티튜드는 특히 유연한 검색 패턴을 지원하는 검색 기능을 가지고 있다. 원래 데비안을 위해 개발되었지만, RPM 패키지 매니저 (RPM) 기반 배포판에서도 등장한다.|
  * dpkg와 APT의 경우 제대로 사용하기 위해서는 좀더 많은 지식을 요구한다. 그에 비하여 aptitude의 경우 주요 패키지 작업 과정을 자동화하여 가능한 쉽게 작업할 수 있도록 해주므로 보다 쉽게 할 수 있다.
  * https://unix.stackexchange.com/questions/767/what-is-the-real-difference-between-apt-get-and-aptitude-how-about-wajig
  * http://www.songtory.com/post/001003/1/245
  * ![image](https://user-images.githubusercontent.com/52701529/128633364-9231fd14-be61-48f3-b24b-149c40a69ec8.png)

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
