<?php

namespace cms\core\configurations\helpers;

//helpers
use cms\core\module\Models\ModuleModel;
use Cms;
use Illuminate\Support\Facades\Schema;
//models
use cms\core\configurations\Models\ConfigurationModel;


class Configurations
{
    function __construct()
    {
    }
    /*
     * get module configuration parm
     * type=1 is core,type =2 is local
     */
    public static function getParm($module, $type = 2)
    {
        $parm =  ModuleModel::select('configuration_parm')
            ->where('name', '=', $module)
            ->where('type', '=', $type)
            ->first();
        if ($parm)
            $parm = json_decode($parm->configuration_parm);

        return $parm;
    }
    public static function getConfig($name)
    {
        $parm = ConfigurationModel::where('name', $name)->select('parm')->first();

        if ($parm)
            $parm = json_decode($parm->parm);

        return $parm;
    }

    public static function getAllConfig()
    {
        $parm = ConfigurationModel::pluck('parm', 'name');

        foreach ($parm as $key => $value)
            $parm[$key] = json_decode($value);

        return $parm;
    }

    public static function getCurrentTheme()
    {
        if (Schema::hasTable('configurations')) {
            $data = ConfigurationModel::where('name', '=', 'site')->first();

            if (count((array) $data) > 0 && isset($data->parm)) {
                $data =  json_decode($data->parm);

                if (isset($data->active_theme))
                    return $data->active_theme;
            }
        }

        return Cms::getThemeConfig()['active'];
    }
}
