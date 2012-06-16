/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

// создаем свой обработчик

// подсвтка главного меню

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

// Дерево документов

/*     $.jstree.THEMES_DIR = "assets/jstree/themes/"; */

    $('#doctree')
      .jstree({
        "plugins": [
          "themes","json_data","ui"
        ],
         "json_data" : {
           "ajax" : {
              "url" : "/docs/get_categories"
           }
         }
      })
      .bind("select_node.jstree", function (event, data) {
        $.get('/docs.js', {category : data.rslt.obj.data("id") } )
// data.rslt.obj` is the jquery extended node that was clicked
//          alert(data.rslt.obj.attr("id"));
//но работает именно так:... 
// alert(data.rslt.obj.data("id"));
      });
});
