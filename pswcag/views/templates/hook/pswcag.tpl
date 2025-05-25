{assign var='font' value=Configuration::get('PSWCAG_FONT')}
{assign var='contrast' value=Configuration::get('PSWCAG_CONTRAST')}
{assign var='grayscale' value=Configuration::get('PSWCAG_GRAYSCALE')}
{assign var='links' value=Configuration::get('PSWCAG_LINKS')}
{assign var='animations' value=Configuration::get('PSWCAG_ANIMATIONS')}
{assign var='shortcut' value=Configuration::get('PSWCAG_SHORTCUT')}
{assign var='label' value=Configuration::get('PSWCAG_LABEL')}

<script>
  window.pswcag_config = {
    font: {$font|escape:'javascript'},
    contrast: {$contrast|escape:'javascript'},
    grayscale: {$grayscale|escape:'javascript'},
    links: {$links|escape:'javascript'},
    animations: {$animations|escape:'javascript'},
    shortcut: {$shortcut|escape:'javascript'}
  };
</script>

<div id="pswcag-widget" class="pswcag-bottom-right">
  <button
    id="pswcag-toggle"
    aria-expanded="false"
    aria-controls="pswcag-menu"
    aria-label="{$label|escape:'html':'UTF-8'}"
    title="{$label|escape:'html':'UTF-8'}"
  >
    <i class="fas fa-universal-access" aria-hidden="true"></i>
  </button>

  <div id="pswcag-menu" hidden>
    <div class="pswcag-header">
      {$label|escape:'html':'UTF-8'}
    </div>

    <ul class="pswcag-actions">
      <li style="display: flex; gap: 12px;">
        <button id="pswcag-font-inc" class="pswcag-btn pswcag-big" style="flex:1;">
          <i class="fas fa-search-plus" aria-hidden="true"></i> {l s='Increase' mod='pswcag'}
        </button>
        <button id="pswcag-font-dec" class="pswcag-btn pswcag-big" style="flex:1;">
          <i class="fas fa-search-minus" aria-hidden="true"></i> {l s='Decrease' mod='pswcag'}
        </button>
      </li>
      <li>
        <button id="pswcag-contrast" class="pswcag-btn pswcag-big">
          <i class="fas fa-adjust" aria-hidden="true"></i> {l s='High Contrast' mod='pswcag'}
        </button>
      </li>
      <li>
        <button id="pswcag-grayscale" class="pswcag-btn pswcag-big">
          <i class="fas fa-low-vision" aria-hidden="true"></i> {l s='Grayscale' mod='pswcag'}
        </button>
      </li>
      <li>
        <button id="pswcag-links" class="pswcag-btn pswcag-big">
          <i class="fas fa-link" aria-hidden="true"></i> {l s='Underline Links' mod='pswcag'}
        </button>
      </li>
      <li>
        <button id="pswcag-stop-animations" class="pswcag-btn pswcag-big">
          <i class="fas fa-pause-circle" aria-hidden="true"></i> {l s='Stop Animations' mod='pswcag'}
        </button>
      </li>
    </ul>

    <div class="pswcag-footer">
      <button
        id="pswcag-reset"
        class="pswcag-btn-icon"
        title="{l s='Reset settings' mod='pswcag'}"
        aria-label="{l s='Reset settings' mod='pswcag'}"
      >
        <i class="fas fa-sync-alt" aria-hidden="true"></i>
      </button>

      <button
        id="pswcag-reset-position"
        class="pswcag-btn-icon"
        title="{l s='Reset position' mod='pswcag'}"
        aria-label="{l s='Reset position' mod='pswcag'}"
      >
        <i class="fas fa-crosshairs" aria-hidden="true"></i>
      </button>
    </div>
  </div>
</div>
<noscript>
{include file='module:pswcag/views/templates/hook/noscript.tpl'}
</noscript>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous"referrerpolicy="no-referrer"/>
<link rel="stylesheet" href="{$urls.base_url}modules/pswcag/views/css/pswcag.css"/>
<script src="{$urls.base_url}modules/pswcag/views/js/pswcag.js"defer></script>

