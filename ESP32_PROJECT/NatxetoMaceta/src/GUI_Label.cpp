#include "GUI_Label.h"

GUI_Label::GUI_Label(lv_obj_t * parent, const lv_obj_t * copy, const char* text)
{
    this->parent = parent;
    this->me = lv_label_create(this->parent, NULL);
    this->text = text;

  	lv_label_set_long_mode(this->me, LV_LABEL_LONG_BREAK);
  	lv_label_set_text(this->me, this->text);
  	lv_label_set_align(this->me, LV_LABEL_ALIGN_CENTER);
  	lv_obj_set_size(this->me, 240, 40);
  	lv_obj_set_pos(this->me, 0, 15);
}

GUI_Label::~GUI_Label()
{
}
