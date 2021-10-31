#include "GUI.h"

GUI::~GUI()
{

}

GUI::GUI( )
{
    /* If you want to use a task to create the graphic, you NEED to create a Pinned task
     * Otherwise there can be problem such as memory corruption and so on.
     * NOTE: When not using Wi-Fi nor Bluetooth you can pin the guiTask to core 0 */
    //xTaskCreatePinnedToCore(guiTask, "gui", 4096*2, NULL, 0, NULL, 1);

	lv_init();

    /* Initialize SPI or I2C bus used by the drivers */
    lvgl_driver_init();

    this->Init_Buffer( );

    this->Init_Display( );
    
    this->Init_Touch( );
    
    esp_register_freertos_tick_hook( &this->TickTask );
}

void GUI::Handler( )
{
    lv_task_handler();
}

void GUI::TickTask( )
{
    lv_tick_inc(10);
}

void GUI::LoadScreen( lv_obj_t * scr )
{
    lv_scr_load(scr);
}



void GUI::Init_Buffer( )
{
    /* Initialize the working buffer depending on the selected display.
     * NOTE: buf2 == NULL when using monochrome displays. */
    lv_disp_buf_init(&this->disp_buf, &this->buf1, &this->buf2, DISP_BUF_SIZE);
}

void GUI::Init_Display( )
{
    lv_disp_drv_init(&this->tft_Ili9341);
	this->tft_Ili9341.hor_res = 240;
  	this->tft_Ili9341.ver_res = 320;
    this->tft_Ili9341.flush_cb = disp_driver_flush;
    this->tft_Ili9341.buffer = &disp_buf;
    lv_disp_drv_register(&this->tft_Ili9341);
}

void GUI::Init_Touch( )
{
    /* Register an input device when enabled on the menuconfig */
    lv_indev_drv_init(&this->Touch_XPT);
    this->Touch_XPT.read_cb = touch_driver_read;
    this->Touch_XPT.type = LV_INDEV_TYPE_POINTER;
    lv_indev_drv_register(&this->Touch_XPT);
}