#include "GUI_Screen.h"

GUI_Screen::GUI_Screen(lv_obj_t * parent, const lv_obj_t * copy)
{
    this->parent = parent;
    this->me = lv_obj_create(this->parent, NULL);

    /*lv_style_init(this->style);
    lv_style_set_bg_color(this->style, LV_STATE_DEFAULT, LV_COLOR_OLIVE);
    lv_obj_add_style(this->me, LV_BTN_PART_MAIN, this->style);*/
}

lv_obj_t * GUI_Screen::getMe( )
{
    return this->me;
}

GUI_Screen::~GUI_Screen()
{

}
