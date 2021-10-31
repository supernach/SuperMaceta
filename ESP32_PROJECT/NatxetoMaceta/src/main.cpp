
/* LVGL Example project
 *
 * Basic project to test LVGL on ESP32 based projects.
 *
 * This example code is in the Public Domain (or CC0 licensed, at your option.)
 *
 * Unless required by applicable law or agreed to in writing, this
 * software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, either express or implied.
 */


#include "soc/rtc_wdt.h"
#include "GUI.h"
#include "GUI_Screen.h"
#include "GUI_Label.h"
#include "GUI_Button.h"


GUI gui = GUI( );

GUI_Screen scrPrincipal = GUI_Screen( NULL, NULL );
GUI_Label lbl_Titulo = GUI_Label( scrPrincipal.getMe( ), NULL, "Pulsa el boton");

GUI_Button btn = GUI_Button( scrPrincipal.getMe( ), NULL );
//GUI_Label btn_label  = GUI_Label( btn.getMe( ), NULL, "Boton");

extern "C" {
	void app_main( );
}

void app_main() {

    gui.LoadScreen( scrPrincipal.getMe( ) );

	while (1) {
        gui.Handler( );
		rtc_wdt_feed();
    }
}