TestAppC.nc

includes Test;
configuration TestAppC
{
}
implementation
{
  components TestC, MainC;
  components Leds, new TimerMilliC();

  components ActiveMessageC as AMC;
  components new AMSenderC(Am_TEST_DATA_MSG) as AMSC;

  TestC.Boot -> MainC;
  TestC.Leds -> LedsC;
  TestC.MilliTimer -> TimerMilliC;

  Test.RadioControl -> AMC;
  Test.RadioSend -> AMSC;

  components new SensirionSht11C() as Sht11OC;
  TestC.Temp -> Sht11OC.Temperature;
  TestC.Humi -> Sht11OC.Humidity;

  components new IlluAdoC() as Illu;
  TestC.Illu -> Illu;

  components BatteryC;
  TestC.Battery -> BatteryC;
}
