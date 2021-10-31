#include "GUI_Screen.h"

GUI_Screen::GUI_Screen()
{
    this->me = lv_obj_create(NULL, NULL);
}

GUI_Screen::GUI_Screen(lv_obj_t * parent, const lv_obj_t * copy, GUI_Style* estilo )
{
    this->parent = parent;
    this->me = lv_obj_create(this->parent, NULL);
    this->style = estilo;
    lv_obj_add_style(this->me, LV_OBJ_PART_MAIN, this->style->getMe( ) );

}

lv_obj_t * GUI_Screen::getMe( )
{
    return this->me;
}

GUI_Screen::~GUI_Screen()
{

}
