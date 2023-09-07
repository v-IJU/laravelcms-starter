<?php
namespace cms\core\admin\providers;

use Illuminate\Support\ServiceProvider;

use Illuminate\Support\Facades\Route;
use Cms;

class AdminServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {

    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register() {
        $this->registerViews();
        $this->registerRoute();
        $this->registerAdminRoute();
        $this->registerMiddleware();
    }

    public function registerRoute() {
        include(__DIR__.'/../routes.php');
    }

    public function registerAdminRoute() {
        Route::prefix('administrator')
            ->middleware(['web','Admin'])
            ->namespace('cms\core\admin\Controllers')
            ->group(__DIR__ . '/../adminroutes.php');
    }



    /**
     * Register views.
     *
     * @return void
     */
    public function registerViews()
    {
        $theme = Cms::getCurrentTheme();

        $viewPath = resource_path('views/modules/admin');

        //$sourcePath = __DIR__.'/../resources/views';
        $Path = __DIR__.'/../resources/views';
        $sourcePath = base_path().'/cms/local/'.$theme.'/admin/resources/views';

        $this->publishes([
            $sourcePath => $viewPath
        ]);
        $this->loadViewsFrom(array_merge(array_map(function ($path) {
            return $path . '/modules/admin';
        }, [$Path]), [$sourcePath,$Path]), 'admin');
    }

    public function registerMiddleware()
    {
        app('router')->aliasMiddleware('Admin', \cms\core\admin\Middleware\AdminAuth::class);
    }


}
