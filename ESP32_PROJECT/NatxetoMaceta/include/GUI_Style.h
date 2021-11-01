#ifndef GUI_STYLE_H
#define GUI_STYLE_H

#include "lvgl.h"
#include "lvgl_helpers.h"


class GUI_Style
{
private:

    lv_style_t style;
    lv_obj_t* obj;
    
public:
    GUI_Style( );
    GUI_Style( lv_obj_t* obj );
    ~GUI_Style();

    lv_style_t* getMe( );
    void sBgColor( lv_color_t color, lv_state_t estado );
    void sTextColor( lv_color_t color, lv_state_t estado );

    void sBtnMenu( lv_color_t color, lv_state_t estado );
    void sPage(lv_color_t color, lv_state_t estado );
};









#endif