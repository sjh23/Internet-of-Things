TestAppC.nc

includes Test;
configuration TestAppC
{
}
implementation
{
  components TestC, MainC;
  components Leds, new TimerMilliC();

  //AMC : 무선 송수신 제어
  components ActiveMessageC as AMC;
  //AMSC : 메시지 전송용 컴포넌트, 메시지 분류
  components new AMSenderC(AM_TEST_DATA_MSG) as AMSC;

  // 컴포넌트 연결
  TestC.Boot -> MainC;  // 부팅 완료 시 동작 연결
  TestC.Leds -> LedsC;  // LED 제어
  TestC.MilliTimer -> TimerMilliC; // 타이머 주기 설정

  // 무선 전송 기능
  Test.RadioControl -> AMC;     //RadioControl은 무선 모듈을 켜고 끄는 초기화 및 제어용 인터페이스야. 전원 제어나 상태 확인에 사용
  Test.RadioSend -> AMSC;

  //온도와 습도를 센서로 수집
  components new SensirionSht11C() as Sht11OC;
  TestC.Temp -> Sht11OC.Temperature;
  TestC.Humi -> Sht11OC.Humidity;

  //조도 센서
  components new IlluAdoC() as Illu;
  TestC.Illu -> Illu;
  
  //베터리 센서
  components BatteryC;
  TestC.Battery -> BatteryC; //전압 값 읽음
}
