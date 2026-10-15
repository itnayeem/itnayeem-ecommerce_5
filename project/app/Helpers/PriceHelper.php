<?php 

use App\Models\Currency;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class PriceHelper
{

    public static function showPrice($price) {
        $gs = cache()->remember('generalsettings', now()->addDay(), function () {
            return DB::table('generalsettings')->first();
        });
        if(is_numeric( $price ) && floor( $price ) != $price){
           return number_format($price, 2, $gs->decimal_separator, $gs->thousand_separator);
        }else{
           return number_format($price, 0, $gs->decimal_separator, $gs->thousand_separator);
        }
    }
    public static function showCurrencyPrice($price) {
        $gs = cache()->remember('generalsettings', now()->addDay(), function () {
            return DB::table('generalsettings')->first();
        });
        $new_price = 0;
        if(is_numeric( $price ) && floor( $price ) != $price){
            $new_price = number_format($price, 2, $gs->decimal_separator, $gs->thousand_separator);
        }else{
            $new_price = number_format($price, 0, $gs->decimal_separator, $gs->thousand_separator);
        }
        if (Session::has('currency'))
        {
            $curr = Currency::find(Session::get('currency'));
        }
        else
        {
            $curr = Currency::where('is_default','=',1)->first();
        }

        if($gs->currency_format == 0){
            return $curr->sign.$new_price;
        }
        else{
            return $new_price.$curr->sign;
        }
    }


    public static function showAdminCurrencyPrice($price) {
        $gs = cache()->remember('generalsettings', now()->addDay(), function () {
            return DB::table('generalsettings')->first();
        });
        $new_price = 0;
        if(is_numeric( $price ) && floor( $price ) != $price){
            $new_price = number_format($price, 2, $gs->decimal_separator, $gs->thousand_separator);
        }else{
            $new_price = number_format($price, 0, $gs->decimal_separator, $gs->thousand_separator);
        }
 
        $curr = Currency::where('is_default','=',1)->first();
  

        if($gs->currency_format == 0){
            return $curr->sign.$new_price;
        }
        else{
            return $new_price.$curr->sign;
        }
    }


    public static function showOrderCurrencyPrice($price,$currency) {
        $gs = cache()->remember('generalsettings', now()->addDay(), function () {
            return DB::table('generalsettings')->first();
        });
        $new_price = 0;
        if(is_numeric($price) && floor( $price ) != $price){
            $new_price = number_format($price, 2, $gs->decimal_separator, $gs->thousand_separator);
        }else{
            $new_price = number_format($price, 0, $gs->decimal_separator, $gs->thousand_separator);
        }
 
        if($gs->currency_format == 0){
            return $currency.$new_price;
        }
        else{
            return $new_price.$currency;
        }
    }

}