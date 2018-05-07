/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var edit = document.querySelector('.removeEdit');
edit.addEventListener('click', function () {
    document.querySelector('#fieldsetEnable').removeAttribute('disabled');
    edit.classList.add('disabled');
    edit.classList.remove('btn');
    edit.classList.remove('btn-flat');
    document.querySelector('.removeEdit').textContent = "";
});
