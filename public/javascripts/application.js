// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
    $('a.post-link').click(function() {
        $.get($(this).attr('href'),{format: 'js'},function(data) {
            $('#right').html(data)
        })
        return false
    })
})