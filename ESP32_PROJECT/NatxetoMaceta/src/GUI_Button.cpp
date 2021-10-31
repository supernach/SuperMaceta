#include "GUI_Button.h"


GUI_Button::GUI_Button(lv_obj_t * parent, const lv_obj_t * copy )
{
    this->parent = parent;
    this->me = lv_btn_create(this->parent, NULL);

    this->txt = GUI_Label( this->me, NULL, "aa" );

    lv_btn_set_layout(this->me, LV_LAYOUT_CENTER );

    

    lv_style_init(this->style);
    /*lv_style_set_bg_color(this->style, LV_STATE_DEFAULT, LV_COLOR_WHITE);
    lv_style_set_bg_color(this->style, LV_STATE_PRESSED, LV_COLOR_GRAY);
    lv_style_set_bg_color(this->style, LV_STATE_FOCUSED, LV_COLOR_RED);
    lv_style_set_bg_color(this->style, LV_STATE_FOCUSED | LV_STATE_PRESSED, lv_color_hex(0xf88));*/
    lv_obj_add_style(this->me, LV_BTN_PART_MAIN, this->style);

    lv_obj_set_event_cb(this->me, this->event_handler);
	lv_obj_align(this->me, NULL, LV_ALIGN_CENTER, 0, -40);
}

lv_obj_t * GUI_Button::getMe( )
{
    return this->me;
}

GUI_Button::~GUI_Button()
{

}


void GUI_Button::event_handler(lv_obj_t * obj, lv_event_t e)
{
    if(e == LV_EVENT_CLICKED) {
        static uint8_t cnt = 0;
        cnt++;

        lv_obj_t * label = lv_obj_get_child(obj, 0);
        lv_label_set_text_fmt(label, "Boton: %d", cnt);
    }
}