{include file='common/header.tpl'}

        <aside class="col-sm-2 left-panel">
            {if $USERNAME}
                {include file='common/user-panel.tpl'}
            {else}
                {include file='common/guest-panel.tpl'}
            {/if}
        </aside>

{include file='common/footer.tpl'}
