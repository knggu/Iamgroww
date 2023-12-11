import 'dart:async';

void main() {
  PomodoroTimer pomodoroTimer = PomodoroTimer();
  pomodoroTimer.start();
}

class PomodoroTimer {
  int sessionCount = 0;
  bool isWorkTime = true;
  Timer? timer;

  void start() {
    print('flutter: Pomodoro 타이머를 시작합니다.');
    startSession(5); // 작업 세션 25분
  }

  void startSession(int minutes) {
    int seconds = minutes * 60;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      int remaingMinutes = seconds ~/ 60;
      int remainSeconds = seconds % 60;
      print('남은 시간: $remaingMinutes:$remainSeconds');

      if (seconds == 0) {
        t.cancel();
        sessionCount++;
        if (isWorkTime) {
          print('flutter: 작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.');
          if (sessionCount < 3) {
            startSession(5); // 휴식시간 5분
          } else {
            startSession(15); // 휴식시간 15분
          }
        } else {
          print('flutter: Pomodoro 타이머가 완료되었습니다.');
        }
        isWorkTime = !isWorkTime;
      } else {
        seconds--;
      }
    });
  }
}
// print('flutter: 작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.');
// print('flutter: Pomodoro 타이머가 완료되었습니다.');

