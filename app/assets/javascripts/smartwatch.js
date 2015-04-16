$(function() {
    var smartwatches = [];
    var params = {};

    getSmartwatches();

    function getSmartwatches() {
        var url = '/smartwatches.json?';
        $.each(params, function(key, value) {
           url+= key + '=' + value + '&'
        });
        console.log(url);
        $.get(url, function( data ) {
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
        $('#smartwatch-content').html('');
        $.each(smartwatches, function(index, smartwatch) {
            $('#smartwatch-content').append(smartwatch.name + '<br>');
        })
    }

    $('#button1').click(function() {
        $('#page1').animate({
            right: '+=100vw'
        });
        $('#page2').animate({
            right: '+=100vw'
        });
    })

    $('#button2').click(function() {
        var value = $('input[name=radio]:checked', '#page2 .funkyradio').val();
        if (value === undefined) {

        } else {
            params.phoneos = value;
            getSmartwatches();
        }
    });

    $('#smartwatch-arrow').click(function() {
       $('#smartwatch-content').toggle('slide');
    });


});

