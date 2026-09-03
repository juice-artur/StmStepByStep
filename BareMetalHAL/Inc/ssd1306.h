#ifndef SSD1306_H
#define SSD1306_H

#include "stm32f4xx_hal.h"

void SSD1306_Init(void);
void SSD1306_Clear(void);
void SSD1306_UpdateScreen(void);
void SSD1306_GotoXY(uint8_t x, uint8_t y);
void SSD1306_WriteChar(char ch);
void SSD1306_WriteString(const char *str);

#endif