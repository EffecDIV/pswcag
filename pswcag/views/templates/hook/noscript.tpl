<noscript>
  <div id="pswcag-noscript" class="pswcag-bottom-right">
    <input type="checkbox" id="pswcag-noscript-toggle" hidden>

    <label for="pswcag-noscript-toggle" id="pswcag-toggle" aria-expanded="false" aria-controls="pswcag-noscript-menu" title="{l s='Accessibility Options' mod='pswcag'}">
      <i class="fas fa-universal-access" aria-hidden="true"></i>
    </label>

    <div id="pswcag-noscript-menu">
      <div class="pswcag-header">
        {l s='Accessibility (NoJS)' mod='pswcag'}
      </div>

      <ul class="pswcag-actions">
        <li>
          <label>
            <input type="checkbox" id="pswcag-fonti-toggle" hidden>
            <span class="pswcag-btn pswcag-big">
              <i class="fas fa-search-plus" aria-hidden="true"></i> {l s='Increase Font' mod='pswcag'}
            </span>
          </label>
        </li>
        <li>
          <label>
            <input type="checkbox" id="pswcag-fontd-toggle" hidden>
            <span class="pswcag-btn pswcag-big">
              <i class="fas fa-search-minus" aria-hidden="true"></i> {l s='Decrease Font' mod='pswcag'}
            </span>
          </label>
        </li>
        <li>
          <label>
            <input type="checkbox" id="pswcag-contrast-toggle" hidden>
            <span class="pswcag-btn pswcag-big">
              <i class="fas fa-adjust" aria-hidden="true"></i> {l s='High Contrast' mod='pswcag'}
            </span>
          </label>
        </li>
        <li>
          <label>
            <input type="checkbox" id="pswcag-grayscale-toggle" hidden>
            <span class="pswcag-btn pswcag-big">
              <i class="fas fa-low-vision" aria-hidden="true"></i> {l s='Grayscale' mod='pswcag'}
            </span>
          </label>
        </li>
        <li>
          <label>
            <input type="checkbox" id="pswcag-underline-toggle" hidden>
            <span class="pswcag-btn pswcag-big">
              <i class="fas fa-link" aria-hidden="true"></i> {l s='Underline Links' mod='pswcag'}
            </span>
          </label>
        </li>
        <li>
          <label>
            <input type="checkbox" id="pswcag-animation-toggle" hidden>
            <span class="pswcag-btn pswcag-big">
              <i class="fas fa-pause-circle" aria-hidden="true"></i> {l s='Stop Animations' mod='pswcag'}
            </span>
          </label>
        </li>
      </ul>
    </div>
  </div>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <style>
    html:has(#pswcag-fonti-toggle:checked) {
      font-size: 120%;
    }

    html:has(#pswcag-fontd-toggle:checked) {
      font-size: 80%;
    }

    html:has(#pswcag-contrast-toggle:checked) {
      filter: contrast(125%);
    }

    html:has(#pswcag-contrast-toggle:checked) * {
      color: #000;
    }

    html:has(#pswcag-grayscale-toggle:checked) {
      filter: grayscale(100%);
    }

    html:has(#pswcag-underline-toggle:checked) a {
      text-decoration: underline;
    }

    html:has(#pswcag-animation-toggle:checked) * {
      animation: none !important;
      transition: none !important;
      scroll-behavior: auto !important;
    }

    html:has(#pswcag-noscript-toggle:checked) #pswcag-noscript-menu {
      display: block;
    }

    #pswcag-noscript {
      position: fixed;
      bottom: 20px;
      right: 20px;
      font-family: 'Segoe UI', sans-serif;
      z-index: 9999;
    }

    #pswcag-toggle {
      background: #0073aa;
      color: #fff;
      border: none;
      font-size: 2rem;
      padding: 16px;
      border-radius: 50%;
      cursor: pointer;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
      transition: all 0.3s ease;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    #pswcag-toggle:hover {
      background: #005f8d;
    }

    #pswcag-toggle i {
      font-size: 1.8rem;
      transition: transform 0.3s ease;
    }

    #pswcag-noscript-menu {
      display: none;
      position: absolute;
      bottom: 100%;
      right: 0;
      background: #fff;
      border-radius: 8px;
      padding: 24px;
      border: 1px solid #c3c3c3;
      box-shadow: 0 0 0 2px #d0d0d0, 0 4px 12px rgba(0, 0, 0, 0.1);
      width: 360px;
      font-size: 16px;
      max-height: 85vh;
      overflow-y: auto;
      transition: all 0.3s ease;
      transform-origin: bottom right;
      margin-bottom: 12px;
    }

    .pswcag-header {
      font-size: 20px;
      font-weight: bold;
      text-align: center;
      margin-bottom: 20px;
      color: #0073aa;
    }

    .pswcag-actions {
      display: flex;
      flex-direction: column;
      gap: 12px;
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .pswcag-actions label {
      width: 100%;
    }

    .pswcag-btn.pswcag-big {
      display: flex;
      align-items: center;
      gap: 12px;
      width: 100%;
      padding: 16px;
      font-size: 16px;
      background: #0073aa;
      border: none;
      border-radius: 8px;
      color: #fff;
      font-weight: 600;
      cursor: pointer;
      transition: background 0.2s;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
    }

    .pswcag-btn.pswcag-big:hover {
      background: #005f8d;
    }

    .pswcag-btn.pswcag-big i {
      font-size: 1.5rem;
      color: #fff;
    }

    @media (max-width: 768px) {
      #pswcag-noscript-menu {
        min-width: 90vw;
        max-width: 90vw;
        font-size: 17px;
      }

      #pswcag-toggle {
        font-size: 2.2rem;
        padding: 20px;
      }
    }
  </style>
</noscript>

