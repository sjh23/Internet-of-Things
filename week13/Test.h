#ifndef TEST_H
#define TEST_H
#include "message.h"
enum {
  //약 10초(10240ms)마다 센서 동작, LU 생략가능
  TEST_PERIOD = 10240LU, 
};
enum {
  DFLT_VAL = 0x11,
};
enum {
  //데이터 길이 제한
  TEST_DATA_LENGTH = TOSH_DATA_LENGTH - 6,
};
enum {
  //메시지 종류를 구분할 ID
  AM_TEST_DATA_MSG = 0xA4,
};

typedef nx_struct test_data_msg {
  // 각 필드 역할 설
  nx_am_addr_t srcID;  // 송신자 ID
  nx_uint32_t seqNo;   // 시퀀스 번호
  nx_uint16_t type;    // 메시지 타입
  nx_uint16_t Temp;    // 온도
  nx_uint16_t Humi;    // 습도
  nx_uint16_t Illu;    // 조도
  nx_uint16_t battery; // 베터리 잔량
  //nx_uint8_t testData[TEST_DATA_LENGTH]; <- 가짜 데이터 패턴을 보내서 전송 용량이나 패킷 손실 테스트를 할 수 있음
}  test_data_msg_t;

#endif // TEST_H
