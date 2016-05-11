$(function () {
    $("#search-input").keyup(function(e) {
        if (e.keyCode == 13) $("#search-btn").click();
    });

    $("#search-btn").click(function() {
        var search_terms = $("#search-input").val();
        history.pushState('p', null, '?search=' + search_terms);

        $.ajax({
            url: BASE_URL+"api/search_products.php",
            method: "POST",
            data: {query: search_terms}
        }).done(updateProducts).fail(function(x, err) { console.error(err); });
    });
});

function updateProducts(new_products) {
    console.log("Updating products");
    console.log(new_products.length);

    // Update num products header
    var num_prods = $("#num-products");
    num_prods.html(num_prods.html().replace(/\d+/g, new_products.length));

    var tpl, removed = false;
    var addProducts = function() {
        if (tpl === undefined || !removed) return;

        $.each(new_products, function(i, p) {
            var product = tpl.fetch({BASE_URL: BASE_URL, product: p});
            $(product).hide().appendTo(".main-content").fadeIn();
        });
    };

    // Get product template
    $.ajax({
        url: BASE_URL+"views/products/product-listing.tpl",
        cache: false
    }).done(function (data) {
        tpl = new jSmart(data);
        addProducts();
    }).fail(function(x, err) { console.error(err); });

    // Remove visible list with fade
    if (!$(".product").length) removed = true;
    else $(".product").each(function (i) {
        $(this).fadeOut(function () {
            $(this).remove();
            if (!removed) {
                removed = true;
                addProducts();
            }
        });
    });
}
