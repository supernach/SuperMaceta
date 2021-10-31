#include "GUI_Style.h"

GUI_Style::GUI_Style( )
{
    lv_style_init(&this->style);
}


GUI_Style::~GUI_Style()
{
}

lv_style_t* GUI_Style::getMe( )
{
    return &this->style;
}

void GUI_Style::sBgColor(lv_color_t color, lv_state_t estado )
{
    lv_style_set_bg_color(&this->style, estado, color);


    lv_style_set_border_color(&this->style, LV_STATE_DEFAULT, color);
    lv_style_set_border_color(&this->style, LV_STATE_CHECKED, color);
    lv_style_set_border_color(&this->style, LV_STATE_FOCUSED, color);
    lv_style_set_border_color(&this->style, LV_STATE_EDITED, color);
    lv_style_set_border_color(&this->style, LV_STATE_HOVERED, color);
    lv_style_set_border_color(&this->style, LV_STATE_PRESSED, color);
    lv_style_set_border_color(&this->style, LV_STATE_DISABLED, color);

    lv_style_set_radius(&this->style, estado, 0);
}

void GUI_Style::sTextColor(lv_color_t color, lv_state_t estado )
{
    lv_style_set_text_color(&this->style, estado, color);
}

void GUI_Style::sPage(lv_color_t color, lv_state_t estado )
{
    
}