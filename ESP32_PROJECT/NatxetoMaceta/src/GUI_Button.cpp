#include "GUI_Button.h"

GUI_Button::GUI_Button( )
{
    
}

GUI_Button::GUI_Button(lv_obj_t * parent, const lv_obj_t * copy, GUI_Style* estilo, lv_coord_t h, lv_coord_t y )
{
    this->parent = parent;
    this->me = lv_btn_create(this->parent, NULL);

    this->style = estilo;

    //lv_btn_set_layout(this->me, LV_LAYOUT_CENTER );
    lv_obj_set_size(this->me, lv_page_get_width_fit( this->parent )-5, h);
    lv_obj_set_pos(this->me, lv_obj_get_x( this->parent ), lv_obj_get_y( this->parent )+y);
    //lv_obj_set_pos(this->me, 0, 0);

    lv_obj_set_event_cb(this->me, this->event_handler);
	//lv_obj_align(this->me, NULL, LV_ALIGN_CENTER, 0, -40);

    lv_obj_add_style(this->me, LV_BTN_PART_MAIN, this->style->getMe( ));

    
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
        /*static uint8_t cnt = 0;
        cnt++;

        lv_obj_t * label = lv_obj_get_child(obj, 0);
        lv_label_set_text_fmt(label, "Boton: %d", cnt);*/
    }
}