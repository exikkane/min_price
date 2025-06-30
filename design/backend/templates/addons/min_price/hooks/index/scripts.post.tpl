{if $runtime.company_id}
    <script>
        (function(_, $) {
            $(document).ready(function() {
                $.ceFormValidator('registerValidator', {
                    class_name: 'cm-price-validator',
                    message: _.tr('price_should_be_greater'),
                    func: function(id) {
                        var val = $('#' + id).val();
                        var price = parseFloat(val.replace(',', '.'));

                        if (isNaN(price) || price <= 0) {
                            return false;
                        }

                        return true;
                    }
                });
            });
        }(Tygh, Tygh.$));
    </script>
{/if}
{$min_price = {$addons.min_price.min_price|format_price:$currencies.$primary_currency nofilter}}
{$price_should_be_greater = __("price_should_be_greater", ["[min]" => $min_price])}

<script>
    Tygh.tr('price_should_be_greater',  '{$price_should_be_greater|escape:javascript nofilter}');
</script>