Quest
# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 강임구
- 리뷰어 : 최현우


# PRT(Peer Review Template)

- [x]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 1. local_reverse_word = word[::-1] # 문자열 뒤집기
    - 2. input_word = input("단어를 입력해주세요 : ") # 문장 Input 받기
    - 3. if local_reverse_word == word:
        print("입력된 단어는 회문입니다.")
          else:
        print("입력된 단어는 회문이 아닙니다.") # 회문 여부 판단하기
        - 해당 조건을 만족하는 코드를 캡쳐해 근거로 첨부
    
- [x]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - """
    def reverse_check(word): # 입력 단어 뒤집는다.
      local_reverse_word = word[::-1] # 입력 단어와 뒤집은 단어 비교 후 출력
      if local_reverse_word == word:
        print("입력된 단어는 회문입니다.")
      else:
        print("입력된 단어는 회문이 아닙니다.")
    """
    - [::-1]을 이용하여 문자열을 뒤집고, 뒤집은 문자열에 if문으로 조건을 달아서 회문 판단
    - 주석이 너무 정리가 잘 되어 있어서 많이 배우고 이해했습니다.
        
- [x]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
        """
    def main(): # 단어를 입력 받는다
      input_word = input("단어를 입력해주세요 : ")

      print("====================")
      print("입력값 :\n" + input_word) # 단어를 뒤집는다.
      reverse_word = input_word[::-1]

      print("\n")

      print("출력값 :")
      print("뒤집힌 단어는 : " + reverse_word) # 회문 판별 함수
      reverse_check(input_word) """
        - 추후 여러 함수를 만들 때 여러가지로 혼동이 올 수 있어서 쓰는 방법인 main함수
        너무 잘 작성하시고 복잡해졌을때를 체험하고 보고 배웠습니다
        
- [x]  **4. 회고를 잘 작성했나요?**
    """
    #코드 짤때 개념 먼저 인지하고 하나씩 코드를 그려나가는데
    #팀원인 최재혁님께서 간결하고 오류날 부분을 먼저 인지하고
    #수정할 부분을 알려주어 큰 어려움 없이 진행하였다.
    #함수 및 변수 선언시 에러가 일어날 경우를 대비해 기능마다 함수로 묶어서
    #오류날 부분을 최대한 잡는 부분도 배워서 신기했다.
    #하나씩 추출하여 대입하는 방법도 생각해보았지만 최대한 간결한 방식을 생각해내는것이
    #코딩을 좀 더 쉽게 하는 방법임을 느꼈다.
    #차후 인자 하나씩 추출하여 비교하고 결과를 도출해 내는 방법도 코딩해보겠다.
    """
        
- [x]  **5. 코드가 간결하고 효율적인가요?**
    - 함수 2가지로 구분하여 구조를 만들고 함수들도 심플하고 효율적으로 필요 기능만 작성하였습니다
    - 코드 참조
"""
def reverse_check(word):
  local_reverse_word = word[::-1]
  if local_reverse_word == word:
    print("입력된 단어는 회문입니다.")
  else:
    print("입력된 단어는 회문이 아닙니다.")

def main():
  input_word = input("단어를 입력해주세요 : ")

  print("====================")
  print("입력값 :\n" + input_word)
  reverse_word = input_word[::-1]

  print("\n")

  print("출력값 :")
  print("뒤집힌 단어는 : " + reverse_word)
  reverse_check(input_word)

main()
"""        


# 참고 링크 및 코드 개선
```
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```