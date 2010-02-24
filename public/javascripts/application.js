// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function setupPostLinks() {
    $('a.post-link').click(function() {
        $.get($(this).attr('href'),{format: 'js'},function(data) {
            $('#right').html(data)
        })
        return false
    })
}

function setupReadToggle() {
    $('select#show-posts').change(function() {
        $('.read').toggle()
    })
}

function setupAddFeedLink() {
    $("a#add-feed").click(function() {
        $.get($(this).attr('href'),{format: 'js'},function(data) {
            $("#right").html(data)
        })
        return false;
    })
}

$(setupPostLinks)
$(setupReadToggle)
$(setupAddFeedLink)