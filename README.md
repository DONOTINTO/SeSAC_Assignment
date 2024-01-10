> **새싹 도봉캠퍼스 IOS 개발자 과정 1기 (12월 23일 ~ ing)**

---
# `📖 목차`

- [SeSAC_Assignment_1226](#-sesac-assignment-1226)
- [SeSAC_Assignment_1228](#-sesac-assignment-1228)
- [SeSAC_Assignment_0102](#-sesac-assignment-0102)
- [SeSAC_Assignment_0103](#-sesac-assignment-0103)

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

---
## `❗ SeSAC Assignment 0105`
테이블 뷰를 만들어보는 과제로, 스토리보드와 코드로 진행했다.
테이블 뷰의 데이터를 삽입 삭제할 때 테이블 뷰를 다시 한번 호출하여 뷰에도 데이터가 삽입되고 삭제되는 로직을 구현했다.

button의 image를 selected에 따라 변경해주었는데, 이때 background가 원치않은 색상으로 자동으로 변경되는 문제가 있었다.
우선 iOS 15부터 적용되는 UIButton.Configuration을 통해 해당 문제를 해결할 수 있었다.

더 좋은 방법으로는 UIButton이 아닌 데이터 자체에 클릭 여부를 판별할 수 있는 프로퍼티를 생성하고, 해당 프로퍼티에 따라 .normal 상태에서 이미지를 변경해줄 수 있었다.

> **기간**

24.01.05

> **UIKit**
- UITableView
- UITebleViewCell
- UIButton.Configuration

> **키워드**
- 테이블 뷰 데이터 삽입/삭제

---
## `❗ SeSAC Assignment 0108`
테이블뷰에 전달할 데이터가 많아져서 이를 구조체로 만들었다.
생성한 구조체에는 데이터를 저장하고 테이블 뷰의 셀에 데이터를 담아주었다.

SPM을 통해 KingFisher 라이브러리를 추가하였다.
KingFisher를 외부 링크 이미지를 불러와 볼 수 있었다.

> **기간**

24.01.08

> **UIKit**
- UITableView
- UITableViewCell
- DateFormatter

> **Library**
- KingFisher

> **키워드**
- 테이블 뷰 데이터 삽입/삭제

---
## `❗ SeSAC Assignment 0109`
콜렉션 뷰를 통해 2열로 커스텀 셀을 보여주었다.
테이블 뷰와 다르게 FlowLayout을 통해 내부 설정들을 진행해주어야 했다.

아이템을 원하는 열만큼 보여주기 위하여 다음과 같이 수행했다.
collectionView의 Width에서 좌우 inset과 아이템별 interSpacing을 빼주었다.
interspacing은 내가 희망하는 열의 1을 뺀 값만큼 존재하기 때문에 interSpacing에서 row의 갯수 - 1을 해주어  곱해주었다.

```swift
//예시
let leftInset: CGFloat = 10
let rightInset: CGFloat = 10
let interSpacing: CGFloat = 15
let row: CGFloat = 3
let collectionViewWidth = collectionView.frame.width

let itemWidth = collectionViewWidth - leftInset - rightInst - ((row - 1) * interSpacing) 
```

collectionView의 너비가 확정되는 순간이 viewDidLoad가 아닌 view가 전부 그려진 viewDidAppear라는 점을 확인하여 해당 시점에 item의 크기를 결정해주었다.

> **기간**

24.01.09

> **UIKit**
- UICollectionView
- UICollectionViewCell
- UICollectionViewFlowLayout
- UICollectionViewLayout

> **Library**
- KingFisher

> **키워드**
- Delegate
- DataSource
- Nib / Xib
- View의 Frame.width가 정해지는 시점
