## About Laravel

1. Run the app

    ```shell
    php artisan serve

    Username : admin
    Password : admin123
    ```

    Project will be running in the browser.

    Open [http://localhost:8000/administrator](http://localhost:8000/administrator) to view it in your browser.

2. Some useful Commands

    ```shell
    # Create a new module
    php artisan make:cms-module <modulename>
    #create module with crud views
    php artisan make:cms-module <modulename> --crud
    #create controller
    php artisan make:cms-controller <controller-name> <module-name>
    # Migrate our tables
    php artisan cms-migrate
    # Seeding
    php artisan db:cms-seed
    #register modules to table
    php artisan update:cms-module
    #register plugins
    php artisan update:cms-plugins
    #regiser menus
    php artisan update:cms-menu
    ```
