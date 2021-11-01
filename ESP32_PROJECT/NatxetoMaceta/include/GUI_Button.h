#ifndef GUI_BUTTON_H
#define GUI_BUTTON_H

#include "lvgl.h"
#include "lvgl_helpers.h"
#include "GUI_Style.h"

class GUI_Button
{
private:
    lv_obj_t * parent;
    lv_obj_t * me;
    GUI_Style* style;

    static void event_handler(lv_obj_t * obj, lv_event_t e);
public:
    GUI_Button( );
    GUI_Button(lv_obj_t * parent, const lv_obj_t * copy, GUI_Style* estilo, lv_coord_t h, lv_coord_t y );
    lv_obj_t * getMe( );
    ~GUI_Button();
};







#endif