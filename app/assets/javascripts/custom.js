/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

// создаем свой обработчик

$(document).ready(function(){
    $('.not_current_page_item').mouseenter(function(){
        $(this).animate({
                        backgroundColor: "#803824",
                        color: "#FFFFFF"
                        } , 500);
    });

    $('.not_current_page_item').mouseout(function(){
        $(this).animate({
                            backgroundColor: "#FFFFFF",
                            color: "#551300"
                        } , 500)
               .queue(function(){
                                    $(this).queue("fx", [])
                                });
    });


});