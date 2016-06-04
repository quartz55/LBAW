{function name=stars}
{math equation="floor(x)" x=$rating assign=full_stars}
{math equation="x - floor(x)" x=$rating y=$rating assign=half_stars}
{math equation="5 - ceil(x)" x=$rating assign=empty_stars}

{for $i=1 to $full_stars}
    <i class="fa fa-star"></i>
{/for}
{for $i=1 to $half_stars}
    <i class="fa fa-star-half-o"></i>
{/for}
{for $i=1 to $empty_stars}
    <i class="fa fa-star-o"></i>
{/for}
{/function}

{include file='common/header.tpl'}

<link href="{$BASE_URL}css/product.css" rel="stylesheet"/>

{include file='common/left-panel.tpl' grid_opt="col-md-2 text-xs-center"}

<div class="main-content col-xs-12 col-md-10">
    <h3>{$product.name} <small class="label label-default">#{$product.code}</small></h3>

    <!-- TOOLBAR -->
    <form action="{$BASE_URL}actions/add_to_cart.php" method="POST" class="form-inline m-b-1">
        <input name="id" type="hidden" value="{$product.idproduct}"/>
        <div class="form-group">
            <span class="price-tag form-control">€{$product.price}</span>
            <div class="input-group add-to-cart">
                <input name="quantity" class="form-control" id="add-to-cart-qty" type="number" min="1" max="{$product.stock}" step="1" value="1"/>
                <span class="input-group-btn">
                    <button type="submit" class="add-to-cart-btn btn btn-warning">
                        <i class="fa fa-shopping-cart"></i> Add to cart</button>
                </span>
            </div>
        </div>
    </form>
    <!-- END TOOLBAR -->

    <div class="product-info row">
        <div class="product-image col-md-4">
            <img src="http://placehold.it/350x250" class="img-fluid img-rounded center-block" />
        </div>
        <div class="product-description col-md-8">
            <p>{$product.description}</p>
        </div>
    </div>

    <!-- REVIEWS -->
    <div class="product-reviews row">
        <div class="col-xs-12">
            <h4 class="text-muted">Reviews</h4>
        </div>
        <div class="reviews-stats col-xs-12 col-md-3 text-xs-center">
            <div class="reviews-avg">
                {$reviews_avg}
            </div>
            <div class="reviews-avg-stars">
                {call stars rating=$reviews_avg}
            </div>
            <div class="reviews-total-reviews">
                <i class="fa fa-users"></i>
                <span class="reviews-total-number">
                    {$reviews_count}
                </span>
            </div>
        </div>
        <div class="reviews col-xs-12 col-md-9">
            {foreach $reviews as $review}
                <div class="review">
                    <div class="review-header">
                        <span class="review-rating">{stars rating=$review.rating}</span>
                        {if $review.title != ''}
                            <strong>{$review.title}</strong>
                        {/if}
                    </div>
                    <div class="review-user">By <span class="text-muted">{$review.name}</span></div>
                    {if $review.description != ''}
                        <div class="review-description">{$review.description}</div>
                    {/if}
                </div>
            {/foreach}
        </div>
    </div>
    <!-- END REVIEWS -->
</div>



{include file='common/footer.tpl'}

<script src="{$BASE_URL}js/product.js">
</script>
