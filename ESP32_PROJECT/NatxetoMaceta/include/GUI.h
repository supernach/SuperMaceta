#ifndef GUI_H
#define GUI_H


#include "lvgl.h"
#include "lvgl_helpers.h"
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_freertos_hooks.h"
#include "freertos/semphr.h"
#include "esp_system.h"
#include "soc/rtc_wdt.h"
#include "driver/gpio.h"

class  GUI
{
    public:
        GUI( );
        ~GUI( );
        void Handler( );
        static void TickTask( );
        void LoadScreen( lv_obj_t * scr );
      
    private:
        lv_disp_buf_t disp_buf;
        lv_color_t buf1[DISP_BUF_SIZE];
        lv_color_t buf2[DISP_BUF_SIZE];

        lv_disp_drv_t tft_Ili9341;
        lv_indev_drv_t Touch_XPT;

        void Init_Buffer( );
        void Init_Display( );
        void Init_Touch( );

};








#endif