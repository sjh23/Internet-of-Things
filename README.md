LCD판이 작동하기 위한 코드

#include <Wire.h>				//I2C 통신을 위한 기본 라이브러리
#include <LiquidCrystal_I2C.h>	//I2C LCD 라이브러리

LiquidCrystal_I2C lcd(0x27, 16, 2);

void setup()
{
  lcd.init();					//I2C LCD 초기화
  lcd.backlight();				//백라이트 켜기
  lcd.print("LCD init");
  delay(2000);
  lcd.clear();
}

void loop()
{
  lcd.setCursor(16,0);
  lcd.print("Hello, World!");
  
  for(int position = 0; position < 16; position++){ 
    lcd.scrollDisplayLeft();//오른쪽에서 왼쪽으로 순차출력하는 명령문
    delay(150);
  }
}
==========================================================================
초음파 거리센서에 값을 LCD의 출력하는 코드 
-둘다 5V를 사용하는 초음파거리센서와 LCD를 같이 작동 시킬려면 브레드보드가 필여하다 

#include <Wire.h>				        //I2C 통신을 위한 기본 라이브러리
#include <LiquidCrystal_I2C.h>	//I2C LCD 라이브러리
#define TRIG 13
#define ECHO 12

LiquidCrystal_I2C lcd(0x27, 16, 2);

void setup()
{
  Serial.begin(9600);
  pinMode(TRIG, OUTPUT);
  pinMode(ECHO, INPUT);
  lcd.init();					          //I2C LCD 초기화
  lcd.backlight();				      //백라이트 켜기
  lcd.print("LCD init");
  delay(2000);
  lcd.clear();
}

void loop()
{
  long duration, distance;

  digitalWrite(TRIG, LOW);        //초음파 거리장치 작동 코드
  delayMicroseconds(2);
  digitalWrite(TRIG, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG, LOW);

  duration = pulseIn(ECHO, HIGH);

  distance = duration * 17 / 1000; //거리 계산
  
  lcd.setCursor(0,0);              //lcd 글씨출력 좌표설정
  lcd.print(distance);             //출력줄
  lcd.print(" cm");
  delay(1000);
  lcd.clear();                     //값 초기화 명령어
}
