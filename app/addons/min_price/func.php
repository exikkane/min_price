<?php

use Tygh\Registry;

/**
 * The 'update_product_pre' hook handler
 *
 * Checks whether updated price is 0 and replaces it with min price if so.
 * Min price is retrieved from the settings of the Minimum item price add-on.
 *
 * @param array $product_data
 *
 * @return void
 *
 * @see fn_update_product()
 */
function fn_min_price_update_product_pre(array &$product_data)
{
    if ($product_data['price'] > 0 || !Registry::get('runtime.company_id')) {
        return;
    }

    $min_price = Registry::get('addons.min_price.min_price');
    $product_data['price'] = (string) $min_price;

    fn_set_notification('W', __('warning'), __('product_min_price_updated', ['[product]' => $product_data['product'], '[min_price]' => $min_price]));
}
