늦었지만 차근히 진행

rails 설치

제일 먼저 vagrant를 설치한다.

vagrant 이전에 가상화(virtualization) 부터 정리(https://www.lesstif.com/pages/viewpage.action?pageId=24445417 에서 참조하였습니다. 감사합니다.)

가상화는 실제 HW가 있는게 아니라 SW를 통해서 가상의 HW를 세팅하고 개발을 진행하는 것. 실제 HW를 구매하고 이러기에는 물리적/금전적 한계가 있기때문에 이를 SW로 보완함. 이때, 이 SW를 Hypervisor라고 함(ex virtual boy, vmware, xen 등)

가상화를 통해서 다양한 OS와 애플리케이션을 논리적으로 분리할 수 있기에 복잡한 환경을 추상화 할 수 있는 좋은 방법이지만, 가상화를 통한 개발도 마찬가지로 개발 환경을 관리해야 하는 부담이 있음. 팀 단위 개발에서는 팀내 구성원들이 개발하고자 하는 애플리케이션의 개발환경을 통일시켜야 하는 작업이 필요함.

vagrant 는 개발환경을 통일시켜야한다는 번거로움을 해결하기 위해서 만들었다. 설정 스크립트를 기반으로 특정 환경의 가상 머신을 만들어서 빠르게 개발 환경을 맞추고 공유할 수 있게 만든 솔루션.

vagrant 설치는 강사님 github페이지에서 퍼왔고 이대로 진행.

#### versions

- [virtualBox](https://www.virtualbox.org/wiki/Download_Old_Builds_5_1) : 5.1.30
- [Vagrant](https://releases.hashicorp.com/vagrant/?_ga=2.237010176.1475687836.1513147132-756484628.1513147132) : 1.9.5
- [git for windows - git bash](https://git-for-windows.github.io/)

#### setting - vagrant

1. Windows에서 폴더 하나를 만든다. (vagrant 가상 환경과 windows와 공유하는 폴더가 될 예정임.)
2. 해당 폴더의 경로에서 git bash 창을 연다.

```
$ vagrant init
```

1. Vagrantfile이 생겼을텐데, 이를 수정하고 저장한다.(포트포워딩, host os 와 guest os간에 포트 번호를 맞추는 작업. 이작업을 수행하지 않으면 가상머신에서 만든 서버를 외부에서 접속할 수 없다.

   3000번 포트는 rails 기본 설정 port, 4567은 Sinatra 기본 설정 port

```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"	<< 구동하고자 하는 os
  config.vm.network "forwarded_port", guest: 3000, host: 3000 << 포트 포워딩
  config.vm.network "forwarded_port", guest: 4567, host: 4567 << 포트 포워딩
end

```

1. 가상 환경을 만든다.

```
$ vagrant up
```

1. 가상환경에 접속한다.

```
$ vagrant ssh
```

1. 가상머신에 접속된 상태에서 공유폴더에 접근한다.

```
$ cd /vagrant
```

#### setting - vagrant 내 루비 개발 환경

> 루비버전은 2.3.5로 맞춘다.

**아래의 코드들은 반드시 가상 환경 내에서 입력해야합니다.** git bash 창에서 `ubuntu@ubuntu-xenial:~$` 확인!

```
$ vagrant ssh
Welcome to Ubuntu 16.04.3 LTS (GNU/Linux 4.4.0-103-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

0 packages can be updated.
0 updates are security updates.


Last login: Wed Dec 13 07:26:42 2017 from 10.0.2.2
ubuntu@ubuntu-xenial:~$

```

1. 아래의 코드를 git bash 창에 복붙한다. **반드시 vagrant 환경 내에서** 

```
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs yarn
```

1. 한번 더 한땀한땀.. git bash 창에.. (rbenv 설치작업)

```
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.3.5
rbenv global 2.3.5
ruby -v
```

1. 한번 더! git bash 창에..(gem : ruby 라이브러리, bundler :  rails에서 의존성 관리를 위해서 사용)

   새버전의 ruby를 사용할 때마다 bundler를 새로 설치해줘야 한다.

```
gem install bundler
rbenv rehash
```

추가적으로, git 설정을 vagrant 환경에서 다시 해줘야합니다.

```
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR@EMAIL.com"
```

ruby on rails 설치(vagrant 에서 진행해야함.)

```
nodejs 설치(rails는 의존해야할 sw가 많아서 nodejs 가 필요하다.)
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
```

```
gem install rails -v 4.2.9
rbenv rehash
rails -v
# Rails 4.2.9
```

rbenv를 이용해서 ruby나 rails를 설치를 하면 꼭 rbenv rehash 명령어를 통해 설치된 내용이 적용되게끔 해줘야한다.



설치중에 궁금한거

rbenv : ruby 버전 관리를 위한 프로그램, 하나의 시스템에서 여러가지 버전의 ruby를 관리해줄 수 있는 친구(rvm도 있음), 버전관리 프로그램 없이 여러 ruby를 진행할 경우, 버전차이로 인해서 충돌이 일어나거나 이전에 개발한 프로그램이 동작안할 수 있기 때문에 설치해두는것이 편하다. - ruby 버전관리를 위해서 참조할 사이트 : http://bigmatch.i-um.net/2013/12/04/%EB%A9%98%EB%B6%95%EC%97%86%EC%9D%B4-rvm%EA%B3%BC-%EB%A3%A8%EB%B9%84-%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0/
