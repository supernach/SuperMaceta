#include "GUI_Page.h"

GUI_Page::GUI_Page( )
{

}

GUI_Page::GUI_Page(lv_obj_t * parent, const lv_obj_t * copy, GUI_Style* estilo )
{
    this->parent = parent;
    this->me = lv_page_create(this->parent, NULL);
	this->style = estilo;

	lv_obj_set_size(this->me, lv_obj_get_width( this->parent ), lv_obj_get_height( this->parent ) );
  	lv_obj_set_pos(this->me, lv_obj_get_x( this->parent ), lv_obj_get_y( this->parent ) );
	//lv_obj_align(this->me, NULL, LV_ALIGN_CENTER, 0, 0);

	lv_page_set_scrlbar_mode(this->me, LV_SCRLBAR_MODE_AUTO);

	lv_style_set_pad_top(this->style->getMe( ), LV_STATE_DEFAULT, 0 );
	lv_style_set_pad_bottom(this->style->getMe( ), LV_STATE_DEFAULT, 0 );
	lv_style_set_pad_left(this->style->getMe( ), LV_STATE_DEFAULT, 0 );
	lv_style_set_pad_right(this->style->getMe( ), LV_STATE_DEFAULT, 0 );

	lv_style_set_margin_top(this->style->getMe( ), LV_STATE_DEFAULT, 0 );
	lv_style_set_margin_bottom(this->style->getMe( ), LV_STATE_DEFAULT, 0 );
	lv_style_set_margin_left(this->style->getMe( ), LV_STATE_DEFAULT, 0 );
	lv_style_set_margin_right(this->style->getMe( ), LV_STATE_DEFAULT, 0 );

	lv_style_set_bg_color(this->style->getMe( ), LV_STATE_DEFAULT, lv_color_hex( 0xFFFFFF ) );
	lv_style_set_border_color(this->style->getMe( ), LV_STATE_DEFAULT, lv_color_hex( 0xFFFFFF ) );
	lv_style_set_border_width(this->style->getMe( ), LV_STATE_DEFAULT, 1 );
	lv_style_set_outline_color(this->style->getMe( ), LV_STATE_DEFAULT, lv_color_hex( 0xFFFFFF ) );
	lv_obj_add_style(this->me, LV_PAGE_PART_BG, this->style->getMe( ) );

	lv_style_set_bg_color(this->style->getMe( ), LV_STATE_DEFAULT, lv_color_hex( 0xBDBDBD ) );
	lv_style_set_border_color(this->style->getMe( ), LV_STATE_DEFAULT, lv_color_hex( 0xBDBDBD ) );
	lv_style_set_border_width(this->style->getMe( ), LV_STATE_DEFAULT, 0 );
	lv_style_set_size(this->style->getMe( ), LV_STATE_DEFAULT, 6 );
	lv_style_set_radius(this->style->getMe( ), LV_STATE_DEFAULT, 15 );
	lv_obj_add_style(this->me, LV_PAGE_PART_SCROLLBAR, this->style->getMe( ) );

	lv_obj_add_style(this->me, LV_LIST_PART_SCROLLBAR, this->style->getMe( ) );
	lv_obj_add_style(this->me, LV_LIST_PART_EDGE_FLASH, this->style->getMe( ) );
}

GUI_Page::~GUI_Page()
{
}

lv_obj_t* GUI_Page::getMe( )
{
	return this->me;
}
