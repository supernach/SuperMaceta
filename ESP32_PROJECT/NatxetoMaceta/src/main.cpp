
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
#include "GUI_Style.h"
#include "GUI_Container.h"
#include "GUI_Page.h"


GUI gui = GUI( ); //= GUI( );

//GUI_Style Plantilla_Top = GUI_Style( );
GUI_Style stl_scrPrincipal;
GUI_Screen scrPrincipal;// = GUI_Screen( NULL, NULL, gui.getDisp( ) );

//GUI_Label lbl_Titulo = GUI_Label( scrPrincipal.getMe( ), NULL, "Pulsa el boton");

GUI_Style stl_Top;
GUI_Container Top_I;
GUI_Container Top_D;

GUI_Style stl_Proyecto;
GUI_Label Proyecto;

GUI_Style stl_Hora;
GUI_Label Hora;

GUI_Style stl_Top_2;
GUI_Container Top_2;

GUI_Style stl_TituloScreen;
GUI_Label TituloScreen;

GUI_Style stl_Middle;
GUI_Container Middle;

GUI_Style stl_Contenido;
GUI_Page Contenido;

GUI_Style stl_Bottom;
GUI_Container Bottom;

GUI_Style stl_Status;
GUI_Label Status;

//GUI_Button btn = GUI_Button( scrPrincipal.getMe( ), NULL, "Boton", &BotonMenu );

extern "C" {
	void app_main( );
}

void app_main() {
    stl_scrPrincipal = GUI_Style( );
    stl_scrPrincipal.sBgColor( lv_color_hex(0x455A64), LV_STATE_DEFAULT );
    stl_scrPrincipal.sBgColor( lv_color_hex(0x455A64), LV_STATE_PRESSED );
    scrPrincipal = GUI_Screen( NULL, NULL, &stl_scrPrincipal );

    stl_Top = GUI_Style( );
    stl_Top.sBgColor(lv_color_hex(0x455A64), LV_STATE_DEFAULT );
    stl_Top.sBgColor(lv_color_hex(0x455A64), LV_STATE_PRESSED );
    Top_I = GUI_Container( scrPrincipal.getMe( ) , NULL, &stl_Top, 120, 16, 0, 0, LV_LAYOUT_CENTER );
    Top_D = GUI_Container( scrPrincipal.getMe( ) , NULL, &stl_Top, 120, 16, 120, 0, LV_LAYOUT_CENTER );

    stl_Proyecto = GUI_Style( );
    stl_Proyecto.sTextColor(lv_color_hex(0xCFD8DC), LV_STATE_DEFAULT );
    Proyecto = GUI_Label( Top_I.getMe( ), NULL, &stl_Proyecto, "SuperMaceta 1.0", LV_LABEL_ALIGN_LEFT );

    stl_Hora = GUI_Style( );
    stl_Hora.sTextColor(lv_color_hex(0xCFD8DC), LV_STATE_DEFAULT );
    Hora = GUI_Label( Top_D.getMe( ), NULL, &stl_Hora, "DD/MM - 0:00", LV_LABEL_ALIGN_RIGHT );

    stl_Top_2 = GUI_Style( );
    stl_Top_2.sBgColor(lv_color_hex(0xCFD8DC), LV_STATE_DEFAULT );
    stl_Top_2.sBgColor(lv_color_hex(0xCFD8DC), LV_STATE_PRESSED );
    Top_2 = GUI_Container( scrPrincipal.getMe( ), NULL, &stl_Top_2, 240, 20, 0, 16, LV_LAYOUT_CENTER );

    stl_TituloScreen = GUI_Style( );
    stl_TituloScreen.sTextColor(lv_color_hex(0xFFFFFF), LV_STATE_DEFAULT );
    TituloScreen = GUI_Label( Top_2.getMe( ), NULL, &stl_TituloScreen, "MENU PRINCIPAL", LV_LABEL_ALIGN_CENTER );


    stl_Middle = GUI_Style( );
    stl_Middle.sBgColor(lv_color_hex(0xFFFFFF), LV_STATE_DEFAULT );
    stl_Middle.sBgColor(lv_color_hex(0xFFFFFF), LV_STATE_PRESSED );
    Middle = GUI_Container( scrPrincipal.getMe( ), NULL, &stl_Middle, 240, 268, 0, 36, LV_LAYOUT_CENTER );

    stl_Contenido = GUI_Style( );
    //stl_Contenido.sBgColor( lv_color_hex(0x000000), LV_STATE_DEFAULT);
    Contenido = GUI_Page( Middle.getMe( ), NULL, &stl_Contenido );
    
    stl_Bottom = GUI_Style( );
    stl_Bottom.sBgColor(lv_color_hex(0x455A64), LV_STATE_DEFAULT );
    stl_Bottom.sBgColor(lv_color_hex(0x455A64), LV_STATE_PRESSED );
    Bottom = GUI_Container( scrPrincipal.getMe( ), NULL, &stl_Bottom, 240, 16, 0, 305, LV_LAYOUT_CENTER );

    stl_Status = GUI_Style( );
    stl_Status.sTextColor(lv_color_hex(0xCFD8DC), LV_STATE_DEFAULT );
    Status = GUI_Label( Bottom.getMe( ), NULL, &stl_Status, "STATUS", LV_LABEL_ALIGN_LEFT );
    



    gui.LoadScreen( scrPrincipal.getMe( ) );

	while (1) {
        gui.Handler( );
		rtc_wdt_feed();
    }
}