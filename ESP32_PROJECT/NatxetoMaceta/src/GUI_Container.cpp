#include "GUI_Container.h"

GUI_Container::GUI_Container( )
{

}

GUI_Container::GUI_Container( lv_obj_t * parent, const lv_obj_t * copy, GUI_Style* estilo, lv_coord_t h, lv_coord_t v, lv_coord_t x, lv_coord_t y, lv_layout_t align  )
{
    this->parent = parent;
    this->me = lv_cont_create(this->parent, NULL);
    this->style = estilo;

    lv_obj_set_size(this->me, h, v );
    lv_obj_set_pos(this->me, x, y);

    lv_cont_set_fit(this->me, LV_FIT_NONE);
    lv_cont_set_layout(this->me, align );

    lv_obj_add_style(this->me, LV_CONT_PART_MAIN, this->style->getMe( ) );
    
}

GUI_Container::~GUI_Container()
{
}

lv_obj_t * GUI_Container::getMe( )
{
    return this->me;
}
