starList = []

$("#u-one").mouseover(function() {
    $("#u-one").addClass("checked").removeClass("unchecked");
});

$("#u-one").mouseout(function() {
    $("#u-one").addClass("unchecked").removeClass("checked");
});




// star_elements = $('.fa-star');
//
// function changeRatingStars()
// {
//   // Current star hovered
//   var star = $(this);
//
//   // Removes all colors first from all stars
//   $('.fa-star').removeClass('gray').removeClass('yellow');
//
//   // Makes the current hovered star yellow
//   star.addClass('yellow');
//
//   // Makes the previous stars yellow and the next stars gray
//   star.parent().prevAll().children('.fa-star').addClass('yellow');
//   star.parent().nextAll().children('.fa-star').addClass('gray');
// }
//
// function resetRatingStars()
// {
//     star_elements.each(function(i, elem)
//     {
//         $(elem).removeClass('yellow').removeClass('gray').addClass(current_star_statusses[i] ? 'yellow' : 'gray');
//     });
// }
