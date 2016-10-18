$(function() {
  $('.map').each(function() {
    var $map = $(this);
    var $img = $(this).find('img');

    var scale = parseInt($img.prop('src').replace(/[^\d]/g, '')) || 1;
    var tileSize = 16 * scale;
    $map.addClass('scale' + scale);

    var width = $img.prop('width');
    var height = $img.prop('height');

    $map.width(width);
    $map.height(height);

    var tiles = width / tileSize * height / tileSize;

    for (var i = 0; i < tiles; i++) {
      var $tile = $('<span class="tile"><span class="index">' + i + '</span></span>');
      $img.after($tile);
    }
  });
});

$(document).on('click', function(e) {
  var $target = $(e.target);
  if ($target.hasClass('tile')) {
    $target.toggleClass('grid');
  }
  if ($target.hasClass('index')) {
    $target.parent().toggleClass('grid');
  }
});

$('.map').on('dblclick', function() {
  $(this).toggleClass('grid');
});
