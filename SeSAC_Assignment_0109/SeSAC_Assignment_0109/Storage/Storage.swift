//
//  Storage.swift
//  SeSAC_Assignment_0109
//
//  Created by 이중엽 on 1/11/24.
//

import Foundation

class Storage {
    static let shared = Storage()
    
    private var cityInfoList: [City] = [
        City(city_name: "방콕", city_english_name: "Bangkok", city_explain: "방콕, 파타야, 후아힌, 코사멧, 코사무이", city_image: "https://i.namu.wiki/i/OUKHuXT-QXe-wDgGE_9hMfEW9Sb3lyMWl0SSbpTQyfl0Lw3rs_A_DuVyXBNXTFG3FUkfmy7hBjL68dgLzssEQg.webp", domestic_travel: false),
        City(city_name: "오사카", city_english_name: "Osaka", city_explain: "오사카, 교토, 고베, 나라", city_image: "https://i.namu.wiki/i/IyejHd9WlEd118tJq1coTwS4RpkaqIY0JhPbbiVX6WWpkkoWbLK-R4DkPg8GN4cLvm0RmhWuBTrY7HymFxoUhFY48GKKxnmzsXNu7VZBO2x1y9wsOizxOxb0ngLmTqjQeZVd4pgySwBDqRvoc9LYsw.webp", domestic_travel: false),
        City(city_name: "다낭", city_english_name: "Danang", city_explain: "다낭, 호이안, 후에", city_image: "https://i.namu.wiki/i/skBWgWUvf6QsFa_GV-falaAW6bO-g1FDlSTTL8AHZ-WfRdDVwpll5AR29N4oPl1H0SMqIAP87clppdEpmGdrwVEFAAT47BUVNCk02OrN9S7a1m3o4AKoEFO1UUTUvtO02mFV2tCOAz9l32hWwKDESA.webp", domestic_travel: false),
        City(city_name: "제주", city_english_name: "Jeju", city_explain: "제주, 섭지코지, 성산일출봉", city_image: "https://i.namu.wiki/i/nqsYz3MRqmLeTyfn2eYJ6mqriV9QzpeiibJH-TeoTVtdBlmQNHq_NaN1W0TSSpQGzdOgELdlutXXior-k7MOstBNO2uQ-JI1pjLFecNfBU5is8P4FTaRDGe95uGw1SEY-5x7SDXuLIcL_ZkXXg5n5Q.webp", domestic_travel: true),
        City(city_name: "부산", city_english_name: "Busan", city_explain: "부산, 해운대, 마린시티", city_image: "https://i.namu.wiki/i/ChOLr6xQTP_GEX3bn3aADywR6uqitf3qcrIn6gb_Xrd6oXEofXHSS9kezFOvdPQfsDrXSZG9rv3wPcmzAdg5aWsKFF9CKmzPadMSLeY8TtR-XOLkGIxA0gaoFG3tDyQobEEfdOwXtjoMuTpx1NGrbA.webp", domestic_travel: true),
        City(city_name: "파리", city_english_name: "Paris", city_explain: "파리, 베르사유, 몽생미셀, 스트라스부르", city_image: "https://i.namu.wiki/i/wc6IdjDNOFVBMcUOM5ZHLXEf8GXJ8Il1ODw2OMwaj4rrwetPT6bKzQ4fSM0PJgOHy-OBzfeAY3QEKpgTUY3vYQWW3QqG3X67SURJaFF9ejRnM5c-5DP8c_sIoQapUiCOdf0NnSzzbBpk5GYgNFy_qg.webp", domestic_travel: false),
        City(city_name: "시드니", city_english_name: "Sydney", city_explain: "시드니, 블루마운틴, 울릉공, 뉴캐슬", city_image: "https://i.namu.wiki/i/wUpNMYJ19X-xa_RO--yl9f17Mn1YTXGaE_dgBCYEdRaWSBQFgKngoEH29t2B__YR_B_YGpTOagI51X0XPIp9UWPtDE7gT-pPekRlQx6TWjBOxgmgjx2vDo0U6-mrXVoKVJOVEr99RLASIo1yVV4nMg.webp", domestic_travel: false),
        City(city_name: "전주", city_english_name: "Jeonju", city_explain: "전주, 한옥 마을, 오목대, 경기전", city_image: "https://i.namu.wiki/i/kTgE66pI-V9jxhv1LtYHrV7D8pxl235sTSTQT_V196jpDzNoQiFZ_TDx-TM7ZEuk4agrxMPHxVPdSAQykKb15HSM3w45zayebVV5ad0XRgqnU8I79-tCml1aNWUp5rlwKDrqHERUk1GhRfKQ9HZQqQ.webp", domestic_travel: true),
        City(city_name: "밀라노", city_english_name: "Milano", city_explain: "밀라노, 꼬모, 베로나, 베르가모, 시르미오네", city_image: "https://i.namu.wiki/i/MuwqS_NUm9LN3RVXoy3tJ3E4mNgLEig_RYlv2A6Cmj2-3yfIGz1uLFWyp5ui3IQSHk-jB3NZzmHkD2hKG_Efpz3ffA0-_Qk8Yfr-QtY8j1oQFQqyGvkQwyvVr8lLSj75CoJDqVYIsI8D0iSOG2Khnw.webp", domestic_travel: false),
        City(city_name: "리스본", city_english_name: "Lisbon", city_explain: "리스본, 신트라, 카스카이스, 오비두스", city_image: "https://i.namu.wiki/i/ofDtId7rfgbvVHFjIlteit-5guTlOAHZRt_KoRQWihjaPlQAJyiyPpHeo8PrbcucsKOJGHF4Bkgw9arMc73emoEcN-4BQtS-SMmB4F6YRTHHMlFZkYcNY4QLK6rf7keZBKxLjcLG9KxPnewNgWWeXQ.webp", domestic_travel: false),
        City(city_name: "서울", city_english_name: "Seoul", city_explain: "서울, 남산타워, 롯데타워, 경복궁", city_image: "https://i.namu.wiki/i/OqH4Z-L3mVvFW_LywHFnzml3B_VaaAYH9l96FYvND7IHGkIWnpPSTrKZVAOCpJ1-FqBkimHoJJGxyw-BCIfAc2S4DyNeNYGTE2g_cVFOAeu075px_eLHUD9aD9cQaS_SUtBy8H6eH-3gzFaoWbM0sw.webp", domestic_travel: true),
        City(city_name: "두바이", city_english_name: "Dubai", city_explain: "두바이, 아부다비, 알 아인", city_image: "https://i.namu.wiki/i/va-qL9TI8xsD41Z8NGdUPbyn0iE31CLC6kyo3zlKBS7oOEIQP-sbaTgt0AvidSB0qKEzjIimELccA7-P5uGO0cNvrA58GSGFCUDGrEeRN6DV-XOvWH6cx-PeGtaUHZNQGNenD6tjKaECf6T-0RyrnQ.webp", domestic_travel: false),
        City(city_name: "홍콩", city_english_name: "Hongkong", city_explain: "홍콩, 마카오", city_image: "https://i.namu.wiki/i/KZHwVRPLz9qWyNsltipcSqdZ1OIQ3hiM7C1GHp2jg1iiLxhgovAeXIY_DJEtZ8mUA3PJR-U0T3fbzcnmtqDFj-Tg9NIrdJe1rbi7ICAjVF9y4D1Km3XFLpQ7V4K7U2ANFH8CjF1yeh1XUmGT4IPJWQ.webp", domestic_travel: false),
        City(city_name: "토론토", city_english_name: "Toronto", city_explain: "토론토, 나이아가라, 킹스턴, 블루마운틴", city_image: "https://i.namu.wiki/i/I7os9ysTEyBl4sVe-9AN-dHFmJ95e0j3P03DIQiVwIrLOi_RAbo311TdKiRFb0LMyUkbhAPzASfH6JR25cVXj3vYNR2S9koQBZsWrEitWWRe855pPYigkUFUvXGDn1xTF2jxneC4NRl7zcRY5_iBRA.webp", domestic_travel: false),
        City(city_name: "대전", city_english_name: "Daejeon", city_explain: "대전, 성심당", city_image: "https://i.namu.wiki/i/fFklvoNy6HqB2XtGHad8aZ9zItaH-ow-H97JlYV5OvgYHWgOfjiL4OPB_7UWLbKdQhJXlIrxs1Q25WomVNz1McMgUZmlME4OpNOI1KUMrOkR05LWsoU7PfXLI_EOKZdy6PCx9Bu7JBNTLbDn8RvdQA.webp", domestic_travel: true),
    ]
    private var travel: [Travel] = [
        Travel(title: "하나우마 베이",
               description: "아름다운 자연을 감상할 수 있는 스노쿨링 명소",
               travel_image: "https://i.namu.wiki/i/sjSC1PqQU2NHmqbNLaxTX2Xjv3ECYheHBXExDxRamD_6pAqrHzON38uux4NPc0VPH_ABevlB5kDanGj-CeTiYHPGn6qVd7JvMGE6rFc-7_pJhYeSdOQO6L44SS2bfknDzvmXFtQxkjzy7wXEM40JRQ.webp",
               grade: 4.8,
               save: 6932,
               like: false,
               ad: false),
        Travel(title: "쿠알로아 랜치",
               description: "광활한 대자연에서 즐기는 다양하고 재미있는 액티비티",
               travel_image: "https://i.namu.wiki/i/cWabj0szWX0yD_vPCE9MM_Ny0H_Zw6FcysfLSbUnKGGx2DG-_texH3FQf_vy99oKmjhn_GR77kEzisESnahWb2DDZrjccEFuU6iAB_eYV2HMaZz9YQs1H4iVrVu925ngEGBp7qLwMSSv3K8bUJs9Pg.webp",
               grade: 4.9,
               save: 5167,
               like: true,
               ad: false),
        Travel(title: "알라 모아나 센터",
               description: "하와이 최고의 쇼핑 명소",
               travel_image: "https://www.myhawaii.kr/advertorial/img/AMC/masthead.jpg",
               grade: 3.8,
               save: 8262,
               like: true,
               ad: false),
        Travel(title: "와이키키 비치",
               description: "세계적으로 유명한 하와이 최고의 해변",
               travel_image: "https://i.namu.wiki/i/U6gL8dUEwsRQYiKwagIfKVYWTqBKA-Oe-8pUIJlJCnQhZS1mYv-5IgHZQOVI2oXMWRIZIKPCvA5k00h9tufAoH7827XeWBq-NIKC2fE4uOC1UxNM3Mtp_quN82akLNercZ3LBhSAmOi6agnzoakPcA.webp",
               grade: 4.2,
               save: 7892,
               like: true,
               ad: false),
        Travel(title: "하와이 여행을 가고싶다면?\n수업이 있는데 가실 생각은 아니시죠?",
               description: nil,
               travel_image: nil,
               grade: nil,
               save: nil,
               like: nil,
               ad: true),
        Travel(title: "철도 박물관",
               description: "일본 철도의 역사를 둘러볼 수 있는 박물관",
               travel_image: "https://i.namu.wiki/i/QbfDshpU0_RAX5w6Wx_gflwo2JG-Fa7OH1gwSxc3xTplO4kY6rf_o2vi4dJ0btNR6znaB8vMmkBncBmEpjr2kAonlImc7ysO3veNxDzrTmm2wo7qSKEgHZqxHNcgAqv1jLUmY2l6C5iWacgwFK7UAQ.webp",
               grade: 2.8,
               save: 3,
               like: false,
               ad: false),
        Travel(title: "도쿄 디즈니랜드",
               description: "월트 디즈니가 창조한 동화 속 세상",
               travel_image: "https://i.namu.wiki/i/LMFkAgQwYBz1tZwX-vdWQ5f8SIFlOzoQ0Nuvp9lr2eirv4-L3HLndy1rdeXmqEhmipuSm0T_z-9KshjThBoSOgpZdCz3E6xHL60hCXGgYtlA-DJ9bR6WxD3gLuwvqorHcoCCIt7fcAzORtKpTvgLtg.webp",
               grade: 4.7,
               save: 26076,
               like: true,
               ad: false),
        Travel(title: "도쿄 타워",
               description: "아름다운 전망을 즐길 수 있는 도쿄의 상징",
               travel_image: "https://i.namu.wiki/i/qgypLbTR2WkbB1KHYEshGDoLlHvJ8tEYUHG_v0hUwA56lC6xlfETeT865gTCX9cTZ0HooCYxUpAsfRVbDxf66SE8SslBc0jGvvaQDWxP9q-TnhhYRSq6SYlwDfna6LUI4jWtHdmrJOK6gsRSVwHQ5A.webp",
               grade: 4.1,
               save: 37077,
               like: false,
               ad: false),
        Travel(title: "도쿄 여행 예약은?\nXCode로 직접 예약앱을 만들면 되겠네요!",
               description: nil,
               travel_image: nil,
               grade: nil,
               save: nil,
               like: nil,
               ad: true),
        Travel(title: "동문 재래 시장",
               description: "먹거리와 생활용품을 판매하는, 제주에서 가장 큰 시장",
               travel_image: "https://i.namu.wiki/i/3suJ2tLVP9aL1ZuNI7WoU0PD7Ccat96mukf2GKUJynYyDpatCWlHbAmgceDHWoZBUTwxdn98Yz1rhDkSVXk3sg.webp",
               grade: 4.0,
               save: 67696,
               like: true,
               ad: false),
        Travel(title: "제주 국제공항",
               description: "면세점이 있어 더욱 사랑받는, 제주 여행의 시작과 끝을 함께하는 공항",
               travel_image: "https://i.namu.wiki/i/0RxtEa3ytZ-rQ_N4xBh2ZuXG7p4Y8kyWoCoQwW2kfvxUSFbqvWBwbHG9G71bnAz4MJ58676pOOvjsZe-ag0SPQ.webp",
               grade: 4.8,
               save: 18817,
               like: true,
               ad: false),
        Travel(title: "서귀포 매일 올레 시장",
               description: "다양한 농수산물, 잡화, 먹거리를 판매하는 재래 시장",
               travel_image: "https://i.ytimg.com/vi/bHKeV2WD-Is/mqdefault.jpg",
               grade: 3.9,
               save: 45399,
               like: false,
               ad: false),
        Travel(title: "성산일출봉",
               description: "유네스코 세계 자연 유산에 등재된, 제주 최고의 일출 명소",
               travel_image: "https://i.namu.wiki/i/YJi27t5UpaCKJbe1TncjPUHqMvERvg9U_GJ9crPGaj3I5zITrIju605hdZI6AKjcKWPd1Zdz4nEiA42ODy6zJA0AWsqd57n9nGgXziBkVdTRaJDp0cm_WJq_Rh33RypS_zDHDZFULMx2Dc8triymnw.webp",
               grade: 4.9,
               save: 44507,
               like: true,
               ad: false),
        Travel(title: "제주 비행기 최저가! 예약 문의는 취업부터!",
               description: nil,
               travel_image: nil,
               grade: nil,
               save: nil,
               like: nil,
               ad: true),
        Travel(title: "도봉 캠퍼스",
               description: "Jack님과 함께하는,\n우당탕탕 iOS 개발 성장기!",
               travel_image: "https://i.namu.wiki/i/5UX2TOfPumdE86BaCcWNMR-ER8cmC516gcItb9ECxBDvwQNG11H3hAfW7qVs7ceMKMNawSap7JuuaF21pX4KFg.webp",
               grade: 5.0,
               save: 30,
               like: true,
               ad: false),
    ]
    
    func getCityAllList() -> [City] {
        return Storage.shared.cityInfoList
    }
    
    func getDomesticCityList() -> [City] {
        return Storage.shared.cityInfoList.filter { $0.domestic_travel == true }
    }
    
    func getOverseasCityList() -> [City] {
        return Storage.shared.cityInfoList.filter { $0.domestic_travel == false }
    }
    
    func getTravelList() -> [Travel] {
        return Storage.shared.travel
    }
    
    func setTravelLike(_ idx: Int) {
        Storage.shared.travel[idx].like?.toggle()
    }
}


