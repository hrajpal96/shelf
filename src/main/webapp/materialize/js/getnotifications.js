/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* global checkForNotifications */
function checkNotifications() {
    var xmlhttp = new XMLHttpRequest();
    var url = "getNotifications.jsp";
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            if (xmlhttp.responseText.endsWith("0")) {
            
            }else{
                document.getElementById("notificationcount").innerHTML = xmlhttp.responseText; 
            }
        }
    };

}