// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require jquery_nested_form
//= require_tree .



//入力フォーム追加機能
$(document).ready(function () {
  $('.repeater').repeater({
      initEmpty: false,
    defaultValues: {
        'disc_name': ''
    },

    isFirstItemUndeletable: true,//一番最初のものを削除できなくする

    show: function () {
        $(this).slideDown();
    },
    hide: function (deleteElement) {
        if(confirm('本当に消しますか？')) {
            $(this).slideUp(deleteElement);
        }
    },
    repeaters: [{
      selector: '.inner-repeater'
    }]
  });
});
//一番下の文で、ディスクにソングをネストしている





//上部スライダーjquery
$(function() {
    $('.center-item').slick({
          infinite: true,
          dots:true,
          slidesToShow: 1,
          centerMode: true, //要素を中央寄せ
          centerPadding:'0', //両サイドの見えている部分のサイズ
          autoplay:true, //自動再生
          responsive: [{
               breakpoint: 480,
                    settings: {
                         centerMode: false,
               }
          }]
     });
});


//下部スライダーjquery
$(function() {
    $('.multiple-item').slick({
          infinite: true,
          dots:true,
          slidesToShow: 5,
          slidesToScroll: 5,
          responsive: [{
               breakpoint: 768,
                    settings: {
                         slidesToShow: 3,
                         slidesToScroll: 3,
               }
          },{
               breakpoint: 480,
                    settings: {
                         slidesToShow: 2,
                         slidesToScroll: 2,
                    }
               }
          ]
     });
});