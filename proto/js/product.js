$(function () {
    var qty = $("#add-to-cart-qty");
    var base_width = Number(qty.css('width').slice(0,-2));
    qty.on('propertychange input', function () {
        if (qty.val().length <= 0 || qty.val() <= 0) qty.val(1);
        var new_w = base_width+(qty.val().length-1)*base_width/3;
        console.log(new_w);
        qty.css('width', new_w);
    });
});
