#ifndef GUI_CONTAINER_H
#define GUI_CONTAINER_H

#include "lvgl.h"
#include "lvgl_helpers.h"

#include "GUI_Style.h"


class GUI_Container
{
private:
    lv_obj_t * parent;
    lv_obj_t * me;
    GUI_Style* style;
public:
    GUI_Container( );
    GUI_Container( lv_obj_t * parent, const lv_obj_t * copy, GUI_Style* estilo, lv_coord_t h, lv_coord_t v, lv_coord_t x, lv_coord_t y, lv_layout_t align );
    ~GUI_Container( );

    lv_obj_t * getMe( );
};









#endif