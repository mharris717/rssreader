// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Link Setup

function setupPostLinks() {
    $('a.post-link').live('click',function() {
        $.get($(this).attr('href'),{format: 'js'},function(data) {
            $('#right').html(data)
        })
        return false
    })
}

function setupReadToggle() {
    $('select#show-posts').change(function() {
        $('.read').toggle(500)
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

// Sorting

function compByLinkText(a,b) { 
    return ($(a).attr('data-post-dt') > $(b).attr('data-post-dt')) ? -1 : 1 
}

function compByFeed(a,b) { 
    if ($(a).attr('data-feed-title') != $(b).attr('data-feed-title')) {
        return ($(a).attr('data-feed-title') > $(b).attr('data-feed-title')) ? 1 : -1
    }
    return ($(a).attr('data-post-dt') > $(b).attr('data-post-dt')) ? -1 : 1
}

function sortFunc() {
    var type = $('select#sort-type').find('option:selected').val()
    if (type == 'date') {
        return compByLinkText
    }
    else if (type == 'feed') {
        return compByFeed
    }
}

function replaceWithSortedPosts() {
    var sorted = $('.post').sort(sortFunc())
    $('.feeds').quicksand(sorted)
}

function setupSorting() {
    $('select#sort-type').change(replaceWithSortedPosts)
}

// Rest

$(setupPostLinks)
$(setupReadToggle)
$(setupAddFeedLink)
$(setupSorting)
$(function() {
    $('#left .feeds').quicksand($('#left .feeds .post'))
})