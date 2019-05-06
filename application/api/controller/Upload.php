<?php
namespace app\api\controller;

use app\common\model\Image;
use think\Controller;
use think\facade\Env;
use think\facade\Session;

/**
 * 通用上传接口
 * Class Upload
 * @package app\api\controller
 */
class Upload extends Controller
{
    protected function initialize()
    {
        parent::initialize();
        if (!Session::has('admin_id')) {
            $result = [
                'error'   => 1,
                'message' => '未登录'
            ];

            return json($result);
        }
    }

    /**
     * 通用图片上传接口
     * @return \think\response\Json
     */
    public function upload()
    {
        $config = [
            'size' => 2097152,
            'ext'  => 'jpg,gif,png,bmp,jpeg'
        ];

        $file = $this->request->file('file');
        $hash = $file->hash();
        $image = Image::get(['hash' => $hash]);
        if($image){
            $result = [
                'error' => 0,
                'name' => $image->file,
                'url' => $image->url,
            ];
        }else {
            $upload_path = str_replace('\\', '/', Env::get('root_path') . 'public/uploads');
            $save_path = '/uploads/';
            $info = $file->validate($config)->move($upload_path);
            if ($info) {
                $result = [
                    'error' => 0,
                    'name' => $info->getInfo('name'),
                    'url' => str_replace('\\', '/', $save_path . $info->getSaveName())
                ];
                Image::create([
                    'file' => $result['name'],
                    'url' => $result['url'],
                    'hash' => $hash,
                    'create_time' => time()
                ]);
            } else {
                $result = [
                    'error' => 1,
                    'message' => $file->getError()
                ];
            }
        }

        return json($result);
    }
}