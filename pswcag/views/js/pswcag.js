$(function () {
  const $widget = $('#pswcag-widget');
  const $toggleBtn = $('#pswcag-toggle');
  const $menu = $('#pswcag-menu');
  const positionKey = 'pswcag-corner';
  let isDragging = false, offsetX = 0, offsetY = 0;

  const savedCorner = localStorage.getItem(positionKey);
  applyCorner(savedCorner || 'bottom-right');

  function applyCorner(corner) {
    $widget
      .removeClass('pswcag-top-left pswcag-top-right pswcag-bottom-left pswcag-bottom-right')
      .addClass('pswcag-' + corner)
      .css({ top: '', left: '', bottom: '', right: '', cursor: 'default', transform: 'scale(1)' });
  }

  $toggleBtn.on('click', () => {
    const expanded = $toggleBtn.attr('aria-expanded') === 'true';
    $toggleBtn.attr('aria-expanded', !expanded);
    $menu.prop('hidden', expanded);
  });

  $widget.on('mousedown touchstart', function (e) {
    if (
      !$menu.prop('hidden') ||
      $(e.target).closest('#pswcag-menu').length ||
      ($(e.target).is('button') && !$(e.target).is('#pswcag-toggle'))
    ) {
      return;
    }

    const evt = e.originalEvent.touches ? e.originalEvent.touches[0] : e;
    isDragging = true;
    offsetX = evt.clientX - $widget[0].getBoundingClientRect().left;
    offsetY = evt.clientY - $widget[0].getBoundingClientRect().top;
    $widget.css('transition', 'none');
    if (e.originalEvent.touches) document.body.style.overflow = 'hidden';
  });

  $(document).on('mousemove touchmove', function (e) {
    if (!isDragging) return;
    const evt = e.originalEvent.touches ? e.originalEvent.touches[0] : e;
    const x = evt.clientX - offsetX;
    const y = evt.clientY - offsetY;
    const maxX = window.innerWidth - $widget.outerWidth();
    const maxY = window.innerHeight - $widget.outerHeight();
    $widget.css({ top: Math.max(0, Math.min(y, maxY)), left: Math.max(0, Math.min(x, maxX)), right: '', bottom: '' });
  });

  $(document).on('mouseup touchend', function (e) {
    if (!isDragging) return;
    isDragging = false;
    document.body.style.overflow = '';
    const evt = e.originalEvent.changedTouches ? e.originalEvent.changedTouches[0] : e;
    const x = evt.clientX, y = evt.clientY;
    const cx = window.innerWidth / 2, cy = window.innerHeight / 2;
    const corner = x < cx ? (y < cy ? 'top-left' : 'bottom-left') : (y < cy ? 'top-right' : 'bottom-right');
    localStorage.setItem(positionKey, corner);
    $widget.css('transition', 'all 0.3s ease');
    applyCorner(corner);
  });

  $('#pswcag-reset-position').on('click', () => {
    localStorage.removeItem(positionKey);
    applyCorner('bottom-right');
  });

  function toggleState($btn, className, key) {
    const active = $btn.attr('aria-pressed') === 'true';
    $btn.attr('aria-pressed', !active).toggleClass('pswcag-active', !active);
    $('html').toggleClass(className, !active);
    localStorage.setItem(key, !active);
  }

  function setupButton(id, className, key) {
    const $btn = $(id);
    if (!$btn.length) return;
    const stored = localStorage.getItem(key) === 'true';
    $btn.attr('aria-pressed', stored);
    if (stored) {
      $('html').addClass(className);
      $btn.addClass('pswcag-active');
    }
    $btn.on('click', e => {
      e.preventDefault();
      toggleState($btn, className, key);
    });
  }

  if (!pswcag_config.contrast) $('#pswcag-contrast').closest('li').remove();
  else setupButton('#pswcag-contrast', 'pswcag-contrast', 'pswcag-contrast');

  if (!pswcag_config.grayscale) $('#pswcag-grayscale').closest('li').remove();
  else setupButton('#pswcag-grayscale', 'pswcag-grayscale', 'pswcag-grayscale');

  if (!pswcag_config.links) $('#pswcag-links').closest('li').remove();
  else setupButton('#pswcag-links', 'pswcag-underline', 'pswcag-underline');

  if (!pswcag_config.animations) $('#pswcag-stop-animations').closest('li').remove();
  else setupButton('#pswcag-stop-animations', 'pswcag-no-animations', 'pswcag-no-animations');

  const fontKey = 'pswcag-font-size';
  let fontScale = parseFloat(localStorage.getItem(fontKey)) || 1;

  if (!pswcag_config.font) {
    $('#pswcag-font-inc').closest('li').remove();
  } else {
    $('html').css('font-size', fontScale + 'em');
    const baseSize = window.innerWidth <= 768 ? '14px' : '15px';
    $('#pswcag-menu, #pswcag-menu *').css({
      fontSize: baseSize,
      transform: 'scale(1)',
      lineHeight: '1.2',
      letterSpacing: 'normal'
    });

    $('#pswcag-font-inc').on('click', e => {
      e.preventDefault();
      fontScale = Math.min(fontScale + 0.1, 1.6);
      $('html').css('font-size', fontScale + 'em');
      localStorage.setItem(fontKey, fontScale);
    });

    $('#pswcag-font-dec').on('click', e => {
      e.preventDefault();
      fontScale = Math.max(fontScale - 0.1, 0.8);
      $('html').css('font-size', fontScale + 'em');
      localStorage.setItem(fontKey, fontScale);
    });
  }

  $('#pswcag-reset').on('click', e => {
    e.preventDefault();
    ['contrast', 'grayscale', 'underline', 'no-animations', 'font-size'].forEach(k =>
      localStorage.removeItem('pswcag-' + k)
    );
    $('html').removeClass('pswcag-contrast pswcag-grayscale pswcag-underline pswcag-no-animations');
    $('.pswcag-active').removeClass('pswcag-active');
    $('html').css('font-size', '1em');
    fontScale = 1;
    localStorage.setItem(fontKey, fontScale);
  });

  if (pswcag_config.shortcut) {
    $(document).on('keydown', e => {
      if (!e.altKey) return;
      const key = e.key.toLowerCase();
      switch (key) {
        case 'arrowup': $('#pswcag-font-inc').click(); break;
        case 'arrowdown': $('#pswcag-font-dec').click(); break;
        case 'a': $('#pswcag-contrast').click(); break;
        case 'c': $('#pswcag-grayscale').click(); break;
        case 'g': $('#pswcag-links').click(); break;
        case 'l': $('#pswcag-stop-animations').click(); break;
        case 'm':
          const expanded = $toggleBtn.attr('aria-expanded') == 'true';
          $toggleBtn.attr('aria-expanded', !expanded);
          $menu.prop('hidden', expanded);
          break;
      }
    });
  }
});

