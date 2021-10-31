#ifndef GUI_LABEL_H
#define GUI_LABEL_H

#include "lvgl.h"
#include "lvgl_helpers.h"


class GUI_Label
{
private:
    lv_obj_t * parent;
    lv_obj_t * me;
    const char* text;
public:
    GUI_Label(lv_obj_t * parent, const lv_obj_t * copy, const char* text);
    ~GUI_Label();
};









#endif