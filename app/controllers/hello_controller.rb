# coding : utf-8 << ruby 표준 문자 코드
'''ruby 1.9 까지는 멀티바이트 문자열을 사용하면 문자열을 읽을 때 예외가 발생할 수 있다.
그래서 magic comment를 써줘야하지만 2.0 이후에서는 사용할 필요가 없다.
'''

#모든 controller는 ApplicationController를 상속해줘야함.
#ApplicationController는 controller의 기본적인 기능을 제공하는 클래스
class HelloController < ApplicationController
  #def index
    #render text : value  //value : 출력하려는 문자열
    #controller는 출력 값을 직접 생성하면 안되지만 이 방법은 debug 용도이기때문에 예외적으로 사용
    #여기서 바로 출력하려면 아래를 입력하면 된다.
    #render text: 'Hello World..!'
  #end
  def view
    #액션 메서드에서 꼭 필요한 것 -> 템플릿 변수 !!!!!
    #템플릿 파일에서 사용할 수 있는 변수, 액션 메서드에서 데이터를 뷰로 전달할 때 사용
    #이것을 통해서 view - controller가 연결됨
    #rails에서는 인스턴스 변수로 템플릿 변수 역할을 할 수 있음.
    @msg = 'Hello World..!'
    #원하는 템플릿을 지정하기위해서는 다음과 같은 구문을 사용
    #render 'hello/special' -> hello/special.html.erb를 호출
  end
end
