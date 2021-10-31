
#if 0

#include "GUI_Container.h"

GUI_Container::GUI_Container( )
{

}

GUI_Container::GUI_Container(lv_obj_t * parent, const lv_obj_t * copy )
{
    this->parent = parent;
    this->me = lv_cont_create(this->parent, NULL);
    
}

GUI_Container::~GUI_Container()
{
}


#endif
