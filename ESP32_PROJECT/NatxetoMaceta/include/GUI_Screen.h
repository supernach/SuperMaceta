#ifndef GUI_SCREEN_H
#define GUI_SCREEN_H

#include "lvgl.h"
#include "lvgl_helpers.h"
#include "GUI_Style.h"


class GUI_Screen
{
private:
    lv_obj_t * parent;
    lv_obj_t * me;
    GUI_Style* style;

public:
    GUI_Screen( );
    GUI_Screen(lv_obj_t * parent, const lv_obj_t * copy, GUI_Style* estilo );
    lv_obj_t * getMe( );
    ~GUI_Screen();
};







#endif