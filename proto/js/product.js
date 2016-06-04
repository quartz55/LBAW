$(function () {
    var qty = $("#add-to-cart-qty");
    var base_width = 16;
    var stock = qty.attr('max');
    console.log(stock);
    qty.on('propertychange input', function () {
      if (Number(qty.val()) <= 0 && qty.val().length > 0) qty.val(1);
        if (Number(qty.val()) > stock) qty.val(stock);
        var new_w = (qty.val().length+1) * base_width;
        console.log(new_w);
        qty.css('width', new_w);
    });
});
