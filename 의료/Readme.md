## Project name
### [의료] 고령화 실태 및 치매 심층 분석

팀장 권구희  
팀원 박수빈 박종락 백민경 신영균


## Project Overview

<p align="center">
  <img src="https://github.com/user-attachments/assets/42d41c0c-b409-42ba-b235-1c3f6c595c9b" alt="Image 1" width="45%"/>
  <img src="https://github.com/user-attachments/assets/50a8f570-4f4d-4c92-8c4d-fb69dd6ed63b" alt="Image 2" width="45%"/>
</p>



점점 심해지는 한국의 고령화 및 그에 따라 증가하는 치매 현황을 다양한 데이터 분석 기법을 통해 분석 

#### keywords : 고령화, 치매, 노인질환, 의료, 의료인력

## Project content

1. 고령화 인구 분석
2. 노인 질환 분석
3. 치매 라이프 로그 데이터 분석
4. 의료 인력 및 기관 분포 분석

### 고령화 인구 분석
<p align="center">
  <img src="https://github.com/user-attachments/assets/690ab644-7ebf-4307-bea5-db58310e9064" alt="Image 1" width="45%"/>
  <img src="https://github.com/user-attachments/assets/76adb2e0-c213-4fe0-86bc-6c788cd19f53" alt="Image 2" width="45%"/>
</p>
LSTM (Long Short-Term Memory) 모델을 사용하여 향후 30년간 노인 인구 비율을 예측했을 때 한국은 초고령사회에 근접해 있으며, 2047년까지 노인 인구 비율이 50%를 초과할 것으로 예상  
이렇듯 고령화는 심각한 사회적 문제이며 이에 따른 부과적인 사회 문제를 야기, 특히 노인 질병에 집중해 분석을 시작했습니다.

### 노인 질환 분석
노인에게 영향을 미치는 다양한 질병의 유병률과 영향을 분석  
<p align="center">
  <img src="https://github.com/user-attachments/assets/a4772f00-30a2-47a3-b334-633ac615be2e" alt="Image 1" width="45%"/>
  <img src="https://github.com/user-attachments/assets/580a21d6-1eda-49ab-9f45-a29255a464f0" alt="Image 2" width="45%"/>
</p>
치매의 발생률은 연령이 증가할수록 급격히 증가하며, 여성에게서 더 높은 비율로 나타남을 확인    



특히, 나이와 치매 발생 간의 상관관계가 80%에 달하기 때문에 우리는 치매를 중심으로 분석을 진행했습니다.  

### 치매 라이프 로그 데이터 분석

[AI Hub 치매 데이터셋](https://aihub.or.kr/aihubdata/data/view.do?currMenu=115&topMenu=100&aihubDataSe=realm&dataSetSn=226) 을 이용한 치매 환자
분석을 수행했습니다. 해당 데이터셋은 웨어러블 기기에서 수집한 치매 단계별 수면 및 활동 패턴과 관련된 변수들을 포함하고 있습니다.

<p align="center">
  <img src="https://github.com/user-attachments/assets/f440cf64-a029-453a-b1b0-8c2bc311bfbb" alt="Image" width="40%">
</p>


경도인지장애(MCI) 환자는 47명, 인지정상(CN) 환자는 85명, 치매(Dem) 환자는 9명으로 구성되어 있는 데이터셋 입니다.
<p align="center">
  <img width="350" alt="image" src="https://github.com/user-attachments/assets/82fb15bb-7742-497a-ab17-1dcb1410803e">
</p>


활동 및 수면 변수들 간의 관계를 분석한 결과 비활동시간과 수면은 양의 상관관계를 가짐을 확인했습니다.

<img width="831" alt="image" src="https://github.com/user-attachments/assets/ab791d7b-8f02-4e95-8663-1c59f8a268fb">


특히 치매군은 다른 그룹에 비해 활동 수준이 낮고 수면 시간이 증가했습니다. 활동 시간과 가벼운 운동 시간 등에서 그 차이를 두드러지게 확인 할 수 있습니다.
<img width="858" alt="image" src="https://github.com/user-attachments/assets/d1f05c5f-f430-4f15-87bc-bb5c2f62fcca">


#### 검정실시

시각화로 차이를 알아볼 뿐만 아니라, 정확하게 집단간의 차이가 있는지 알아보고자 통계적 검정 실시했습니다


정규성을 만족하지 않아, 비모수적 방법인  Kruskal-Wallis test  사용

그래프에서 가장 많은 차이를 확인할 수  있었던 다섯개의 변수를 확인하였고, 아래는 그 결과 입니다.
| Variable        | H-statistic | p-value  |
|-----------------|-------------|----------|
| 휴식시간          | 8.659603    | 0.013170 |
| 가벼운 수면시간    | 9.051453    | 0.010827 |
| 뒤척임 비율       | 7.095563    | 0.028788 |
| 수면 시기 점수    | 6.685152    | 0.035346 |
| 깊은 수면 점수    | 6.057222    | 0.048383 |

결론적으로 정상, 경도 인지 장애, 치매 세 그룹 간에 활동 및 수면 변수에서 유의미한 차이가 있다는 것을 확인할 수 있었습니다.


어떤 그룹끼리의 차이가 있는지 더 정확히 확인해보기 위해 Dunn’s test를 수행하였고, 아래는 일부 결과입니다.

| Dunn’s test : Activity Rest | 정상 | 치매 | 경도 치매 |
|------------|------|------|-----------|
| **정상**   | 1    | **0.0033** | 0.7045    |
| **치매**   | **0.0033** | 1    | **0.0082**  |
| **경도 치매** | 0.7045 | **0.0082** | 1         |

대부분의 변수에서 정상과 치매 사이에 뚜렷한 차이를 볼 수 있었습니다. 더 자세한 분석은 ppt를 참고해 주세요.

#### 결론적으로 치매 환자는 다른 그룹에 비해 활동 수준이 낮고 수면 시간이 증가함을 확인할 수  있었습니다



### 의료 인력 및 기관 분포 분석
#### 그렇다면, 이런 치매 환자를 위한 의료 인력과 시설은 충분할까요? 

<p align="center">
  <img src="https://github.com/user-attachments/assets/6cfff8a8-5d7f-4040-92c8-128056a34e8e" alt="Image 1" width="48%">
  <img src="https://github.com/user-attachments/assets/ba07c21a-bc96-4d78-bac8-42355f0e7a26" alt="Image 2" width="48%">
</p>
도시 지역과 비도시 지역 간 의료 인력 분포에 큰 불균형이 존재함을 확인할 수 있었습니다.


## Project conclusion
고령화 사회로 빠르게 진입하고 있는 한국에서, 나이와 높은 상관관계를 가진 치매 예방 및 관리의 중요성이 더욱 부각될 것입니다. 


분석 결과, 치매 환자들은 정상인과 비교하여 활동량이 현저히 감소하고 수면 패턴에 뚜렷한 변화가 나타났습니다.
라이프 로그 데이터와 같은 객관적 데이터를 활용하여 치매의 조기 발견과 치료를 위한 인사이트를 얻을 수 있을 것이라 기대할 수 있습니다. 


또한, 의료 인력과 시설의 지역별 불균형 문제를 해결하여, 치매 환자들이 적절한 치료와 지원을 받을 수 있도록 하는 정책적 노력이 필요합니다.




