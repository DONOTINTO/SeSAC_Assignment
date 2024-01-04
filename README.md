> **새싹 도봉캠퍼스 IOS 개발자 과정 1기 (12월 23일 ~ ing)**

---
# `📖 목차`

- [SeSAC_Assignment_1226](#❗-sesac-assignment-1226)
- [SeSAC_Assignment_1228](#❗-sesac-assignment-1228)
- [SeSAC_Assignment_0102](#❗-sesac-assignment-0102)
- [SeSAC_Assignment_0103](#❗-sesac-assignment-0103)

---
## `❗ SeSAC Assignment 1226`
> **기간**
   
23.12.26 ~ 23.12.27

UITabBarController와 UINavigationController를 적용해보고, 간단한 Nexflix UI를 StoryBorad로 구현했다. AutoLayout을 사용하진 않았다.   
SignUpViewController의 switch 액션 이벤트에 애니메이션 반응을 추가해보았다.

> **UIKit**
- UITabBarController
- UINavigationViewController
- UIView.animate

> **구현 내용**
- SignUpViewController의 Switch를 반응에 따라 오브젝트의 transform을 애니메이션을 이용하여 반응하도록 구현하였다.

---
## `❗ SeSAC Assignment 1228`
**신조어 검색기**   
신조어와 해석을 Dictionary로 key와 value로 저장하여 신조어를 검색하였을 때, 그에 해당하는 해석이 화면에 띄워주었다.

> **기간**

23.12.28

> **키워드**
- Dictionary

---

**네이버웹툰 UI**   

AutoLayout을 이용하여 어느 기기에서도 동일한 비율로 볼 수 있도록 UI를 구성하였다.   
UIScrollView를 활용하여 요일 선택 부분을 구현하였고, 이에 UITapGestureRecognizer를 활용하여 요일별로 새로운 웹툰이 보여지도록 하였다.

> **기간**

23.12.30 ~ 24.01.01

> **UIKit**
- UIScrollView
- UITapGestureRecognizer

> **키워드**
- AutoLayout
- UITapGestureRecognizer

---
## `❗ SeSAC Assignment 0102`
간단한 UIImagView와 UILabel을 AutoLayout을 설정해주었다. 각 이미지를 클릭하면 클릭 횟수한 횟수를 노출시켜준다.   
클릭 횟수는 UIView가 기본적으로 가지고 있는 Tag기능을 이용하여 구현하였다.   
클릭 횟수가 10회를 달성하면 Alert창으로 과제 달성 알람창을 띄워주었다.   
Image를 클릭했을 때 Scale을 키웠다 줄여주는 애니메이션을 추가해주었다.   

> **기간**   

24.01.02

> **UIKit**
- tag
- UIAlertController
- UIAlertAction
- UIView.animate

> **키워드**
- CGAffineTransform

---
## `❗ SeSAC Assignment 0103`
입력한 값에 맞추어 BMI 수치를 Alert창으로 보여준다.
UITextField에는 다음과 같은 조건들이 있다. 
1. 범위
2. 숫자만 입력
3. 최대 3자리까지 입력

이에 맞추어 로직을 짜고 switch문 대신에 기존에 안써보았던 if case를 적용해보았다.
그 외 새로 적용해본 기술은 없었고 로직을 최대한 깔끔하게 작성해보려고 노력했다.
범위를 지정했으니 최대 3자리 입력 제약은 굳이 안넣어도 됐을 것 같다.

> **기간**

24.01.03

> **UIKit**
- UIAlertController
- UIAlertAction

> **키워드**
- AutoLayout
- UITapGestureRecognizer
- if case / guard case
- Enum