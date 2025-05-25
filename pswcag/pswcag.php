<?php

if (!defined('_PS_VERSION_')) {
    exit;
}

use PrestaShop\PrestaShop\Core\Module\WidgetInterface;

class Pswcag extends Module implements WidgetInterface
{
    public function __construct()
    {
        $this->name = 'pswcag';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'EffecDiv';
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('WCAG Accessibility Tools');
        $this->description = $this->l('Adds accessibility tools to your PrestaShop store according to WCAG 2.1 AA.');

        $this->ps_versions_compliancy = [
            'min' => '1.7.0.0',
            'max' => _PS_VERSION_,
        ];
    }

    public function install()
    {
        return parent::install()
            && $this->registerHook('displayFooter')
            && $this->registerHook('displayAfterBodyOpeningTag');
    }

    public function uninstall()
    {
        return parent::uninstall()
            && Configuration::deleteByName('PSWCAG_FONT')
            && Configuration::deleteByName('PSWCAG_CONTRAST')
            && Configuration::deleteByName('PSWCAG_GRAYSCALE')
            && Configuration::deleteByName('PSWCAG_LINKS')
            && Configuration::deleteByName('PSWCAG_ANIMATIONS')
            && Configuration::deleteByName('PSWCAG_SHORTCUT')
            && Configuration::deleteByName('PSWCAG_LABEL');
    }

    public function getContent()
    {
        Tools::redirectAdmin(
            $this->context->link->getAdminLink('AdminPswcag')
        );
    }

    public function hookDisplayAfterBodyOpeningTag()
    {
        Media::addJsDef([
            'pswcag_config' => [
                'font' => (bool) Configuration::get('PSWCAG_FONT'),
                'contrast' => (bool) Configuration::get('PSWCAG_CONTRAST'),
                'grayscale' => (bool) Configuration::get('PSWCAG_GRAYSCALE'),
                'links' => (bool) Configuration::get('PSWCAG_LINKS'),
                'animations' => (bool) Configuration::get('PSWCAG_ANIMATIONS'),
                'shortcut' => (bool) Configuration::get('PSWCAG_SHORTCUT'),
            ],
        ]);

        return $this->renderWidget('displayAfterBodyOpeningTag', []);
    }

    public function hookDisplayFooter()
    {
        $this->context->controller->registerStylesheet(
            'pswcag-style',
            'modules/' . $this->name . '/views/css/pswcag.css',
            [
                'media' => 'all',
                'priority' => 150,
            ]
        );

        $this->context->controller->registerJavascript(
            'pswcag-script',
            'modules/' . $this->name . '/views/js/pswcag.js',
            [
                'position' => 'bottom',
                'priority' => 150,
                'attribute' => 'defer',
            ]
        );
        
        $this->context->controller->registerStylesheet(
            'pswcag-fontawesome',
            'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css',
            [
                'server' => 'remote',
                'priority' => 1,
            ]
        );

        return;
    }

    public function renderWidget($hookName, array $configuration)
    {
        if (!$this->isCached('views/templates/hook/pswcag.tpl')) {
            $this->smarty->assign(
                $this->getWidgetVariables($hookName, $configuration)
            );
        }

        return $this->fetch('module:' . $this->name . '/views/templates/hook/pswcag.tpl');
    }

    public function getWidgetVariables($hookName, array $configuration)
    {
        return [
            'pswcag_label' => Configuration::get('PSWCAG_LABEL', 'Accessibility Options'),
        ];
    }
}

