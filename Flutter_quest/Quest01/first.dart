
void main() {




}




class WorkTimer {

  int wmin = 25;
  int dsec = 10;

  int remainMin = 25;
  int remainSec = 0;

  int count = 0;

  timer = Timer.periodic(const Duration(seconds: dsec), _noticeTime);


  void _noticeTime() {
    print('남은시간: $remainMin 분 $remainSec 초');
  }
    

  if (remainMin == 0 && remainSec == 0 ) {
    print('타이머 종료');
    count = count + 1;
  }
  else {

    if (remainSec == 0) {
    remainMin = remainMin - 1;
    remainSec = 60 - dsec ;
    }
    else {
      remainSec = remainSec - 10;
      }

  } 
  
  

  }

class RestTimer {

}





