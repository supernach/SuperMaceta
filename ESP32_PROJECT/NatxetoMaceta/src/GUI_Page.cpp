#include "GUI_Page.h"

GUI_Page::GUI_Page( )
{

}

GUI_Page::GUI_Page(lv_obj_t * parent, const lv_obj_t * copy, GUI_Style* estilo )
{
    this->parent = parent;
    this->me = lv_page_create(this->parent, NULL);
	this->style = estilo;

	lv_obj_set_size(this->me, lv_obj_get_width( this->parent )-10, lv_obj_get_height( this->parent )-10 );
  	lv_obj_set_pos(this->me, lv_obj_get_x( this->parent ), lv_obj_get_y( this->parent ) );
	
	lv_style_set_pad_top(this->style->getMe( ), LV_STATE_DEFAULT, 1);
	
	lv_obj_add_style(this->me, LV_PAGE_PART_BG, this->style->getMe( ) );
	
	//lv_obj_add_style(this->me, LV_PAGE_PART_SCROLLBAR, this->style->getMe( ) );

	//lv_obj_add_style(this->me, LV_LIST_PART_SCROLLBAR, this->style->getMe( ) );

	//lv_obj_add_style(this->me, LV_LIST_PART_EDGE_FLASH, this->style->getMe( ) );
	
}

GUI_Page::~GUI_Page()
{
}

lv_obj_t* GUI_Page::getMe( )
{
	return this->me;
}
