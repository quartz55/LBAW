<div class="error_msgs container">
    {foreach $ERROR_MSGS as $err}
        <div class="alert alert-danger fade in">
            {$err}
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        </div>
    {/foreach}
</div>

<div class="succ_msgs container">
    {foreach $SUCCESS_MSGS as $succ}
        <div class="alert alert-success fade in">
            {$succ}
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        </div>
    {/foreach}
</div>
