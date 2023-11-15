## Abstractive Summary

news_summary2.ipynb가 최종 결과물입니다.

##
전처리 전 원문 : India's industrial output grew 3.8% year-on-year in September, government data on Friday stated. The Index of Industrial Production for mining sector rose 7.9%, while that for manufacturing grew 3.4% in September. The highest growth was registered in the coal sector, which posted 10.6% growth year-on-year, followed by petroleum refinery at 8% and natural gas at 6.3%.<br/>
전처리 후 원문 : india industrial output grew year year september government data friday stated index industrial production mining sector rose manufacturing grew september highest growth registered coal sector posted growth year year followed petroleum natural gas <br/>
***
실제 Headlines : India's industrial output rises 3.8% in September<br/>
***
실제 요약 : said india holdings army trial <br/>
예측 요약 :  india falls fiscal deficit fy<br/>
***

## Extractive Summary

summa summarize(ratio=0.5), keywords 사용<br/>

전처리 전 원문(t1) : India's industrial output grew 3.8% year-on-year in September, government data on Friday stated. The Index of Industrial Production for mining sector rose 7.9%, while that for manufacturing grew 3.4% in September. The highest growth was registered in the coal sector, which posted 10.6% growth year-on-year, followed by petroleum refinery at 8% and natural gas at 6.3%.<br/>
전처리 후 원문(t2) : india industrial output grew year year september government data friday stated index industrial production mining sector rose manufacturing grew september highest growth registered coal sector posted growth year year followed petroleum natural gas <br/>
***
t1의 summarize : The Index of Industrial Production for mining sector rose 7.9%, while that for manufacturing grew 3.4% in September.<br/>
t2의 summarize : 결과 미도출(결과가 나오지 않음)<br/>
***
t1의 keywords : industrial, sector, growth, grew year<br/>
t2의 keywords : growth, industrial output, production<br/>
***
## 회고록
중간에 길이에 따라 dataset을 잘라내고 다시 구성하는 코드를 잘못 구성하여 다시 고쳤다.<br/>
코드에 힌트가 있었는데 len에 집중하느라 split()을 놓쳐 오류가 있었다.<br/>
수정전 코드에는 .split()이 없어 상당히 이상한 집단을 남겨놈<br/>
<br/>
seq2seq에 어텐션까지 코드구현의 이해를 따라가기가 어려웠다.<br/>
다른건 고사하고 전처리에서 문제가 많았다.<br/>
실제 csv 파일과 전처리 후 csv 파일의 내용물을 확인해보면<br/>
특수문자로 수치를 나타낸 내용이 중요한 원본이였지만<br/>
전처리 후에는 다 날아가서 아무런 의미를 가지고 있지 않은 원본이 된 것도 확인하였다.(예시는 상단을 확인하면 됩니다)<br/>
<br/>
원본에서 텍스트의 깨짐으로 영어가 아니라 이상한 한글을 내포함으로써 뜻이 손상된것도 확인되었다.<br/>
예시 :  President Iv횄징n M횄징rquez<br/>
머신러닝/딥러닝에 양과 질이 중요한 데이터가 필요한 것을 다시 한번 머리속에 새겨지는 경험이였다.<br/>
상단의 예시를 보면 그래도 학습하고 난 후 실제요약, 예측요약에서는 원문에 있는 단어를 뽑아내려고 하는 것이 보였다.<br/>
india가 뭘 하긴 했다고 학습한거 같은데...<br/>
뭘 했는지는 다 잘려나가서... 학습이 어려웠을수도 ㅎㅎ<br/>
<br/>