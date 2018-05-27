/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $('#search').focus(function () {
        $('#searchtab').removeClass("disabled").addClass("");
        $('ul.tabs').tabs('select_tab', 'test-swipe-4');
        $('#test-swipe-4').load('results.jsp', function () {
        });
    });
});