package org.abbatia.utils;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

class UtilidadesTest {

  @ParameterizedTest(name = "Round {0} to {1} with {2} decimals")
  @CsvSource({
    "0.25 , 0.0 , 0",
    "1.25 , 1.3, 1",
    "0.1, 0.1, 1",
    "0 , 0.0 , 1",
    "1 , 1.0, 1",
    "0.1, 0.1, 1"
  })
  void redondearTest(double number, double expectedResult, int decimals) {
    assertEquals(expectedResult, Utilidades.redondear(number, decimals), () -> number + " should equal " + expectedResult);
  }

}