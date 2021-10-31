#include "GUI_Label.h"

GUI_Label::GUI_Label( )
{

}

GUI_Label::GUI_Label(lv_obj_t * parent, const lv_obj_t * copy, GUI_Style* estilo, const char* text, lv_label_align_t align )
{
    this->parent = parent;
    this->me = lv_label_create(this->parent, NULL);
    this->text = text;
	this->style = estilo;

  	lv_label_set_long_mode(this->me, LV_LABEL_LONG_BREAK);
  	lv_label_set_text(this->me, this->text);
  	lv_label_set_align(this->me, align);
  	lv_obj_set_size(this->me, lv_obj_get_width( this->parent ), lv_obj_get_width( this->parent ) );
  	lv_obj_set_pos(this->me, lv_obj_get_x( this->parent ), lv_obj_get_y( this->parent ) );

	lv_obj_add_style(this->me, LV_LABEL_PART_MAIN, this->style->getMe( ) );
}

GUI_Label::~GUI_Label()
{
}
