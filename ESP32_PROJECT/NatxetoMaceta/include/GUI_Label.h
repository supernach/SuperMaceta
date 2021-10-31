#ifndef GUI_LABEL_H
#define GUI_LABEL_H

#include "lvgl.h"
#include "lvgl_helpers.h"
#include "GUI_Style.h"


class GUI_Label
{
private:
    lv_obj_t * parent;
    lv_obj_t * me;
    GUI_Style* style;
    const char* text;
public:
    GUI_Label( );
    GUI_Label(lv_obj_t * parent, const lv_obj_t * copy, GUI_Style* estilo, const char* text, lv_label_align_t align );
    ~GUI_Label();
};









#endif