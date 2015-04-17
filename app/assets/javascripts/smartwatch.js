$(function () {


    (function ($) {
        $.fn.daysText = function (days) {
            text = days + ' day';
            if (days !== 1) {
                text += 's'
            }
            this.text(text);
            this.attr('data-battery', days);
        };

        $.fn.priceText = function (price) {
            text = '$' + price;

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
        count = smartwatches.length
        $('#smartwatch-count').html(count)
        if (count === 1) {
            $('#smartwatch-count').append(' smartwatch')
        } else {
            $('#smartwatch-count').append(' smartwatches')
        }
        $('#smartwatch-list').html('');
        $.each(smartwatches, function (index, smartwatch) {
            $('#smartwatch-list').append(smartwatchBox(smartwatch));
        })
    }
    
    function smartwatchBox(smartwatch) {
      html = '<a href="' + smartwatch.amazon_url + '" class="smartwatch-box col-md-4" style="background-image: url(' + smartwatch.image_path + ')">';
      html +=   '<h2>' + smartwatch.name + '</h2>';
      html +=   '<span class="orange">Buy for $' + smartwatch.price + '</span>';
      html +=   '<br>'
      html +=   smartwatch.notes;
      //html +=   '<br>'
      //html +=   smartwatch.battery_life;
      //html +=   '<br>'
      //html +=   smartwatch.release_date;
      html += '</a>';
      
      return html
    }

    function errorMessage(message) {
        alert(message);
    }

    $('#button1').click(function () {
        $('#page1').animate({
            right: '+=100vw',
        }, function() {
          $(this).hide();  
        });
        $('#page2').show();
        $('#page2').animate({
            right: '+=100vw'
        });
    })

    $('#button2').click(function () {
        var value = $('input[name=radio]:checked', '#page2 .funkyradio').val();
        if (value === undefined) {
            errorMessage('You must select something')
        } else {
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
    });

    $('#button3').click(function () {
        var value = $('#battery-life-amount').attr('data-battery');
        if (value === undefined) {
            errorMessage('You must select something')
        } else {
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
    });

    $('#button4').click(function () {
        var value = $('#price-amount').attr('data-price');
        if (value === undefined) {
            errorMessage('You must select something')
        } else {
            $(this).setLoading();
            params.price = value;
            $.when(getSmartwatches()).done(function () {
                $('#page4').animate({
                    right: '+=100vw'
                  }, function() {
                  $(this).hide();  
                });
                $('#page5').animate({
                    right: '+=100vw'
                });
                openSmartwatches();
            });
        }
    });

    $('#smartwatch-arrow').click(function () {
        toggleSmartwatches();
    });
    
    
    function openSmartwatches() {
      $('#smartwatch-arrow i').removeClass('fa-arrow-up').addClass('fa-arrow-down');
      $('#smartwatch-content').show();
    }
    
    function closeSmartwatches() {
      $('#smartwatch-arrow i').removeClass('fa-arrow-down').addClass('fa-arrow-up');
      $('#smartwatch-content').hide();
    }
    
    function toggleSmartwatches() {
      if ($('#smartwatch-content').is(':visible')) {
        closeSmartwatches();
      } else {
        openSmartwatches();
      }
    }

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


});