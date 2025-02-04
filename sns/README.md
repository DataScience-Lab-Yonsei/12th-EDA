## 영화 흥행 요인 분석   
#### 팀 구성원 : 송예원, 김지원, 김지은, 김경환
#### EDA 프로젝트 자료 소개
> * Dataset:
>   * [KOBIS 박스오피스 데이터](https://www.kobis.or.kr/kobis/business/stat/boxs/findDailyBoxOfficeList.do)
>   * 영화관 인스타그램 데이터 크롤링 : @cgv_korea, @megaboxon, @lottecinema_official
>   * 네이버 영화 데이터 크롤링 
> * [EDA 발표자료](24_2_DSL_EDA_SNS.pdf) : EDA 발표 때 사용한 ppt입니다.

<br>



## EDA 프로젝트 요약

1. 프로젝트 주제 및 목적
   
        - 박스오피스 데이터, 영화관 인스타그램 데이터, 네이버 리뷰 데이터를 활용하여 영화 흥행에 영향을 미치는 주요 요인을 분석.
        - 관객들이 선호하는 영화의 특징을 파악.
        - 효과적인 SNS 영화 홍보 전략을 모색. 

2. 데이터 수집 및 전처리

        - 2016~2024년 관객 수 100명 이상의 영화들에 대한 데이터 수집.
        - KOBIS 박스 오피스 데이터: 영화명, 개봉일, 매출액, 점유율, 관객수, 스크린수, 상영횟수, 국적, 배급사
        - 네이버: 영화의 등급, 장르, 러닝타임 
        - 네이버: 사용자 아이디, 별점, 관람평, 작성 날짜, 공감 수, 비공감 수
        - 인스타그램: 게시 날짜, 게시글, 좋아요 수
        - 결측치 처리: 삭제 또는 분포, 중앙값, 최빈값을 활용해 결측치 처리
        - 인스타그램 게시물: 영화 홍보 관련 게시물과 비홍보 게시물로 분류  

4. 분석 방법 및 결과
    
        - 배급사 순위별 영화 평균 평점 시각화: 모든 배급사에서 평균 평점은 7점 이상이며, 양의 상관관계는 확인되지 않았다.  
        - 배급사 순위별 평균 매출액 시각화: 1, 2순위 배급사의 평균 매출액이 현저히 높았다. 
        - 장르별 관객수 분포 시각화 및 검정: 장르별 관객수에 유의한 차이가 있는지 파악하기 위해 Kruskal Wallis 검정 진행. 그 결과, 장르별 관객수 의 중위값에 유의한 차이가 있다. 
        - 등급별 관객수 분포 시각화 및 검정: 등급별 관객수에 유의한 차이가 있는지 파악하기 위해 Kruskal Wallis 검정 진행. 그 결과, 등급별 관객수의 중위값에 유의한 차이가 있다.
        - 대표국적별 관객수 분포 시각화 및 검정: 대표국적별 관객수에 유의한 차이가 있는지 파악하기 위해 Kruskal Wallis 검정 진행. 그 결과, 대표국적별 관객수의 중위값에 유의한 차이가 있다.
        - Quantile Regression: 러닝타임과 평균 별점의 관객 수와의 관계를 파악하기 위해 Quantile Regression 진행. 그 결과, 두 변수 모두 관객 수와 양의 상관관계를 지니고 있다.

        - 연도별 인스타그램 게시물 수 및 좋아요 수 추이 시각화: 게시물 수는 매년 증가하고 있으나 평군 좋아요 수는 2020년까지 증가했다가 이후 하락하는 경향을 보였다. 
        - 해시태그 분석: 인스타그램 게시물의 해시태그를 분석하여 자주 등장하는 콘텐츠 유형을 파악. 그 결과, 주요 콘텐츠는 공식 캐릭터, 브랜드 홍보 콘텐츠, 이벤트, 영화 홍보 콘텐츠로 분류된다. 좋아요 수가 많은 콘텐츠는 영화 제목과 영화 배우 관련 해시태그가 주를 이뤘다.
        - 콘텐츠 유형별 비중 및 좋아요 수 분석: 영화 중심 콘텐츠와 브랜드 중심 콘텐츠로 게시물을 분류하여 연도별 콘텐츠 비중 변화를 시각화한 결과, 영화 중심 콘텐츠의 비중이 증가하고 있음을 확인. Kruskal-Wallis 검정을 통해 두 콘텐츠 유형 간의 좋아요 수의 중위값을 비교한 결과, 영화 중심 콘텐츠의 좋아요 수가 브랜드 중심 콘텐츠보다 유의미하게 더 많은 것으로 나타났다.
		    
5. 결론

        - 영화의 장르, 등급, 국적별 관객 수에는 유의미한 차이가 있다. 특히 액션/어드벤쳐/SF 장르, 12세 이상 등급인 한국 영화가 한국 관객들에게 더 선호되는 경향이 있다.
        - 영화의 관객수(상위 75%)는 러닝타임과 별점과 양의 상관관계를 갖고 있다.
        - 2020년 부터 감소하는 경향을 보이는 인스타그램 좋아요 수를 회복하기 위해: 영화 중심 콘텐츠의 양과 다양성을 확대하고, 브랜드 중심 콘텐츠를 대중들에게 더욱 매력적으로 전달할 수 있는 새로운 전략을 모색해야 한다.  
    
6. 한계점 
    
        - 결측치로 인한 데이터 제한: 크롤링 과정에서 많은 결측치가 발생했으며, 일부 데이터는 다른 값으로 대체하기 어려워 사용하지 않았기 때문에 분석에 활용할 수 있는 데이터 수가 제한적이었다.
        - 데이터의 왜곡: 대부분의 영화가 상업적으로 성공하지 않았기 때문에 데이터가 치우친(skewed) 경향이 있었다. 이로 인해 분석 결과가 특정 영화 그룹에 편중될 가능성이 있었다. 



<br>


