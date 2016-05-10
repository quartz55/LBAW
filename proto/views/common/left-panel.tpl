<aside class="left-panel {$grid_opt}">
    {if $USERNAME}
        {include file='common/user-panel.tpl'}
    {else}
        {include file='common/guest-panel.tpl'}
    {/if}
</aside>
