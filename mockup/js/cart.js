$(function () {
    var items = parseInt(Cookies.get("cartItems"));
    var product_temp = $("article.cart-product").wrap('<p/>').parent().html();
    $("article.cart-product").unwrap();
    $("article.cart-product").remove();
    console.log(product_temp);
    // temp.remove();

    for (var i = 0; i < items; ++i)
        $(".cart-header").after(product_temp);

    $(".cart-items-number").html(items);
    $(".cart-cost").html("€"+items*5.99);
});
