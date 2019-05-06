<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019\1\18 0018
 * Time: 16:48
 */

namespace app\admin\validate;

use think\Validate;
use think\validate\ValidateRule;

class Instalment extends Base
{

    protected static $typeMsg = [
        'in' => ':attribute必须为个人或者企业',
    ];

    protected $rule = [
        'investor|资方信息' => 'require',
        'policy|投保人' => 'require',
        'product_id|分期产品' => 'require',
        'service|金融信息服务费' => 'require',
        'company_id|保险公司' => 'require',
        'premium|商业险总额' => 'require',
        'invoice|合格证/发票' => 'requireIf:is_new,1',
        'license_original|行驶证正本' => 'requireCallback:check_require',
        'license_copy|行驶证副本' => 'requireCallback:check_require',
        'plate_no|车牌号' => 'requireCallback:check_require',
        'owner|车主' => 'require',
        'vin|车辆识别代码' => 'require',
        'engine|发动机号' => 'require',
        'price|车辆价格' => 'require',
        'type|保单被保人类型' => 'require|in:1,2',
        'is_legal|经办人类型' => 'in:0,1',
//        'mobile|手机号' => 'require|unique:insured,mobile,abc,id',
        'mobile|手机号' => 'require|check_unique',
        'name|姓名' => 'require',
        'card|身份证号' => 'require',
        'agreement|经办人授权协议' => 'requireCallback:check_agent',
        'enterprise|被保企业名称' => 'requireIf:type,2',
        'enterprise_license|企业营业执照' => 'requireIf:type,2',
        'code|企业信用代码' => 'requireIf:type,2',
        'expiry|营业执照有效期' => 'requireIf:type,2',
        'legal|法人姓名' => 'requireCallback:check_legal',
        'legal_card|法人身份证号' => 'requireCallback:check_legal',
        'account|企业账号' => 'requireIf:type,2',
        'bank|开户行' => 'requireIf:type,2',
        'salesman_id|业务员' => 'require',
        'policy_img|投保单' => 'require',
        'endorsement|批单' => 'requireWith:is_renewal',
        'receipt|发票' => 'requireWith:is_renewal',
    ];

    protected $message = [
        'license_original.requireCallback' => '请上传:attribute',
        'license_copy.requireCallback' => '请上传:attribute',
        'plate_no.requireCallback' => '请填写:attribute',
        'mobile.check_unique' => '手机号已存在',
    ];

    protected $scene = [
        'save' => [

        ]
    ];

    public function __construct(array $rules = [], array $message = [], array $field = [])
    {
        parent::__construct($rules, $message, $field);
        self::setTypeMsg(self::$typeMsg);
    }

    public function check_require($value, $data)
    {
        if(!isset($data['is_new']) || $data['is_new'] == 0){
            return true;
        }
        return false;
    }

    public function check_legal($value, $data)
    {
        if($data['type'] == 2 && $data['is_legal'] == 1){
            return true;
        }
        return false;
    }

    public function check_agent($value, $data)
    {
        if($data['type'] == 2 && $data['is_legal'] == 0){
            return true;
        }
        return false;
    }

    public function check_unique($value,$rule,$data,$filed)
    {
        if(isset($data['insured_id'])) {
            $result = Validate::unique($value, 'insured,mobile,' . $data['insured_id'] . ',id', $data, $filed);
        }else{
            $result = Validate::unique($value, 'insured', $data, $filed);
        }
        return $result;
    }

}