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
    var num_prods = $("#num-products");
    num_prods.html(num_prods.html().replace(/\d+/g, new_products.length));
    $(".product").remove();

    var template = '<article class="product row" onclick="window.location.href=getProductURL({$product.idproduct});"> <span class="col-xs-12"> <h5 class="product-list-name">{$product.name}</h5> <span class="price-tag">&euro;{$product.price}</span> </span> <div class="col-sm-3"> <img src="http://placehold.it/350x250" class="img-fluid img-rounded product-image" /> </div> <div class="col-sm-9 product-list-description"> <b>#{$product.code}</b> <br/> {$product.description} </div> </article>';
    $.each(new_products, function(i, p) {
        var product = template;
        product = product.replace(/\{\$product\.idproduct\}/g, p.idproduct);
        product = product.replace(/\{\$product\.name\}/g, p.name);
        product = product.replace(/\{\$product\.price\}/g, p.price);
        product = product.replace(/\{\$product\.code\}/g, p.code);
        product = product.replace(/\{\$product\.description\}/g, p.description);

        $(".main-content").append(product);
    });
}
