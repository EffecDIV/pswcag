<?php

class AdminPswcagController extends ModuleAdminController
{
    public function __construct()
    {
        $this->bootstrap = true;
        $this->name = 'pswcag';

        parent::__construct();
    }

    public function initContent()
    {
        parent::initContent();

        $this->context->smarty->assign('content', $this->renderForm());
    }

    protected function switchValues()
    {
        return [
            [
                'id' => 'active_on',
                'value' => 1,
                'label' => $this->module->l('Enabled'),
            ],
            [
                'id' => 'active_off',
                'value' => 0,
                'label' => $this->module->l('Disabled'),
            ],
        ];
    }

    public function renderForm()
    {
        $helper = new HelperForm();

        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->module = $this->module;
        $helper->default_form_language = (int) Configuration::get('PS_LANG_DEFAULT');
        $helper->allow_employee_form_lang = (int) Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG');

        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitPswcagModule';
        $helper->currentIndex = AdminController::$currentIndex . '&configure=' . $this->module->name;
        $helper->token = Tools::getAdminTokenLite('AdminPswcag');

        $helper->fields_value = [
            'PSWCAG_FONT' => Configuration::get('PSWCAG_FONT'),
            'PSWCAG_CONTRAST' => Configuration::get('PSWCAG_CONTRAST'),
            'PSWCAG_GRAYSCALE' => Configuration::get('PSWCAG_GRAYSCALE'),
            'PSWCAG_LINKS' => Configuration::get('PSWCAG_LINKS'),
            'PSWCAG_ANIMATIONS' => Configuration::get('PSWCAG_ANIMATIONS'),
            'PSWCAG_SHORTCUT' => Configuration::get('PSWCAG_SHORTCUT'),
            'PSWCAG_LABEL' => Configuration::get('PSWCAG_LABEL') ?: 'Accessibility Options',
        ];

        return $helper->generateForm([
            [
                'form' => [
                    'legend' => [
                        'title' => $this->module->l('WCAG Module Settings'),
                    ],
                    'input' => [
                        [
                            'type' => 'text',
                            'label' => $this->module->l('Menu title'),
                            'name' => 'PSWCAG_LABEL',
                        ],
                        [
                            'type' => 'switch',
                            'label' => $this->module->l('Enable font resizing'),
                            'name' => 'PSWCAG_FONT',
                            'values' => $this->switchValues(),
                        ],
                        [
                            'type' => 'switch',
                            'label' => $this->module->l('Enable high contrast'),
                            'name' => 'PSWCAG_CONTRAST',
                            'values' => $this->switchValues(),
                        ],
                        [
                            'type' => 'switch',
                            'label' => $this->module->l('Enable grayscale'),
                            'name' => 'PSWCAG_GRAYSCALE',
                            'values' => $this->switchValues(),
                        ],
                        [
                            'type' => 'switch',
                            'label' => $this->module->l('Enable underline links'),
                            'name' => 'PSWCAG_LINKS',
                            'values' => $this->switchValues(),
                        ],
                        [
                            'type' => 'switch',
                            'label' => $this->module->l('Disable animations'),
                            'name' => 'PSWCAG_ANIMATIONS',
                            'values' => $this->switchValues(),
                        ],
                        [
                            'type' => 'switch',
                            'label' => $this->module->l('Enable shortcuts (Alt + *)'),
                            'name' => 'PSWCAG_SHORTCUT',
                            'values' => $this->switchValues(),
                        ],
                    ],
                    'submit' => [
                        'title' => $this->module->l('Save'),
                    ],
                ],
            ],
        ]);
    }

    public function postProcess()
    {
        if (Tools::isSubmit('submitPswcagModule')) {
            $token = Tools::getAdminTokenLite('AdminPswcag');

            if (Tools::getValue('token') !== $token) {
                $this->errors[] = $this->module->l('Invalid security token.');
                return;
            }

            $keys = [
                'PSWCAG_FONT',
                'PSWCAG_CONTRAST',
                'PSWCAG_GRAYSCALE',
                'PSWCAG_LINKS',
                'PSWCAG_ANIMATIONS',
                'PSWCAG_SHORTCUT',
                'PSWCAG_LABEL',
            ];

            foreach ($keys as $key) {
                Configuration::updateValue($key, Tools::getValue($key));
            }

            $this->confirmations[] = $this->module->l('Settings saved.');
        }
    }
}

