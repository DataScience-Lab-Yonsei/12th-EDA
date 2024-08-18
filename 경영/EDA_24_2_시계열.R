library(forecast)
library(dplyr)
library(tseries)

##계절성이 보이는 데이터로만 진행
#폐업률 - 소매(서적/문구) - 필수의료  - 차량 관련 서비스 - 반려동물
#매출 데이터 - 소매(식품) - 소매(생활) - 소매(운송) - 소매(스포츠) - 차량관련서비스

df <- read.csv('/Users/jeongsooyoon/Desktop/DSL/24-2 EDA (경영)/industry_earned_mean.csv')
# 특정 열들만 선택 (예: A와 C 열)
df_earned <- df %>%
  select(서비스_업종_코드_명,기준_년분기_코드,당월_매출_금액)
df_earned <- df[order(df$기준_년분기_코드), ]

df_closed <- df %>%
  select(서비스_업종_코드_명,기준_년분기_코드,폐업_점포_수)
df_closed <- df[order(df$기준_년분기_코드), ]

########################아래부터 업종 별 변경###################

# '서비스_업종_코드_명'이 '교육/학원'인 행의 '당월_매출_금액' 컬럼만 추출
df_closed_test <- df_closed %>%
  filter(서비스_업종_코드_명 == '소매(서적/문구)') %>%
  select(당월_매출_금액)

df_closed_test
######################################시계열 시작#####################################
test1.ts <- ts(df_closed_test)
plot(test1.ts)

logtest1<-log(test1.ts) #분산안정화를 위해 log변환시킴 
plot(logtest1) #(2)분산 일정해졌음을 확인함

log_diff1_test1<-diff(logtest1) #1차 차분 
plot(log_diff1_test1) #(3)추세 사라졌음을 확인함
log_diff12_test1<-diff(log_diff1_test1, lag=4) #계절차분시도 
plot(log_diff12_test1) #(4)시도표를 보고 정상 시계열임을 확인함.

adf.test(log_diff12_test1)


#1. 모형의 식별
par(mfrow=c(2,1))
acf(log_diff12_test1, lag=21, main = 'ACF') #lag로 표의 범위 조정
pacf(log_diff12_test1, lag=21, main = 'PACF')


#auto.arima
auto.arima(test1.ts, seasonal=T, stepwise=F, approximation =F)

#후보 모형 여러개 결정하기
#2. 모수의 추정
fit1<-arima(logtest1,c(0,0,0), seasonal=list(order=c(1,1,0),period=4)) #ar(1)xar(1)
fit2<-arima(logtest1,c(0,0,0), seasonal=list(order=c(0,1,1),period=4)) #ma(1)xar(1)
fit3<-arima(logtest1,c(0,0,0), seasonal=list(order=c(1,1,1),period=4)) #arma(1,1)xar(1)
fit4<-arima(logtest1,c(0,0,0), seasonal=list(order=c(0,1,0),period=4)) #ar(1)xma(1) #aic 젤 작음 

fit1
fit2
fit3
fit4

#3. 모형의 진단
tsdiag(fit4) #p-value가 모두 0.05보다 크므로 White Noise를 따른다.

#4. 모형의 예측 (predict 혹은 forecast 사용)
pred<-predict(fit4, n.ahead=8) #fit4 모형을 미래 24개까지 예측한다 #혹은 n.ahead=10*12 시 10년치 데이터 각 달별로 출력
pred
exp(pred$pred) #로그변환한 것을 회복시켜야 함.
forecast(fit4,h=8)

par(mfrow=c(1,1))
ts.plot(test1.ts, exp(pred$pred), lty=c(1,3)) #예측값들을 시도표에서 확인

