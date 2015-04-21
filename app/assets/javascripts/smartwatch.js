$(function () {


    (function ($) {
        $.fn.daysText = function (days) {
            text = 'At least ' + days + ' day';
            if (days !== 1) {
                text += 's'
            }
            this.text(text);
            this.attr('data-battery', days);
        };

        $.fn.priceText = function (price) {
            text = 'At most $' + price;

            this.text(text);
            this.attr('data-price', price);
        };

        $.fn.setLoading = function () {
            this.html('<span class="fa fa-refresh fa-refresh-animate"></span> Loading...');
        };

    })(jQuery);

    $('.ui-slider-handle').draggable();

    var smartwatches = [];
    var params = {};
    var buttonsClickable = [true, true, true, true]

    getSmartwatches();

    function getSmartwatches() {
        var url = '/smartwatches.json?';
        $.each(params, function (key, value) {
            url += key + '=' + value + '&'
        });
        return $.get(url, function (data) {
            smartwatches = data;
            updateSmartwatches(smartwatches);
        });
    }

    function updateSmartwatches(smartwatches) {
        var count = smartwatches.length;
        var html = '<button class="btn btn-primary" style="padding: 2px 8px">'
        html += count
        if (count === 1) {
            html += ' SMARTWATCH';
        } else {
            html += ' SMARTWATCHES';
        }
        html += '</button>'
        $('#smartwatch-count').html(html);
        
        $('#smartwatch-list').html('');
        
        $.each(smartwatches, function (index, smartwatch) {        	
            $('#smartwatch-list').append(smartwatchBox(index, smartwatch));
        })
    }
    
    function smartwatchBox(index, smartwatch) {
      html = '<a href="' + smartwatch.amazon_url + '" class="smartwatch-box col-md-4" style="background-image: url(' + smartwatch.image_path + ')">';
      html +=   '<h2 class="display-table" style="width:100%">';
      html +=		'<span class="table-cell" style="width:100%">' +smartwatch.name + '</span>';
      html +=		'<span class="btn btn-primary table-cell" style="text-align:right">' + '#' + (index + 1) + '</span>'; 
      html +=	'</h2>';
      html +=   '<span class="orange">Buy for $' + smartwatch.price + '</span>';
      html +=   '<br>';
      html +=	smartwatch.notes;
      html += '</a>';
      
      return html
    }

    function errorMessage(message) {
        bootbox.alert({
            message: message,
            title: "Error"
        });
    }
    
    $('#smartwatch-top-bar').click(function () {
        toggleSmartwatches();
    });
    
    
    function openSmartwatches() {
      $('#smartwatch-arrow i').removeClass('fa-arrow-up').addClass('fa-arrow-down');
      $('#smartwatch-content').slideDown();
      $('#social-bar').slideDown()
      $('#smartwatches').animate({
        bottom: '40px'
      });
    }
    
    function closeSmartwatches() {
      $('#smartwatch-arrow i').removeClass('fa-arrow-down').addClass('fa-arrow-up');
      $('#social-bar').slideUp();
      $('#smartwatches').animate({
        bottom: '0px'
      });
      $('#smartwatch-content').slideUp();
    }
    
    function toggleSmartwatches() {
      if ($('#smartwatch-content').is(':visible')) {
        closeSmartwatches();
      } else {
        openSmartwatches();
      }
    }

    $('#button1').click(function () {
      if (buttonsClickable[0]) {
        buttonsClickable[0] = false;
        $('#page1').animate({
            right: '+=100vw',
        }, function() {
          $(this).hide();  
        });
        $('#page2').show();
        $('#page2').animate({
            right: '+=100vw'
        });
        $('#start-over').fadeIn(1000);
      }
    })

    $('#button2').click(function () {
        var value = $('input[name=radio]:checked', '#page2 .funkyradio').val();
        if (value === undefined) {
            errorMessage('You must choose a phone type.')
        } else {
          if (buttonsClickable[1]) {
            buttonsClickable[1] = false;
            $(this).setLoading();
            params.phoneos = value;
            $.when(getSmartwatches()).done(function () {
                $('#page2').animate({
                    right: '+=100vw'
                }, function() {
                  $(this).hide();  
                });
                $('#page3').show();
                $('#page3').animate({
                    right: '+=100vw'
                });
            });
          }
        }
    });

    $('#button3').click(function () {
        var value = $('#battery-life-amount').attr('data-battery');
        if (value === undefined) {
            errorMessage('You must select something')
        } else {
          if (buttonsClickable[2]) {
            buttonsClickable[2] = false;
            $(this).setLoading();
            params.battery = value;
            $.when(getSmartwatches()).done(function () {
                $('#page3').animate({
                    right: '+=100vw'
                }, function() {
                  $(this).hide();  
                });
                $('#page4').show();
                $('#page4').animate({
                    right: '+=100vw'
                });
            });
          }
        }
    });

    $('#button4').click(function () {
        var value = $('#price-amount').attr('data-price');
        if (value === undefined) {
            errorMessage('You must select something')
        } else {
          if (buttonsClickable[3]) {
            buttonsClickable[3] = false;
            $(this).setLoading();
            params.price = value;
            $.when(getSmartwatches()).done(function () {
                $('#page4').animate({
                    right: '+=100vw'
                  }, function() {
                  $(this).hide();  
                });
                $('#page5').show();
                $('#page5').animate({
                    right: '+=100vw'
                }, function() {
                  
                  setTimeout(openSmartwatches, 500);
                });
                
            });
          }
        }
    });

    // SLIDER

    $("#battery-slider").slider({
        range: "max",
        min: 1,
        max: 10,
        value: 2,
        step: 0.25,
        slide: function (event, ui) {
            $("#battery-life-amount").daysText(ui.value);
        }
    });
    
    $("#battery-life-amount").daysText($("#battery-slider").slider("value"));

    $("#price-slider").slider({
        range: "max",
        min: 0,
        max: 1000,
        value: 200,
        step: 10,
        slide: function (event, ui) {
            $("#price-amount").priceText(ui.value);
        }
    });
    
    $("#price-amount").priceText($("#price-slider").slider("value"));
    
    
    // SOCIAL MEDIA POP-UP
    
    $('#social-bar a').click(function() {
      window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');
      return false;
    });
    
});