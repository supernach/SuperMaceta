#include "GUI_Style.h"

GUI_Style::GUI_Style(  )
{
    lv_style_init(&this->style);
}

GUI_Style::GUI_Style( lv_obj_t* obj )
{
    lv_style_init(&this->style);
    this->obj = obj;
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

void GUI_Style::sBtnMenu(lv_color_t color, lv_state_t estado )
{
    lv_style_set_radius(&this->style, LV_STATE_DEFAULT, 0);
    //lv_style_set_bg_opa(&styles->btn, LV_STATE_DEFAULT, LV_OPA_COVER);
    lv_style_set_bg_color(&this->style, LV_STATE_DEFAULT, lv_color_hex(0xf7fbff));
    lv_style_set_bg_color(&this->style, LV_STATE_PRESSED, lv_color_hex(0xeff3f7));
    lv_style_set_bg_color(&this->style, LV_STATE_CHECKED, lv_color_hex(0xeff3f7));
    lv_style_set_bg_color(&this->style, LV_STATE_CHECKED | LV_STATE_PRESSED, lv_color_hex(0xeff3f7));
    lv_style_set_bg_color(&this->style, LV_STATE_DISABLED, lv_color_hex(0xFFFFFF));
    lv_style_set_bg_color(&this->style, LV_STATE_DISABLED | LV_STATE_CHECKED, lv_color_hex(0xFFFFFF));
    lv_style_set_border_color(&this->style, LV_STATE_DEFAULT, lv_color_hex(0xBDBDBD));
    lv_style_set_border_color(&this->style, LV_STATE_PRESSED, lv_color_hex(0xBDBDBD));
    lv_style_set_border_color(&this->style, LV_STATE_DISABLED, lv_color_hex(0xBDBDBD));
    lv_style_set_border_width(&this->style, LV_STATE_DEFAULT, 1);
    lv_style_set_border_opa(&this->style, LV_STATE_CHECKED, LV_OPA_TRANSP);
    lv_style_set_border_side( &this->style, LV_STATE_DEFAULT, LV_BORDER_SIDE_BOTTOM );
    lv_style_set_border_side( &this->style, LV_STATE_PRESSED, LV_BORDER_SIDE_BOTTOM );
    lv_style_set_border_side( &this->style, LV_STATE_CHECKED, LV_BORDER_SIDE_BOTTOM );

    lv_style_set_text_color(&this->style, LV_STATE_DEFAULT, lv_color_hex(0x000000));
    lv_style_set_text_color(&this->style, LV_STATE_PRESSED, lv_color_hex(0x000000));
    lv_style_set_text_color(&this->style, LV_STATE_CHECKED,  lv_color_hex(0x000000));
    lv_style_set_text_color(&this->style, LV_STATE_CHECKED | LV_STATE_PRESSED, lv_color_hex(0x000000));
    lv_style_set_text_color(&this->style, LV_STATE_DISABLED, lv_color_hex(0xBDBDBD));

    /*lv_style_set_image_recolor(&styles->btn, LV_STATE_DEFAULT, IS_LIGHT ? lv_color_hex(0x31404f) : lv_color_hex(0xffffff));
    lv_style_set_image_recolor(&styles->btn, LV_STATE_PRESSED, IS_LIGHT ? lv_color_hex(0x31404f) : lv_color_hex(0xffffff));
    lv_style_set_image_recolor(&styles->btn, LV_STATE_PRESSED, lv_color_hex(0xffffff));
    lv_style_set_image_recolor(&styles->btn, LV_STATE_CHECKED | LV_STATE_PRESSED, lv_color_hex(0xffffff));
    lv_style_set_image_recolor(&styles->btn, LV_STATE_DISABLED, IS_LIGHT ? lv_color_hex(0x888888) : lv_color_hex(0x888888));

    lv_style_set_value_color(&styles->btn, LV_STATE_DEFAULT, IS_LIGHT ? lv_color_hex(0x31404f) : lv_color_hex(0xffffff));
    lv_style_set_value_color(&styles->btn, LV_STATE_PRESSED, IS_LIGHT ? lv_color_hex(0x31404f) : lv_color_hex(0xffffff));
    lv_style_set_value_color(&styles->btn, LV_STATE_CHECKED,  lv_color_hex(0xffffff));
    lv_style_set_value_color(&styles->btn, LV_STATE_CHECKED | LV_STATE_PRESSED, lv_color_hex(0xffffff));
    lv_style_set_value_color(&styles->btn, LV_STATE_DISABLED, IS_LIGHT ? lv_color_hex(0x888888) : lv_color_hex(0x888888));*/

    lv_style_set_outline_opa(&this->style, LV_STATE_FOCUSED, 0);
}

void GUI_Style::sPage(lv_color_t color, lv_state_t estado )
{
    lv_style_set_pad_left(&this->style, LV_STATE_DEFAULT, 1);
    lv_style_set_pad_right(&this->style, LV_STATE_DEFAULT, 1);
    lv_style_set_pad_top(&this->style, LV_STATE_DEFAULT, 1);
    lv_style_set_pad_bottom(&this->style, LV_STATE_DEFAULT, 1);
    lv_style_set_pad_inner(&this->style, LV_STATE_DEFAULT, 1);

    lv_style_set_bg_color( &this->style, LV_STATE_DEFAULT, lv_color_hex(0xFDFDFD) );

    //lv_style_set_border_width( &this->style, LV_STATE_DEFAULT, 1 );

    lv_style_set_margin_all( &this->style, LV_STATE_DEFAULT, 1 );
    //lv_obj_add_style(this->obj, LV_PAGE_PART_BG, &this->style );
}