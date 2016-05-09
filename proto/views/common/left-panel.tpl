<aside class="col-sm-6 col-md-2 left-panel">
    {if $USERNAME}
        {include file='common/user-panel.tpl'}
    {else}
        {include file='common/guest-panel.tpl'}
    {/if}
</aside>
