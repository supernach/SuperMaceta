#ifndef GUI_BUTTON_H
#define GUI_BUTTON_H

#include "lvgl.h"
#include "lvgl_helpers.h"
#include "GUI_Label.h"
#include "GUI_Style.h"

class GUI_Button
{
private:
    lv_obj_t * parent;
    lv_obj_t * me;
    GUI_Style* style;
    GUI_Label texto;

    static void event_handler(lv_obj_t * obj, lv_event_t e);
public:
    GUI_Button(lv_obj_t * parent, const lv_obj_t * copy, const char* txt, GUI_Style* estilo );
    lv_obj_t * getMe( );
    ~GUI_Button();
};







#endif