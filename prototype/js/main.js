var navButtons = {
    index: "index.html",
    products: "products.html",
    product1: "products.html",
    contact: "contact.html"
};


$(function () {
    setActive();
    if (!Cookies.get('cartItems'))
        Cookies.set('cartItems', '0');
    setCartItems();

    $(".add-to-cart").click(addCartItem);
});

function getCurentFileName(){
    var pagePathName= window.location.pathname;
    return pagePathName.substring(pagePathName.lastIndexOf("/") + 1);
}

function setActive() {
    var page = getCurentFileName().split(".")[0];
    var btnName = navButtons[page];
    // console.log(page + " - " + btnName);
    if (btnName !== null) {
        var navBtn = $(".site-nav a[href='"+btnName+"']");
        navBtn.parent().addClass("active");
    }
}

function addCartItem() {
    var numItems = Cookies.get("cartItems");
    ++numItems;
    Cookies.set("cartItems", numItems);
    setCartItems();
}

function setCartItems() {
    var numItems = Cookies.get("cartItems");
    $(".cart-num-items").html(" " + numItems);
}
