/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

// создаем свой обработчик

$(document).ready(function(){
    $('.not_current_page_item').mouseenter(function(){
        $(this).find('a').animate({
                        backgroundColor: "#803824",
                        color: "#FFFFFF"
                        } , 200);
    });

    $('.not_current_page_item').mouseout(function(){
        $(this).find('a').animate({
                            backgroundColor: "#FFFFFF",
                            color: "#551300"
                        } , 200)
               .queue(function(){
                                    $(this).queue("fx", [])
                                });
    });

    $.jstree.THEMES_DIR = "jstree/themes/";

    $('#doctree')
      .jstree({
         "plugins": [
           "themes","json_data","ui"
         ],
         "json_data" : {
			"ajax" : {
				"url" : "/docs"
			}
         }
      })
      .bind("select_node.jstree", function (e, data) {
        alert(data.rslt.obj.data("id"));
      });
});
