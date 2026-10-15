<?php

namespace App\Http\Middleware;
use Closure;
use App\Models\Generalsetting;

class HTTPSConnection {

    public function handle($request, Closure $next)

    {
        $gs = Generalsetting::find(1);

            if($gs->is_secure == 1 && !in_array($request->getHost(), ['127.0.0.1', 'localhost'])) {
                if (!$request->secure()) {

                    return redirect()->secure($request->getRequestUri());
                }
            }


            return $next($request);

    }

}



?>