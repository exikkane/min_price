{assign var=price value=$product_data.price}

{if $product_data.master_product_id && $runtime.company_id && $product_data.price == 0}
    {assign var=price value="0.10"}
{/if}

{component name="configurable_page.field" entity="products" tab="detailed" section="information" field="price"}
    <div class="control-group {$no_hide_input_if_shared_product}">
        <label for="elm_price_price" class="control-label cm-required cm-price-validator">{__("price")} ({$currencies.$primary_currency.symbol nofilter}):</label>
        <div class="controls">
            <div class="input-group {$input_append_if_shared_product}">
                <input type="text"
                       name="product_data[price]"
                       id="elm_price_price"
                       value="{$price|fn_format_price:$primary_currency:null:false}"
                       class="input-long cm-numeric"
                       data-a-sep
                />
                {include file="buttons/update_for_all.tpl"
                display=$show_update_for_all
                object_id="price"
                name="update_all_vendors[price]"
                component="products.price"
                hide_inputs=$hide_inputs_if_shared_product
                append=true
                }
            </div>
        </div>
    </div>
{/component}