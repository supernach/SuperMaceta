#ifndef GUI_Page_H
#define GUI_Page_H

#include "lvgl.h"
#include "lvgl_helpers.h"
#include "GUI_Style.h"


class GUI_Page
{
private:
    lv_obj_t * parent;
    lv_obj_t * me;
    GUI_Style* style;

public:
    GUI_Page( );
    GUI_Page(lv_obj_t * parent, const lv_obj_t * copy, GUI_Style* estilo );
    ~GUI_Page();

    lv_obj_t * getMe( );
};









#endif