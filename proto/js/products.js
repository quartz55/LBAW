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

    $.ajax({
        url: BASE_URL+"views/products/product-listing.tpl"
    }).done(function (template) {
        // Update num products header
        var num_prods = $("#num-products");
        num_prods.html(num_prods.html().replace(/\d+/g, new_products.length));

        var smartyjs = new jSmart(template);
        $(".product").remove();
        $.each(new_products, function(i, p) {
            var product = smartyjs.fetch({BASE_URL: BASE_URL, product: p});

            $(".main-content").append(product);
        });
    }).fail(function(x, err) { console.error(err); });

}
