#ifndef GUI_STYLE_H
#define GUI_STYLE_H

#include "lvgl.h"
#include "lvgl_helpers.h"


class GUI_Style
{
private:

    lv_style_t style;
    
public:
    GUI_Style( );
    ~GUI_Style();

    lv_style_t* getMe( );
    void sBgColor( lv_color_t color, lv_state_t estado );
    void sTextColor( lv_color_t color, lv_state_t estado );

    void sPage( lv_color_t color, lv_state_t estado );
};









#endif