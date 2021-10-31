#ifndef GUI_SCREEN_H
#define GUI_SCREEN_H

#include "lvgl.h"
#include "lvgl_helpers.h"

class GUI_Screen
{
private:
    lv_obj_t * parent;
    lv_obj_t * me;
    lv_style_t* style;
public:
    GUI_Screen(lv_obj_t * parent, const lv_obj_t * copy);
    lv_obj_t * getMe( );
    ~GUI_Screen();
};







#endif