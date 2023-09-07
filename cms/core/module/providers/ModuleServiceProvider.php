<?php
namespace cms\core\module\providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Route;

use Cms;

class ModuleServiceProvider extends ServiceProvider
{
    /*
     * commande
     */
    protected $commands = [
        'cms\core\module\Console\Commands\ModuleUpdate'
    ];
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
    public function register()
    {
        //$this->registerViews();
        //$this->registerRoute();
        //$this->registerAdminRoute();
        $this->registerCommand();
    }

    public function registerRoute()
    {
        /*

        $router = new Router;
        $router ->middleware('web')->group([
            'namespace' => 'cms\core\user\Controllers',
            'prefix' => ''
        ], function ($router) {
            // Ideally create a seperate apiroutes.php or something similar
            require __DIR__.'/../routes.php';
        });
        */


    }
    public function registerAdminRoute()
    {

        Route::prefix('administrator')
            ->middleware(['web','Admin'])
            ->namespace('cms\core\user\Controllers')
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

        $viewPath = resource_path('views/modules/user');

        //$sourcePath = __DIR__.'/../resources/views';
        $Path = __DIR__.'/../resources/views';
        $sourcePath = base_path().'/cms/local/'.$theme.'/user/resources/views';

        $this->publishes([
            $sourcePath => $viewPath
        ]);
        $this->loadViewsFrom(array_merge(array_map(function ($path) {
            return $path . '/modules/user';
        }, [$Path]), [$sourcePath,$Path]), 'user');
    }

    /*
     * register commands
     */
    protected function registerCommand()
    {
        $this->commands($this->commands);
    }

}
