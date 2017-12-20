rails 새 프로젝트 생성

rails new appName [options] // appName : 프로젝트 이름, option : 옵션



bundle install

gem을 gemfile에 등록하는 것만으로 사용할 수 있는게 아니다. bundle install 명령 통해서 실제로 적용될 수 있게끔 해야한다.



rails server 실행
rails server [server][] [option]
rails s

<option>
-p : port
-b : binding(ip address),  - 기본 0.0.0.0
-c: config file, 
-d: Demonize server, 
-u: Enable debugger, 
-e: Change the environment, 
-P: Specify a PID file



가장 기본인 hello world 출력을 위해서는 controller와 view를 작성해야한다.

controller는 application에 대한 특정 request를 받아서 처리하는 역할

view는 받은 정보를 사용자가 읽을 수 있는 형태로 표시하는 것 

routing은 request를 어떠한 controller에 보낼 것인지를 결정하는 역할, 요청에 대해서 어디서 처리할것인지를 지정, routing으로 호출해야할 controller와 action결정, /config/routes.rb에 정의

여기에서 view는 controller가 작성한 정보에 대해서 출력만 하는 역할이지 다른 작업이 생기면 안된다.



controller 작성

rails generate controller [name][] [option] 	//name : 컨트롤러 명, option : 옵션

완료되면 /p1/app/controllers/hello_controller.rb 에 controller 파일이 생성된다.

controller 이름 규칙

controller class : 앞글자는 대문자로 뒤에 Controller라는 글자를 붙임

controller 파일 명 : 클래스 이름을 소문자로 만들고 _ 로 구분 ex) hello_controller.rb

helper 파일 명 : 이름 뒤에 _helper.rb

test 스크립트 이름 : 이름 뒤에 _controller_test.tb



view 작성

최종적인 출력은 ERB(Embedded Ruby)를 사용해서 출력하는 것이 기본

ERB 템플릿은 HTML 기반에 Ruby script를 삽입한 구조.

Ruby 스크립트를 넣어서 조건, 반복등을 자유로이 적용 가능.

View helper를 사용해서 DB에서 추출한 데이터를 기반으로 링크 또는 입력 양식 요소 들을 간단히 생성 가능.

템플릿을 이용하려면 controller class를 만들어야함.

템플릿 파일은 /app/view/(controller 이름)/<액션 이름>.html.erb 로생성

템플릿 파일에 ruby 스크립트 넣을 때

<% [코드] %> or <%= [return 식] %>로 넣는다.