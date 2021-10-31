
#if 0
#ifndef GUI_TEMPLATE_H
#define GUI_TEMPLATE_H

#include "lvgl.h"
#include "lvgl_helpers.h"


class GUI_Container
{
private:
    lv_obj_t * parent;
    lv_obj_t * me;
public:
    GUI_Container( );
    GUI_Container(lv_obj_t * parent, const lv_obj_t * copy);
    ~GUI_Container( );
};









#endif
#endif