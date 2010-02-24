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

function setupSorting() {
    $('select#sort-type').change(function() {
        var type = $(this).find('option:selected').val()
        if (type == 'date') {
            sortPostsByLinkText()
        }
        else if (type == 'feed') {
            sortPostsByFeed()
        }
    })
}

function compByLinkText(a,b) { 
    return ($(a).find("a").text() > $(b).find("a").text()) ? 1 : -1 
}

function compByFeed(a,b) { 
    var sortVal = function(x) { return [$(x).attr('data-feed-title'),$(x).find('a').text()] }
    return (sortVal(a) > sortVal(b)) ? 1 : -1 
}

function sortPostsByLinkText() {
    var sorted = $('.post').sort(compByLinkText)
    $('#left .feeds').html('').append(sorted)
    $('.post-feed-title').show()
}

function sortPostsByFeed() {
    var sorted = $('.post').sort(compByFeed)
    $('#left .feeds').html('').append(sorted)
    $('.post-feed-title').show()
}

$(setupPostLinks)
$(setupReadToggle)
$(setupAddFeedLink)
$(setupSorting)