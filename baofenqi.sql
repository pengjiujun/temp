/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : baofenqi

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-01-28 10:57:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'admin', '0dfc7612f607db6c17fd99388e9e5f9c', '1', '0', '1547704027', '1548293748', '127.0.0.1', '1547892400');
INSERT INTO `admin_user` VALUES ('2', 'jxs2', '139960872bfe648944b0aaa8050b0234', '1', '0', '1547802491', '2019', '127.0.0.1', '1547890776');
INSERT INTO `admin_user` VALUES ('4', 'jxs1', '139960872bfe648944b0aaa8050b0234', '1', '0', '1547812643', '1548208005', '127.0.0.1', '1547892407');
INSERT INTO `admin_user` VALUES ('5', 'back', '139960872bfe648944b0aaa8050b0234', '1', '0', '1547890710', '2019', '127.0.0.1', '1547892414');
INSERT INTO `admin_user` VALUES ('6', 'cd', '139960872bfe648944b0aaa8050b0234', '1', '4', '1548041651', '1548144586', '127.0.0.1', '1548041651');
INSERT INTO `admin_user` VALUES ('7', '22', '139960872bfe648944b0aaa8050b0234', '1', '4', '1548042413', '1548144439', '127.0.0.1', '1548042413');

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '区域主键',
  `area_name` varchar(16) DEFAULT NULL COMMENT '区域名称',
  `area_code` varchar(128) DEFAULT NULL COMMENT '区域代码',
  `area_parent_id` int(11) DEFAULT NULL COMMENT '上级主键',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`area_parent_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=900001 DEFAULT CHARSET=utf8 COMMENT='区域字典';

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('110000', '北京', 'Beijing', '0');
INSERT INTO `area` VALUES ('110100', '北京市', 'Beijing', '110000');
INSERT INTO `area` VALUES ('110101', '东城区', 'Dongcheng', '110100');
INSERT INTO `area` VALUES ('110102', '西城区', 'Xicheng', '110100');
INSERT INTO `area` VALUES ('110105', '朝阳区', 'Chaoyang', '110100');
INSERT INTO `area` VALUES ('110106', '丰台区', 'Fengtai', '110100');
INSERT INTO `area` VALUES ('110107', '石景山区', 'Shijingshan', '110100');
INSERT INTO `area` VALUES ('110108', '海淀区', 'Haidian', '110100');
INSERT INTO `area` VALUES ('110109', '门头沟区', 'Mentougou', '110100');
INSERT INTO `area` VALUES ('110111', '房山区', 'Fangshan', '110100');
INSERT INTO `area` VALUES ('110112', '通州区', 'Tongzhou', '110100');
INSERT INTO `area` VALUES ('110113', '顺义区', 'Shunyi', '110100');
INSERT INTO `area` VALUES ('110114', '昌平区', 'Changping', '110100');
INSERT INTO `area` VALUES ('110115', '大兴区', 'Daxing', '110100');
INSERT INTO `area` VALUES ('110116', '怀柔区', 'Huairou', '110100');
INSERT INTO `area` VALUES ('110117', '平谷区', 'Pinggu', '110100');
INSERT INTO `area` VALUES ('110228', '密云县', 'Miyun', '110100');
INSERT INTO `area` VALUES ('110229', '延庆县', 'Yanqing', '110100');
INSERT INTO `area` VALUES ('120000', '天津', 'Tianjin', '0');
INSERT INTO `area` VALUES ('120100', '天津市', 'Tianjin', '120000');
INSERT INTO `area` VALUES ('120101', '和平区', 'Heping', '120100');
INSERT INTO `area` VALUES ('120102', '河东区', 'Hedong', '120100');
INSERT INTO `area` VALUES ('120103', '河西区', 'Hexi', '120100');
INSERT INTO `area` VALUES ('120104', '南开区', 'Nankai', '120100');
INSERT INTO `area` VALUES ('120105', '河北区', 'Hebei', '120100');
INSERT INTO `area` VALUES ('120106', '红桥区', 'Hongqiao', '120100');
INSERT INTO `area` VALUES ('120110', '东丽区', 'Dongli', '120100');
INSERT INTO `area` VALUES ('120111', '西青区', 'Xiqing', '120100');
INSERT INTO `area` VALUES ('120112', '津南区', 'Jinnan', '120100');
INSERT INTO `area` VALUES ('120113', '北辰区', 'Beichen', '120100');
INSERT INTO `area` VALUES ('120114', '武清区', 'Wuqing', '120100');
INSERT INTO `area` VALUES ('120115', '宝坻区', 'Baodi', '120100');
INSERT INTO `area` VALUES ('120116', '滨海新区', 'Binhaixinqu', '120100');
INSERT INTO `area` VALUES ('120221', '宁河县', 'Ninghe', '120100');
INSERT INTO `area` VALUES ('120223', '静海县', 'Jinghai', '120100');
INSERT INTO `area` VALUES ('120225', '蓟县', 'Jixian', '120100');
INSERT INTO `area` VALUES ('130000', '河北省', 'Hebei', '0');
INSERT INTO `area` VALUES ('130100', '石家庄市', 'Shijiazhuang', '130000');
INSERT INTO `area` VALUES ('130102', '长安区', 'Chang\'an', '130100');
INSERT INTO `area` VALUES ('130104', '桥西区', 'Qiaoxi', '130100');
INSERT INTO `area` VALUES ('130105', '新华区', 'Xinhua', '130100');
INSERT INTO `area` VALUES ('130107', '井陉矿区', 'Jingxingkuangqu', '130100');
INSERT INTO `area` VALUES ('130108', '裕华区', 'Yuhua', '130100');
INSERT INTO `area` VALUES ('130109', '藁城区', 'Gaocheng', '130100');
INSERT INTO `area` VALUES ('130110', '鹿泉区', 'Luquan', '130100');
INSERT INTO `area` VALUES ('130111', '栾城区', 'Luancheng', '130100');
INSERT INTO `area` VALUES ('130121', '井陉县', 'Jingxing', '130100');
INSERT INTO `area` VALUES ('130123', '正定县', 'Zhengding', '130100');
INSERT INTO `area` VALUES ('130125', '行唐县', 'Xingtang', '130100');
INSERT INTO `area` VALUES ('130126', '灵寿县', 'Lingshou', '130100');
INSERT INTO `area` VALUES ('130127', '高邑县', 'Gaoyi', '130100');
INSERT INTO `area` VALUES ('130128', '深泽县', 'Shenze', '130100');
INSERT INTO `area` VALUES ('130129', '赞皇县', 'Zanhuang', '130100');
INSERT INTO `area` VALUES ('130130', '无极县', 'Wuji', '130100');
INSERT INTO `area` VALUES ('130131', '平山县', 'Pingshan', '130100');
INSERT INTO `area` VALUES ('130132', '元氏县', 'Yuanshi', '130100');
INSERT INTO `area` VALUES ('130133', '赵县', 'Zhaoxian', '130100');
INSERT INTO `area` VALUES ('130181', '辛集市', 'Xinji', '130100');
INSERT INTO `area` VALUES ('130183', '晋州市', 'Jinzhou', '130100');
INSERT INTO `area` VALUES ('130184', '新乐市', 'Xinle', '130100');
INSERT INTO `area` VALUES ('130200', '唐山市', 'Tangshan', '130000');
INSERT INTO `area` VALUES ('130202', '路南区', 'Lunan', '130200');
INSERT INTO `area` VALUES ('130203', '路北区', 'Lubei', '130200');
INSERT INTO `area` VALUES ('130204', '古冶区', 'Guye', '130200');
INSERT INTO `area` VALUES ('130205', '开平区', 'Kaiping', '130200');
INSERT INTO `area` VALUES ('130207', '丰南区', 'Fengnan', '130200');
INSERT INTO `area` VALUES ('130208', '丰润区', 'Fengrun', '130200');
INSERT INTO `area` VALUES ('130209', '曹妃甸区', 'Caofeidian', '130200');
INSERT INTO `area` VALUES ('130223', '滦县', 'Luanxian', '130200');
INSERT INTO `area` VALUES ('130224', '滦南县', 'Luannan', '130200');
INSERT INTO `area` VALUES ('130225', '乐亭县', 'Laoting', '130200');
INSERT INTO `area` VALUES ('130227', '迁西县', 'Qianxi', '130200');
INSERT INTO `area` VALUES ('130229', '玉田县', 'Yutian', '130200');
INSERT INTO `area` VALUES ('130281', '遵化市', 'Zunhua', '130200');
INSERT INTO `area` VALUES ('130283', '迁安市', 'Qian\'an', '130200');
INSERT INTO `area` VALUES ('130300', '秦皇岛市', 'Qinhuangdao', '130000');
INSERT INTO `area` VALUES ('130302', '海港区', 'Haigang', '130300');
INSERT INTO `area` VALUES ('130303', '山海关区', 'Shanhaiguan', '130300');
INSERT INTO `area` VALUES ('130304', '北戴河区', 'Beidaihe', '130300');
INSERT INTO `area` VALUES ('130321', '青龙满族自治县', 'Qinglong', '130300');
INSERT INTO `area` VALUES ('130322', '昌黎县', 'Changli', '130300');
INSERT INTO `area` VALUES ('130323', '抚宁县', 'Funing', '130300');
INSERT INTO `area` VALUES ('130324', '卢龙县', 'Lulong', '130300');
INSERT INTO `area` VALUES ('130400', '邯郸市', 'Handan', '130000');
INSERT INTO `area` VALUES ('130402', '邯山区', 'Hanshan', '130400');
INSERT INTO `area` VALUES ('130403', '丛台区', 'Congtai', '130400');
INSERT INTO `area` VALUES ('130404', '复兴区', 'Fuxing', '130400');
INSERT INTO `area` VALUES ('130406', '峰峰矿区', 'Fengfengkuangqu', '130400');
INSERT INTO `area` VALUES ('130421', '邯郸县', 'Handan', '130400');
INSERT INTO `area` VALUES ('130423', '临漳县', 'Linzhang', '130400');
INSERT INTO `area` VALUES ('130424', '成安县', 'Cheng\'an', '130400');
INSERT INTO `area` VALUES ('130425', '大名县', 'Daming', '130400');
INSERT INTO `area` VALUES ('130426', '涉县', 'Shexian', '130400');
INSERT INTO `area` VALUES ('130427', '磁县', 'Cixian', '130400');
INSERT INTO `area` VALUES ('130428', '肥乡县', 'Feixiang', '130400');
INSERT INTO `area` VALUES ('130429', '永年县', 'Yongnian', '130400');
INSERT INTO `area` VALUES ('130430', '邱县', 'Qiuxian', '130400');
INSERT INTO `area` VALUES ('130431', '鸡泽县', 'Jize', '130400');
INSERT INTO `area` VALUES ('130432', '广平县', 'Guangping', '130400');
INSERT INTO `area` VALUES ('130433', '馆陶县', 'Guantao', '130400');
INSERT INTO `area` VALUES ('130434', '魏县', 'Weixian', '130400');
INSERT INTO `area` VALUES ('130435', '曲周县', 'Quzhou', '130400');
INSERT INTO `area` VALUES ('130481', '武安市', 'Wu\'an', '130400');
INSERT INTO `area` VALUES ('130500', '邢台市', 'Xingtai', '130000');
INSERT INTO `area` VALUES ('130502', '桥东区', 'Qiaodong', '130500');
INSERT INTO `area` VALUES ('130503', '桥西区', 'Qiaoxi', '130500');
INSERT INTO `area` VALUES ('130521', '邢台县', 'Xingtai', '130500');
INSERT INTO `area` VALUES ('130522', '临城县', 'Lincheng', '130500');
INSERT INTO `area` VALUES ('130523', '内丘县', 'Neiqiu', '130500');
INSERT INTO `area` VALUES ('130524', '柏乡县', 'Baixiang', '130500');
INSERT INTO `area` VALUES ('130525', '隆尧县', 'Longyao', '130500');
INSERT INTO `area` VALUES ('130526', '任县', 'Renxian', '130500');
INSERT INTO `area` VALUES ('130527', '南和县', 'Nanhe', '130500');
INSERT INTO `area` VALUES ('130528', '宁晋县', 'Ningjin', '130500');
INSERT INTO `area` VALUES ('130529', '巨鹿县', 'Julu', '130500');
INSERT INTO `area` VALUES ('130530', '新河县', 'Xinhe', '130500');
INSERT INTO `area` VALUES ('130531', '广宗县', 'Guangzong', '130500');
INSERT INTO `area` VALUES ('130532', '平乡县', 'Pingxiang', '130500');
INSERT INTO `area` VALUES ('130533', '威县', 'Weixian', '130500');
INSERT INTO `area` VALUES ('130534', '清河县', 'Qinghe', '130500');
INSERT INTO `area` VALUES ('130535', '临西县', 'Linxi', '130500');
INSERT INTO `area` VALUES ('130581', '南宫市', 'Nangong', '130500');
INSERT INTO `area` VALUES ('130582', '沙河市', 'Shahe', '130500');
INSERT INTO `area` VALUES ('130600', '保定市', 'Baoding', '130000');
INSERT INTO `area` VALUES ('130602', '新市区', 'Xinshi', '130600');
INSERT INTO `area` VALUES ('130603', '北市区', 'Beishi', '130600');
INSERT INTO `area` VALUES ('130604', '南市区', 'Nanshi', '130600');
INSERT INTO `area` VALUES ('130621', '满城县', 'Mancheng', '130600');
INSERT INTO `area` VALUES ('130622', '清苑县', 'Qingyuan', '130600');
INSERT INTO `area` VALUES ('130623', '涞水县', 'Laishui', '130600');
INSERT INTO `area` VALUES ('130624', '阜平县', 'Fuping', '130600');
INSERT INTO `area` VALUES ('130625', '徐水县', 'Xushui', '130600');
INSERT INTO `area` VALUES ('130626', '定兴县', 'Dingxing', '130600');
INSERT INTO `area` VALUES ('130627', '唐县', 'Tangxian', '130600');
INSERT INTO `area` VALUES ('130628', '高阳县', 'Gaoyang', '130600');
INSERT INTO `area` VALUES ('130629', '容城县', 'Rongcheng', '130600');
INSERT INTO `area` VALUES ('130630', '涞源县', 'Laiyuan', '130600');
INSERT INTO `area` VALUES ('130631', '望都县', 'Wangdu', '130600');
INSERT INTO `area` VALUES ('130632', '安新县', 'Anxin', '130600');
INSERT INTO `area` VALUES ('130633', '易县', 'Yixian', '130600');
INSERT INTO `area` VALUES ('130634', '曲阳县', 'Quyang', '130600');
INSERT INTO `area` VALUES ('130635', '蠡县', 'Lixian', '130600');
INSERT INTO `area` VALUES ('130636', '顺平县', 'Shunping', '130600');
INSERT INTO `area` VALUES ('130637', '博野县', 'Boye', '130600');
INSERT INTO `area` VALUES ('130638', '雄县', 'Xiongxian', '130600');
INSERT INTO `area` VALUES ('130681', '涿州市', 'Zhuozhou', '130600');
INSERT INTO `area` VALUES ('130682', '定州市', 'Dingzhou', '130600');
INSERT INTO `area` VALUES ('130683', '安国市', 'Anguo', '130600');
INSERT INTO `area` VALUES ('130684', '高碑店市', 'Gaobeidian', '130600');
INSERT INTO `area` VALUES ('130700', '张家口市', 'Zhangjiakou', '130000');
INSERT INTO `area` VALUES ('130702', '桥东区', 'Qiaodong', '130700');
INSERT INTO `area` VALUES ('130703', '桥西区', 'Qiaoxi', '130700');
INSERT INTO `area` VALUES ('130705', '宣化区', 'Xuanhua', '130700');
INSERT INTO `area` VALUES ('130706', '下花园区', 'Xiahuayuan', '130700');
INSERT INTO `area` VALUES ('130721', '宣化县', 'Xuanhua', '130700');
INSERT INTO `area` VALUES ('130722', '张北县', 'Zhangbei', '130700');
INSERT INTO `area` VALUES ('130723', '康保县', 'Kangbao', '130700');
INSERT INTO `area` VALUES ('130724', '沽源县', 'Guyuan', '130700');
INSERT INTO `area` VALUES ('130725', '尚义县', 'Shangyi', '130700');
INSERT INTO `area` VALUES ('130726', '蔚县', 'Yuxian', '130700');
INSERT INTO `area` VALUES ('130727', '阳原县', 'Yangyuan', '130700');
INSERT INTO `area` VALUES ('130728', '怀安县', 'Huai\'an', '130700');
INSERT INTO `area` VALUES ('130729', '万全县', 'Wanquan', '130700');
INSERT INTO `area` VALUES ('130730', '怀来县', 'Huailai', '130700');
INSERT INTO `area` VALUES ('130731', '涿鹿县', 'Zhuolu', '130700');
INSERT INTO `area` VALUES ('130732', '赤城县', 'Chicheng', '130700');
INSERT INTO `area` VALUES ('130733', '崇礼县', 'Chongli', '130700');
INSERT INTO `area` VALUES ('130800', '承德市', 'Chengde', '130000');
INSERT INTO `area` VALUES ('130802', '双桥区', 'Shuangqiao', '130800');
INSERT INTO `area` VALUES ('130803', '双滦区', 'Shuangluan', '130800');
INSERT INTO `area` VALUES ('130804', '鹰手营子矿区', 'Yingshouyingzikuangqu', '130800');
INSERT INTO `area` VALUES ('130821', '承德县', 'Chengde', '130800');
INSERT INTO `area` VALUES ('130822', '兴隆县', 'Xinglong', '130800');
INSERT INTO `area` VALUES ('130823', '平泉县', 'Pingquan', '130800');
INSERT INTO `area` VALUES ('130824', '滦平县', 'Luanping', '130800');
INSERT INTO `area` VALUES ('130825', '隆化县', 'Longhua', '130800');
INSERT INTO `area` VALUES ('130826', '丰宁满族自治县', 'Fengning', '130800');
INSERT INTO `area` VALUES ('130827', '宽城满族自治县', 'Kuancheng', '130800');
INSERT INTO `area` VALUES ('130828', '围场满族蒙古族自治县', 'Weichang', '130800');
INSERT INTO `area` VALUES ('130900', '沧州市', 'Cangzhou', '130000');
INSERT INTO `area` VALUES ('130902', '新华区', 'Xinhua', '130900');
INSERT INTO `area` VALUES ('130903', '运河区', 'Yunhe', '130900');
INSERT INTO `area` VALUES ('130921', '沧县', 'Cangxian', '130900');
INSERT INTO `area` VALUES ('130922', '青县', 'Qingxian', '130900');
INSERT INTO `area` VALUES ('130923', '东光县', 'Dongguang', '130900');
INSERT INTO `area` VALUES ('130924', '海兴县', 'Haixing', '130900');
INSERT INTO `area` VALUES ('130925', '盐山县', 'Yanshan', '130900');
INSERT INTO `area` VALUES ('130926', '肃宁县', 'Suning', '130900');
INSERT INTO `area` VALUES ('130927', '南皮县', 'Nanpi', '130900');
INSERT INTO `area` VALUES ('130928', '吴桥县', 'Wuqiao', '130900');
INSERT INTO `area` VALUES ('130929', '献县', 'Xianxian', '130900');
INSERT INTO `area` VALUES ('130930', '孟村回族自治县', 'Mengcun', '130900');
INSERT INTO `area` VALUES ('130981', '泊头市', 'Botou', '130900');
INSERT INTO `area` VALUES ('130982', '任丘市', 'Renqiu', '130900');
INSERT INTO `area` VALUES ('130983', '黄骅市', 'Huanghua', '130900');
INSERT INTO `area` VALUES ('130984', '河间市', 'Hejian', '130900');
INSERT INTO `area` VALUES ('131000', '廊坊市', 'Langfang', '130000');
INSERT INTO `area` VALUES ('131002', '安次区', 'Anci', '131000');
INSERT INTO `area` VALUES ('131003', '广阳区', 'Guangyang', '131000');
INSERT INTO `area` VALUES ('131022', '固安县', 'Gu\'an', '131000');
INSERT INTO `area` VALUES ('131023', '永清县', 'Yongqing', '131000');
INSERT INTO `area` VALUES ('131024', '香河县', 'Xianghe', '131000');
INSERT INTO `area` VALUES ('131025', '大城县', 'Daicheng', '131000');
INSERT INTO `area` VALUES ('131026', '文安县', 'Wen\'an', '131000');
INSERT INTO `area` VALUES ('131028', '大厂回族自治县', 'Dachang', '131000');
INSERT INTO `area` VALUES ('131081', '霸州市', 'Bazhou', '131000');
INSERT INTO `area` VALUES ('131082', '三河市', 'Sanhe', '131000');
INSERT INTO `area` VALUES ('131100', '衡水市', 'Hengshui', '130000');
INSERT INTO `area` VALUES ('131102', '桃城区', 'Taocheng', '131100');
INSERT INTO `area` VALUES ('131121', '枣强县', 'Zaoqiang', '131100');
INSERT INTO `area` VALUES ('131122', '武邑县', 'Wuyi', '131100');
INSERT INTO `area` VALUES ('131123', '武强县', 'Wuqiang', '131100');
INSERT INTO `area` VALUES ('131124', '饶阳县', 'Raoyang', '131100');
INSERT INTO `area` VALUES ('131125', '安平县', 'Anping', '131100');
INSERT INTO `area` VALUES ('131126', '故城县', 'Gucheng', '131100');
INSERT INTO `area` VALUES ('131127', '景县', 'Jingxian', '131100');
INSERT INTO `area` VALUES ('131128', '阜城县', 'Fucheng', '131100');
INSERT INTO `area` VALUES ('131181', '冀州市', 'Jizhou', '131100');
INSERT INTO `area` VALUES ('131182', '深州市', 'Shenzhou', '131100');
INSERT INTO `area` VALUES ('140000', '山西省', 'Shanxi', '0');
INSERT INTO `area` VALUES ('140100', '太原市', 'Taiyuan', '140000');
INSERT INTO `area` VALUES ('140105', '小店区', 'Xiaodian', '140100');
INSERT INTO `area` VALUES ('140106', '迎泽区', 'Yingze', '140100');
INSERT INTO `area` VALUES ('140107', '杏花岭区', 'Xinghualing', '140100');
INSERT INTO `area` VALUES ('140108', '尖草坪区', 'Jiancaoping', '140100');
INSERT INTO `area` VALUES ('140109', '万柏林区', 'Wanbailin', '140100');
INSERT INTO `area` VALUES ('140110', '晋源区', 'Jinyuan', '140100');
INSERT INTO `area` VALUES ('140121', '清徐县', 'Qingxu', '140100');
INSERT INTO `area` VALUES ('140122', '阳曲县', 'Yangqu', '140100');
INSERT INTO `area` VALUES ('140123', '娄烦县', 'Loufan', '140100');
INSERT INTO `area` VALUES ('140181', '古交市', 'Gujiao', '140100');
INSERT INTO `area` VALUES ('140200', '大同市', 'Datong', '140000');
INSERT INTO `area` VALUES ('140202', '城区', 'Chengqu', '140200');
INSERT INTO `area` VALUES ('140203', '矿区', 'Kuangqu', '140200');
INSERT INTO `area` VALUES ('140211', '南郊区', 'Nanjiao', '140200');
INSERT INTO `area` VALUES ('140212', '新荣区', 'Xinrong', '140200');
INSERT INTO `area` VALUES ('140221', '阳高县', 'Yanggao', '140200');
INSERT INTO `area` VALUES ('140222', '天镇县', 'Tianzhen', '140200');
INSERT INTO `area` VALUES ('140223', '广灵县', 'Guangling', '140200');
INSERT INTO `area` VALUES ('140224', '灵丘县', 'Lingqiu', '140200');
INSERT INTO `area` VALUES ('140225', '浑源县', 'Hunyuan', '140200');
INSERT INTO `area` VALUES ('140226', '左云县', 'Zuoyun', '140200');
INSERT INTO `area` VALUES ('140227', '大同县', 'Datong', '140200');
INSERT INTO `area` VALUES ('140300', '阳泉市', 'Yangquan', '140000');
INSERT INTO `area` VALUES ('140302', '城区', 'Chengqu', '140300');
INSERT INTO `area` VALUES ('140303', '矿区', 'Kuangqu', '140300');
INSERT INTO `area` VALUES ('140311', '郊区', 'Jiaoqu', '140300');
INSERT INTO `area` VALUES ('140321', '平定县', 'Pingding', '140300');
INSERT INTO `area` VALUES ('140322', '盂县', 'Yuxian', '140300');
INSERT INTO `area` VALUES ('140400', '长治市', 'Changzhi', '140000');
INSERT INTO `area` VALUES ('140402', '城区', 'Chengqu', '140400');
INSERT INTO `area` VALUES ('140411', '郊区', 'Jiaoqu', '140400');
INSERT INTO `area` VALUES ('140421', '长治县', 'Changzhi', '140400');
INSERT INTO `area` VALUES ('140423', '襄垣县', 'Xiangyuan', '140400');
INSERT INTO `area` VALUES ('140424', '屯留县', 'Tunliu', '140400');
INSERT INTO `area` VALUES ('140425', '平顺县', 'Pingshun', '140400');
INSERT INTO `area` VALUES ('140426', '黎城县', 'Licheng', '140400');
INSERT INTO `area` VALUES ('140427', '壶关县', 'Huguan', '140400');
INSERT INTO `area` VALUES ('140428', '长子县', 'Zhangzi', '140400');
INSERT INTO `area` VALUES ('140429', '武乡县', 'Wuxiang', '140400');
INSERT INTO `area` VALUES ('140430', '沁县', 'Qinxian', '140400');
INSERT INTO `area` VALUES ('140431', '沁源县', 'Qinyuan', '140400');
INSERT INTO `area` VALUES ('140481', '潞城市', 'Lucheng', '140400');
INSERT INTO `area` VALUES ('140500', '晋城市', 'Jincheng', '140000');
INSERT INTO `area` VALUES ('140502', '城区', 'Chengqu', '140500');
INSERT INTO `area` VALUES ('140521', '沁水县', 'Qinshui', '140500');
INSERT INTO `area` VALUES ('140522', '阳城县', 'Yangcheng', '140500');
INSERT INTO `area` VALUES ('140524', '陵川县', 'Lingchuan', '140500');
INSERT INTO `area` VALUES ('140525', '泽州县', 'Zezhou', '140500');
INSERT INTO `area` VALUES ('140581', '高平市', 'Gaoping', '140500');
INSERT INTO `area` VALUES ('140600', '朔州市', 'Shuozhou', '140000');
INSERT INTO `area` VALUES ('140602', '朔城区', 'Shuocheng', '140600');
INSERT INTO `area` VALUES ('140603', '平鲁区', 'Pinglu', '140600');
INSERT INTO `area` VALUES ('140621', '山阴县', 'Shanyin', '140600');
INSERT INTO `area` VALUES ('140622', '应县', 'Yingxian', '140600');
INSERT INTO `area` VALUES ('140623', '右玉县', 'Youyu', '140600');
INSERT INTO `area` VALUES ('140624', '怀仁县', 'Huairen', '140600');
INSERT INTO `area` VALUES ('140700', '晋中市', 'Jinzhong', '140000');
INSERT INTO `area` VALUES ('140702', '榆次区', 'Yuci', '140700');
INSERT INTO `area` VALUES ('140721', '榆社县', 'Yushe', '140700');
INSERT INTO `area` VALUES ('140722', '左权县', 'Zuoquan', '140700');
INSERT INTO `area` VALUES ('140723', '和顺县', 'Heshun', '140700');
INSERT INTO `area` VALUES ('140724', '昔阳县', 'Xiyang', '140700');
INSERT INTO `area` VALUES ('140725', '寿阳县', 'Shouyang', '140700');
INSERT INTO `area` VALUES ('140726', '太谷县', 'Taigu', '140700');
INSERT INTO `area` VALUES ('140727', '祁县', 'Qixian', '140700');
INSERT INTO `area` VALUES ('140728', '平遥县', 'Pingyao', '140700');
INSERT INTO `area` VALUES ('140729', '灵石县', 'Lingshi', '140700');
INSERT INTO `area` VALUES ('140781', '介休市', 'Jiexiu', '140700');
INSERT INTO `area` VALUES ('140800', '运城市', 'Yuncheng', '140000');
INSERT INTO `area` VALUES ('140802', '盐湖区', 'Yanhu', '140800');
INSERT INTO `area` VALUES ('140821', '临猗县', 'Linyi', '140800');
INSERT INTO `area` VALUES ('140822', '万荣县', 'Wanrong', '140800');
INSERT INTO `area` VALUES ('140823', '闻喜县', 'Wenxi', '140800');
INSERT INTO `area` VALUES ('140824', '稷山县', 'Jishan', '140800');
INSERT INTO `area` VALUES ('140825', '新绛县', 'Xinjiang', '140800');
INSERT INTO `area` VALUES ('140826', '绛县', 'Jiangxian', '140800');
INSERT INTO `area` VALUES ('140827', '垣曲县', 'Yuanqu', '140800');
INSERT INTO `area` VALUES ('140828', '夏县', 'Xiaxian', '140800');
INSERT INTO `area` VALUES ('140829', '平陆县', 'Pinglu', '140800');
INSERT INTO `area` VALUES ('140830', '芮城县', 'Ruicheng', '140800');
INSERT INTO `area` VALUES ('140881', '永济市', 'Yongji', '140800');
INSERT INTO `area` VALUES ('140882', '河津市', 'Hejin', '140800');
INSERT INTO `area` VALUES ('140900', '忻州市', 'Xinzhou', '140000');
INSERT INTO `area` VALUES ('140902', '忻府区', 'Xinfu', '140900');
INSERT INTO `area` VALUES ('140921', '定襄县', 'Dingxiang', '140900');
INSERT INTO `area` VALUES ('140922', '五台县', 'Wutai', '140900');
INSERT INTO `area` VALUES ('140923', '代县', 'Daixian', '140900');
INSERT INTO `area` VALUES ('140924', '繁峙县', 'Fanshi', '140900');
INSERT INTO `area` VALUES ('140925', '宁武县', 'Ningwu', '140900');
INSERT INTO `area` VALUES ('140926', '静乐县', 'Jingle', '140900');
INSERT INTO `area` VALUES ('140927', '神池县', 'Shenchi', '140900');
INSERT INTO `area` VALUES ('140928', '五寨县', 'Wuzhai', '140900');
INSERT INTO `area` VALUES ('140929', '岢岚县', 'Kelan', '140900');
INSERT INTO `area` VALUES ('140930', '河曲县', 'Hequ', '140900');
INSERT INTO `area` VALUES ('140931', '保德县', 'Baode', '140900');
INSERT INTO `area` VALUES ('140932', '偏关县', 'Pianguan', '140900');
INSERT INTO `area` VALUES ('140981', '原平市', 'Yuanping', '140900');
INSERT INTO `area` VALUES ('141000', '临汾市', 'Linfen', '140000');
INSERT INTO `area` VALUES ('141002', '尧都区', 'Yaodu', '141000');
INSERT INTO `area` VALUES ('141021', '曲沃县', 'Quwo', '141000');
INSERT INTO `area` VALUES ('141022', '翼城县', 'Yicheng', '141000');
INSERT INTO `area` VALUES ('141023', '襄汾县', 'Xiangfen', '141000');
INSERT INTO `area` VALUES ('141024', '洪洞县', 'Hongtong', '141000');
INSERT INTO `area` VALUES ('141025', '古县', 'Guxian', '141000');
INSERT INTO `area` VALUES ('141026', '安泽县', 'Anze', '141000');
INSERT INTO `area` VALUES ('141027', '浮山县', 'Fushan', '141000');
INSERT INTO `area` VALUES ('141028', '吉县', 'Jixian', '141000');
INSERT INTO `area` VALUES ('141029', '乡宁县', 'Xiangning', '141000');
INSERT INTO `area` VALUES ('141030', '大宁县', 'Daning', '141000');
INSERT INTO `area` VALUES ('141031', '隰县', 'Xixian', '141000');
INSERT INTO `area` VALUES ('141032', '永和县', 'Yonghe', '141000');
INSERT INTO `area` VALUES ('141033', '蒲县', 'Puxian', '141000');
INSERT INTO `area` VALUES ('141034', '汾西县', 'Fenxi', '141000');
INSERT INTO `area` VALUES ('141081', '侯马市', 'Houma', '141000');
INSERT INTO `area` VALUES ('141082', '霍州市', 'Huozhou', '141000');
INSERT INTO `area` VALUES ('141100', '吕梁市', 'Lvliang', '140000');
INSERT INTO `area` VALUES ('141102', '离石区', 'Lishi', '141100');
INSERT INTO `area` VALUES ('141121', '文水县', 'Wenshui', '141100');
INSERT INTO `area` VALUES ('141122', '交城县', 'Jiaocheng', '141100');
INSERT INTO `area` VALUES ('141123', '兴县', 'Xingxian', '141100');
INSERT INTO `area` VALUES ('141124', '临县', 'Linxian', '141100');
INSERT INTO `area` VALUES ('141125', '柳林县', 'Liulin', '141100');
INSERT INTO `area` VALUES ('141126', '石楼县', 'Shilou', '141100');
INSERT INTO `area` VALUES ('141127', '岚县', 'Lanxian', '141100');
INSERT INTO `area` VALUES ('141128', '方山县', 'Fangshan', '141100');
INSERT INTO `area` VALUES ('141129', '中阳县', 'Zhongyang', '141100');
INSERT INTO `area` VALUES ('141130', '交口县', 'Jiaokou', '141100');
INSERT INTO `area` VALUES ('141181', '孝义市', 'Xiaoyi', '141100');
INSERT INTO `area` VALUES ('141182', '汾阳市', 'Fenyang', '141100');
INSERT INTO `area` VALUES ('150000', '内蒙古自治区', 'Inner Mongolia', '0');
INSERT INTO `area` VALUES ('150100', '呼和浩特市', 'Hohhot', '150000');
INSERT INTO `area` VALUES ('150102', '新城区', 'Xincheng', '150100');
INSERT INTO `area` VALUES ('150103', '回民区', 'Huimin', '150100');
INSERT INTO `area` VALUES ('150104', '玉泉区', 'Yuquan', '150100');
INSERT INTO `area` VALUES ('150105', '赛罕区', 'Saihan', '150100');
INSERT INTO `area` VALUES ('150121', '土默特左旗', 'Tumotezuoqi', '150100');
INSERT INTO `area` VALUES ('150122', '托克托县', 'Tuoketuo', '150100');
INSERT INTO `area` VALUES ('150123', '和林格尔县', 'Helingeer', '150100');
INSERT INTO `area` VALUES ('150124', '清水河县', 'Qingshuihe', '150100');
INSERT INTO `area` VALUES ('150125', '武川县', 'Wuchuan', '150100');
INSERT INTO `area` VALUES ('150200', '包头市', 'Baotou', '150000');
INSERT INTO `area` VALUES ('150202', '东河区', 'Donghe', '150200');
INSERT INTO `area` VALUES ('150203', '昆都仑区', 'Kundulun', '150200');
INSERT INTO `area` VALUES ('150204', '青山区', 'Qingshan', '150200');
INSERT INTO `area` VALUES ('150205', '石拐区', 'Shiguai', '150200');
INSERT INTO `area` VALUES ('150206', '白云鄂博矿区', 'Baiyunebokuangqu', '150200');
INSERT INTO `area` VALUES ('150207', '九原区', 'Jiuyuan', '150200');
INSERT INTO `area` VALUES ('150221', '土默特右旗', 'Tumoteyouqi', '150200');
INSERT INTO `area` VALUES ('150222', '固阳县', 'Guyang', '150200');
INSERT INTO `area` VALUES ('150223', '达尔罕茂明安联合旗', 'Damaoqi', '150200');
INSERT INTO `area` VALUES ('150300', '乌海市', 'Wuhai', '150000');
INSERT INTO `area` VALUES ('150302', '海勃湾区', 'Haibowan', '150300');
INSERT INTO `area` VALUES ('150303', '海南区', 'Hainan', '150300');
INSERT INTO `area` VALUES ('150304', '乌达区', 'Wuda', '150300');
INSERT INTO `area` VALUES ('150400', '赤峰市', 'Chifeng', '150000');
INSERT INTO `area` VALUES ('150402', '红山区', 'Hongshan', '150400');
INSERT INTO `area` VALUES ('150403', '元宝山区', 'Yuanbaoshan', '150400');
INSERT INTO `area` VALUES ('150404', '松山区', 'Songshan', '150400');
INSERT INTO `area` VALUES ('150421', '阿鲁科尔沁旗', 'Alukeerqinqi', '150400');
INSERT INTO `area` VALUES ('150422', '巴林左旗', 'Balinzuoqi', '150400');
INSERT INTO `area` VALUES ('150423', '巴林右旗', 'Balinyouqi', '150400');
INSERT INTO `area` VALUES ('150424', '林西县', 'Linxi', '150400');
INSERT INTO `area` VALUES ('150425', '克什克腾旗', 'Keshiketengqi', '150400');
INSERT INTO `area` VALUES ('150426', '翁牛特旗', 'Wengniuteqi', '150400');
INSERT INTO `area` VALUES ('150428', '喀喇沁旗', 'Kalaqinqi', '150400');
INSERT INTO `area` VALUES ('150429', '宁城县', 'Ningcheng', '150400');
INSERT INTO `area` VALUES ('150430', '敖汉旗', 'Aohanqi', '150400');
INSERT INTO `area` VALUES ('150500', '通辽市', 'Tongliao', '150000');
INSERT INTO `area` VALUES ('150502', '科尔沁区', 'Keerqin', '150500');
INSERT INTO `area` VALUES ('150521', '科尔沁左翼中旗', 'Keerqinzuoyizhongqi', '150500');
INSERT INTO `area` VALUES ('150522', '科尔沁左翼后旗', 'Keerqinzuoyihouqi', '150500');
INSERT INTO `area` VALUES ('150523', '开鲁县', 'Kailu', '150500');
INSERT INTO `area` VALUES ('150524', '库伦旗', 'Kulunqi', '150500');
INSERT INTO `area` VALUES ('150525', '奈曼旗', 'Naimanqi', '150500');
INSERT INTO `area` VALUES ('150526', '扎鲁特旗', 'Zhaluteqi', '150500');
INSERT INTO `area` VALUES ('150581', '霍林郭勒市', 'Huolinguole', '150500');
INSERT INTO `area` VALUES ('150600', '鄂尔多斯市', 'Ordos', '150000');
INSERT INTO `area` VALUES ('150602', '东胜区', 'Dongsheng', '150600');
INSERT INTO `area` VALUES ('150621', '达拉特旗', 'Dalateqi', '150600');
INSERT INTO `area` VALUES ('150622', '准格尔旗', 'Zhungeerqi', '150600');
INSERT INTO `area` VALUES ('150623', '鄂托克前旗', 'Etuokeqianqi', '150600');
INSERT INTO `area` VALUES ('150624', '鄂托克旗', 'Etuokeqi', '150600');
INSERT INTO `area` VALUES ('150625', '杭锦旗', 'Hangjinqi', '150600');
INSERT INTO `area` VALUES ('150626', '乌审旗', 'Wushenqi', '150600');
INSERT INTO `area` VALUES ('150627', '伊金霍洛旗', 'Yijinhuoluoqi', '150600');
INSERT INTO `area` VALUES ('150700', '呼伦贝尔市', 'Hulunber', '150000');
INSERT INTO `area` VALUES ('150702', '海拉尔区', 'Hailaer', '150700');
INSERT INTO `area` VALUES ('150703', '扎赉诺尔区', 'Zhalainuoer', '150700');
INSERT INTO `area` VALUES ('150721', '阿荣旗', 'Arongqi', '150700');
INSERT INTO `area` VALUES ('150722', '莫力达瓦达斡尔族自治旗', 'Moqi', '150700');
INSERT INTO `area` VALUES ('150723', '鄂伦春自治旗', 'Elunchun', '150700');
INSERT INTO `area` VALUES ('150724', '鄂温克族自治旗', 'Ewen', '150700');
INSERT INTO `area` VALUES ('150725', '陈巴尔虎旗', 'Chenbaerhuqi', '150700');
INSERT INTO `area` VALUES ('150726', '新巴尔虎左旗', 'Xinbaerhuzuoqi', '150700');
INSERT INTO `area` VALUES ('150727', '新巴尔虎右旗', 'Xinbaerhuyouqi', '150700');
INSERT INTO `area` VALUES ('150781', '满洲里市', 'Manzhouli', '150700');
INSERT INTO `area` VALUES ('150782', '牙克石市', 'Yakeshi', '150700');
INSERT INTO `area` VALUES ('150783', '扎兰屯市', 'Zhalantun', '150700');
INSERT INTO `area` VALUES ('150784', '额尔古纳市', 'Eerguna', '150700');
INSERT INTO `area` VALUES ('150785', '根河市', 'Genhe', '150700');
INSERT INTO `area` VALUES ('150800', '巴彦淖尔市', 'Bayan Nur', '150000');
INSERT INTO `area` VALUES ('150802', '临河区', 'Linhe', '150800');
INSERT INTO `area` VALUES ('150821', '五原县', 'Wuyuan', '150800');
INSERT INTO `area` VALUES ('150822', '磴口县', 'Dengkou', '150800');
INSERT INTO `area` VALUES ('150823', '乌拉特前旗', 'Wulateqianqi', '150800');
INSERT INTO `area` VALUES ('150824', '乌拉特中旗', 'Wulatezhongqi', '150800');
INSERT INTO `area` VALUES ('150825', '乌拉特后旗', 'Wulatehouqi', '150800');
INSERT INTO `area` VALUES ('150826', '杭锦后旗', 'Hangjinhouqi', '150800');
INSERT INTO `area` VALUES ('150900', '乌兰察布市', 'Ulanqab', '150000');
INSERT INTO `area` VALUES ('150902', '集宁区', 'Jining', '150900');
INSERT INTO `area` VALUES ('150921', '卓资县', 'Zhuozi', '150900');
INSERT INTO `area` VALUES ('150922', '化德县', 'Huade', '150900');
INSERT INTO `area` VALUES ('150923', '商都县', 'Shangdu', '150900');
INSERT INTO `area` VALUES ('150924', '兴和县', 'Xinghe', '150900');
INSERT INTO `area` VALUES ('150925', '凉城县', 'Liangcheng', '150900');
INSERT INTO `area` VALUES ('150926', '察哈尔右翼前旗', 'Chayouqianqi', '150900');
INSERT INTO `area` VALUES ('150927', '察哈尔右翼中旗', 'Chayouzhongqi', '150900');
INSERT INTO `area` VALUES ('150928', '察哈尔右翼后旗', 'Chayouhouqi', '150900');
INSERT INTO `area` VALUES ('150929', '四子王旗', 'Siziwangqi', '150900');
INSERT INTO `area` VALUES ('150981', '丰镇市', 'Fengzhen', '150900');
INSERT INTO `area` VALUES ('152200', '兴安盟', 'Hinggan', '150000');
INSERT INTO `area` VALUES ('152201', '乌兰浩特市', 'Wulanhaote', '152200');
INSERT INTO `area` VALUES ('152202', '阿尔山市', 'Aershan', '152200');
INSERT INTO `area` VALUES ('152221', '科尔沁右翼前旗', 'Keyouqianqi', '152200');
INSERT INTO `area` VALUES ('152222', '科尔沁右翼中旗', 'Keyouzhongqi', '152200');
INSERT INTO `area` VALUES ('152223', '扎赉特旗', 'Zhalaiteqi', '152200');
INSERT INTO `area` VALUES ('152224', '突泉县', 'Tuquan', '152200');
INSERT INTO `area` VALUES ('152500', '锡林郭勒盟', 'Xilin Gol', '150000');
INSERT INTO `area` VALUES ('152501', '二连浩特市', 'Erlianhaote', '152500');
INSERT INTO `area` VALUES ('152502', '锡林浩特市', 'Xilinhaote', '152500');
INSERT INTO `area` VALUES ('152522', '阿巴嘎旗', 'Abagaqi', '152500');
INSERT INTO `area` VALUES ('152523', '苏尼特左旗', 'Sunitezuoqi', '152500');
INSERT INTO `area` VALUES ('152524', '苏尼特右旗', 'Suniteyouqi', '152500');
INSERT INTO `area` VALUES ('152525', '东乌珠穆沁旗', 'Dongwuqi', '152500');
INSERT INTO `area` VALUES ('152526', '西乌珠穆沁旗', 'Xiwuqi', '152500');
INSERT INTO `area` VALUES ('152527', '太仆寺旗', 'Taipusiqi', '152500');
INSERT INTO `area` VALUES ('152528', '镶黄旗', 'Xianghuangqi', '152500');
INSERT INTO `area` VALUES ('152529', '正镶白旗', 'Zhengxiangbaiqi', '152500');
INSERT INTO `area` VALUES ('152530', '正蓝旗', 'Zhenglanqi', '152500');
INSERT INTO `area` VALUES ('152531', '多伦县', 'Duolun', '152500');
INSERT INTO `area` VALUES ('152900', '阿拉善盟', 'Alxa', '150000');
INSERT INTO `area` VALUES ('152921', '阿拉善左旗', 'Alashanzuoqi', '152900');
INSERT INTO `area` VALUES ('152922', '阿拉善右旗', 'Alashanyouqi', '152900');
INSERT INTO `area` VALUES ('152923', '额济纳旗', 'Ejinaqi', '152900');
INSERT INTO `area` VALUES ('210000', '辽宁省', 'Liaoning', '0');
INSERT INTO `area` VALUES ('210100', '沈阳市', 'Shenyang', '210000');
INSERT INTO `area` VALUES ('210102', '和平区', 'Heping', '210100');
INSERT INTO `area` VALUES ('210103', '沈河区', 'Shenhe', '210100');
INSERT INTO `area` VALUES ('210104', '大东区', 'Dadong', '210100');
INSERT INTO `area` VALUES ('210105', '皇姑区', 'Huanggu', '210100');
INSERT INTO `area` VALUES ('210106', '铁西区', 'Tiexi', '210100');
INSERT INTO `area` VALUES ('210111', '苏家屯区', 'Sujiatun', '210100');
INSERT INTO `area` VALUES ('210112', '浑南区', 'Hunnan', '210100');
INSERT INTO `area` VALUES ('210113', '沈北新区', 'Shenbeixinqu', '210100');
INSERT INTO `area` VALUES ('210114', '于洪区', 'Yuhong', '210100');
INSERT INTO `area` VALUES ('210122', '辽中县', 'Liaozhong', '210100');
INSERT INTO `area` VALUES ('210123', '康平县', 'Kangping', '210100');
INSERT INTO `area` VALUES ('210124', '法库县', 'Faku', '210100');
INSERT INTO `area` VALUES ('210181', '新民市', 'Xinmin', '210100');
INSERT INTO `area` VALUES ('210200', '大连市', 'Dalian', '210000');
INSERT INTO `area` VALUES ('210202', '中山区', 'Zhongshan', '210200');
INSERT INTO `area` VALUES ('210203', '西岗区', 'Xigang', '210200');
INSERT INTO `area` VALUES ('210204', '沙河口区', 'Shahekou', '210200');
INSERT INTO `area` VALUES ('210211', '甘井子区', 'Ganjingzi', '210200');
INSERT INTO `area` VALUES ('210212', '旅顺口区', 'Lvshunkou', '210200');
INSERT INTO `area` VALUES ('210213', '金州区', 'Jinzhou', '210200');
INSERT INTO `area` VALUES ('210224', '长海县', 'Changhai', '210200');
INSERT INTO `area` VALUES ('210281', '瓦房店市', 'Wafangdian', '210200');
INSERT INTO `area` VALUES ('210282', '普兰店市', 'Pulandian', '210200');
INSERT INTO `area` VALUES ('210283', '庄河市', 'Zhuanghe', '210200');
INSERT INTO `area` VALUES ('210300', '鞍山市', 'Anshan', '210000');
INSERT INTO `area` VALUES ('210302', '铁东区', 'Tiedong', '210300');
INSERT INTO `area` VALUES ('210303', '铁西区', 'Tiexi', '210300');
INSERT INTO `area` VALUES ('210304', '立山区', 'Lishan', '210300');
INSERT INTO `area` VALUES ('210311', '千山区', 'Qianshan', '210300');
INSERT INTO `area` VALUES ('210321', '台安县', 'Tai\'an', '210300');
INSERT INTO `area` VALUES ('210323', '岫岩满族自治县', 'Xiuyan', '210300');
INSERT INTO `area` VALUES ('210381', '海城市', 'Haicheng', '210300');
INSERT INTO `area` VALUES ('210400', '抚顺市', 'Fushun', '210000');
INSERT INTO `area` VALUES ('210402', '新抚区', 'Xinfu', '210400');
INSERT INTO `area` VALUES ('210403', '东洲区', 'Dongzhou', '210400');
INSERT INTO `area` VALUES ('210404', '望花区', 'Wanghua', '210400');
INSERT INTO `area` VALUES ('210411', '顺城区', 'Shuncheng', '210400');
INSERT INTO `area` VALUES ('210421', '抚顺县', 'Fushun', '210400');
INSERT INTO `area` VALUES ('210422', '新宾满族自治县', 'Xinbin', '210400');
INSERT INTO `area` VALUES ('210423', '清原满族自治县', 'Qingyuan', '210400');
INSERT INTO `area` VALUES ('210500', '本溪市', 'Benxi', '210000');
INSERT INTO `area` VALUES ('210502', '平山区', 'Pingshan', '210500');
INSERT INTO `area` VALUES ('210503', '溪湖区', 'Xihu', '210500');
INSERT INTO `area` VALUES ('210504', '明山区', 'Mingshan', '210500');
INSERT INTO `area` VALUES ('210505', '南芬区', 'Nanfen', '210500');
INSERT INTO `area` VALUES ('210521', '本溪满族自治县', 'Benxi', '210500');
INSERT INTO `area` VALUES ('210522', '桓仁满族自治县', 'Huanren', '210500');
INSERT INTO `area` VALUES ('210600', '丹东市', 'Dandong', '210000');
INSERT INTO `area` VALUES ('210602', '元宝区', 'Yuanbao', '210600');
INSERT INTO `area` VALUES ('210603', '振兴区', 'Zhenxing', '210600');
INSERT INTO `area` VALUES ('210604', '振安区', 'Zhen\'an', '210600');
INSERT INTO `area` VALUES ('210624', '宽甸满族自治县', 'Kuandian', '210600');
INSERT INTO `area` VALUES ('210681', '东港市', 'Donggang', '210600');
INSERT INTO `area` VALUES ('210682', '凤城市', 'Fengcheng', '210600');
INSERT INTO `area` VALUES ('210700', '锦州市', 'Jinzhou', '210000');
INSERT INTO `area` VALUES ('210702', '古塔区', 'Guta', '210700');
INSERT INTO `area` VALUES ('210703', '凌河区', 'Linghe', '210700');
INSERT INTO `area` VALUES ('210711', '太和区', 'Taihe', '210700');
INSERT INTO `area` VALUES ('210726', '黑山县', 'Heishan', '210700');
INSERT INTO `area` VALUES ('210727', '义县', 'Yixian', '210700');
INSERT INTO `area` VALUES ('210781', '凌海市', 'Linghai', '210700');
INSERT INTO `area` VALUES ('210782', '北镇市', 'Beizhen', '210700');
INSERT INTO `area` VALUES ('210800', '营口市', 'Yingkou', '210000');
INSERT INTO `area` VALUES ('210802', '站前区', 'Zhanqian', '210800');
INSERT INTO `area` VALUES ('210803', '西市区', 'Xishi', '210800');
INSERT INTO `area` VALUES ('210804', '鲅鱼圈区', 'Bayuquan', '210800');
INSERT INTO `area` VALUES ('210811', '老边区', 'Laobian', '210800');
INSERT INTO `area` VALUES ('210881', '盖州市', 'Gaizhou', '210800');
INSERT INTO `area` VALUES ('210882', '大石桥市', 'Dashiqiao', '210800');
INSERT INTO `area` VALUES ('210900', '阜新市', 'Fuxin', '210000');
INSERT INTO `area` VALUES ('210902', '海州区', 'Haizhou', '210900');
INSERT INTO `area` VALUES ('210903', '新邱区', 'Xinqiu', '210900');
INSERT INTO `area` VALUES ('210904', '太平区', 'Taiping', '210900');
INSERT INTO `area` VALUES ('210905', '清河门区', 'Qinghemen', '210900');
INSERT INTO `area` VALUES ('210911', '细河区', 'Xihe', '210900');
INSERT INTO `area` VALUES ('210921', '阜新蒙古族自治县', 'Fuxin', '210900');
INSERT INTO `area` VALUES ('210922', '彰武县', 'Zhangwu', '210900');
INSERT INTO `area` VALUES ('211000', '辽阳市', 'Liaoyang', '210000');
INSERT INTO `area` VALUES ('211002', '白塔区', 'Baita', '211000');
INSERT INTO `area` VALUES ('211003', '文圣区', 'Wensheng', '211000');
INSERT INTO `area` VALUES ('211004', '宏伟区', 'Hongwei', '211000');
INSERT INTO `area` VALUES ('211005', '弓长岭区', 'Gongchangling', '211000');
INSERT INTO `area` VALUES ('211011', '太子河区', 'Taizihe', '211000');
INSERT INTO `area` VALUES ('211021', '辽阳县', 'Liaoyang', '211000');
INSERT INTO `area` VALUES ('211081', '灯塔市', 'Dengta', '211000');
INSERT INTO `area` VALUES ('211100', '盘锦市', 'Panjin', '210000');
INSERT INTO `area` VALUES ('211102', '双台子区', 'Shuangtaizi', '211100');
INSERT INTO `area` VALUES ('211103', '兴隆台区', 'Xinglongtai', '211100');
INSERT INTO `area` VALUES ('211121', '大洼县', 'Dawa', '211100');
INSERT INTO `area` VALUES ('211122', '盘山县', 'Panshan', '211100');
INSERT INTO `area` VALUES ('211200', '铁岭市', 'Tieling', '210000');
INSERT INTO `area` VALUES ('211202', '银州区', 'Yinzhou', '211200');
INSERT INTO `area` VALUES ('211204', '清河区', 'Qinghe', '211200');
INSERT INTO `area` VALUES ('211221', '铁岭县', 'Tieling', '211200');
INSERT INTO `area` VALUES ('211223', '西丰县', 'Xifeng', '211200');
INSERT INTO `area` VALUES ('211224', '昌图县', 'Changtu', '211200');
INSERT INTO `area` VALUES ('211281', '调兵山市', 'Diaobingshan', '211200');
INSERT INTO `area` VALUES ('211282', '开原市', 'Kaiyuan', '211200');
INSERT INTO `area` VALUES ('211300', '朝阳市', 'Chaoyang', '210000');
INSERT INTO `area` VALUES ('211302', '双塔区', 'Shuangta', '211300');
INSERT INTO `area` VALUES ('211303', '龙城区', 'Longcheng', '211300');
INSERT INTO `area` VALUES ('211321', '朝阳县', 'Chaoyang', '211300');
INSERT INTO `area` VALUES ('211322', '建平县', 'Jianping', '211300');
INSERT INTO `area` VALUES ('211324', '喀喇沁左翼蒙古族自治县', 'Kalaqinzuoyi', '211300');
INSERT INTO `area` VALUES ('211381', '北票市', 'Beipiao', '211300');
INSERT INTO `area` VALUES ('211382', '凌源市', 'Lingyuan', '211300');
INSERT INTO `area` VALUES ('211400', '葫芦岛市', 'Huludao', '210000');
INSERT INTO `area` VALUES ('211402', '连山区', 'Lianshan', '211400');
INSERT INTO `area` VALUES ('211403', '龙港区', 'Longgang', '211400');
INSERT INTO `area` VALUES ('211404', '南票区', 'Nanpiao', '211400');
INSERT INTO `area` VALUES ('211421', '绥中县', 'Suizhong', '211400');
INSERT INTO `area` VALUES ('211422', '建昌县', 'Jianchang', '211400');
INSERT INTO `area` VALUES ('211481', '兴城市', 'Xingcheng', '211400');
INSERT INTO `area` VALUES ('211500', '金普新区', 'Jinpuxinqu', '210000');
INSERT INTO `area` VALUES ('211501', '金州新区', 'Jinzhouxinqu', '211500');
INSERT INTO `area` VALUES ('211502', '普湾新区', 'Puwanxinqu', '211500');
INSERT INTO `area` VALUES ('211503', '保税区', 'Baoshuiqu', '211500');
INSERT INTO `area` VALUES ('220000', '吉林省', 'Jilin', '0');
INSERT INTO `area` VALUES ('220100', '长春市', 'Changchun', '220000');
INSERT INTO `area` VALUES ('220102', '南关区', 'Nanguan', '220100');
INSERT INTO `area` VALUES ('220103', '宽城区', 'Kuancheng', '220100');
INSERT INTO `area` VALUES ('220104', '朝阳区', 'Chaoyang', '220100');
INSERT INTO `area` VALUES ('220105', '二道区', 'Erdao', '220100');
INSERT INTO `area` VALUES ('220106', '绿园区', 'Lvyuan', '220100');
INSERT INTO `area` VALUES ('220112', '双阳区', 'Shuangyang', '220100');
INSERT INTO `area` VALUES ('220113', '九台区', 'Jiutai', '220100');
INSERT INTO `area` VALUES ('220122', '农安县', 'Nong\'an', '220100');
INSERT INTO `area` VALUES ('220182', '榆树市', 'Yushu', '220100');
INSERT INTO `area` VALUES ('220183', '德惠市', 'Dehui', '220100');
INSERT INTO `area` VALUES ('220200', '吉林市', 'Jilin', '220000');
INSERT INTO `area` VALUES ('220202', '昌邑区', 'Changyi', '220200');
INSERT INTO `area` VALUES ('220203', '龙潭区', 'Longtan', '220200');
INSERT INTO `area` VALUES ('220204', '船营区', 'Chuanying', '220200');
INSERT INTO `area` VALUES ('220211', '丰满区', 'Fengman', '220200');
INSERT INTO `area` VALUES ('220221', '永吉县', 'Yongji', '220200');
INSERT INTO `area` VALUES ('220281', '蛟河市', 'Jiaohe', '220200');
INSERT INTO `area` VALUES ('220282', '桦甸市', 'Huadian', '220200');
INSERT INTO `area` VALUES ('220283', '舒兰市', 'Shulan', '220200');
INSERT INTO `area` VALUES ('220284', '磐石市', 'Panshi', '220200');
INSERT INTO `area` VALUES ('220300', '四平市', 'Siping', '220000');
INSERT INTO `area` VALUES ('220302', '铁西区', 'Tiexi', '220300');
INSERT INTO `area` VALUES ('220303', '铁东区', 'Tiedong', '220300');
INSERT INTO `area` VALUES ('220322', '梨树县', 'Lishu', '220300');
INSERT INTO `area` VALUES ('220323', '伊通满族自治县', 'Yitong', '220300');
INSERT INTO `area` VALUES ('220381', '公主岭市', 'Gongzhuling', '220300');
INSERT INTO `area` VALUES ('220382', '双辽市', 'Shuangliao', '220300');
INSERT INTO `area` VALUES ('220400', '辽源市', 'Liaoyuan', '220000');
INSERT INTO `area` VALUES ('220402', '龙山区', 'Longshan', '220400');
INSERT INTO `area` VALUES ('220403', '西安区', 'Xi\'an', '220400');
INSERT INTO `area` VALUES ('220421', '东丰县', 'Dongfeng', '220400');
INSERT INTO `area` VALUES ('220422', '东辽县', 'Dongliao', '220400');
INSERT INTO `area` VALUES ('220500', '通化市', 'Tonghua', '220000');
INSERT INTO `area` VALUES ('220502', '东昌区', 'Dongchang', '220500');
INSERT INTO `area` VALUES ('220503', '二道江区', 'Erdaojiang', '220500');
INSERT INTO `area` VALUES ('220521', '通化县', 'Tonghua', '220500');
INSERT INTO `area` VALUES ('220523', '辉南县', 'Huinan', '220500');
INSERT INTO `area` VALUES ('220524', '柳河县', 'Liuhe', '220500');
INSERT INTO `area` VALUES ('220581', '梅河口市', 'Meihekou', '220500');
INSERT INTO `area` VALUES ('220582', '集安市', 'Ji\'an', '220500');
INSERT INTO `area` VALUES ('220600', '白山市', 'Baishan', '220000');
INSERT INTO `area` VALUES ('220602', '浑江区', 'Hunjiang', '220600');
INSERT INTO `area` VALUES ('220605', '江源区', 'Jiangyuan', '220600');
INSERT INTO `area` VALUES ('220621', '抚松县', 'Fusong', '220600');
INSERT INTO `area` VALUES ('220622', '靖宇县', 'Jingyu', '220600');
INSERT INTO `area` VALUES ('220623', '长白朝鲜族自治县', 'Changbai', '220600');
INSERT INTO `area` VALUES ('220681', '临江市', 'Linjiang', '220600');
INSERT INTO `area` VALUES ('220700', '松原市', 'Songyuan', '220000');
INSERT INTO `area` VALUES ('220702', '宁江区', 'Ningjiang', '220700');
INSERT INTO `area` VALUES ('220721', '前郭尔罗斯蒙古族自治县', 'Qianguoerluosi', '220700');
INSERT INTO `area` VALUES ('220722', '长岭县', 'Changling', '220700');
INSERT INTO `area` VALUES ('220723', '乾安县', 'Qian\'an', '220700');
INSERT INTO `area` VALUES ('220781', '扶余市', 'Fuyu', '220700');
INSERT INTO `area` VALUES ('220800', '白城市', 'Baicheng', '220000');
INSERT INTO `area` VALUES ('220802', '洮北区', 'Taobei', '220800');
INSERT INTO `area` VALUES ('220821', '镇赉县', 'Zhenlai', '220800');
INSERT INTO `area` VALUES ('220822', '通榆县', 'Tongyu', '220800');
INSERT INTO `area` VALUES ('220881', '洮南市', 'Taonan', '220800');
INSERT INTO `area` VALUES ('220882', '大安市', 'Da\'an', '220800');
INSERT INTO `area` VALUES ('222400', '延边朝鲜族自治州', 'Yanbian', '220000');
INSERT INTO `area` VALUES ('222401', '延吉市', 'Yanji', '222400');
INSERT INTO `area` VALUES ('222402', '图们市', 'Tumen', '222400');
INSERT INTO `area` VALUES ('222403', '敦化市', 'Dunhua', '222400');
INSERT INTO `area` VALUES ('222404', '珲春市', 'Hunchun', '222400');
INSERT INTO `area` VALUES ('222405', '龙井市', 'Longjing', '222400');
INSERT INTO `area` VALUES ('222406', '和龙市', 'Helong', '222400');
INSERT INTO `area` VALUES ('222424', '汪清县', 'Wangqing', '222400');
INSERT INTO `area` VALUES ('222426', '安图县', 'Antu', '222400');
INSERT INTO `area` VALUES ('230000', '黑龙江省', 'Heilongjiang', '0');
INSERT INTO `area` VALUES ('230100', '哈尔滨市', 'Harbin', '230000');
INSERT INTO `area` VALUES ('230102', '道里区', 'Daoli', '230100');
INSERT INTO `area` VALUES ('230103', '南岗区', 'Nangang', '230100');
INSERT INTO `area` VALUES ('230104', '道外区', 'Daowai', '230100');
INSERT INTO `area` VALUES ('230108', '平房区', 'Pingfang', '230100');
INSERT INTO `area` VALUES ('230109', '松北区', 'Songbei', '230100');
INSERT INTO `area` VALUES ('230110', '香坊区', 'Xiangfang', '230100');
INSERT INTO `area` VALUES ('230111', '呼兰区', 'Hulan', '230100');
INSERT INTO `area` VALUES ('230112', '阿城区', 'A\'cheng', '230100');
INSERT INTO `area` VALUES ('230113', '双城区', 'Shuangcheng', '230100');
INSERT INTO `area` VALUES ('230123', '依兰县', 'Yilan', '230100');
INSERT INTO `area` VALUES ('230124', '方正县', 'Fangzheng', '230100');
INSERT INTO `area` VALUES ('230125', '宾县', 'Binxian', '230100');
INSERT INTO `area` VALUES ('230126', '巴彦县', 'Bayan', '230100');
INSERT INTO `area` VALUES ('230127', '木兰县', 'Mulan', '230100');
INSERT INTO `area` VALUES ('230128', '通河县', 'Tonghe', '230100');
INSERT INTO `area` VALUES ('230129', '延寿县', 'Yanshou', '230100');
INSERT INTO `area` VALUES ('230183', '尚志市', 'Shangzhi', '230100');
INSERT INTO `area` VALUES ('230184', '五常市', 'Wuchang', '230100');
INSERT INTO `area` VALUES ('230200', '齐齐哈尔市', 'Qiqihar', '230000');
INSERT INTO `area` VALUES ('230202', '龙沙区', 'Longsha', '230200');
INSERT INTO `area` VALUES ('230203', '建华区', 'Jianhua', '230200');
INSERT INTO `area` VALUES ('230204', '铁锋区', 'Tiefeng', '230200');
INSERT INTO `area` VALUES ('230205', '昂昂溪区', 'Angangxi', '230200');
INSERT INTO `area` VALUES ('230206', '富拉尔基区', 'Fulaerji', '230200');
INSERT INTO `area` VALUES ('230207', '碾子山区', 'Nianzishan', '230200');
INSERT INTO `area` VALUES ('230208', '梅里斯达斡尔族区', 'Meilisi', '230200');
INSERT INTO `area` VALUES ('230221', '龙江县', 'Longjiang', '230200');
INSERT INTO `area` VALUES ('230223', '依安县', 'Yi\'an', '230200');
INSERT INTO `area` VALUES ('230224', '泰来县', 'Tailai', '230200');
INSERT INTO `area` VALUES ('230225', '甘南县', 'Gannan', '230200');
INSERT INTO `area` VALUES ('230227', '富裕县', 'Fuyu', '230200');
INSERT INTO `area` VALUES ('230229', '克山县', 'Keshan', '230200');
INSERT INTO `area` VALUES ('230230', '克东县', 'Kedong', '230200');
INSERT INTO `area` VALUES ('230231', '拜泉县', 'Baiquan', '230200');
INSERT INTO `area` VALUES ('230281', '讷河市', 'Nehe', '230200');
INSERT INTO `area` VALUES ('230300', '鸡西市', 'Jixi', '230000');
INSERT INTO `area` VALUES ('230302', '鸡冠区', 'Jiguan', '230300');
INSERT INTO `area` VALUES ('230303', '恒山区', 'Hengshan', '230300');
INSERT INTO `area` VALUES ('230304', '滴道区', 'Didao', '230300');
INSERT INTO `area` VALUES ('230305', '梨树区', 'Lishu', '230300');
INSERT INTO `area` VALUES ('230306', '城子河区', 'Chengzihe', '230300');
INSERT INTO `area` VALUES ('230307', '麻山区', 'Mashan', '230300');
INSERT INTO `area` VALUES ('230321', '鸡东县', 'Jidong', '230300');
INSERT INTO `area` VALUES ('230381', '虎林市', 'Hulin', '230300');
INSERT INTO `area` VALUES ('230382', '密山市', 'Mishan', '230300');
INSERT INTO `area` VALUES ('230400', '鹤岗市', 'Hegang', '230000');
INSERT INTO `area` VALUES ('230402', '向阳区', 'Xiangyang', '230400');
INSERT INTO `area` VALUES ('230403', '工农区', 'Gongnong', '230400');
INSERT INTO `area` VALUES ('230404', '南山区', 'Nanshan', '230400');
INSERT INTO `area` VALUES ('230405', '兴安区', 'Xing\'an', '230400');
INSERT INTO `area` VALUES ('230406', '东山区', 'Dongshan', '230400');
INSERT INTO `area` VALUES ('230407', '兴山区', 'Xingshan', '230400');
INSERT INTO `area` VALUES ('230421', '萝北县', 'Luobei', '230400');
INSERT INTO `area` VALUES ('230422', '绥滨县', 'Suibin', '230400');
INSERT INTO `area` VALUES ('230500', '双鸭山市', 'Shuangyashan', '230000');
INSERT INTO `area` VALUES ('230502', '尖山区', 'Jianshan', '230500');
INSERT INTO `area` VALUES ('230503', '岭东区', 'Lingdong', '230500');
INSERT INTO `area` VALUES ('230505', '四方台区', 'Sifangtai', '230500');
INSERT INTO `area` VALUES ('230506', '宝山区', 'Baoshan', '230500');
INSERT INTO `area` VALUES ('230521', '集贤县', 'Jixian', '230500');
INSERT INTO `area` VALUES ('230522', '友谊县', 'Youyi', '230500');
INSERT INTO `area` VALUES ('230523', '宝清县', 'Baoqing', '230500');
INSERT INTO `area` VALUES ('230524', '饶河县', 'Raohe', '230500');
INSERT INTO `area` VALUES ('230600', '大庆市', 'Daqing', '230000');
INSERT INTO `area` VALUES ('230602', '萨尔图区', 'Saertu', '230600');
INSERT INTO `area` VALUES ('230603', '龙凤区', 'Longfeng', '230600');
INSERT INTO `area` VALUES ('230604', '让胡路区', 'Ranghulu', '230600');
INSERT INTO `area` VALUES ('230605', '红岗区', 'Honggang', '230600');
INSERT INTO `area` VALUES ('230606', '大同区', 'Datong', '230600');
INSERT INTO `area` VALUES ('230621', '肇州县', 'Zhaozhou', '230600');
INSERT INTO `area` VALUES ('230622', '肇源县', 'Zhaoyuan', '230600');
INSERT INTO `area` VALUES ('230623', '林甸县', 'Lindian', '230600');
INSERT INTO `area` VALUES ('230624', '杜尔伯特蒙古族自治县', 'Duerbote', '230600');
INSERT INTO `area` VALUES ('230700', '伊春市', 'Yichun', '230000');
INSERT INTO `area` VALUES ('230702', '伊春区', 'Yichun', '230700');
INSERT INTO `area` VALUES ('230703', '南岔区', 'Nancha', '230700');
INSERT INTO `area` VALUES ('230704', '友好区', 'Youhao', '230700');
INSERT INTO `area` VALUES ('230705', '西林区', 'Xilin', '230700');
INSERT INTO `area` VALUES ('230706', '翠峦区', 'Cuiluan', '230700');
INSERT INTO `area` VALUES ('230707', '新青区', 'Xinqing', '230700');
INSERT INTO `area` VALUES ('230708', '美溪区', 'Meixi', '230700');
INSERT INTO `area` VALUES ('230709', '金山屯区', 'Jinshantun', '230700');
INSERT INTO `area` VALUES ('230710', '五营区', 'Wuying', '230700');
INSERT INTO `area` VALUES ('230711', '乌马河区', 'Wumahe', '230700');
INSERT INTO `area` VALUES ('230712', '汤旺河区', 'Tangwanghe', '230700');
INSERT INTO `area` VALUES ('230713', '带岭区', 'Dailing', '230700');
INSERT INTO `area` VALUES ('230714', '乌伊岭区', 'Wuyiling', '230700');
INSERT INTO `area` VALUES ('230715', '红星区', 'Hongxing', '230700');
INSERT INTO `area` VALUES ('230716', '上甘岭区', 'Shangganling', '230700');
INSERT INTO `area` VALUES ('230722', '嘉荫县', 'Jiayin', '230700');
INSERT INTO `area` VALUES ('230781', '铁力市', 'Tieli', '230700');
INSERT INTO `area` VALUES ('230800', '佳木斯市', 'Jiamusi', '230000');
INSERT INTO `area` VALUES ('230803', '向阳区', 'Xiangyang', '230800');
INSERT INTO `area` VALUES ('230804', '前进区', 'Qianjin', '230800');
INSERT INTO `area` VALUES ('230805', '东风区', 'Dongfeng', '230800');
INSERT INTO `area` VALUES ('230811', '郊区', 'Jiaoqu', '230800');
INSERT INTO `area` VALUES ('230822', '桦南县', 'Huanan', '230800');
INSERT INTO `area` VALUES ('230826', '桦川县', 'Huachuan', '230800');
INSERT INTO `area` VALUES ('230828', '汤原县', 'Tangyuan', '230800');
INSERT INTO `area` VALUES ('230833', '抚远县', 'Fuyuan', '230800');
INSERT INTO `area` VALUES ('230881', '同江市', 'Tongjiang', '230800');
INSERT INTO `area` VALUES ('230882', '富锦市', 'Fujin', '230800');
INSERT INTO `area` VALUES ('230900', '七台河市', 'Qitaihe', '230000');
INSERT INTO `area` VALUES ('230902', '新兴区', 'Xinxing', '230900');
INSERT INTO `area` VALUES ('230903', '桃山区', 'Taoshan', '230900');
INSERT INTO `area` VALUES ('230904', '茄子河区', 'Qiezihe', '230900');
INSERT INTO `area` VALUES ('230921', '勃利县', 'Boli', '230900');
INSERT INTO `area` VALUES ('231000', '牡丹江市', 'Mudanjiang', '230000');
INSERT INTO `area` VALUES ('231002', '东安区', 'Dong\'an', '231000');
INSERT INTO `area` VALUES ('231003', '阳明区', 'Yangming', '231000');
INSERT INTO `area` VALUES ('231004', '爱民区', 'Aimin', '231000');
INSERT INTO `area` VALUES ('231005', '西安区', 'Xi\'an', '231000');
INSERT INTO `area` VALUES ('231024', '东宁县', 'Dongning', '231000');
INSERT INTO `area` VALUES ('231025', '林口县', 'Linkou', '231000');
INSERT INTO `area` VALUES ('231081', '绥芬河市', 'Suifenhe', '231000');
INSERT INTO `area` VALUES ('231083', '海林市', 'Hailin', '231000');
INSERT INTO `area` VALUES ('231084', '宁安市', 'Ning\'an', '231000');
INSERT INTO `area` VALUES ('231085', '穆棱市', 'Muling', '231000');
INSERT INTO `area` VALUES ('231100', '黑河市', 'Heihe', '230000');
INSERT INTO `area` VALUES ('231102', '爱辉区', 'Aihui', '231100');
INSERT INTO `area` VALUES ('231121', '嫩江县', 'Nenjiang', '231100');
INSERT INTO `area` VALUES ('231123', '逊克县', 'Xunke', '231100');
INSERT INTO `area` VALUES ('231124', '孙吴县', 'Sunwu', '231100');
INSERT INTO `area` VALUES ('231181', '北安市', 'Bei\'an', '231100');
INSERT INTO `area` VALUES ('231182', '五大连池市', 'Wudalianchi', '231100');
INSERT INTO `area` VALUES ('231200', '绥化市', 'Suihua', '230000');
INSERT INTO `area` VALUES ('231202', '北林区', 'Beilin', '231200');
INSERT INTO `area` VALUES ('231221', '望奎县', 'Wangkui', '231200');
INSERT INTO `area` VALUES ('231222', '兰西县', 'Lanxi', '231200');
INSERT INTO `area` VALUES ('231223', '青冈县', 'Qinggang', '231200');
INSERT INTO `area` VALUES ('231224', '庆安县', 'Qing\'an', '231200');
INSERT INTO `area` VALUES ('231225', '明水县', 'Mingshui', '231200');
INSERT INTO `area` VALUES ('231226', '绥棱县', 'Suileng', '231200');
INSERT INTO `area` VALUES ('231281', '安达市', 'Anda', '231200');
INSERT INTO `area` VALUES ('231282', '肇东市', 'Zhaodong', '231200');
INSERT INTO `area` VALUES ('231283', '海伦市', 'Hailun', '231200');
INSERT INTO `area` VALUES ('232700', '大兴安岭地区', 'DaXingAnLing', '230000');
INSERT INTO `area` VALUES ('232701', '加格达奇区', 'Jiagedaqi', '232700');
INSERT INTO `area` VALUES ('232702', '新林区', 'Xinlin', '232700');
INSERT INTO `area` VALUES ('232703', '松岭区', 'Songling', '232700');
INSERT INTO `area` VALUES ('232704', '呼中区', 'Huzhong', '232700');
INSERT INTO `area` VALUES ('232721', '呼玛县', 'Huma', '232700');
INSERT INTO `area` VALUES ('232722', '塔河县', 'Tahe', '232700');
INSERT INTO `area` VALUES ('232723', '漠河县', 'Mohe', '232700');
INSERT INTO `area` VALUES ('310000', '上海', 'Shanghai', '0');
INSERT INTO `area` VALUES ('310100', '上海市', 'Shanghai', '310000');
INSERT INTO `area` VALUES ('310101', '黄浦区', 'Huangpu', '310100');
INSERT INTO `area` VALUES ('310104', '徐汇区', 'Xuhui', '310100');
INSERT INTO `area` VALUES ('310105', '长宁区', 'Changning', '310100');
INSERT INTO `area` VALUES ('310106', '静安区', 'Jing\'an', '310100');
INSERT INTO `area` VALUES ('310107', '普陀区', 'Putuo', '310100');
INSERT INTO `area` VALUES ('310108', '闸北区', 'Zhabei', '310100');
INSERT INTO `area` VALUES ('310109', '虹口区', 'Hongkou', '310100');
INSERT INTO `area` VALUES ('310110', '杨浦区', 'Yangpu', '310100');
INSERT INTO `area` VALUES ('310112', '闵行区', 'Minhang', '310100');
INSERT INTO `area` VALUES ('310113', '宝山区', 'Baoshan', '310100');
INSERT INTO `area` VALUES ('310114', '嘉定区', 'Jiading', '310100');
INSERT INTO `area` VALUES ('310115', '浦东新区', 'Pudong', '310100');
INSERT INTO `area` VALUES ('310116', '金山区', 'Jinshan', '310100');
INSERT INTO `area` VALUES ('310117', '松江区', 'Songjiang', '310100');
INSERT INTO `area` VALUES ('310118', '青浦区', 'Qingpu', '310100');
INSERT INTO `area` VALUES ('310120', '奉贤区', 'Fengxian', '310100');
INSERT INTO `area` VALUES ('310230', '崇明县', 'Chongming', '310100');
INSERT INTO `area` VALUES ('320000', '江苏省', 'Jiangsu', '0');
INSERT INTO `area` VALUES ('320100', '南京市', 'Nanjing', '320000');
INSERT INTO `area` VALUES ('320102', '玄武区', 'Xuanwu', '320100');
INSERT INTO `area` VALUES ('320104', '秦淮区', 'Qinhuai', '320100');
INSERT INTO `area` VALUES ('320105', '建邺区', 'Jianye', '320100');
INSERT INTO `area` VALUES ('320106', '鼓楼区', 'Gulou', '320100');
INSERT INTO `area` VALUES ('320111', '浦口区', 'Pukou', '320100');
INSERT INTO `area` VALUES ('320113', '栖霞区', 'Qixia', '320100');
INSERT INTO `area` VALUES ('320114', '雨花台区', 'Yuhuatai', '320100');
INSERT INTO `area` VALUES ('320115', '江宁区', 'Jiangning', '320100');
INSERT INTO `area` VALUES ('320116', '六合区', 'Luhe', '320100');
INSERT INTO `area` VALUES ('320117', '溧水区', 'Lishui', '320100');
INSERT INTO `area` VALUES ('320118', '高淳区', 'Gaochun', '320100');
INSERT INTO `area` VALUES ('320200', '无锡市', 'Wuxi', '320000');
INSERT INTO `area` VALUES ('320202', '崇安区', 'Chong\'an', '320200');
INSERT INTO `area` VALUES ('320203', '南长区', 'Nanchang', '320200');
INSERT INTO `area` VALUES ('320204', '北塘区', 'Beitang', '320200');
INSERT INTO `area` VALUES ('320205', '锡山区', 'Xishan', '320200');
INSERT INTO `area` VALUES ('320206', '惠山区', 'Huishan', '320200');
INSERT INTO `area` VALUES ('320211', '滨湖区', 'Binhu', '320200');
INSERT INTO `area` VALUES ('320281', '江阴市', 'Jiangyin', '320200');
INSERT INTO `area` VALUES ('320282', '宜兴市', 'Yixing', '320200');
INSERT INTO `area` VALUES ('320300', '徐州市', 'Xuzhou', '320000');
INSERT INTO `area` VALUES ('320302', '鼓楼区', 'Gulou', '320300');
INSERT INTO `area` VALUES ('320303', '云龙区', 'Yunlong', '320300');
INSERT INTO `area` VALUES ('320305', '贾汪区', 'Jiawang', '320300');
INSERT INTO `area` VALUES ('320311', '泉山区', 'Quanshan', '320300');
INSERT INTO `area` VALUES ('320312', '铜山区', 'Tongshan', '320300');
INSERT INTO `area` VALUES ('320321', '丰县', 'Fengxian', '320300');
INSERT INTO `area` VALUES ('320322', '沛县', 'Peixian', '320300');
INSERT INTO `area` VALUES ('320324', '睢宁县', 'Suining', '320300');
INSERT INTO `area` VALUES ('320381', '新沂市', 'Xinyi', '320300');
INSERT INTO `area` VALUES ('320382', '邳州市', 'Pizhou', '320300');
INSERT INTO `area` VALUES ('320400', '常州市', 'Changzhou', '320000');
INSERT INTO `area` VALUES ('320402', '天宁区', 'Tianning', '320400');
INSERT INTO `area` VALUES ('320404', '钟楼区', 'Zhonglou', '320400');
INSERT INTO `area` VALUES ('320405', '戚墅堰区', 'Qishuyan', '320400');
INSERT INTO `area` VALUES ('320411', '新北区', 'Xinbei', '320400');
INSERT INTO `area` VALUES ('320412', '武进区', 'Wujin', '320400');
INSERT INTO `area` VALUES ('320481', '溧阳市', 'Liyang', '320400');
INSERT INTO `area` VALUES ('320482', '金坛市', 'Jintan', '320400');
INSERT INTO `area` VALUES ('320500', '苏州市', 'Suzhou', '320000');
INSERT INTO `area` VALUES ('320505', '虎丘区', 'Huqiu', '320500');
INSERT INTO `area` VALUES ('320506', '吴中区', 'Wuzhong', '320500');
INSERT INTO `area` VALUES ('320507', '相城区', 'Xiangcheng', '320500');
INSERT INTO `area` VALUES ('320508', '姑苏区', 'Gusu', '320500');
INSERT INTO `area` VALUES ('320509', '吴江区', 'Wujiang', '320500');
INSERT INTO `area` VALUES ('320581', '常熟市', 'Changshu', '320500');
INSERT INTO `area` VALUES ('320582', '张家港市', 'Zhangjiagang', '320500');
INSERT INTO `area` VALUES ('320583', '昆山市', 'Kunshan', '320500');
INSERT INTO `area` VALUES ('320585', '太仓市', 'Taicang', '320500');
INSERT INTO `area` VALUES ('320600', '南通市', 'Nantong', '320000');
INSERT INTO `area` VALUES ('320602', '崇川区', 'Chongchuan', '320600');
INSERT INTO `area` VALUES ('320611', '港闸区', 'Gangzha', '320600');
INSERT INTO `area` VALUES ('320612', '通州区', 'Tongzhou', '320600');
INSERT INTO `area` VALUES ('320621', '海安县', 'Hai\'an', '320600');
INSERT INTO `area` VALUES ('320623', '如东县', 'Rudong', '320600');
INSERT INTO `area` VALUES ('320681', '启东市', 'Qidong', '320600');
INSERT INTO `area` VALUES ('320682', '如皋市', 'Rugao', '320600');
INSERT INTO `area` VALUES ('320684', '海门市', 'Haimen', '320600');
INSERT INTO `area` VALUES ('320700', '连云港市', 'Lianyungang', '320000');
INSERT INTO `area` VALUES ('320703', '连云区', 'Lianyun', '320700');
INSERT INTO `area` VALUES ('320706', '海州区', 'Haizhou', '320700');
INSERT INTO `area` VALUES ('320707', '赣榆区', 'Ganyu', '320700');
INSERT INTO `area` VALUES ('320722', '东海县', 'Donghai', '320700');
INSERT INTO `area` VALUES ('320723', '灌云县', 'Guanyun', '320700');
INSERT INTO `area` VALUES ('320724', '灌南县', 'Guannan', '320700');
INSERT INTO `area` VALUES ('320800', '淮安市', 'Huai\'an', '320000');
INSERT INTO `area` VALUES ('320802', '清河区', 'Qinghe', '320800');
INSERT INTO `area` VALUES ('320803', '淮安区', 'Huai\'an', '320800');
INSERT INTO `area` VALUES ('320804', '淮阴区', 'Huaiyin', '320800');
INSERT INTO `area` VALUES ('320811', '清浦区', 'Qingpu', '320800');
INSERT INTO `area` VALUES ('320826', '涟水县', 'Lianshui', '320800');
INSERT INTO `area` VALUES ('320829', '洪泽县', 'Hongze', '320800');
INSERT INTO `area` VALUES ('320830', '盱眙县', 'Xuyi', '320800');
INSERT INTO `area` VALUES ('320831', '金湖县', 'Jinhu', '320800');
INSERT INTO `area` VALUES ('320900', '盐城市', 'Yancheng', '320000');
INSERT INTO `area` VALUES ('320902', '亭湖区', 'Tinghu', '320900');
INSERT INTO `area` VALUES ('320903', '盐都区', 'Yandu', '320900');
INSERT INTO `area` VALUES ('320921', '响水县', 'Xiangshui', '320900');
INSERT INTO `area` VALUES ('320922', '滨海县', 'Binhai', '320900');
INSERT INTO `area` VALUES ('320923', '阜宁县', 'Funing', '320900');
INSERT INTO `area` VALUES ('320924', '射阳县', 'Sheyang', '320900');
INSERT INTO `area` VALUES ('320925', '建湖县', 'Jianhu', '320900');
INSERT INTO `area` VALUES ('320981', '东台市', 'Dongtai', '320900');
INSERT INTO `area` VALUES ('320982', '大丰市', 'Dafeng', '320900');
INSERT INTO `area` VALUES ('321000', '扬州市', 'Yangzhou', '320000');
INSERT INTO `area` VALUES ('321002', '广陵区', 'Guangling', '321000');
INSERT INTO `area` VALUES ('321003', '邗江区', 'Hanjiang', '321000');
INSERT INTO `area` VALUES ('321012', '江都区', 'Jiangdu', '321000');
INSERT INTO `area` VALUES ('321023', '宝应县', 'Baoying', '321000');
INSERT INTO `area` VALUES ('321081', '仪征市', 'Yizheng', '321000');
INSERT INTO `area` VALUES ('321084', '高邮市', 'Gaoyou', '321000');
INSERT INTO `area` VALUES ('321100', '镇江市', 'Zhenjiang', '320000');
INSERT INTO `area` VALUES ('321102', '京口区', 'Jingkou', '321100');
INSERT INTO `area` VALUES ('321111', '润州区', 'Runzhou', '321100');
INSERT INTO `area` VALUES ('321112', '丹徒区', 'Dantu', '321100');
INSERT INTO `area` VALUES ('321181', '丹阳市', 'Danyang', '321100');
INSERT INTO `area` VALUES ('321182', '扬中市', 'Yangzhong', '321100');
INSERT INTO `area` VALUES ('321183', '句容市', 'Jurong', '321100');
INSERT INTO `area` VALUES ('321200', '泰州市', 'Taizhou', '320000');
INSERT INTO `area` VALUES ('321202', '海陵区', 'Hailing', '321200');
INSERT INTO `area` VALUES ('321203', '高港区', 'Gaogang', '321200');
INSERT INTO `area` VALUES ('321204', '姜堰区', 'Jiangyan', '321200');
INSERT INTO `area` VALUES ('321281', '兴化市', 'Xinghua', '321200');
INSERT INTO `area` VALUES ('321282', '靖江市', 'Jingjiang', '321200');
INSERT INTO `area` VALUES ('321283', '泰兴市', 'Taixing', '321200');
INSERT INTO `area` VALUES ('321300', '宿迁市', 'Suqian', '320000');
INSERT INTO `area` VALUES ('321302', '宿城区', 'Sucheng', '321300');
INSERT INTO `area` VALUES ('321311', '宿豫区', 'Suyu', '321300');
INSERT INTO `area` VALUES ('321322', '沭阳县', 'Shuyang', '321300');
INSERT INTO `area` VALUES ('321323', '泗阳县', 'Siyang', '321300');
INSERT INTO `area` VALUES ('321324', '泗洪县', 'Sihong', '321300');
INSERT INTO `area` VALUES ('330000', '浙江省', 'Zhejiang', '0');
INSERT INTO `area` VALUES ('330100', '杭州市', 'Hangzhou', '330000');
INSERT INTO `area` VALUES ('330102', '上城区', 'Shangcheng', '330100');
INSERT INTO `area` VALUES ('330103', '下城区', 'Xiacheng', '330100');
INSERT INTO `area` VALUES ('330104', '江干区', 'Jianggan', '330100');
INSERT INTO `area` VALUES ('330105', '拱墅区', 'Gongshu', '330100');
INSERT INTO `area` VALUES ('330106', '西湖区', 'Xihu', '330100');
INSERT INTO `area` VALUES ('330108', '滨江区', 'Binjiang', '330100');
INSERT INTO `area` VALUES ('330109', '萧山区', 'Xiaoshan', '330100');
INSERT INTO `area` VALUES ('330110', '余杭区', 'Yuhang', '330100');
INSERT INTO `area` VALUES ('330122', '桐庐县', 'Tonglu', '330100');
INSERT INTO `area` VALUES ('330127', '淳安县', 'Chun\'an', '330100');
INSERT INTO `area` VALUES ('330182', '建德市', 'Jiande', '330100');
INSERT INTO `area` VALUES ('330183', '富阳区', 'Fuyang', '330100');
INSERT INTO `area` VALUES ('330185', '临安市', 'Lin\'an', '330100');
INSERT INTO `area` VALUES ('330200', '宁波市', 'Ningbo', '330000');
INSERT INTO `area` VALUES ('330203', '海曙区', 'Haishu', '330200');
INSERT INTO `area` VALUES ('330204', '江东区', 'Jiangdong', '330200');
INSERT INTO `area` VALUES ('330205', '江北区', 'Jiangbei', '330200');
INSERT INTO `area` VALUES ('330206', '北仑区', 'Beilun', '330200');
INSERT INTO `area` VALUES ('330211', '镇海区', 'Zhenhai', '330200');
INSERT INTO `area` VALUES ('330212', '鄞州区', 'Yinzhou', '330200');
INSERT INTO `area` VALUES ('330225', '象山县', 'Xiangshan', '330200');
INSERT INTO `area` VALUES ('330226', '宁海县', 'Ninghai', '330200');
INSERT INTO `area` VALUES ('330281', '余姚市', 'Yuyao', '330200');
INSERT INTO `area` VALUES ('330282', '慈溪市', 'Cixi', '330200');
INSERT INTO `area` VALUES ('330283', '奉化市', 'Fenghua', '330200');
INSERT INTO `area` VALUES ('330300', '温州市', 'Wenzhou', '330000');
INSERT INTO `area` VALUES ('330302', '鹿城区', 'Lucheng', '330300');
INSERT INTO `area` VALUES ('330303', '龙湾区', 'Longwan', '330300');
INSERT INTO `area` VALUES ('330304', '瓯海区', 'Ouhai', '330300');
INSERT INTO `area` VALUES ('330322', '洞头县', 'Dongtou', '330300');
INSERT INTO `area` VALUES ('330324', '永嘉县', 'Yongjia', '330300');
INSERT INTO `area` VALUES ('330326', '平阳县', 'Pingyang', '330300');
INSERT INTO `area` VALUES ('330327', '苍南县', 'Cangnan', '330300');
INSERT INTO `area` VALUES ('330328', '文成县', 'Wencheng', '330300');
INSERT INTO `area` VALUES ('330329', '泰顺县', 'Taishun', '330300');
INSERT INTO `area` VALUES ('330381', '瑞安市', 'Rui\'an', '330300');
INSERT INTO `area` VALUES ('330382', '乐清市', 'Yueqing', '330300');
INSERT INTO `area` VALUES ('330400', '嘉兴市', 'Jiaxing', '330000');
INSERT INTO `area` VALUES ('330402', '南湖区', 'Nanhu', '330400');
INSERT INTO `area` VALUES ('330411', '秀洲区', 'Xiuzhou', '330400');
INSERT INTO `area` VALUES ('330421', '嘉善县', 'Jiashan', '330400');
INSERT INTO `area` VALUES ('330424', '海盐县', 'Haiyan', '330400');
INSERT INTO `area` VALUES ('330481', '海宁市', 'Haining', '330400');
INSERT INTO `area` VALUES ('330482', '平湖市', 'Pinghu', '330400');
INSERT INTO `area` VALUES ('330483', '桐乡市', 'Tongxiang', '330400');
INSERT INTO `area` VALUES ('330500', '湖州市', 'Huzhou', '330000');
INSERT INTO `area` VALUES ('330502', '吴兴区', 'Wuxing', '330500');
INSERT INTO `area` VALUES ('330503', '南浔区', 'Nanxun', '330500');
INSERT INTO `area` VALUES ('330521', '德清县', 'Deqing', '330500');
INSERT INTO `area` VALUES ('330522', '长兴县', 'Changxing', '330500');
INSERT INTO `area` VALUES ('330523', '安吉县', 'Anji', '330500');
INSERT INTO `area` VALUES ('330600', '绍兴市', 'Shaoxing', '330000');
INSERT INTO `area` VALUES ('330602', '越城区', 'Yuecheng', '330600');
INSERT INTO `area` VALUES ('330603', '柯桥区', 'Keqiao ', '330600');
INSERT INTO `area` VALUES ('330604', '上虞区', 'Shangyu', '330600');
INSERT INTO `area` VALUES ('330624', '新昌县', 'Xinchang', '330600');
INSERT INTO `area` VALUES ('330681', '诸暨市', 'Zhuji', '330600');
INSERT INTO `area` VALUES ('330683', '嵊州市', 'Shengzhou', '330600');
INSERT INTO `area` VALUES ('330700', '金华市', 'Jinhua', '330000');
INSERT INTO `area` VALUES ('330702', '婺城区', 'Wucheng', '330700');
INSERT INTO `area` VALUES ('330703', '金东区', 'Jindong', '330700');
INSERT INTO `area` VALUES ('330723', '武义县', 'Wuyi', '330700');
INSERT INTO `area` VALUES ('330726', '浦江县', 'Pujiang', '330700');
INSERT INTO `area` VALUES ('330727', '磐安县', 'Pan\'an', '330700');
INSERT INTO `area` VALUES ('330781', '兰溪市', 'Lanxi', '330700');
INSERT INTO `area` VALUES ('330782', '义乌市', 'Yiwu', '330700');
INSERT INTO `area` VALUES ('330783', '东阳市', 'Dongyang', '330700');
INSERT INTO `area` VALUES ('330784', '永康市', 'Yongkang', '330700');
INSERT INTO `area` VALUES ('330800', '衢州市', 'Quzhou', '330000');
INSERT INTO `area` VALUES ('330802', '柯城区', 'Kecheng', '330800');
INSERT INTO `area` VALUES ('330803', '衢江区', 'Qujiang', '330800');
INSERT INTO `area` VALUES ('330822', '常山县', 'Changshan', '330800');
INSERT INTO `area` VALUES ('330824', '开化县', 'Kaihua', '330800');
INSERT INTO `area` VALUES ('330825', '龙游县', 'Longyou', '330800');
INSERT INTO `area` VALUES ('330881', '江山市', 'Jiangshan', '330800');
INSERT INTO `area` VALUES ('330900', '舟山市', 'Zhoushan', '330000');
INSERT INTO `area` VALUES ('330902', '定海区', 'Dinghai', '330900');
INSERT INTO `area` VALUES ('330903', '普陀区', 'Putuo', '330900');
INSERT INTO `area` VALUES ('330921', '岱山县', 'Daishan', '330900');
INSERT INTO `area` VALUES ('330922', '嵊泗县', 'Shengsi', '330900');
INSERT INTO `area` VALUES ('331000', '台州市', 'Taizhou', '330000');
INSERT INTO `area` VALUES ('331002', '椒江区', 'Jiaojiang', '331000');
INSERT INTO `area` VALUES ('331003', '黄岩区', 'Huangyan', '331000');
INSERT INTO `area` VALUES ('331004', '路桥区', 'Luqiao', '331000');
INSERT INTO `area` VALUES ('331021', '玉环县', 'Yuhuan', '331000');
INSERT INTO `area` VALUES ('331022', '三门县', 'Sanmen', '331000');
INSERT INTO `area` VALUES ('331023', '天台县', 'Tiantai', '331000');
INSERT INTO `area` VALUES ('331024', '仙居县', 'Xianju', '331000');
INSERT INTO `area` VALUES ('331081', '温岭市', 'Wenling', '331000');
INSERT INTO `area` VALUES ('331082', '临海市', 'Linhai', '331000');
INSERT INTO `area` VALUES ('331100', '丽水市', 'Lishui', '330000');
INSERT INTO `area` VALUES ('331102', '莲都区', 'Liandu', '331100');
INSERT INTO `area` VALUES ('331121', '青田县', 'Qingtian', '331100');
INSERT INTO `area` VALUES ('331122', '缙云县', 'Jinyun', '331100');
INSERT INTO `area` VALUES ('331123', '遂昌县', 'Suichang', '331100');
INSERT INTO `area` VALUES ('331124', '松阳县', 'Songyang', '331100');
INSERT INTO `area` VALUES ('331125', '云和县', 'Yunhe', '331100');
INSERT INTO `area` VALUES ('331126', '庆元县', 'Qingyuan', '331100');
INSERT INTO `area` VALUES ('331127', '景宁畲族自治县', 'Jingning', '331100');
INSERT INTO `area` VALUES ('331181', '龙泉市', 'Longquan', '331100');
INSERT INTO `area` VALUES ('331200', '舟山群岛新区', 'Zhoushan', '330000');
INSERT INTO `area` VALUES ('331201', '金塘岛', 'Jintang', '331200');
INSERT INTO `area` VALUES ('331202', '六横岛', 'Liuheng', '331200');
INSERT INTO `area` VALUES ('331203', '衢山岛', 'Qushan', '331200');
INSERT INTO `area` VALUES ('331204', '舟山本岛西北部', 'Zhoushan', '331200');
INSERT INTO `area` VALUES ('331205', '岱山岛西南部', 'Daishan', '331200');
INSERT INTO `area` VALUES ('331206', '泗礁岛', 'Sijiao', '331200');
INSERT INTO `area` VALUES ('331207', '朱家尖岛', 'Zhujiajian', '331200');
INSERT INTO `area` VALUES ('331208', '洋山岛', 'Yangshan', '331200');
INSERT INTO `area` VALUES ('331209', '长涂岛', 'Changtu', '331200');
INSERT INTO `area` VALUES ('331210', '虾峙岛', 'Xiazhi', '331200');
INSERT INTO `area` VALUES ('340000', '安徽省', 'Anhui', '0');
INSERT INTO `area` VALUES ('340100', '合肥市', 'Hefei', '340000');
INSERT INTO `area` VALUES ('340102', '瑶海区', 'Yaohai', '340100');
INSERT INTO `area` VALUES ('340103', '庐阳区', 'Luyang', '340100');
INSERT INTO `area` VALUES ('340104', '蜀山区', 'Shushan', '340100');
INSERT INTO `area` VALUES ('340111', '包河区', 'Baohe', '340100');
INSERT INTO `area` VALUES ('340121', '长丰县', 'Changfeng', '340100');
INSERT INTO `area` VALUES ('340122', '肥东县', 'Feidong', '340100');
INSERT INTO `area` VALUES ('340123', '肥西县', 'Feixi', '340100');
INSERT INTO `area` VALUES ('340124', '庐江县', 'Lujiang', '340100');
INSERT INTO `area` VALUES ('340181', '巢湖市', 'Chaohu', '340100');
INSERT INTO `area` VALUES ('340200', '芜湖市', 'Wuhu', '340000');
INSERT INTO `area` VALUES ('340202', '镜湖区', 'Jinghu', '340200');
INSERT INTO `area` VALUES ('340203', '弋江区', 'Yijiang', '340200');
INSERT INTO `area` VALUES ('340207', '鸠江区', 'Jiujiang', '340200');
INSERT INTO `area` VALUES ('340208', '三山区', 'Sanshan', '340200');
INSERT INTO `area` VALUES ('340221', '芜湖县', 'Wuhu', '340200');
INSERT INTO `area` VALUES ('340222', '繁昌县', 'Fanchang', '340200');
INSERT INTO `area` VALUES ('340223', '南陵县', 'Nanling', '340200');
INSERT INTO `area` VALUES ('340225', '无为县', 'Wuwei', '340200');
INSERT INTO `area` VALUES ('340300', '蚌埠市', 'Bengbu', '340000');
INSERT INTO `area` VALUES ('340302', '龙子湖区', 'Longzihu', '340300');
INSERT INTO `area` VALUES ('340303', '蚌山区', 'Bengshan', '340300');
INSERT INTO `area` VALUES ('340304', '禹会区', 'Yuhui', '340300');
INSERT INTO `area` VALUES ('340311', '淮上区', 'Huaishang', '340300');
INSERT INTO `area` VALUES ('340321', '怀远县', 'Huaiyuan', '340300');
INSERT INTO `area` VALUES ('340322', '五河县', 'Wuhe', '340300');
INSERT INTO `area` VALUES ('340323', '固镇县', 'Guzhen', '340300');
INSERT INTO `area` VALUES ('340400', '淮南市', 'Huainan', '340000');
INSERT INTO `area` VALUES ('340402', '大通区', 'Datong', '340400');
INSERT INTO `area` VALUES ('340403', '田家庵区', 'Tianjiaan', '340400');
INSERT INTO `area` VALUES ('340404', '谢家集区', 'Xiejiaji', '340400');
INSERT INTO `area` VALUES ('340405', '八公山区', 'Bagongshan', '340400');
INSERT INTO `area` VALUES ('340406', '潘集区', 'Panji', '340400');
INSERT INTO `area` VALUES ('340421', '凤台县', 'Fengtai', '340400');
INSERT INTO `area` VALUES ('340500', '马鞍山市', 'Ma\'anshan', '340000');
INSERT INTO `area` VALUES ('340503', '花山区', 'Huashan', '340500');
INSERT INTO `area` VALUES ('340504', '雨山区', 'Yushan', '340500');
INSERT INTO `area` VALUES ('340506', '博望区', 'Bowang', '340500');
INSERT INTO `area` VALUES ('340521', '当涂县', 'Dangtu', '340500');
INSERT INTO `area` VALUES ('340522', '含山县', 'Hanshan ', '340500');
INSERT INTO `area` VALUES ('340523', '和县', 'Hexian', '340500');
INSERT INTO `area` VALUES ('340600', '淮北市', 'Huaibei', '340000');
INSERT INTO `area` VALUES ('340602', '杜集区', 'Duji', '340600');
INSERT INTO `area` VALUES ('340603', '相山区', 'Xiangshan', '340600');
INSERT INTO `area` VALUES ('340604', '烈山区', 'Lieshan', '340600');
INSERT INTO `area` VALUES ('340621', '濉溪县', 'Suixi', '340600');
INSERT INTO `area` VALUES ('340700', '铜陵市', 'Tongling', '340000');
INSERT INTO `area` VALUES ('340702', '铜官山区', 'Tongguanshan', '340700');
INSERT INTO `area` VALUES ('340703', '狮子山区', 'Shizishan', '340700');
INSERT INTO `area` VALUES ('340711', '郊区', 'Jiaoqu', '340700');
INSERT INTO `area` VALUES ('340721', '铜陵县', 'Tongling', '340700');
INSERT INTO `area` VALUES ('340800', '安庆市', 'Anqing', '340000');
INSERT INTO `area` VALUES ('340802', '迎江区', 'Yingjiang', '340800');
INSERT INTO `area` VALUES ('340803', '大观区', 'Daguan', '340800');
INSERT INTO `area` VALUES ('340811', '宜秀区', 'Yixiu', '340800');
INSERT INTO `area` VALUES ('340822', '怀宁县', 'Huaining', '340800');
INSERT INTO `area` VALUES ('340823', '枞阳县', 'Zongyang', '340800');
INSERT INTO `area` VALUES ('340824', '潜山县', 'Qianshan', '340800');
INSERT INTO `area` VALUES ('340825', '太湖县', 'Taihu', '340800');
INSERT INTO `area` VALUES ('340826', '宿松县', 'Susong', '340800');
INSERT INTO `area` VALUES ('340827', '望江县', 'Wangjiang', '340800');
INSERT INTO `area` VALUES ('340828', '岳西县', 'Yuexi', '340800');
INSERT INTO `area` VALUES ('340881', '桐城市', 'Tongcheng', '340800');
INSERT INTO `area` VALUES ('341000', '黄山市', 'Huangshan', '340000');
INSERT INTO `area` VALUES ('341002', '屯溪区', 'Tunxi', '341000');
INSERT INTO `area` VALUES ('341003', '黄山区', 'Huangshan', '341000');
INSERT INTO `area` VALUES ('341004', '徽州区', 'Huizhou', '341000');
INSERT INTO `area` VALUES ('341021', '歙县', 'Shexian', '341000');
INSERT INTO `area` VALUES ('341022', '休宁县', 'Xiuning', '341000');
INSERT INTO `area` VALUES ('341023', '黟县', 'Yixian', '341000');
INSERT INTO `area` VALUES ('341024', '祁门县', 'Qimen', '341000');
INSERT INTO `area` VALUES ('341100', '滁州市', 'Chuzhou', '340000');
INSERT INTO `area` VALUES ('341102', '琅琊区', 'Langya', '341100');
INSERT INTO `area` VALUES ('341103', '南谯区', 'Nanqiao', '341100');
INSERT INTO `area` VALUES ('341122', '来安县', 'Lai\'an', '341100');
INSERT INTO `area` VALUES ('341124', '全椒县', 'Quanjiao', '341100');
INSERT INTO `area` VALUES ('341125', '定远县', 'Dingyuan', '341100');
INSERT INTO `area` VALUES ('341126', '凤阳县', 'Fengyang', '341100');
INSERT INTO `area` VALUES ('341181', '天长市', 'Tianchang', '341100');
INSERT INTO `area` VALUES ('341182', '明光市', 'Mingguang', '341100');
INSERT INTO `area` VALUES ('341200', '阜阳市', 'Fuyang', '340000');
INSERT INTO `area` VALUES ('341202', '颍州区', 'Yingzhou', '341200');
INSERT INTO `area` VALUES ('341203', '颍东区', 'Yingdong', '341200');
INSERT INTO `area` VALUES ('341204', '颍泉区', 'Yingquan', '341200');
INSERT INTO `area` VALUES ('341221', '临泉县', 'Linquan', '341200');
INSERT INTO `area` VALUES ('341222', '太和县', 'Taihe', '341200');
INSERT INTO `area` VALUES ('341225', '阜南县', 'Funan', '341200');
INSERT INTO `area` VALUES ('341226', '颍上县', 'Yingshang', '341200');
INSERT INTO `area` VALUES ('341282', '界首市', 'Jieshou', '341200');
INSERT INTO `area` VALUES ('341300', '宿州市', 'Suzhou', '340000');
INSERT INTO `area` VALUES ('341302', '埇桥区', 'Yongqiao', '341300');
INSERT INTO `area` VALUES ('341321', '砀山县', 'Dangshan', '341300');
INSERT INTO `area` VALUES ('341322', '萧县', 'Xiaoxian', '341300');
INSERT INTO `area` VALUES ('341323', '灵璧县', 'Lingbi', '341300');
INSERT INTO `area` VALUES ('341324', '泗县', 'Sixian', '341300');
INSERT INTO `area` VALUES ('341500', '六安市', 'Lu\'an', '340000');
INSERT INTO `area` VALUES ('341502', '金安区', 'Jin\'an', '341500');
INSERT INTO `area` VALUES ('341503', '裕安区', 'Yu\'an', '341500');
INSERT INTO `area` VALUES ('341521', '寿县', 'Shouxian', '341500');
INSERT INTO `area` VALUES ('341522', '霍邱县', 'Huoqiu', '341500');
INSERT INTO `area` VALUES ('341523', '舒城县', 'Shucheng', '341500');
INSERT INTO `area` VALUES ('341524', '金寨县', 'Jinzhai', '341500');
INSERT INTO `area` VALUES ('341525', '霍山县', 'Huoshan', '341500');
INSERT INTO `area` VALUES ('341600', '亳州市', 'Bozhou', '340000');
INSERT INTO `area` VALUES ('341602', '谯城区', 'Qiaocheng', '341600');
INSERT INTO `area` VALUES ('341621', '涡阳县', 'Guoyang', '341600');
INSERT INTO `area` VALUES ('341622', '蒙城县', 'Mengcheng', '341600');
INSERT INTO `area` VALUES ('341623', '利辛县', 'Lixin', '341600');
INSERT INTO `area` VALUES ('341700', '池州市', 'Chizhou', '340000');
INSERT INTO `area` VALUES ('341702', '贵池区', 'Guichi', '341700');
INSERT INTO `area` VALUES ('341721', '东至县', 'Dongzhi', '341700');
INSERT INTO `area` VALUES ('341722', '石台县', 'Shitai', '341700');
INSERT INTO `area` VALUES ('341723', '青阳县', 'Qingyang', '341700');
INSERT INTO `area` VALUES ('341800', '宣城市', 'Xuancheng', '340000');
INSERT INTO `area` VALUES ('341802', '宣州区', 'Xuanzhou', '341800');
INSERT INTO `area` VALUES ('341821', '郎溪县', 'Langxi', '341800');
INSERT INTO `area` VALUES ('341822', '广德县', 'Guangde', '341800');
INSERT INTO `area` VALUES ('341823', '泾县', 'Jingxian', '341800');
INSERT INTO `area` VALUES ('341824', '绩溪县', 'Jixi', '341800');
INSERT INTO `area` VALUES ('341825', '旌德县', 'Jingde', '341800');
INSERT INTO `area` VALUES ('341881', '宁国市', 'Ningguo', '341800');
INSERT INTO `area` VALUES ('350000', '福建省', 'Fujian', '0');
INSERT INTO `area` VALUES ('350100', '福州市', 'Fuzhou', '350000');
INSERT INTO `area` VALUES ('350102', '鼓楼区', 'Gulou', '350100');
INSERT INTO `area` VALUES ('350103', '台江区', 'Taijiang', '350100');
INSERT INTO `area` VALUES ('350104', '仓山区', 'Cangshan', '350100');
INSERT INTO `area` VALUES ('350105', '马尾区', 'Mawei', '350100');
INSERT INTO `area` VALUES ('350111', '晋安区', 'Jin\'an', '350100');
INSERT INTO `area` VALUES ('350121', '闽侯县', 'Minhou', '350100');
INSERT INTO `area` VALUES ('350122', '连江县', 'Lianjiang', '350100');
INSERT INTO `area` VALUES ('350123', '罗源县', 'Luoyuan', '350100');
INSERT INTO `area` VALUES ('350124', '闽清县', 'Minqing', '350100');
INSERT INTO `area` VALUES ('350125', '永泰县', 'Yongtai', '350100');
INSERT INTO `area` VALUES ('350128', '平潭县', 'Pingtan', '350100');
INSERT INTO `area` VALUES ('350181', '福清市', 'Fuqing', '350100');
INSERT INTO `area` VALUES ('350182', '长乐市', 'Changle', '350100');
INSERT INTO `area` VALUES ('350200', '厦门市', 'Xiamen', '350000');
INSERT INTO `area` VALUES ('350203', '思明区', 'Siming', '350200');
INSERT INTO `area` VALUES ('350205', '海沧区', 'Haicang', '350200');
INSERT INTO `area` VALUES ('350206', '湖里区', 'Huli', '350200');
INSERT INTO `area` VALUES ('350211', '集美区', 'Jimei', '350200');
INSERT INTO `area` VALUES ('350212', '同安区', 'Tong\'an', '350200');
INSERT INTO `area` VALUES ('350213', '翔安区', 'Xiang\'an', '350200');
INSERT INTO `area` VALUES ('350300', '莆田市', 'Putian', '350000');
INSERT INTO `area` VALUES ('350302', '城厢区', 'Chengxiang', '350300');
INSERT INTO `area` VALUES ('350303', '涵江区', 'Hanjiang', '350300');
INSERT INTO `area` VALUES ('350304', '荔城区', 'Licheng', '350300');
INSERT INTO `area` VALUES ('350305', '秀屿区', 'Xiuyu', '350300');
INSERT INTO `area` VALUES ('350322', '仙游县', 'Xianyou', '350300');
INSERT INTO `area` VALUES ('350400', '三明市', 'Sanming', '350000');
INSERT INTO `area` VALUES ('350402', '梅列区', 'Meilie', '350400');
INSERT INTO `area` VALUES ('350403', '三元区', 'Sanyuan', '350400');
INSERT INTO `area` VALUES ('350421', '明溪县', 'Mingxi', '350400');
INSERT INTO `area` VALUES ('350423', '清流县', 'Qingliu', '350400');
INSERT INTO `area` VALUES ('350424', '宁化县', 'Ninghua', '350400');
INSERT INTO `area` VALUES ('350425', '大田县', 'Datian', '350400');
INSERT INTO `area` VALUES ('350426', '尤溪县', 'Youxi', '350400');
INSERT INTO `area` VALUES ('350427', '沙县', 'Shaxian', '350400');
INSERT INTO `area` VALUES ('350428', '将乐县', 'Jiangle', '350400');
INSERT INTO `area` VALUES ('350429', '泰宁县', 'Taining', '350400');
INSERT INTO `area` VALUES ('350430', '建宁县', 'Jianning', '350400');
INSERT INTO `area` VALUES ('350481', '永安市', 'Yong\'an', '350400');
INSERT INTO `area` VALUES ('350500', '泉州市', 'Quanzhou', '350000');
INSERT INTO `area` VALUES ('350502', '鲤城区', 'Licheng', '350500');
INSERT INTO `area` VALUES ('350503', '丰泽区', 'Fengze', '350500');
INSERT INTO `area` VALUES ('350504', '洛江区', 'Luojiang', '350500');
INSERT INTO `area` VALUES ('350505', '泉港区', 'Quangang', '350500');
INSERT INTO `area` VALUES ('350521', '惠安县', 'Hui\'an', '350500');
INSERT INTO `area` VALUES ('350524', '安溪县', 'Anxi', '350500');
INSERT INTO `area` VALUES ('350525', '永春县', 'Yongchun', '350500');
INSERT INTO `area` VALUES ('350526', '德化县', 'Dehua', '350500');
INSERT INTO `area` VALUES ('350527', '金门县', 'Jinmen', '350500');
INSERT INTO `area` VALUES ('350581', '石狮市', 'Shishi', '350500');
INSERT INTO `area` VALUES ('350582', '晋江市', 'Jinjiang', '350500');
INSERT INTO `area` VALUES ('350583', '南安市', 'Nan\'an', '350500');
INSERT INTO `area` VALUES ('350600', '漳州市', 'Zhangzhou', '350000');
INSERT INTO `area` VALUES ('350602', '芗城区', 'Xiangcheng', '350600');
INSERT INTO `area` VALUES ('350603', '龙文区', 'Longwen', '350600');
INSERT INTO `area` VALUES ('350622', '云霄县', 'Yunxiao', '350600');
INSERT INTO `area` VALUES ('350623', '漳浦县', 'Zhangpu', '350600');
INSERT INTO `area` VALUES ('350624', '诏安县', 'Zhao\'an', '350600');
INSERT INTO `area` VALUES ('350625', '长泰县', 'Changtai', '350600');
INSERT INTO `area` VALUES ('350626', '东山县', 'Dongshan', '350600');
INSERT INTO `area` VALUES ('350627', '南靖县', 'Nanjing', '350600');
INSERT INTO `area` VALUES ('350628', '平和县', 'Pinghe', '350600');
INSERT INTO `area` VALUES ('350629', '华安县', 'Hua\'an', '350600');
INSERT INTO `area` VALUES ('350681', '龙海市', 'Longhai', '350600');
INSERT INTO `area` VALUES ('350700', '南平市', 'Nanping', '350000');
INSERT INTO `area` VALUES ('350702', '延平区', 'Yanping', '350700');
INSERT INTO `area` VALUES ('350703', '建阳区', 'Jianyang', '350700');
INSERT INTO `area` VALUES ('350721', '顺昌县', 'Shunchang', '350700');
INSERT INTO `area` VALUES ('350722', '浦城县', 'Pucheng', '350700');
INSERT INTO `area` VALUES ('350723', '光泽县', 'Guangze', '350700');
INSERT INTO `area` VALUES ('350724', '松溪县', 'Songxi', '350700');
INSERT INTO `area` VALUES ('350725', '政和县', 'Zhenghe', '350700');
INSERT INTO `area` VALUES ('350781', '邵武市', 'Shaowu', '350700');
INSERT INTO `area` VALUES ('350782', '武夷山市', 'Wuyishan', '350700');
INSERT INTO `area` VALUES ('350783', '建瓯市', 'Jianou', '350700');
INSERT INTO `area` VALUES ('350800', '龙岩市', 'Longyan', '350000');
INSERT INTO `area` VALUES ('350802', '新罗区', 'Xinluo', '350800');
INSERT INTO `area` VALUES ('350821', '长汀县', 'Changting', '350800');
INSERT INTO `area` VALUES ('350822', '永定区', 'Yongding', '350800');
INSERT INTO `area` VALUES ('350823', '上杭县', 'Shanghang', '350800');
INSERT INTO `area` VALUES ('350824', '武平县', 'Wuping', '350800');
INSERT INTO `area` VALUES ('350825', '连城县', 'Liancheng', '350800');
INSERT INTO `area` VALUES ('350881', '漳平市', 'Zhangping', '350800');
INSERT INTO `area` VALUES ('350900', '宁德市', 'Ningde', '350000');
INSERT INTO `area` VALUES ('350902', '蕉城区', 'Jiaocheng', '350900');
INSERT INTO `area` VALUES ('350921', '霞浦县', 'Xiapu', '350900');
INSERT INTO `area` VALUES ('350922', '古田县', 'Gutian', '350900');
INSERT INTO `area` VALUES ('350923', '屏南县', 'Pingnan', '350900');
INSERT INTO `area` VALUES ('350924', '寿宁县', 'Shouning', '350900');
INSERT INTO `area` VALUES ('350925', '周宁县', 'Zhouning', '350900');
INSERT INTO `area` VALUES ('350926', '柘荣县', 'Zherong', '350900');
INSERT INTO `area` VALUES ('350981', '福安市', 'Fu\'an', '350900');
INSERT INTO `area` VALUES ('350982', '福鼎市', 'Fuding', '350900');
INSERT INTO `area` VALUES ('360000', '江西省', 'Jiangxi', '0');
INSERT INTO `area` VALUES ('360100', '南昌市', 'Nanchang', '360000');
INSERT INTO `area` VALUES ('360102', '东湖区', 'Donghu', '360100');
INSERT INTO `area` VALUES ('360103', '西湖区', 'Xihu', '360100');
INSERT INTO `area` VALUES ('360104', '青云谱区', 'Qingyunpu', '360100');
INSERT INTO `area` VALUES ('360105', '湾里区', 'Wanli', '360100');
INSERT INTO `area` VALUES ('360111', '青山湖区', 'Qingshanhu', '360100');
INSERT INTO `area` VALUES ('360121', '南昌县', 'Nanchang', '360100');
INSERT INTO `area` VALUES ('360122', '新建县', 'Xinjian', '360100');
INSERT INTO `area` VALUES ('360123', '安义县', 'Anyi', '360100');
INSERT INTO `area` VALUES ('360124', '进贤县', 'Jinxian', '360100');
INSERT INTO `area` VALUES ('360200', '景德镇市', 'Jingdezhen', '360000');
INSERT INTO `area` VALUES ('360202', '昌江区', 'Changjiang', '360200');
INSERT INTO `area` VALUES ('360203', '珠山区', 'Zhushan', '360200');
INSERT INTO `area` VALUES ('360222', '浮梁县', 'Fuliang', '360200');
INSERT INTO `area` VALUES ('360281', '乐平市', 'Leping', '360200');
INSERT INTO `area` VALUES ('360300', '萍乡市', 'Pingxiang', '360000');
INSERT INTO `area` VALUES ('360302', '安源区', 'Anyuan', '360300');
INSERT INTO `area` VALUES ('360313', '湘东区', 'Xiangdong', '360300');
INSERT INTO `area` VALUES ('360321', '莲花县', 'Lianhua', '360300');
INSERT INTO `area` VALUES ('360322', '上栗县', 'Shangli', '360300');
INSERT INTO `area` VALUES ('360323', '芦溪县', 'Luxi', '360300');
INSERT INTO `area` VALUES ('360400', '九江市', 'Jiujiang', '360000');
INSERT INTO `area` VALUES ('360402', '庐山区', 'Lushan', '360400');
INSERT INTO `area` VALUES ('360403', '浔阳区', 'Xunyang', '360400');
INSERT INTO `area` VALUES ('360421', '九江县', 'Jiujiang', '360400');
INSERT INTO `area` VALUES ('360423', '武宁县', 'Wuning', '360400');
INSERT INTO `area` VALUES ('360424', '修水县', 'Xiushui', '360400');
INSERT INTO `area` VALUES ('360425', '永修县', 'Yongxiu', '360400');
INSERT INTO `area` VALUES ('360426', '德安县', 'De\'an', '360400');
INSERT INTO `area` VALUES ('360427', '星子县', 'Xingzi', '360400');
INSERT INTO `area` VALUES ('360428', '都昌县', 'Duchang', '360400');
INSERT INTO `area` VALUES ('360429', '湖口县', 'Hukou', '360400');
INSERT INTO `area` VALUES ('360430', '彭泽县', 'Pengze', '360400');
INSERT INTO `area` VALUES ('360481', '瑞昌市', 'Ruichang', '360400');
INSERT INTO `area` VALUES ('360482', '共青城市', 'Gongqingcheng', '360400');
INSERT INTO `area` VALUES ('360500', '新余市', 'Xinyu', '360000');
INSERT INTO `area` VALUES ('360502', '渝水区', 'Yushui', '360500');
INSERT INTO `area` VALUES ('360521', '分宜县', 'Fenyi', '360500');
INSERT INTO `area` VALUES ('360600', '鹰潭市', 'Yingtan', '360000');
INSERT INTO `area` VALUES ('360602', '月湖区', 'Yuehu', '360600');
INSERT INTO `area` VALUES ('360622', '余江县', 'Yujiang', '360600');
INSERT INTO `area` VALUES ('360681', '贵溪市', 'Guixi', '360600');
INSERT INTO `area` VALUES ('360700', '赣州市', 'Ganzhou', '360000');
INSERT INTO `area` VALUES ('360702', '章贡区', 'Zhanggong', '360700');
INSERT INTO `area` VALUES ('360703', '南康区', 'Nankang', '360700');
INSERT INTO `area` VALUES ('360721', '赣县', 'Ganxian', '360700');
INSERT INTO `area` VALUES ('360722', '信丰县', 'Xinfeng', '360700');
INSERT INTO `area` VALUES ('360723', '大余县', 'Dayu', '360700');
INSERT INTO `area` VALUES ('360724', '上犹县', 'Shangyou', '360700');
INSERT INTO `area` VALUES ('360725', '崇义县', 'Chongyi', '360700');
INSERT INTO `area` VALUES ('360726', '安远县', 'Anyuan', '360700');
INSERT INTO `area` VALUES ('360727', '龙南县', 'Longnan', '360700');
INSERT INTO `area` VALUES ('360728', '定南县', 'Dingnan', '360700');
INSERT INTO `area` VALUES ('360729', '全南县', 'Quannan', '360700');
INSERT INTO `area` VALUES ('360730', '宁都县', 'Ningdu', '360700');
INSERT INTO `area` VALUES ('360731', '于都县', 'Yudu', '360700');
INSERT INTO `area` VALUES ('360732', '兴国县', 'Xingguo', '360700');
INSERT INTO `area` VALUES ('360733', '会昌县', 'Huichang', '360700');
INSERT INTO `area` VALUES ('360734', '寻乌县', 'Xunwu', '360700');
INSERT INTO `area` VALUES ('360735', '石城县', 'Shicheng', '360700');
INSERT INTO `area` VALUES ('360781', '瑞金市', 'Ruijin', '360700');
INSERT INTO `area` VALUES ('360800', '吉安市', 'Ji\'an', '360000');
INSERT INTO `area` VALUES ('360802', '吉州区', 'Jizhou', '360800');
INSERT INTO `area` VALUES ('360803', '青原区', 'Qingyuan', '360800');
INSERT INTO `area` VALUES ('360821', '吉安县', 'Ji\'an', '360800');
INSERT INTO `area` VALUES ('360822', '吉水县', 'Jishui', '360800');
INSERT INTO `area` VALUES ('360823', '峡江县', 'Xiajiang', '360800');
INSERT INTO `area` VALUES ('360824', '新干县', 'Xingan', '360800');
INSERT INTO `area` VALUES ('360825', '永丰县', 'Yongfeng', '360800');
INSERT INTO `area` VALUES ('360826', '泰和县', 'Taihe', '360800');
INSERT INTO `area` VALUES ('360827', '遂川县', 'Suichuan', '360800');
INSERT INTO `area` VALUES ('360828', '万安县', 'Wan\'an', '360800');
INSERT INTO `area` VALUES ('360829', '安福县', 'Anfu', '360800');
INSERT INTO `area` VALUES ('360830', '永新县', 'Yongxin', '360800');
INSERT INTO `area` VALUES ('360881', '井冈山市', 'Jinggangshan', '360800');
INSERT INTO `area` VALUES ('360900', '宜春市', 'Yichun', '360000');
INSERT INTO `area` VALUES ('360902', '袁州区', 'Yuanzhou', '360900');
INSERT INTO `area` VALUES ('360921', '奉新县', 'Fengxin', '360900');
INSERT INTO `area` VALUES ('360922', '万载县', 'Wanzai', '360900');
INSERT INTO `area` VALUES ('360923', '上高县', 'Shanggao', '360900');
INSERT INTO `area` VALUES ('360924', '宜丰县', 'Yifeng', '360900');
INSERT INTO `area` VALUES ('360925', '靖安县', 'Jing\'an', '360900');
INSERT INTO `area` VALUES ('360926', '铜鼓县', 'Tonggu', '360900');
INSERT INTO `area` VALUES ('360981', '丰城市', 'Fengcheng', '360900');
INSERT INTO `area` VALUES ('360982', '樟树市', 'Zhangshu', '360900');
INSERT INTO `area` VALUES ('360983', '高安市', 'Gao\'an', '360900');
INSERT INTO `area` VALUES ('361000', '抚州市', 'Fuzhou', '360000');
INSERT INTO `area` VALUES ('361002', '临川区', 'Linchuan', '361000');
INSERT INTO `area` VALUES ('361021', '南城县', 'Nancheng', '361000');
INSERT INTO `area` VALUES ('361022', '黎川县', 'Lichuan', '361000');
INSERT INTO `area` VALUES ('361023', '南丰县', 'Nanfeng', '361000');
INSERT INTO `area` VALUES ('361024', '崇仁县', 'Chongren', '361000');
INSERT INTO `area` VALUES ('361025', '乐安县', 'Le\'an', '361000');
INSERT INTO `area` VALUES ('361026', '宜黄县', 'Yihuang', '361000');
INSERT INTO `area` VALUES ('361027', '金溪县', 'Jinxi', '361000');
INSERT INTO `area` VALUES ('361028', '资溪县', 'Zixi', '361000');
INSERT INTO `area` VALUES ('361029', '东乡县', 'Dongxiang', '361000');
INSERT INTO `area` VALUES ('361030', '广昌县', 'Guangchang', '361000');
INSERT INTO `area` VALUES ('361100', '上饶市', 'Shangrao', '360000');
INSERT INTO `area` VALUES ('361102', '信州区', 'Xinzhou', '361100');
INSERT INTO `area` VALUES ('361121', '上饶县', 'Shangrao', '361100');
INSERT INTO `area` VALUES ('361122', '广丰县', 'Guangfeng', '361100');
INSERT INTO `area` VALUES ('361123', '玉山县', 'Yushan', '361100');
INSERT INTO `area` VALUES ('361124', '铅山县', 'Yanshan', '361100');
INSERT INTO `area` VALUES ('361125', '横峰县', 'Hengfeng', '361100');
INSERT INTO `area` VALUES ('361126', '弋阳县', 'Yiyang', '361100');
INSERT INTO `area` VALUES ('361127', '余干县', 'Yugan', '361100');
INSERT INTO `area` VALUES ('361128', '鄱阳县', 'Poyang', '361100');
INSERT INTO `area` VALUES ('361129', '万年县', 'Wannian', '361100');
INSERT INTO `area` VALUES ('361130', '婺源县', 'Wuyuan', '361100');
INSERT INTO `area` VALUES ('361181', '德兴市', 'Dexing', '361100');
INSERT INTO `area` VALUES ('370000', '山东省', 'Shandong', '0');
INSERT INTO `area` VALUES ('370100', '济南市', 'Jinan', '370000');
INSERT INTO `area` VALUES ('370102', '历下区', 'Lixia', '370100');
INSERT INTO `area` VALUES ('370103', '市中区', 'Shizhongqu', '370100');
INSERT INTO `area` VALUES ('370104', '槐荫区', 'Huaiyin', '370100');
INSERT INTO `area` VALUES ('370105', '天桥区', 'Tianqiao', '370100');
INSERT INTO `area` VALUES ('370112', '历城区', 'Licheng', '370100');
INSERT INTO `area` VALUES ('370113', '长清区', 'Changqing', '370100');
INSERT INTO `area` VALUES ('370124', '平阴县', 'Pingyin', '370100');
INSERT INTO `area` VALUES ('370125', '济阳县', 'Jiyang', '370100');
INSERT INTO `area` VALUES ('370126', '商河县', 'Shanghe', '370100');
INSERT INTO `area` VALUES ('370181', '章丘市', 'Zhangqiu', '370100');
INSERT INTO `area` VALUES ('370200', '青岛市', 'Qingdao', '370000');
INSERT INTO `area` VALUES ('370202', '市南区', 'Shinan', '370200');
INSERT INTO `area` VALUES ('370203', '市北区', 'Shibei', '370200');
INSERT INTO `area` VALUES ('370211', '黄岛区', 'Huangdao', '370200');
INSERT INTO `area` VALUES ('370212', '崂山区', 'Laoshan', '370200');
INSERT INTO `area` VALUES ('370213', '李沧区', 'Licang', '370200');
INSERT INTO `area` VALUES ('370214', '城阳区', 'Chengyang', '370200');
INSERT INTO `area` VALUES ('370281', '胶州市', 'Jiaozhou', '370200');
INSERT INTO `area` VALUES ('370282', '即墨市', 'Jimo', '370200');
INSERT INTO `area` VALUES ('370283', '平度市', 'Pingdu', '370200');
INSERT INTO `area` VALUES ('370285', '莱西市', 'Laixi', '370200');
INSERT INTO `area` VALUES ('370286', '西海岸新区', 'Xihai\'an', '370200');
INSERT INTO `area` VALUES ('370300', '淄博市', 'Zibo', '370000');
INSERT INTO `area` VALUES ('370302', '淄川区', 'Zichuan', '370300');
INSERT INTO `area` VALUES ('370303', '张店区', 'Zhangdian', '370300');
INSERT INTO `area` VALUES ('370304', '博山区', 'Boshan', '370300');
INSERT INTO `area` VALUES ('370305', '临淄区', 'Linzi', '370300');
INSERT INTO `area` VALUES ('370306', '周村区', 'Zhoucun', '370300');
INSERT INTO `area` VALUES ('370321', '桓台县', 'Huantai', '370300');
INSERT INTO `area` VALUES ('370322', '高青县', 'Gaoqing', '370300');
INSERT INTO `area` VALUES ('370323', '沂源县', 'Yiyuan', '370300');
INSERT INTO `area` VALUES ('370400', '枣庄市', 'Zaozhuang', '370000');
INSERT INTO `area` VALUES ('370402', '市中区', 'Shizhongqu', '370400');
INSERT INTO `area` VALUES ('370403', '薛城区', 'Xuecheng', '370400');
INSERT INTO `area` VALUES ('370404', '峄城区', 'Yicheng', '370400');
INSERT INTO `area` VALUES ('370405', '台儿庄区', 'Taierzhuang', '370400');
INSERT INTO `area` VALUES ('370406', '山亭区', 'Shanting', '370400');
INSERT INTO `area` VALUES ('370481', '滕州市', 'Tengzhou', '370400');
INSERT INTO `area` VALUES ('370500', '东营市', 'Dongying', '370000');
INSERT INTO `area` VALUES ('370502', '东营区', 'Dongying', '370500');
INSERT INTO `area` VALUES ('370503', '河口区', 'Hekou', '370500');
INSERT INTO `area` VALUES ('370521', '垦利县', 'Kenli', '370500');
INSERT INTO `area` VALUES ('370522', '利津县', 'Lijin', '370500');
INSERT INTO `area` VALUES ('370523', '广饶县', 'Guangrao', '370500');
INSERT INTO `area` VALUES ('370600', '烟台市', 'Yantai', '370000');
INSERT INTO `area` VALUES ('370602', '芝罘区', 'Zhifu', '370600');
INSERT INTO `area` VALUES ('370611', '福山区', 'Fushan', '370600');
INSERT INTO `area` VALUES ('370612', '牟平区', 'Muping', '370600');
INSERT INTO `area` VALUES ('370613', '莱山区', 'Laishan', '370600');
INSERT INTO `area` VALUES ('370634', '长岛县', 'Changdao', '370600');
INSERT INTO `area` VALUES ('370681', '龙口市', 'Longkou', '370600');
INSERT INTO `area` VALUES ('370682', '莱阳市', 'Laiyang', '370600');
INSERT INTO `area` VALUES ('370683', '莱州市', 'Laizhou', '370600');
INSERT INTO `area` VALUES ('370684', '蓬莱市', 'Penglai', '370600');
INSERT INTO `area` VALUES ('370685', '招远市', 'Zhaoyuan', '370600');
INSERT INTO `area` VALUES ('370686', '栖霞市', 'Qixia', '370600');
INSERT INTO `area` VALUES ('370687', '海阳市', 'Haiyang', '370600');
INSERT INTO `area` VALUES ('370700', '潍坊市', 'Weifang', '370000');
INSERT INTO `area` VALUES ('370702', '潍城区', 'Weicheng', '370700');
INSERT INTO `area` VALUES ('370703', '寒亭区', 'Hanting', '370700');
INSERT INTO `area` VALUES ('370704', '坊子区', 'Fangzi', '370700');
INSERT INTO `area` VALUES ('370705', '奎文区', 'Kuiwen', '370700');
INSERT INTO `area` VALUES ('370724', '临朐县', 'Linqu', '370700');
INSERT INTO `area` VALUES ('370725', '昌乐县', 'Changle', '370700');
INSERT INTO `area` VALUES ('370781', '青州市', 'Qingzhou', '370700');
INSERT INTO `area` VALUES ('370782', '诸城市', 'Zhucheng', '370700');
INSERT INTO `area` VALUES ('370783', '寿光市', 'Shouguang', '370700');
INSERT INTO `area` VALUES ('370784', '安丘市', 'Anqiu', '370700');
INSERT INTO `area` VALUES ('370785', '高密市', 'Gaomi', '370700');
INSERT INTO `area` VALUES ('370786', '昌邑市', 'Changyi', '370700');
INSERT INTO `area` VALUES ('370800', '济宁市', 'Jining', '370000');
INSERT INTO `area` VALUES ('370811', '任城区', 'Rencheng', '370800');
INSERT INTO `area` VALUES ('370812', '兖州区', 'Yanzhou ', '370800');
INSERT INTO `area` VALUES ('370826', '微山县', 'Weishan', '370800');
INSERT INTO `area` VALUES ('370827', '鱼台县', 'Yutai', '370800');
INSERT INTO `area` VALUES ('370828', '金乡县', 'Jinxiang', '370800');
INSERT INTO `area` VALUES ('370829', '嘉祥县', 'Jiaxiang', '370800');
INSERT INTO `area` VALUES ('370830', '汶上县', 'Wenshang', '370800');
INSERT INTO `area` VALUES ('370831', '泗水县', 'Sishui', '370800');
INSERT INTO `area` VALUES ('370832', '梁山县', 'Liangshan', '370800');
INSERT INTO `area` VALUES ('370881', '曲阜市', 'Qufu', '370800');
INSERT INTO `area` VALUES ('370883', '邹城市', 'Zoucheng', '370800');
INSERT INTO `area` VALUES ('370900', '泰安市', 'Tai\'an', '370000');
INSERT INTO `area` VALUES ('370902', '泰山区', 'Taishan', '370900');
INSERT INTO `area` VALUES ('370911', '岱岳区', 'Daiyue', '370900');
INSERT INTO `area` VALUES ('370921', '宁阳县', 'Ningyang', '370900');
INSERT INTO `area` VALUES ('370923', '东平县', 'Dongping', '370900');
INSERT INTO `area` VALUES ('370982', '新泰市', 'Xintai', '370900');
INSERT INTO `area` VALUES ('370983', '肥城市', 'Feicheng', '370900');
INSERT INTO `area` VALUES ('371000', '威海市', 'Weihai', '370000');
INSERT INTO `area` VALUES ('371002', '环翠区', 'Huancui', '371000');
INSERT INTO `area` VALUES ('371003', '文登区', 'Wendeng', '371000');
INSERT INTO `area` VALUES ('371082', '荣成市', 'Rongcheng', '371000');
INSERT INTO `area` VALUES ('371083', '乳山市', 'Rushan', '371000');
INSERT INTO `area` VALUES ('371100', '日照市', 'Rizhao', '370000');
INSERT INTO `area` VALUES ('371102', '东港区', 'Donggang', '371100');
INSERT INTO `area` VALUES ('371103', '岚山区', 'Lanshan', '371100');
INSERT INTO `area` VALUES ('371121', '五莲县', 'Wulian', '371100');
INSERT INTO `area` VALUES ('371122', '莒县', 'Juxian', '371100');
INSERT INTO `area` VALUES ('371200', '莱芜市', 'Laiwu', '370000');
INSERT INTO `area` VALUES ('371202', '莱城区', 'Laicheng', '371200');
INSERT INTO `area` VALUES ('371203', '钢城区', 'Gangcheng', '371200');
INSERT INTO `area` VALUES ('371300', '临沂市', 'Linyi', '370000');
INSERT INTO `area` VALUES ('371302', '兰山区', 'Lanshan', '371300');
INSERT INTO `area` VALUES ('371311', '罗庄区', 'Luozhuang', '371300');
INSERT INTO `area` VALUES ('371312', '河东区', 'Hedong', '371300');
INSERT INTO `area` VALUES ('371321', '沂南县', 'Yinan', '371300');
INSERT INTO `area` VALUES ('371322', '郯城县', 'Tancheng', '371300');
INSERT INTO `area` VALUES ('371323', '沂水县', 'Yishui', '371300');
INSERT INTO `area` VALUES ('371324', '兰陵县', 'Lanling', '371300');
INSERT INTO `area` VALUES ('371325', '费县', 'Feixian', '371300');
INSERT INTO `area` VALUES ('371326', '平邑县', 'Pingyi', '371300');
INSERT INTO `area` VALUES ('371327', '莒南县', 'Junan', '371300');
INSERT INTO `area` VALUES ('371328', '蒙阴县', 'Mengyin', '371300');
INSERT INTO `area` VALUES ('371329', '临沭县', 'Linshu', '371300');
INSERT INTO `area` VALUES ('371400', '德州市', 'Dezhou', '370000');
INSERT INTO `area` VALUES ('371402', '德城区', 'Decheng', '371400');
INSERT INTO `area` VALUES ('371403', '陵城区', 'Lingcheng', '371400');
INSERT INTO `area` VALUES ('371422', '宁津县', 'Ningjin', '371400');
INSERT INTO `area` VALUES ('371423', '庆云县', 'Qingyun', '371400');
INSERT INTO `area` VALUES ('371424', '临邑县', 'Linyi', '371400');
INSERT INTO `area` VALUES ('371425', '齐河县', 'Qihe', '371400');
INSERT INTO `area` VALUES ('371426', '平原县', 'Pingyuan', '371400');
INSERT INTO `area` VALUES ('371427', '夏津县', 'Xiajin', '371400');
INSERT INTO `area` VALUES ('371428', '武城县', 'Wucheng', '371400');
INSERT INTO `area` VALUES ('371481', '乐陵市', 'Leling', '371400');
INSERT INTO `area` VALUES ('371482', '禹城市', 'Yucheng', '371400');
INSERT INTO `area` VALUES ('371500', '聊城市', 'Liaocheng', '370000');
INSERT INTO `area` VALUES ('371502', '东昌府区', 'Dongchangfu', '371500');
INSERT INTO `area` VALUES ('371521', '阳谷县', 'Yanggu', '371500');
INSERT INTO `area` VALUES ('371522', '莘县', 'Shenxian', '371500');
INSERT INTO `area` VALUES ('371523', '茌平县', 'Chiping', '371500');
INSERT INTO `area` VALUES ('371524', '东阿县', 'Dong\'e', '371500');
INSERT INTO `area` VALUES ('371525', '冠县', 'Guanxian', '371500');
INSERT INTO `area` VALUES ('371526', '高唐县', 'Gaotang', '371500');
INSERT INTO `area` VALUES ('371581', '临清市', 'Linqing', '371500');
INSERT INTO `area` VALUES ('371600', '滨州市', 'Binzhou', '370000');
INSERT INTO `area` VALUES ('371602', '滨城区', 'Bincheng', '371600');
INSERT INTO `area` VALUES ('371603', '沾化区', 'Zhanhua', '371600');
INSERT INTO `area` VALUES ('371621', '惠民县', 'Huimin', '371600');
INSERT INTO `area` VALUES ('371622', '阳信县', 'Yangxin', '371600');
INSERT INTO `area` VALUES ('371623', '无棣县', 'Wudi', '371600');
INSERT INTO `area` VALUES ('371625', '博兴县', 'Boxing', '371600');
INSERT INTO `area` VALUES ('371626', '邹平县', 'Zouping', '371600');
INSERT INTO `area` VALUES ('371627', '北海新区', 'Beihaixinqu', '371600');
INSERT INTO `area` VALUES ('371700', '菏泽市', 'Heze', '370000');
INSERT INTO `area` VALUES ('371702', '牡丹区', 'Mudan', '371700');
INSERT INTO `area` VALUES ('371721', '曹县', 'Caoxian', '371700');
INSERT INTO `area` VALUES ('371722', '单县', 'Shanxian', '371700');
INSERT INTO `area` VALUES ('371723', '成武县', 'Chengwu', '371700');
INSERT INTO `area` VALUES ('371724', '巨野县', 'Juye', '371700');
INSERT INTO `area` VALUES ('371725', '郓城县', 'Yuncheng', '371700');
INSERT INTO `area` VALUES ('371726', '鄄城县', 'Juancheng', '371700');
INSERT INTO `area` VALUES ('371727', '定陶县', 'Dingtao', '371700');
INSERT INTO `area` VALUES ('371728', '东明县', 'Dongming', '371700');
INSERT INTO `area` VALUES ('410000', '河南省', 'Henan', '0');
INSERT INTO `area` VALUES ('410100', '郑州市', 'Zhengzhou', '410000');
INSERT INTO `area` VALUES ('410102', '中原区', 'Zhongyuan', '410100');
INSERT INTO `area` VALUES ('410103', '二七区', 'Erqi', '410100');
INSERT INTO `area` VALUES ('410104', '管城回族区', 'Guancheng', '410100');
INSERT INTO `area` VALUES ('410105', '金水区', 'Jinshui', '410100');
INSERT INTO `area` VALUES ('410106', '上街区', 'Shangjie', '410100');
INSERT INTO `area` VALUES ('410108', '惠济区', 'Huiji', '410100');
INSERT INTO `area` VALUES ('410122', '中牟县', 'Zhongmu', '410100');
INSERT INTO `area` VALUES ('410181', '巩义市', 'Gongyi', '410100');
INSERT INTO `area` VALUES ('410182', '荥阳市', 'Xingyang', '410100');
INSERT INTO `area` VALUES ('410183', '新密市', 'Xinmi', '410100');
INSERT INTO `area` VALUES ('410184', '新郑市', 'Xinzheng', '410100');
INSERT INTO `area` VALUES ('410185', '登封市', 'Dengfeng', '410100');
INSERT INTO `area` VALUES ('410200', '开封市', 'Kaifeng', '410000');
INSERT INTO `area` VALUES ('410202', '龙亭区', 'Longting', '410200');
INSERT INTO `area` VALUES ('410203', '顺河回族区', 'Shunhe', '410200');
INSERT INTO `area` VALUES ('410204', '鼓楼区', 'Gulou', '410200');
INSERT INTO `area` VALUES ('410205', '禹王台区', 'Yuwangtai', '410200');
INSERT INTO `area` VALUES ('410212', '祥符区', 'Xiangfu', '410200');
INSERT INTO `area` VALUES ('410221', '杞县', 'Qixian', '410200');
INSERT INTO `area` VALUES ('410222', '通许县', 'Tongxu', '410200');
INSERT INTO `area` VALUES ('410223', '尉氏县', 'Weishi', '410200');
INSERT INTO `area` VALUES ('410225', '兰考县', 'Lankao', '410200');
INSERT INTO `area` VALUES ('410300', '洛阳市', 'Luoyang', '410000');
INSERT INTO `area` VALUES ('410302', '老城区', 'Laocheng', '410300');
INSERT INTO `area` VALUES ('410303', '西工区', 'Xigong', '410300');
INSERT INTO `area` VALUES ('410304', '瀍河回族区', 'Chanhe', '410300');
INSERT INTO `area` VALUES ('410305', '涧西区', 'Jianxi', '410300');
INSERT INTO `area` VALUES ('410306', '吉利区', 'Jili', '410300');
INSERT INTO `area` VALUES ('410311', '洛龙区', 'Luolong', '410300');
INSERT INTO `area` VALUES ('410322', '孟津县', 'Mengjin', '410300');
INSERT INTO `area` VALUES ('410323', '新安县', 'Xin\'an', '410300');
INSERT INTO `area` VALUES ('410324', '栾川县', 'Luanchuan', '410300');
INSERT INTO `area` VALUES ('410325', '嵩县', 'Songxian', '410300');
INSERT INTO `area` VALUES ('410326', '汝阳县', 'Ruyang', '410300');
INSERT INTO `area` VALUES ('410327', '宜阳县', 'Yiyang', '410300');
INSERT INTO `area` VALUES ('410328', '洛宁县', 'Luoning', '410300');
INSERT INTO `area` VALUES ('410329', '伊川县', 'Yichuan', '410300');
INSERT INTO `area` VALUES ('410381', '偃师市', 'Yanshi', '410300');
INSERT INTO `area` VALUES ('410400', '平顶山市', 'Pingdingshan', '410000');
INSERT INTO `area` VALUES ('410402', '新华区', 'Xinhua', '410400');
INSERT INTO `area` VALUES ('410403', '卫东区', 'Weidong', '410400');
INSERT INTO `area` VALUES ('410404', '石龙区', 'Shilong', '410400');
INSERT INTO `area` VALUES ('410411', '湛河区', 'Zhanhe', '410400');
INSERT INTO `area` VALUES ('410421', '宝丰县', 'Baofeng', '410400');
INSERT INTO `area` VALUES ('410422', '叶县', 'Yexian', '410400');
INSERT INTO `area` VALUES ('410423', '鲁山县', 'Lushan', '410400');
INSERT INTO `area` VALUES ('410425', '郏县', 'Jiaxian', '410400');
INSERT INTO `area` VALUES ('410481', '舞钢市', 'Wugang', '410400');
INSERT INTO `area` VALUES ('410482', '汝州市', 'Ruzhou', '410400');
INSERT INTO `area` VALUES ('410500', '安阳市', 'Anyang', '410000');
INSERT INTO `area` VALUES ('410502', '文峰区', 'Wenfeng', '410500');
INSERT INTO `area` VALUES ('410503', '北关区', 'Beiguan', '410500');
INSERT INTO `area` VALUES ('410505', '殷都区', 'Yindu', '410500');
INSERT INTO `area` VALUES ('410506', '龙安区', 'Long\'an', '410500');
INSERT INTO `area` VALUES ('410522', '安阳县', 'Anyang', '410500');
INSERT INTO `area` VALUES ('410523', '汤阴县', 'Tangyin', '410500');
INSERT INTO `area` VALUES ('410526', '滑县', 'Huaxian', '410500');
INSERT INTO `area` VALUES ('410527', '内黄县', 'Neihuang', '410500');
INSERT INTO `area` VALUES ('410581', '林州市', 'Linzhou', '410500');
INSERT INTO `area` VALUES ('410600', '鹤壁市', 'Hebi', '410000');
INSERT INTO `area` VALUES ('410602', '鹤山区', 'Heshan', '410600');
INSERT INTO `area` VALUES ('410603', '山城区', 'Shancheng', '410600');
INSERT INTO `area` VALUES ('410611', '淇滨区', 'Qibin', '410600');
INSERT INTO `area` VALUES ('410621', '浚县', 'Xunxian', '410600');
INSERT INTO `area` VALUES ('410622', '淇县', 'Qixian', '410600');
INSERT INTO `area` VALUES ('410700', '新乡市', 'Xinxiang', '410000');
INSERT INTO `area` VALUES ('410702', '红旗区', 'Hongqi', '410700');
INSERT INTO `area` VALUES ('410703', '卫滨区', 'Weibin', '410700');
INSERT INTO `area` VALUES ('410704', '凤泉区', 'Fengquan', '410700');
INSERT INTO `area` VALUES ('410711', '牧野区', 'Muye', '410700');
INSERT INTO `area` VALUES ('410721', '新乡县', 'Xinxiang', '410700');
INSERT INTO `area` VALUES ('410724', '获嘉县', 'Huojia', '410700');
INSERT INTO `area` VALUES ('410725', '原阳县', 'Yuanyang', '410700');
INSERT INTO `area` VALUES ('410726', '延津县', 'Yanjin', '410700');
INSERT INTO `area` VALUES ('410727', '封丘县', 'Fengqiu', '410700');
INSERT INTO `area` VALUES ('410728', '长垣县', 'Changyuan', '410700');
INSERT INTO `area` VALUES ('410781', '卫辉市', 'Weihui', '410700');
INSERT INTO `area` VALUES ('410782', '辉县市', 'Huixian', '410700');
INSERT INTO `area` VALUES ('410800', '焦作市', 'Jiaozuo', '410000');
INSERT INTO `area` VALUES ('410802', '解放区', 'Jiefang', '410800');
INSERT INTO `area` VALUES ('410803', '中站区', 'Zhongzhan', '410800');
INSERT INTO `area` VALUES ('410804', '马村区', 'Macun', '410800');
INSERT INTO `area` VALUES ('410811', '山阳区', 'Shanyang', '410800');
INSERT INTO `area` VALUES ('410821', '修武县', 'Xiuwu', '410800');
INSERT INTO `area` VALUES ('410822', '博爱县', 'Boai', '410800');
INSERT INTO `area` VALUES ('410823', '武陟县', 'Wuzhi', '410800');
INSERT INTO `area` VALUES ('410825', '温县', 'Wenxian', '410800');
INSERT INTO `area` VALUES ('410882', '沁阳市', 'Qinyang', '410800');
INSERT INTO `area` VALUES ('410883', '孟州市', 'Mengzhou', '410800');
INSERT INTO `area` VALUES ('410900', '濮阳市', 'Puyang', '410000');
INSERT INTO `area` VALUES ('410902', '华龙区', 'Hualong', '410900');
INSERT INTO `area` VALUES ('410922', '清丰县', 'Qingfeng', '410900');
INSERT INTO `area` VALUES ('410923', '南乐县', 'Nanle', '410900');
INSERT INTO `area` VALUES ('410926', '范县', 'Fanxian', '410900');
INSERT INTO `area` VALUES ('410927', '台前县', 'Taiqian', '410900');
INSERT INTO `area` VALUES ('410928', '濮阳县', 'Puyang', '410900');
INSERT INTO `area` VALUES ('411000', '许昌市', 'Xuchang', '410000');
INSERT INTO `area` VALUES ('411002', '魏都区', 'Weidu', '411000');
INSERT INTO `area` VALUES ('411023', '许昌县', 'Xuchang', '411000');
INSERT INTO `area` VALUES ('411024', '鄢陵县', 'Yanling', '411000');
INSERT INTO `area` VALUES ('411025', '襄城县', 'Xiangcheng', '411000');
INSERT INTO `area` VALUES ('411081', '禹州市', 'Yuzhou', '411000');
INSERT INTO `area` VALUES ('411082', '长葛市', 'Changge', '411000');
INSERT INTO `area` VALUES ('411100', '漯河市', 'Luohe', '410000');
INSERT INTO `area` VALUES ('411102', '源汇区', 'Yuanhui', '411100');
INSERT INTO `area` VALUES ('411103', '郾城区', 'Yancheng', '411100');
INSERT INTO `area` VALUES ('411104', '召陵区', 'Zhaoling', '411100');
INSERT INTO `area` VALUES ('411121', '舞阳县', 'Wuyang', '411100');
INSERT INTO `area` VALUES ('411122', '临颍县', 'Linying', '411100');
INSERT INTO `area` VALUES ('411200', '三门峡市', 'Sanmenxia', '410000');
INSERT INTO `area` VALUES ('411202', '湖滨区', 'Hubin', '411200');
INSERT INTO `area` VALUES ('411221', '渑池县', 'Mianchi', '411200');
INSERT INTO `area` VALUES ('411222', '陕县', 'Shanxian', '411200');
INSERT INTO `area` VALUES ('411224', '卢氏县', 'Lushi', '411200');
INSERT INTO `area` VALUES ('411281', '义马市', 'Yima', '411200');
INSERT INTO `area` VALUES ('411282', '灵宝市', 'Lingbao', '411200');
INSERT INTO `area` VALUES ('411300', '南阳市', 'Nanyang', '410000');
INSERT INTO `area` VALUES ('411302', '宛城区', 'Wancheng', '411300');
INSERT INTO `area` VALUES ('411303', '卧龙区', 'Wolong', '411300');
INSERT INTO `area` VALUES ('411321', '南召县', 'Nanzhao', '411300');
INSERT INTO `area` VALUES ('411322', '方城县', 'Fangcheng', '411300');
INSERT INTO `area` VALUES ('411323', '西峡县', 'Xixia', '411300');
INSERT INTO `area` VALUES ('411324', '镇平县', 'Zhenping', '411300');
INSERT INTO `area` VALUES ('411325', '内乡县', 'Neixiang', '411300');
INSERT INTO `area` VALUES ('411326', '淅川县', 'Xichuan', '411300');
INSERT INTO `area` VALUES ('411327', '社旗县', 'Sheqi', '411300');
INSERT INTO `area` VALUES ('411328', '唐河县', 'Tanghe', '411300');
INSERT INTO `area` VALUES ('411329', '新野县', 'Xinye', '411300');
INSERT INTO `area` VALUES ('411330', '桐柏县', 'Tongbai', '411300');
INSERT INTO `area` VALUES ('411381', '邓州市', 'Dengzhou', '411300');
INSERT INTO `area` VALUES ('411400', '商丘市', 'Shangqiu', '410000');
INSERT INTO `area` VALUES ('411402', '梁园区', 'Liangyuan', '411400');
INSERT INTO `area` VALUES ('411403', '睢阳区', 'Suiyang', '411400');
INSERT INTO `area` VALUES ('411421', '民权县', 'Minquan', '411400');
INSERT INTO `area` VALUES ('411422', '睢县', 'Suixian', '411400');
INSERT INTO `area` VALUES ('411423', '宁陵县', 'Ningling', '411400');
INSERT INTO `area` VALUES ('411424', '柘城县', 'Zhecheng', '411400');
INSERT INTO `area` VALUES ('411425', '虞城县', 'Yucheng', '411400');
INSERT INTO `area` VALUES ('411426', '夏邑县', 'Xiayi', '411400');
INSERT INTO `area` VALUES ('411481', '永城市', 'Yongcheng', '411400');
INSERT INTO `area` VALUES ('411500', '信阳市', 'Xinyang', '410000');
INSERT INTO `area` VALUES ('411502', '浉河区', 'Shihe', '411500');
INSERT INTO `area` VALUES ('411503', '平桥区', 'Pingqiao', '411500');
INSERT INTO `area` VALUES ('411521', '罗山县', 'Luoshan', '411500');
INSERT INTO `area` VALUES ('411522', '光山县', 'Guangshan', '411500');
INSERT INTO `area` VALUES ('411523', '新县', 'Xinxian', '411500');
INSERT INTO `area` VALUES ('411524', '商城县', 'Shangcheng', '411500');
INSERT INTO `area` VALUES ('411525', '固始县', 'Gushi', '411500');
INSERT INTO `area` VALUES ('411526', '潢川县', 'Huangchuan', '411500');
INSERT INTO `area` VALUES ('411527', '淮滨县', 'Huaibin', '411500');
INSERT INTO `area` VALUES ('411528', '息县', 'Xixian', '411500');
INSERT INTO `area` VALUES ('411600', '周口市', 'Zhoukou', '410000');
INSERT INTO `area` VALUES ('411602', '川汇区', 'Chuanhui', '411600');
INSERT INTO `area` VALUES ('411621', '扶沟县', 'Fugou', '411600');
INSERT INTO `area` VALUES ('411622', '西华县', 'Xihua', '411600');
INSERT INTO `area` VALUES ('411623', '商水县', 'Shangshui', '411600');
INSERT INTO `area` VALUES ('411624', '沈丘县', 'Shenqiu', '411600');
INSERT INTO `area` VALUES ('411625', '郸城县', 'Dancheng', '411600');
INSERT INTO `area` VALUES ('411626', '淮阳县', 'Huaiyang', '411600');
INSERT INTO `area` VALUES ('411627', '太康县', 'Taikang', '411600');
INSERT INTO `area` VALUES ('411628', '鹿邑县', 'Luyi', '411600');
INSERT INTO `area` VALUES ('411681', '项城市', 'Xiangcheng', '411600');
INSERT INTO `area` VALUES ('411700', '驻马店市', 'Zhumadian', '410000');
INSERT INTO `area` VALUES ('411702', '驿城区', 'Yicheng', '411700');
INSERT INTO `area` VALUES ('411721', '西平县', 'Xiping', '411700');
INSERT INTO `area` VALUES ('411722', '上蔡县', 'Shangcai', '411700');
INSERT INTO `area` VALUES ('411723', '平舆县', 'Pingyu', '411700');
INSERT INTO `area` VALUES ('411724', '正阳县', 'Zhengyang', '411700');
INSERT INTO `area` VALUES ('411725', '确山县', 'Queshan', '411700');
INSERT INTO `area` VALUES ('411726', '泌阳县', 'Biyang', '411700');
INSERT INTO `area` VALUES ('411727', '汝南县', 'Runan', '411700');
INSERT INTO `area` VALUES ('411728', '遂平县', 'Suiping', '411700');
INSERT INTO `area` VALUES ('411729', '新蔡县', 'Xincai', '411700');
INSERT INTO `area` VALUES ('419000', '直辖县级', '', '410000');
INSERT INTO `area` VALUES ('419001', '济源市', 'Jiyuan', '419000');
INSERT INTO `area` VALUES ('420000', '湖北省', 'Hubei', '0');
INSERT INTO `area` VALUES ('420100', '武汉市', 'Wuhan', '420000');
INSERT INTO `area` VALUES ('420102', '江岸区', 'Jiang\'an', '420100');
INSERT INTO `area` VALUES ('420103', '江汉区', 'Jianghan', '420100');
INSERT INTO `area` VALUES ('420104', '硚口区', 'Qiaokou', '420100');
INSERT INTO `area` VALUES ('420105', '汉阳区', 'Hanyang', '420100');
INSERT INTO `area` VALUES ('420106', '武昌区', 'Wuchang', '420100');
INSERT INTO `area` VALUES ('420107', '青山区', 'Qingshan', '420100');
INSERT INTO `area` VALUES ('420111', '洪山区', 'Hongshan', '420100');
INSERT INTO `area` VALUES ('420112', '东西湖区', 'Dongxihu', '420100');
INSERT INTO `area` VALUES ('420113', '汉南区', 'Hannan', '420100');
INSERT INTO `area` VALUES ('420114', '蔡甸区', 'Caidian', '420100');
INSERT INTO `area` VALUES ('420115', '江夏区', 'Jiangxia', '420100');
INSERT INTO `area` VALUES ('420116', '黄陂区', 'Huangpi', '420100');
INSERT INTO `area` VALUES ('420117', '新洲区', 'Xinzhou', '420100');
INSERT INTO `area` VALUES ('420200', '黄石市', 'Huangshi', '420000');
INSERT INTO `area` VALUES ('420202', '黄石港区', 'Huangshigang', '420200');
INSERT INTO `area` VALUES ('420203', '西塞山区', 'Xisaishan', '420200');
INSERT INTO `area` VALUES ('420204', '下陆区', 'Xialu', '420200');
INSERT INTO `area` VALUES ('420205', '铁山区', 'Tieshan', '420200');
INSERT INTO `area` VALUES ('420222', '阳新县', 'Yangxin', '420200');
INSERT INTO `area` VALUES ('420281', '大冶市', 'Daye', '420200');
INSERT INTO `area` VALUES ('420300', '十堰市', 'Shiyan', '420000');
INSERT INTO `area` VALUES ('420302', '茅箭区', 'Maojian', '420300');
INSERT INTO `area` VALUES ('420303', '张湾区', 'Zhangwan', '420300');
INSERT INTO `area` VALUES ('420304', '郧阳区', 'Yunyang', '420300');
INSERT INTO `area` VALUES ('420322', '郧西县', 'Yunxi', '420300');
INSERT INTO `area` VALUES ('420323', '竹山县', 'Zhushan', '420300');
INSERT INTO `area` VALUES ('420324', '竹溪县', 'Zhuxi', '420300');
INSERT INTO `area` VALUES ('420325', '房县', 'Fangxian', '420300');
INSERT INTO `area` VALUES ('420381', '丹江口市', 'Danjiangkou', '420300');
INSERT INTO `area` VALUES ('420500', '宜昌市', 'Yichang', '420000');
INSERT INTO `area` VALUES ('420502', '西陵区', 'Xiling', '420500');
INSERT INTO `area` VALUES ('420503', '伍家岗区', 'Wujiagang', '420500');
INSERT INTO `area` VALUES ('420504', '点军区', 'Dianjun', '420500');
INSERT INTO `area` VALUES ('420505', '猇亭区', 'Xiaoting', '420500');
INSERT INTO `area` VALUES ('420506', '夷陵区', 'Yiling', '420500');
INSERT INTO `area` VALUES ('420525', '远安县', 'Yuan\'an', '420500');
INSERT INTO `area` VALUES ('420526', '兴山县', 'Xingshan', '420500');
INSERT INTO `area` VALUES ('420527', '秭归县', 'Zigui', '420500');
INSERT INTO `area` VALUES ('420528', '长阳土家族自治县', 'Changyang', '420500');
INSERT INTO `area` VALUES ('420529', '五峰土家族自治县', 'Wufeng', '420500');
INSERT INTO `area` VALUES ('420581', '宜都市', 'Yidu', '420500');
INSERT INTO `area` VALUES ('420582', '当阳市', 'Dangyang', '420500');
INSERT INTO `area` VALUES ('420583', '枝江市', 'Zhijiang', '420500');
INSERT INTO `area` VALUES ('420600', '襄阳市', 'Xiangyang', '420000');
INSERT INTO `area` VALUES ('420602', '襄城区', 'Xiangcheng', '420600');
INSERT INTO `area` VALUES ('420606', '樊城区', 'Fancheng', '420600');
INSERT INTO `area` VALUES ('420607', '襄州区', 'Xiangzhou', '420600');
INSERT INTO `area` VALUES ('420624', '南漳县', 'Nanzhang', '420600');
INSERT INTO `area` VALUES ('420625', '谷城县', 'Gucheng', '420600');
INSERT INTO `area` VALUES ('420626', '保康县', 'Baokang', '420600');
INSERT INTO `area` VALUES ('420682', '老河口市', 'Laohekou', '420600');
INSERT INTO `area` VALUES ('420683', '枣阳市', 'Zaoyang', '420600');
INSERT INTO `area` VALUES ('420684', '宜城市', 'Yicheng', '420600');
INSERT INTO `area` VALUES ('420700', '鄂州市', 'Ezhou', '420000');
INSERT INTO `area` VALUES ('420702', '梁子湖区', 'Liangzihu', '420700');
INSERT INTO `area` VALUES ('420703', '华容区', 'Huarong', '420700');
INSERT INTO `area` VALUES ('420704', '鄂城区', 'Echeng', '420700');
INSERT INTO `area` VALUES ('420800', '荆门市', 'Jingmen', '420000');
INSERT INTO `area` VALUES ('420802', '东宝区', 'Dongbao', '420800');
INSERT INTO `area` VALUES ('420804', '掇刀区', 'Duodao', '420800');
INSERT INTO `area` VALUES ('420821', '京山县', 'Jingshan', '420800');
INSERT INTO `area` VALUES ('420822', '沙洋县', 'Shayang', '420800');
INSERT INTO `area` VALUES ('420881', '钟祥市', 'Zhongxiang', '420800');
INSERT INTO `area` VALUES ('420900', '孝感市', 'Xiaogan', '420000');
INSERT INTO `area` VALUES ('420902', '孝南区', 'Xiaonan', '420900');
INSERT INTO `area` VALUES ('420921', '孝昌县', 'Xiaochang', '420900');
INSERT INTO `area` VALUES ('420922', '大悟县', 'Dawu', '420900');
INSERT INTO `area` VALUES ('420923', '云梦县', 'Yunmeng', '420900');
INSERT INTO `area` VALUES ('420981', '应城市', 'Yingcheng', '420900');
INSERT INTO `area` VALUES ('420982', '安陆市', 'Anlu', '420900');
INSERT INTO `area` VALUES ('420984', '汉川市', 'Hanchuan', '420900');
INSERT INTO `area` VALUES ('421000', '荆州市', 'Jingzhou', '420000');
INSERT INTO `area` VALUES ('421002', '沙市区', 'Shashi', '421000');
INSERT INTO `area` VALUES ('421003', '荆州区', 'Jingzhou', '421000');
INSERT INTO `area` VALUES ('421022', '公安县', 'Gong\'an', '421000');
INSERT INTO `area` VALUES ('421023', '监利县', 'Jianli', '421000');
INSERT INTO `area` VALUES ('421024', '江陵县', 'Jiangling', '421000');
INSERT INTO `area` VALUES ('421081', '石首市', 'Shishou', '421000');
INSERT INTO `area` VALUES ('421083', '洪湖市', 'Honghu', '421000');
INSERT INTO `area` VALUES ('421087', '松滋市', 'Songzi', '421000');
INSERT INTO `area` VALUES ('421100', '黄冈市', 'Huanggang', '420000');
INSERT INTO `area` VALUES ('421102', '黄州区', 'Huangzhou', '421100');
INSERT INTO `area` VALUES ('421121', '团风县', 'Tuanfeng', '421100');
INSERT INTO `area` VALUES ('421122', '红安县', 'Hong\'an', '421100');
INSERT INTO `area` VALUES ('421123', '罗田县', 'Luotian', '421100');
INSERT INTO `area` VALUES ('421124', '英山县', 'Yingshan', '421100');
INSERT INTO `area` VALUES ('421125', '浠水县', 'Xishui', '421100');
INSERT INTO `area` VALUES ('421126', '蕲春县', 'Qichun', '421100');
INSERT INTO `area` VALUES ('421127', '黄梅县', 'Huangmei', '421100');
INSERT INTO `area` VALUES ('421181', '麻城市', 'Macheng', '421100');
INSERT INTO `area` VALUES ('421182', '武穴市', 'Wuxue', '421100');
INSERT INTO `area` VALUES ('421200', '咸宁市', 'Xianning', '420000');
INSERT INTO `area` VALUES ('421202', '咸安区', 'Xian\'an', '421200');
INSERT INTO `area` VALUES ('421221', '嘉鱼县', 'Jiayu', '421200');
INSERT INTO `area` VALUES ('421222', '通城县', 'Tongcheng', '421200');
INSERT INTO `area` VALUES ('421223', '崇阳县', 'Chongyang', '421200');
INSERT INTO `area` VALUES ('421224', '通山县', 'Tongshan', '421200');
INSERT INTO `area` VALUES ('421281', '赤壁市', 'Chibi', '421200');
INSERT INTO `area` VALUES ('421300', '随州市', 'Suizhou', '420000');
INSERT INTO `area` VALUES ('421303', '曾都区', 'Zengdu', '421300');
INSERT INTO `area` VALUES ('421321', '随县', 'Suixian', '421300');
INSERT INTO `area` VALUES ('421381', '广水市', 'Guangshui', '421300');
INSERT INTO `area` VALUES ('422800', '恩施土家族苗族自治州', 'Enshi', '420000');
INSERT INTO `area` VALUES ('422801', '恩施市', 'Enshi', '422800');
INSERT INTO `area` VALUES ('422802', '利川市', 'Lichuan', '422800');
INSERT INTO `area` VALUES ('422822', '建始县', 'Jianshi', '422800');
INSERT INTO `area` VALUES ('422823', '巴东县', 'Badong', '422800');
INSERT INTO `area` VALUES ('422825', '宣恩县', 'Xuanen', '422800');
INSERT INTO `area` VALUES ('422826', '咸丰县', 'Xianfeng', '422800');
INSERT INTO `area` VALUES ('422827', '来凤县', 'Laifeng', '422800');
INSERT INTO `area` VALUES ('422828', '鹤峰县', 'Hefeng', '422800');
INSERT INTO `area` VALUES ('429000', '直辖县级', '', '420000');
INSERT INTO `area` VALUES ('429004', '仙桃市', 'Xiantao', '429000');
INSERT INTO `area` VALUES ('429005', '潜江市', 'Qianjiang', '429000');
INSERT INTO `area` VALUES ('429006', '天门市', 'Tianmen', '429000');
INSERT INTO `area` VALUES ('429021', '神农架林区', 'Shennongjia', '429000');
INSERT INTO `area` VALUES ('430000', '湖南省', 'Hunan', '0');
INSERT INTO `area` VALUES ('430100', '长沙市', 'Changsha', '430000');
INSERT INTO `area` VALUES ('430102', '芙蓉区', 'Furong', '430100');
INSERT INTO `area` VALUES ('430103', '天心区', 'Tianxin', '430100');
INSERT INTO `area` VALUES ('430104', '岳麓区', 'Yuelu', '430100');
INSERT INTO `area` VALUES ('430105', '开福区', 'Kaifu', '430100');
INSERT INTO `area` VALUES ('430111', '雨花区', 'Yuhua', '430100');
INSERT INTO `area` VALUES ('430112', '望城区', 'Wangcheng', '430100');
INSERT INTO `area` VALUES ('430121', '长沙县', 'Changsha', '430100');
INSERT INTO `area` VALUES ('430124', '宁乡县', 'Ningxiang', '430100');
INSERT INTO `area` VALUES ('430181', '浏阳市', 'Liuyang', '430100');
INSERT INTO `area` VALUES ('430200', '株洲市', 'Zhuzhou', '430000');
INSERT INTO `area` VALUES ('430202', '荷塘区', 'Hetang', '430200');
INSERT INTO `area` VALUES ('430203', '芦淞区', 'Lusong', '430200');
INSERT INTO `area` VALUES ('430204', '石峰区', 'Shifeng', '430200');
INSERT INTO `area` VALUES ('430211', '天元区', 'Tianyuan', '430200');
INSERT INTO `area` VALUES ('430221', '株洲县', 'Zhuzhou', '430200');
INSERT INTO `area` VALUES ('430223', '攸县', 'Youxian', '430200');
INSERT INTO `area` VALUES ('430224', '茶陵县', 'Chaling', '430200');
INSERT INTO `area` VALUES ('430225', '炎陵县', 'Yanling', '430200');
INSERT INTO `area` VALUES ('430281', '醴陵市', 'Liling', '430200');
INSERT INTO `area` VALUES ('430300', '湘潭市', 'Xiangtan', '430000');
INSERT INTO `area` VALUES ('430302', '雨湖区', 'Yuhu', '430300');
INSERT INTO `area` VALUES ('430304', '岳塘区', 'Yuetang', '430300');
INSERT INTO `area` VALUES ('430321', '湘潭县', 'Xiangtan', '430300');
INSERT INTO `area` VALUES ('430381', '湘乡市', 'Xiangxiang', '430300');
INSERT INTO `area` VALUES ('430382', '韶山市', 'Shaoshan', '430300');
INSERT INTO `area` VALUES ('430400', '衡阳市', 'Hengyang', '430000');
INSERT INTO `area` VALUES ('430405', '珠晖区', 'Zhuhui', '430400');
INSERT INTO `area` VALUES ('430406', '雁峰区', 'Yanfeng', '430400');
INSERT INTO `area` VALUES ('430407', '石鼓区', 'Shigu', '430400');
INSERT INTO `area` VALUES ('430408', '蒸湘区', 'Zhengxiang', '430400');
INSERT INTO `area` VALUES ('430412', '南岳区', 'Nanyue', '430400');
INSERT INTO `area` VALUES ('430421', '衡阳县', 'Hengyang', '430400');
INSERT INTO `area` VALUES ('430422', '衡南县', 'Hengnan', '430400');
INSERT INTO `area` VALUES ('430423', '衡山县', 'Hengshan', '430400');
INSERT INTO `area` VALUES ('430424', '衡东县', 'Hengdong', '430400');
INSERT INTO `area` VALUES ('430426', '祁东县', 'Qidong', '430400');
INSERT INTO `area` VALUES ('430481', '耒阳市', 'Leiyang', '430400');
INSERT INTO `area` VALUES ('430482', '常宁市', 'Changning', '430400');
INSERT INTO `area` VALUES ('430500', '邵阳市', 'Shaoyang', '430000');
INSERT INTO `area` VALUES ('430502', '双清区', 'Shuangqing', '430500');
INSERT INTO `area` VALUES ('430503', '大祥区', 'Daxiang', '430500');
INSERT INTO `area` VALUES ('430511', '北塔区', 'Beita', '430500');
INSERT INTO `area` VALUES ('430521', '邵东县', 'Shaodong', '430500');
INSERT INTO `area` VALUES ('430522', '新邵县', 'Xinshao', '430500');
INSERT INTO `area` VALUES ('430523', '邵阳县', 'Shaoyang', '430500');
INSERT INTO `area` VALUES ('430524', '隆回县', 'Longhui', '430500');
INSERT INTO `area` VALUES ('430525', '洞口县', 'Dongkou', '430500');
INSERT INTO `area` VALUES ('430527', '绥宁县', 'Suining', '430500');
INSERT INTO `area` VALUES ('430528', '新宁县', 'Xinning', '430500');
INSERT INTO `area` VALUES ('430529', '城步苗族自治县', 'Chengbu', '430500');
INSERT INTO `area` VALUES ('430581', '武冈市', 'Wugang', '430500');
INSERT INTO `area` VALUES ('430600', '岳阳市', 'Yueyang', '430000');
INSERT INTO `area` VALUES ('430602', '岳阳楼区', 'Yueyanglou', '430600');
INSERT INTO `area` VALUES ('430603', '云溪区', 'Yunxi', '430600');
INSERT INTO `area` VALUES ('430611', '君山区', 'Junshan', '430600');
INSERT INTO `area` VALUES ('430621', '岳阳县', 'Yueyang', '430600');
INSERT INTO `area` VALUES ('430623', '华容县', 'Huarong', '430600');
INSERT INTO `area` VALUES ('430624', '湘阴县', 'Xiangyin', '430600');
INSERT INTO `area` VALUES ('430626', '平江县', 'Pingjiang', '430600');
INSERT INTO `area` VALUES ('430681', '汨罗市', 'Miluo', '430600');
INSERT INTO `area` VALUES ('430682', '临湘市', 'Linxiang', '430600');
INSERT INTO `area` VALUES ('430700', '常德市', 'Changde', '430000');
INSERT INTO `area` VALUES ('430702', '武陵区', 'Wuling', '430700');
INSERT INTO `area` VALUES ('430703', '鼎城区', 'Dingcheng', '430700');
INSERT INTO `area` VALUES ('430721', '安乡县', 'Anxiang', '430700');
INSERT INTO `area` VALUES ('430722', '汉寿县', 'Hanshou', '430700');
INSERT INTO `area` VALUES ('430723', '澧县', 'Lixian', '430700');
INSERT INTO `area` VALUES ('430724', '临澧县', 'Linli', '430700');
INSERT INTO `area` VALUES ('430725', '桃源县', 'Taoyuan', '430700');
INSERT INTO `area` VALUES ('430726', '石门县', 'Shimen', '430700');
INSERT INTO `area` VALUES ('430781', '津市市', 'Jinshi', '430700');
INSERT INTO `area` VALUES ('430800', '张家界市', 'Zhangjiajie', '430000');
INSERT INTO `area` VALUES ('430802', '永定区', 'Yongding', '430800');
INSERT INTO `area` VALUES ('430811', '武陵源区', 'Wulingyuan', '430800');
INSERT INTO `area` VALUES ('430821', '慈利县', 'Cili', '430800');
INSERT INTO `area` VALUES ('430822', '桑植县', 'Sangzhi', '430800');
INSERT INTO `area` VALUES ('430900', '益阳市', 'Yiyang', '430000');
INSERT INTO `area` VALUES ('430902', '资阳区', 'Ziyang', '430900');
INSERT INTO `area` VALUES ('430903', '赫山区', 'Heshan', '430900');
INSERT INTO `area` VALUES ('430921', '南县', 'Nanxian', '430900');
INSERT INTO `area` VALUES ('430922', '桃江县', 'Taojiang', '430900');
INSERT INTO `area` VALUES ('430923', '安化县', 'Anhua', '430900');
INSERT INTO `area` VALUES ('430981', '沅江市', 'Yuanjiang', '430900');
INSERT INTO `area` VALUES ('431000', '郴州市', 'Chenzhou', '430000');
INSERT INTO `area` VALUES ('431002', '北湖区', 'Beihu', '431000');
INSERT INTO `area` VALUES ('431003', '苏仙区', 'Suxian', '431000');
INSERT INTO `area` VALUES ('431021', '桂阳县', 'Guiyang', '431000');
INSERT INTO `area` VALUES ('431022', '宜章县', 'Yizhang', '431000');
INSERT INTO `area` VALUES ('431023', '永兴县', 'Yongxing', '431000');
INSERT INTO `area` VALUES ('431024', '嘉禾县', 'Jiahe', '431000');
INSERT INTO `area` VALUES ('431025', '临武县', 'Linwu', '431000');
INSERT INTO `area` VALUES ('431026', '汝城县', 'Rucheng', '431000');
INSERT INTO `area` VALUES ('431027', '桂东县', 'Guidong', '431000');
INSERT INTO `area` VALUES ('431028', '安仁县', 'Anren', '431000');
INSERT INTO `area` VALUES ('431081', '资兴市', 'Zixing', '431000');
INSERT INTO `area` VALUES ('431100', '永州市', 'Yongzhou', '430000');
INSERT INTO `area` VALUES ('431102', '零陵区', 'Lingling', '431100');
INSERT INTO `area` VALUES ('431103', '冷水滩区', 'Lengshuitan', '431100');
INSERT INTO `area` VALUES ('431121', '祁阳县', 'Qiyang', '431100');
INSERT INTO `area` VALUES ('431122', '东安县', 'Dong\'an', '431100');
INSERT INTO `area` VALUES ('431123', '双牌县', 'Shuangpai', '431100');
INSERT INTO `area` VALUES ('431124', '道县', 'Daoxian', '431100');
INSERT INTO `area` VALUES ('431125', '江永县', 'Jiangyong', '431100');
INSERT INTO `area` VALUES ('431126', '宁远县', 'Ningyuan', '431100');
INSERT INTO `area` VALUES ('431127', '蓝山县', 'Lanshan', '431100');
INSERT INTO `area` VALUES ('431128', '新田县', 'Xintian', '431100');
INSERT INTO `area` VALUES ('431129', '江华瑶族自治县', 'Jianghua', '431100');
INSERT INTO `area` VALUES ('431200', '怀化市', 'Huaihua', '430000');
INSERT INTO `area` VALUES ('431202', '鹤城区', 'Hecheng', '431200');
INSERT INTO `area` VALUES ('431221', '中方县', 'Zhongfang', '431200');
INSERT INTO `area` VALUES ('431222', '沅陵县', 'Yuanling', '431200');
INSERT INTO `area` VALUES ('431223', '辰溪县', 'Chenxi', '431200');
INSERT INTO `area` VALUES ('431224', '溆浦县', 'Xupu', '431200');
INSERT INTO `area` VALUES ('431225', '会同县', 'Huitong', '431200');
INSERT INTO `area` VALUES ('431226', '麻阳苗族自治县', 'Mayang', '431200');
INSERT INTO `area` VALUES ('431227', '新晃侗族自治县', 'Xinhuang', '431200');
INSERT INTO `area` VALUES ('431228', '芷江侗族自治县', 'Zhijiang', '431200');
INSERT INTO `area` VALUES ('431229', '靖州苗族侗族自治县', 'Jingzhou', '431200');
INSERT INTO `area` VALUES ('431230', '通道侗族自治县', 'Tongdao', '431200');
INSERT INTO `area` VALUES ('431281', '洪江市', 'Hongjiang', '431200');
INSERT INTO `area` VALUES ('431300', '娄底市', 'Loudi', '430000');
INSERT INTO `area` VALUES ('431302', '娄星区', 'Louxing', '431300');
INSERT INTO `area` VALUES ('431321', '双峰县', 'Shuangfeng', '431300');
INSERT INTO `area` VALUES ('431322', '新化县', 'Xinhua', '431300');
INSERT INTO `area` VALUES ('431381', '冷水江市', 'Lengshuijiang', '431300');
INSERT INTO `area` VALUES ('431382', '涟源市', 'Lianyuan', '431300');
INSERT INTO `area` VALUES ('433100', '湘西土家族苗族自治州', 'Xiangxi', '430000');
INSERT INTO `area` VALUES ('433101', '吉首市', 'Jishou', '433100');
INSERT INTO `area` VALUES ('433122', '泸溪县', 'Luxi', '433100');
INSERT INTO `area` VALUES ('433123', '凤凰县', 'Fenghuang', '433100');
INSERT INTO `area` VALUES ('433124', '花垣县', 'Huayuan', '433100');
INSERT INTO `area` VALUES ('433125', '保靖县', 'Baojing', '433100');
INSERT INTO `area` VALUES ('433126', '古丈县', 'Guzhang', '433100');
INSERT INTO `area` VALUES ('433127', '永顺县', 'Yongshun', '433100');
INSERT INTO `area` VALUES ('433130', '龙山县', 'Longshan', '433100');
INSERT INTO `area` VALUES ('440000', '广东省', 'Guangdong', '0');
INSERT INTO `area` VALUES ('440100', '广州市', 'Guangzhou', '440000');
INSERT INTO `area` VALUES ('440103', '荔湾区', 'Liwan', '440100');
INSERT INTO `area` VALUES ('440104', '越秀区', 'Yuexiu', '440100');
INSERT INTO `area` VALUES ('440105', '海珠区', 'Haizhu', '440100');
INSERT INTO `area` VALUES ('440106', '天河区', 'Tianhe', '440100');
INSERT INTO `area` VALUES ('440111', '白云区', 'Baiyun', '440100');
INSERT INTO `area` VALUES ('440112', '黄埔区', 'Huangpu', '440100');
INSERT INTO `area` VALUES ('440113', '番禺区', 'Panyu', '440100');
INSERT INTO `area` VALUES ('440114', '花都区', 'Huadu', '440100');
INSERT INTO `area` VALUES ('440115', '南沙区', 'Nansha', '440100');
INSERT INTO `area` VALUES ('440117', '从化区', 'Conghua', '440100');
INSERT INTO `area` VALUES ('440118', '增城区', 'Zengcheng', '440100');
INSERT INTO `area` VALUES ('440200', '韶关市', 'Shaoguan', '440000');
INSERT INTO `area` VALUES ('440203', '武江区', 'Wujiang', '440200');
INSERT INTO `area` VALUES ('440204', '浈江区', 'Zhenjiang', '440200');
INSERT INTO `area` VALUES ('440205', '曲江区', 'Qujiang', '440200');
INSERT INTO `area` VALUES ('440222', '始兴县', 'Shixing', '440200');
INSERT INTO `area` VALUES ('440224', '仁化县', 'Renhua', '440200');
INSERT INTO `area` VALUES ('440229', '翁源县', 'Wengyuan', '440200');
INSERT INTO `area` VALUES ('440232', '乳源瑶族自治县', 'Ruyuan', '440200');
INSERT INTO `area` VALUES ('440233', '新丰县', 'Xinfeng', '440200');
INSERT INTO `area` VALUES ('440281', '乐昌市', 'Lechang', '440200');
INSERT INTO `area` VALUES ('440282', '南雄市', 'Nanxiong', '440200');
INSERT INTO `area` VALUES ('440300', '深圳市', 'Shenzhen', '440000');
INSERT INTO `area` VALUES ('440303', '罗湖区', 'Luohu', '440300');
INSERT INTO `area` VALUES ('440304', '福田区', 'Futian', '440300');
INSERT INTO `area` VALUES ('440305', '南山区', 'Nanshan', '440300');
INSERT INTO `area` VALUES ('440306', '宝安区', 'Bao\'an', '440300');
INSERT INTO `area` VALUES ('440307', '龙岗区', 'Longgang', '440300');
INSERT INTO `area` VALUES ('440308', '盐田区', 'Yantian', '440300');
INSERT INTO `area` VALUES ('440309', '光明新区', 'Guangmingxinqu', '440300');
INSERT INTO `area` VALUES ('440310', '坪山新区', 'Pingshanxinqu', '440300');
INSERT INTO `area` VALUES ('440311', '大鹏新区', 'Dapengxinqu', '440300');
INSERT INTO `area` VALUES ('440312', '龙华新区', 'Longhuaxinqu', '440300');
INSERT INTO `area` VALUES ('440400', '珠海市', 'Zhuhai', '440000');
INSERT INTO `area` VALUES ('440402', '香洲区', 'Xiangzhou', '440400');
INSERT INTO `area` VALUES ('440403', '斗门区', 'Doumen', '440400');
INSERT INTO `area` VALUES ('440404', '金湾区', 'Jinwan', '440400');
INSERT INTO `area` VALUES ('440500', '汕头市', 'Shantou', '440000');
INSERT INTO `area` VALUES ('440507', '龙湖区', 'Longhu', '440500');
INSERT INTO `area` VALUES ('440511', '金平区', 'Jinping', '440500');
INSERT INTO `area` VALUES ('440512', '濠江区', 'Haojiang', '440500');
INSERT INTO `area` VALUES ('440513', '潮阳区', 'Chaoyang', '440500');
INSERT INTO `area` VALUES ('440514', '潮南区', 'Chaonan', '440500');
INSERT INTO `area` VALUES ('440515', '澄海区', 'Chenghai', '440500');
INSERT INTO `area` VALUES ('440523', '南澳县', 'Nanao', '440500');
INSERT INTO `area` VALUES ('440600', '佛山市', 'Foshan', '440000');
INSERT INTO `area` VALUES ('440604', '禅城区', 'Chancheng', '440600');
INSERT INTO `area` VALUES ('440605', '南海区', 'Nanhai', '440600');
INSERT INTO `area` VALUES ('440606', '顺德区', 'Shunde', '440600');
INSERT INTO `area` VALUES ('440607', '三水区', 'Sanshui', '440600');
INSERT INTO `area` VALUES ('440608', '高明区', 'Gaoming', '440600');
INSERT INTO `area` VALUES ('440700', '江门市', 'Jiangmen', '440000');
INSERT INTO `area` VALUES ('440703', '蓬江区', 'Pengjiang', '440700');
INSERT INTO `area` VALUES ('440704', '江海区', 'Jianghai', '440700');
INSERT INTO `area` VALUES ('440705', '新会区', 'Xinhui', '440700');
INSERT INTO `area` VALUES ('440781', '台山市', 'Taishan', '440700');
INSERT INTO `area` VALUES ('440783', '开平市', 'Kaiping', '440700');
INSERT INTO `area` VALUES ('440784', '鹤山市', 'Heshan', '440700');
INSERT INTO `area` VALUES ('440785', '恩平市', 'Enping', '440700');
INSERT INTO `area` VALUES ('440800', '湛江市', 'Zhanjiang', '440000');
INSERT INTO `area` VALUES ('440802', '赤坎区', 'Chikan', '440800');
INSERT INTO `area` VALUES ('440803', '霞山区', 'Xiashan', '440800');
INSERT INTO `area` VALUES ('440804', '坡头区', 'Potou', '440800');
INSERT INTO `area` VALUES ('440811', '麻章区', 'Mazhang', '440800');
INSERT INTO `area` VALUES ('440823', '遂溪县', 'Suixi', '440800');
INSERT INTO `area` VALUES ('440825', '徐闻县', 'Xuwen', '440800');
INSERT INTO `area` VALUES ('440881', '廉江市', 'Lianjiang', '440800');
INSERT INTO `area` VALUES ('440882', '雷州市', 'Leizhou', '440800');
INSERT INTO `area` VALUES ('440883', '吴川市', 'Wuchuan', '440800');
INSERT INTO `area` VALUES ('440900', '茂名市', 'Maoming', '440000');
INSERT INTO `area` VALUES ('440902', '茂南区', 'Maonan', '440900');
INSERT INTO `area` VALUES ('440904', '电白区', 'Dianbai', '440900');
INSERT INTO `area` VALUES ('440981', '高州市', 'Gaozhou', '440900');
INSERT INTO `area` VALUES ('440982', '化州市', 'Huazhou', '440900');
INSERT INTO `area` VALUES ('440983', '信宜市', 'Xinyi', '440900');
INSERT INTO `area` VALUES ('441200', '肇庆市', 'Zhaoqing', '440000');
INSERT INTO `area` VALUES ('441202', '端州区', 'Duanzhou', '441200');
INSERT INTO `area` VALUES ('441203', '鼎湖区', 'Dinghu', '441200');
INSERT INTO `area` VALUES ('441223', '广宁县', 'Guangning', '441200');
INSERT INTO `area` VALUES ('441224', '怀集县', 'Huaiji', '441200');
INSERT INTO `area` VALUES ('441225', '封开县', 'Fengkai', '441200');
INSERT INTO `area` VALUES ('441226', '德庆县', 'Deqing', '441200');
INSERT INTO `area` VALUES ('441283', '高要市', 'Gaoyao', '441200');
INSERT INTO `area` VALUES ('441284', '四会市', 'Sihui', '441200');
INSERT INTO `area` VALUES ('441300', '惠州市', 'Huizhou', '440000');
INSERT INTO `area` VALUES ('441302', '惠城区', 'Huicheng', '441300');
INSERT INTO `area` VALUES ('441303', '惠阳区', 'Huiyang', '441300');
INSERT INTO `area` VALUES ('441322', '博罗县', 'Boluo', '441300');
INSERT INTO `area` VALUES ('441323', '惠东县', 'Huidong', '441300');
INSERT INTO `area` VALUES ('441324', '龙门县', 'Longmen', '441300');
INSERT INTO `area` VALUES ('441400', '梅州市', 'Meizhou', '440000');
INSERT INTO `area` VALUES ('441402', '梅江区', 'Meijiang', '441400');
INSERT INTO `area` VALUES ('441403', '梅县区', 'Meixian', '441400');
INSERT INTO `area` VALUES ('441422', '大埔县', 'Dabu', '441400');
INSERT INTO `area` VALUES ('441423', '丰顺县', 'Fengshun', '441400');
INSERT INTO `area` VALUES ('441424', '五华县', 'Wuhua', '441400');
INSERT INTO `area` VALUES ('441426', '平远县', 'Pingyuan', '441400');
INSERT INTO `area` VALUES ('441427', '蕉岭县', 'Jiaoling', '441400');
INSERT INTO `area` VALUES ('441481', '兴宁市', 'Xingning', '441400');
INSERT INTO `area` VALUES ('441500', '汕尾市', 'Shanwei', '440000');
INSERT INTO `area` VALUES ('441502', '城区', 'Chengqu', '441500');
INSERT INTO `area` VALUES ('441521', '海丰县', 'Haifeng', '441500');
INSERT INTO `area` VALUES ('441523', '陆河县', 'Luhe', '441500');
INSERT INTO `area` VALUES ('441581', '陆丰市', 'Lufeng', '441500');
INSERT INTO `area` VALUES ('441600', '河源市', 'Heyuan', '440000');
INSERT INTO `area` VALUES ('441602', '源城区', 'Yuancheng', '441600');
INSERT INTO `area` VALUES ('441621', '紫金县', 'Zijin', '441600');
INSERT INTO `area` VALUES ('441622', '龙川县', 'Longchuan', '441600');
INSERT INTO `area` VALUES ('441623', '连平县', 'Lianping', '441600');
INSERT INTO `area` VALUES ('441624', '和平县', 'Heping', '441600');
INSERT INTO `area` VALUES ('441625', '东源县', 'Dongyuan', '441600');
INSERT INTO `area` VALUES ('441700', '阳江市', 'Yangjiang', '440000');
INSERT INTO `area` VALUES ('441702', '江城区', 'Jiangcheng', '441700');
INSERT INTO `area` VALUES ('441704', '阳东区', 'Yangdong', '441700');
INSERT INTO `area` VALUES ('441721', '阳西县', 'Yangxi', '441700');
INSERT INTO `area` VALUES ('441781', '阳春市', 'Yangchun', '441700');
INSERT INTO `area` VALUES ('441800', '清远市', 'Qingyuan', '440000');
INSERT INTO `area` VALUES ('441802', '清城区', 'Qingcheng', '441800');
INSERT INTO `area` VALUES ('441803', '清新区', 'Qingxin', '441800');
INSERT INTO `area` VALUES ('441821', '佛冈县', 'Fogang', '441800');
INSERT INTO `area` VALUES ('441823', '阳山县', 'Yangshan', '441800');
INSERT INTO `area` VALUES ('441825', '连山壮族瑶族自治县', 'Lianshan', '441800');
INSERT INTO `area` VALUES ('441826', '连南瑶族自治县', 'Liannan', '441800');
INSERT INTO `area` VALUES ('441881', '英德市', 'Yingde', '441800');
INSERT INTO `area` VALUES ('441882', '连州市', 'Lianzhou', '441800');
INSERT INTO `area` VALUES ('441900', '东莞市', 'Dongguan', '440000');
INSERT INTO `area` VALUES ('441901', '莞城区', 'Guancheng', '441900');
INSERT INTO `area` VALUES ('441902', '南城区', 'Nancheng', '441900');
INSERT INTO `area` VALUES ('441904', '万江区', 'Wanjiang', '441900');
INSERT INTO `area` VALUES ('441905', '石碣镇', 'Shijie', '441900');
INSERT INTO `area` VALUES ('441906', '石龙镇', 'Shilong', '441900');
INSERT INTO `area` VALUES ('441907', '茶山镇', 'Chashan', '441900');
INSERT INTO `area` VALUES ('441908', '石排镇', 'Shipai', '441900');
INSERT INTO `area` VALUES ('441909', '企石镇', 'Qishi', '441900');
INSERT INTO `area` VALUES ('441910', '横沥镇', 'Hengli', '441900');
INSERT INTO `area` VALUES ('441911', '桥头镇', 'Qiaotou', '441900');
INSERT INTO `area` VALUES ('441912', '谢岗镇', 'Xiegang', '441900');
INSERT INTO `area` VALUES ('441913', '东坑镇', 'Dongkeng', '441900');
INSERT INTO `area` VALUES ('441914', '常平镇', 'Changping', '441900');
INSERT INTO `area` VALUES ('441915', '寮步镇', 'Liaobu', '441900');
INSERT INTO `area` VALUES ('441916', '大朗镇', 'Dalang', '441900');
INSERT INTO `area` VALUES ('441917', '麻涌镇', 'Machong', '441900');
INSERT INTO `area` VALUES ('441918', '中堂镇', 'Zhongtang', '441900');
INSERT INTO `area` VALUES ('441919', '高埗镇', 'Gaobu', '441900');
INSERT INTO `area` VALUES ('441920', '樟木头镇', 'Zhangmutou', '441900');
INSERT INTO `area` VALUES ('441921', '大岭山镇', 'Dalingshan', '441900');
INSERT INTO `area` VALUES ('441922', '望牛墩镇', 'Wangniudun', '441900');
INSERT INTO `area` VALUES ('441923', '黄江镇', 'Huangjiang', '441900');
INSERT INTO `area` VALUES ('441924', '洪梅镇', 'Hongmei', '441900');
INSERT INTO `area` VALUES ('441925', '清溪镇', 'Qingxi', '441900');
INSERT INTO `area` VALUES ('441926', '沙田镇', 'Shatian', '441900');
INSERT INTO `area` VALUES ('441927', '道滘镇', 'Daojiao', '441900');
INSERT INTO `area` VALUES ('441928', '塘厦镇', 'Tangxia', '441900');
INSERT INTO `area` VALUES ('441929', '虎门镇', 'Humen', '441900');
INSERT INTO `area` VALUES ('441930', '厚街镇', 'Houjie', '441900');
INSERT INTO `area` VALUES ('441931', '凤岗镇', 'Fenggang', '441900');
INSERT INTO `area` VALUES ('441932', '长安镇', 'Chang\'an', '441900');
INSERT INTO `area` VALUES ('442000', '中山市', 'Zhongshan', '440000');
INSERT INTO `area` VALUES ('442001', '石岐区', 'Shiqi', '442000');
INSERT INTO `area` VALUES ('442004', '南区', 'Nanqu', '442000');
INSERT INTO `area` VALUES ('442005', '五桂山区', 'Wuguishan', '442000');
INSERT INTO `area` VALUES ('442006', '火炬开发区', 'Huoju', '442000');
INSERT INTO `area` VALUES ('442007', '黄圃镇', 'Huangpu', '442000');
INSERT INTO `area` VALUES ('442008', '南头镇', 'Nantou', '442000');
INSERT INTO `area` VALUES ('442009', '东凤镇', 'Dongfeng', '442000');
INSERT INTO `area` VALUES ('442010', '阜沙镇', 'Fusha', '442000');
INSERT INTO `area` VALUES ('442011', '小榄镇', 'Xiaolan', '442000');
INSERT INTO `area` VALUES ('442012', '东升镇', 'Dongsheng', '442000');
INSERT INTO `area` VALUES ('442013', '古镇镇', 'Guzhen', '442000');
INSERT INTO `area` VALUES ('442014', '横栏镇', 'Henglan', '442000');
INSERT INTO `area` VALUES ('442015', '三角镇', 'Sanjiao', '442000');
INSERT INTO `area` VALUES ('442016', '民众镇', 'Minzhong', '442000');
INSERT INTO `area` VALUES ('442017', '南朗镇', 'Nanlang', '442000');
INSERT INTO `area` VALUES ('442018', '港口镇', 'Gangkou', '442000');
INSERT INTO `area` VALUES ('442019', '大涌镇', 'Dayong', '442000');
INSERT INTO `area` VALUES ('442020', '沙溪镇', 'Shaxi', '442000');
INSERT INTO `area` VALUES ('442021', '三乡镇', 'Sanxiang', '442000');
INSERT INTO `area` VALUES ('442022', '板芙镇', 'Banfu', '442000');
INSERT INTO `area` VALUES ('442023', '神湾镇', 'Shenwan', '442000');
INSERT INTO `area` VALUES ('442024', '坦洲镇', 'Tanzhou', '442000');
INSERT INTO `area` VALUES ('445100', '潮州市', 'Chaozhou', '440000');
INSERT INTO `area` VALUES ('445102', '湘桥区', 'Xiangqiao', '445100');
INSERT INTO `area` VALUES ('445103', '潮安区', 'Chao\'an', '445100');
INSERT INTO `area` VALUES ('445122', '饶平县', 'Raoping', '445100');
INSERT INTO `area` VALUES ('445200', '揭阳市', 'Jieyang', '440000');
INSERT INTO `area` VALUES ('445202', '榕城区', 'Rongcheng', '445200');
INSERT INTO `area` VALUES ('445203', '揭东区', 'Jiedong', '445200');
INSERT INTO `area` VALUES ('445222', '揭西县', 'Jiexi', '445200');
INSERT INTO `area` VALUES ('445224', '惠来县', 'Huilai', '445200');
INSERT INTO `area` VALUES ('445281', '普宁市', 'Puning', '445200');
INSERT INTO `area` VALUES ('445300', '云浮市', 'Yunfu', '440000');
INSERT INTO `area` VALUES ('445302', '云城区', 'Yuncheng', '445300');
INSERT INTO `area` VALUES ('445303', '云安区', 'Yun\'an', '445300');
INSERT INTO `area` VALUES ('445321', '新兴县', 'Xinxing', '445300');
INSERT INTO `area` VALUES ('445322', '郁南县', 'Yunan', '445300');
INSERT INTO `area` VALUES ('445381', '罗定市', 'Luoding', '445300');
INSERT INTO `area` VALUES ('450000', '广西壮族自治区', 'Guangxi', '0');
INSERT INTO `area` VALUES ('450100', '南宁市', 'Nanning', '450000');
INSERT INTO `area` VALUES ('450102', '兴宁区', 'Xingning', '450100');
INSERT INTO `area` VALUES ('450103', '青秀区', 'Qingxiu', '450100');
INSERT INTO `area` VALUES ('450105', '江南区', 'Jiangnan', '450100');
INSERT INTO `area` VALUES ('450107', '西乡塘区', 'Xixiangtang', '450100');
INSERT INTO `area` VALUES ('450108', '良庆区', 'Liangqing', '450100');
INSERT INTO `area` VALUES ('450109', '邕宁区', 'Yongning', '450100');
INSERT INTO `area` VALUES ('450122', '武鸣县', 'Wuming', '450100');
INSERT INTO `area` VALUES ('450123', '隆安县', 'Long\'an', '450100');
INSERT INTO `area` VALUES ('450124', '马山县', 'Mashan', '450100');
INSERT INTO `area` VALUES ('450125', '上林县', 'Shanglin', '450100');
INSERT INTO `area` VALUES ('450126', '宾阳县', 'Binyang', '450100');
INSERT INTO `area` VALUES ('450127', '横县', 'Hengxian', '450100');
INSERT INTO `area` VALUES ('450128', '埌东新区', 'Langdong', '450100');
INSERT INTO `area` VALUES ('450200', '柳州市', 'Liuzhou', '450000');
INSERT INTO `area` VALUES ('450202', '城中区', 'Chengzhong', '450200');
INSERT INTO `area` VALUES ('450203', '鱼峰区', 'Yufeng', '450200');
INSERT INTO `area` VALUES ('450204', '柳南区', 'Liunan', '450200');
INSERT INTO `area` VALUES ('450205', '柳北区', 'Liubei', '450200');
INSERT INTO `area` VALUES ('450221', '柳江县', 'Liujiang', '450200');
INSERT INTO `area` VALUES ('450222', '柳城县', 'Liucheng', '450200');
INSERT INTO `area` VALUES ('450223', '鹿寨县', 'Luzhai', '450200');
INSERT INTO `area` VALUES ('450224', '融安县', 'Rong\'an', '450200');
INSERT INTO `area` VALUES ('450225', '融水苗族自治县', 'Rongshui', '450200');
INSERT INTO `area` VALUES ('450226', '三江侗族自治县', 'Sanjiang', '450200');
INSERT INTO `area` VALUES ('450227', '柳东新区', 'Liudong', '450200');
INSERT INTO `area` VALUES ('450300', '桂林市', 'Guilin', '450000');
INSERT INTO `area` VALUES ('450302', '秀峰区', 'Xiufeng', '450300');
INSERT INTO `area` VALUES ('450303', '叠彩区', 'Diecai', '450300');
INSERT INTO `area` VALUES ('450304', '象山区', 'Xiangshan', '450300');
INSERT INTO `area` VALUES ('450305', '七星区', 'Qixing', '450300');
INSERT INTO `area` VALUES ('450311', '雁山区', 'Yanshan', '450300');
INSERT INTO `area` VALUES ('450312', '临桂区', 'Lingui', '450300');
INSERT INTO `area` VALUES ('450321', '阳朔县', 'Yangshuo', '450300');
INSERT INTO `area` VALUES ('450323', '灵川县', 'Lingchuan', '450300');
INSERT INTO `area` VALUES ('450324', '全州县', 'Quanzhou', '450300');
INSERT INTO `area` VALUES ('450325', '兴安县', 'Xing\'an', '450300');
INSERT INTO `area` VALUES ('450326', '永福县', 'Yongfu', '450300');
INSERT INTO `area` VALUES ('450327', '灌阳县', 'Guanyang', '450300');
INSERT INTO `area` VALUES ('450328', '龙胜各族自治县', 'Longsheng', '450300');
INSERT INTO `area` VALUES ('450329', '资源县', 'Ziyuan', '450300');
INSERT INTO `area` VALUES ('450330', '平乐县', 'Pingle', '450300');
INSERT INTO `area` VALUES ('450331', '荔浦县', 'Lipu', '450300');
INSERT INTO `area` VALUES ('450332', '恭城瑶族自治县', 'Gongcheng', '450300');
INSERT INTO `area` VALUES ('450400', '梧州市', 'Wuzhou', '450000');
INSERT INTO `area` VALUES ('450403', '万秀区', 'Wanxiu', '450400');
INSERT INTO `area` VALUES ('450405', '长洲区', 'Changzhou', '450400');
INSERT INTO `area` VALUES ('450406', '龙圩区', 'Longxu', '450400');
INSERT INTO `area` VALUES ('450421', '苍梧县', 'Cangwu', '450400');
INSERT INTO `area` VALUES ('450422', '藤县', 'Tengxian', '450400');
INSERT INTO `area` VALUES ('450423', '蒙山县', 'Mengshan', '450400');
INSERT INTO `area` VALUES ('450481', '岑溪市', 'Cenxi', '450400');
INSERT INTO `area` VALUES ('450500', '北海市', 'Beihai', '450000');
INSERT INTO `area` VALUES ('450502', '海城区', 'Haicheng', '450500');
INSERT INTO `area` VALUES ('450503', '银海区', 'Yinhai', '450500');
INSERT INTO `area` VALUES ('450512', '铁山港区', 'Tieshangang', '450500');
INSERT INTO `area` VALUES ('450521', '合浦县', 'Hepu', '450500');
INSERT INTO `area` VALUES ('450600', '防城港市', 'Fangchenggang', '450000');
INSERT INTO `area` VALUES ('450602', '港口区', 'Gangkou', '450600');
INSERT INTO `area` VALUES ('450603', '防城区', 'Fangcheng', '450600');
INSERT INTO `area` VALUES ('450621', '上思县', 'Shangsi', '450600');
INSERT INTO `area` VALUES ('450681', '东兴市', 'Dongxing', '450600');
INSERT INTO `area` VALUES ('450700', '钦州市', 'Qinzhou', '450000');
INSERT INTO `area` VALUES ('450702', '钦南区', 'Qinnan', '450700');
INSERT INTO `area` VALUES ('450703', '钦北区', 'Qinbei', '450700');
INSERT INTO `area` VALUES ('450721', '灵山县', 'Lingshan', '450700');
INSERT INTO `area` VALUES ('450722', '浦北县', 'Pubei', '450700');
INSERT INTO `area` VALUES ('450800', '贵港市', 'Guigang', '450000');
INSERT INTO `area` VALUES ('450802', '港北区', 'Gangbei', '450800');
INSERT INTO `area` VALUES ('450803', '港南区', 'Gangnan', '450800');
INSERT INTO `area` VALUES ('450804', '覃塘区', 'Qintang', '450800');
INSERT INTO `area` VALUES ('450821', '平南县', 'Pingnan', '450800');
INSERT INTO `area` VALUES ('450881', '桂平市', 'Guiping', '450800');
INSERT INTO `area` VALUES ('450900', '玉林市', 'Yulin', '450000');
INSERT INTO `area` VALUES ('450902', '玉州区', 'Yuzhou', '450900');
INSERT INTO `area` VALUES ('450903', '福绵区', 'Fumian', '450900');
INSERT INTO `area` VALUES ('450904', '玉东新区', 'Yudong', '450900');
INSERT INTO `area` VALUES ('450921', '容县', 'Rongxian', '450900');
INSERT INTO `area` VALUES ('450922', '陆川县', 'Luchuan', '450900');
INSERT INTO `area` VALUES ('450923', '博白县', 'Bobai', '450900');
INSERT INTO `area` VALUES ('450924', '兴业县', 'Xingye', '450900');
INSERT INTO `area` VALUES ('450981', '北流市', 'Beiliu', '450900');
INSERT INTO `area` VALUES ('451000', '百色市', 'Baise', '450000');
INSERT INTO `area` VALUES ('451002', '右江区', 'Youjiang', '451000');
INSERT INTO `area` VALUES ('451021', '田阳县', 'Tianyang', '451000');
INSERT INTO `area` VALUES ('451022', '田东县', 'Tiandong', '451000');
INSERT INTO `area` VALUES ('451023', '平果县', 'Pingguo', '451000');
INSERT INTO `area` VALUES ('451024', '德保县', 'Debao', '451000');
INSERT INTO `area` VALUES ('451025', '靖西县', 'Jingxi', '451000');
INSERT INTO `area` VALUES ('451026', '那坡县', 'Napo', '451000');
INSERT INTO `area` VALUES ('451027', '凌云县', 'Lingyun', '451000');
INSERT INTO `area` VALUES ('451028', '乐业县', 'Leye', '451000');
INSERT INTO `area` VALUES ('451029', '田林县', 'Tianlin', '451000');
INSERT INTO `area` VALUES ('451030', '西林县', 'Xilin', '451000');
INSERT INTO `area` VALUES ('451031', '隆林各族自治县', 'Longlin', '451000');
INSERT INTO `area` VALUES ('451100', '贺州市', 'Hezhou', '450000');
INSERT INTO `area` VALUES ('451102', '八步区', 'Babu', '451100');
INSERT INTO `area` VALUES ('451121', '昭平县', 'Zhaoping', '451100');
INSERT INTO `area` VALUES ('451122', '钟山县', 'Zhongshan', '451100');
INSERT INTO `area` VALUES ('451123', '富川瑶族自治县', 'Fuchuan', '451100');
INSERT INTO `area` VALUES ('451124', '平桂管理区', 'Pingui', '451100');
INSERT INTO `area` VALUES ('451200', '河池市', 'Hechi', '450000');
INSERT INTO `area` VALUES ('451202', '金城江区', 'Jinchengjiang', '451200');
INSERT INTO `area` VALUES ('451221', '南丹县', 'Nandan', '451200');
INSERT INTO `area` VALUES ('451222', '天峨县', 'Tiane', '451200');
INSERT INTO `area` VALUES ('451223', '凤山县', 'Fengshan', '451200');
INSERT INTO `area` VALUES ('451224', '东兰县', 'Donglan', '451200');
INSERT INTO `area` VALUES ('451225', '罗城仫佬族自治县', 'Luocheng', '451200');
INSERT INTO `area` VALUES ('451226', '环江毛南族自治县', 'Huanjiang', '451200');
INSERT INTO `area` VALUES ('451227', '巴马瑶族自治县', 'Bama', '451200');
INSERT INTO `area` VALUES ('451228', '都安瑶族自治县', 'Du\'an', '451200');
INSERT INTO `area` VALUES ('451229', '大化瑶族自治县', 'Dahua', '451200');
INSERT INTO `area` VALUES ('451281', '宜州市', 'Yizhou', '451200');
INSERT INTO `area` VALUES ('451300', '来宾市', 'Laibin', '450000');
INSERT INTO `area` VALUES ('451302', '兴宾区', 'Xingbin', '451300');
INSERT INTO `area` VALUES ('451321', '忻城县', 'Xincheng', '451300');
INSERT INTO `area` VALUES ('451322', '象州县', 'Xiangzhou', '451300');
INSERT INTO `area` VALUES ('451323', '武宣县', 'Wuxuan', '451300');
INSERT INTO `area` VALUES ('451324', '金秀瑶族自治县', 'Jinxiu', '451300');
INSERT INTO `area` VALUES ('451381', '合山市', 'Heshan', '451300');
INSERT INTO `area` VALUES ('451400', '崇左市', 'Chongzuo', '450000');
INSERT INTO `area` VALUES ('451402', '江州区', 'Jiangzhou', '451400');
INSERT INTO `area` VALUES ('451421', '扶绥县', 'Fusui', '451400');
INSERT INTO `area` VALUES ('451422', '宁明县', 'Ningming', '451400');
INSERT INTO `area` VALUES ('451423', '龙州县', 'Longzhou', '451400');
INSERT INTO `area` VALUES ('451424', '大新县', 'Daxin', '451400');
INSERT INTO `area` VALUES ('451425', '天等县', 'Tiandeng', '451400');
INSERT INTO `area` VALUES ('451481', '凭祥市', 'Pingxiang', '451400');
INSERT INTO `area` VALUES ('460000', '海南省', 'Hainan', '0');
INSERT INTO `area` VALUES ('460100', '海口市', 'Haikou', '460000');
INSERT INTO `area` VALUES ('460105', '秀英区', 'Xiuying', '460100');
INSERT INTO `area` VALUES ('460106', '龙华区', 'Longhua', '460100');
INSERT INTO `area` VALUES ('460107', '琼山区', 'Qiongshan', '460100');
INSERT INTO `area` VALUES ('460108', '美兰区', 'Meilan', '460100');
INSERT INTO `area` VALUES ('460200', '三亚市', 'Sanya', '460000');
INSERT INTO `area` VALUES ('460202', '海棠区', 'Haitang', '460200');
INSERT INTO `area` VALUES ('460203', '吉阳区', 'Jiyang', '460200');
INSERT INTO `area` VALUES ('460204', '天涯区', 'Tianya', '460200');
INSERT INTO `area` VALUES ('460205', '崖州区', 'Yazhou', '460200');
INSERT INTO `area` VALUES ('460300', '三沙市', 'Sansha', '460000');
INSERT INTO `area` VALUES ('460321', '西沙群岛', 'Xisha Islands', '460300');
INSERT INTO `area` VALUES ('460322', '南沙群岛', 'Nansha Islands', '460300');
INSERT INTO `area` VALUES ('460323', '中沙群岛', 'Zhongsha Islands', '460300');
INSERT INTO `area` VALUES ('469000', '直辖县级', '', '460000');
INSERT INTO `area` VALUES ('469001', '五指山市', 'Wuzhishan', '469000');
INSERT INTO `area` VALUES ('469002', '琼海市', 'Qionghai', '469000');
INSERT INTO `area` VALUES ('469003', '儋州市', 'Danzhou', '469000');
INSERT INTO `area` VALUES ('469005', '文昌市', 'Wenchang', '469000');
INSERT INTO `area` VALUES ('469006', '万宁市', 'Wanning', '469000');
INSERT INTO `area` VALUES ('469007', '东方市', 'Dongfang', '469000');
INSERT INTO `area` VALUES ('469021', '定安县', 'Ding\'an', '469000');
INSERT INTO `area` VALUES ('469022', '屯昌县', 'Tunchang', '469000');
INSERT INTO `area` VALUES ('469023', '澄迈县', 'Chengmai', '469000');
INSERT INTO `area` VALUES ('469024', '临高县', 'Lingao', '469000');
INSERT INTO `area` VALUES ('469025', '白沙黎族自治县', 'Baisha', '469000');
INSERT INTO `area` VALUES ('469026', '昌江黎族自治县', 'Changjiang', '469000');
INSERT INTO `area` VALUES ('469027', '乐东黎族自治县', 'Ledong', '469000');
INSERT INTO `area` VALUES ('469028', '陵水黎族自治县', 'Lingshui', '469000');
INSERT INTO `area` VALUES ('469029', '保亭黎族苗族自治县', 'Baoting', '469000');
INSERT INTO `area` VALUES ('469030', '琼中黎族苗族自治县', 'Qiongzhong', '469000');
INSERT INTO `area` VALUES ('500000', '重庆', 'Chongqing', '0');
INSERT INTO `area` VALUES ('500100', '重庆市', 'Chongqing', '500000');
INSERT INTO `area` VALUES ('500101', '万州区', 'Wanzhou', '500100');
INSERT INTO `area` VALUES ('500102', '涪陵区', 'Fuling', '500100');
INSERT INTO `area` VALUES ('500103', '渝中区', 'Yuzhong', '500100');
INSERT INTO `area` VALUES ('500104', '大渡口区', 'Dadukou', '500100');
INSERT INTO `area` VALUES ('500105', '江北区', 'Jiangbei', '500100');
INSERT INTO `area` VALUES ('500106', '沙坪坝区', 'Shapingba', '500100');
INSERT INTO `area` VALUES ('500107', '九龙坡区', 'Jiulongpo', '500100');
INSERT INTO `area` VALUES ('500108', '南岸区', 'Nan\'an', '500100');
INSERT INTO `area` VALUES ('500109', '北碚区', 'Beibei', '500100');
INSERT INTO `area` VALUES ('500110', '綦江区', 'Qijiang', '500100');
INSERT INTO `area` VALUES ('500111', '大足区', 'Dazu', '500100');
INSERT INTO `area` VALUES ('500112', '渝北区', 'Yubei', '500100');
INSERT INTO `area` VALUES ('500113', '巴南区', 'Banan', '500100');
INSERT INTO `area` VALUES ('500114', '黔江区', 'Qianjiang', '500100');
INSERT INTO `area` VALUES ('500115', '长寿区', 'Changshou', '500100');
INSERT INTO `area` VALUES ('500116', '江津区', 'Jiangjin', '500100');
INSERT INTO `area` VALUES ('500117', '合川区', 'Hechuan', '500100');
INSERT INTO `area` VALUES ('500118', '永川区', 'Yongchuan', '500100');
INSERT INTO `area` VALUES ('500119', '南川区', 'Nanchuan', '500100');
INSERT INTO `area` VALUES ('500120', '璧山区', 'Bishan', '500100');
INSERT INTO `area` VALUES ('500151', '铜梁区', 'Tongliang', '500100');
INSERT INTO `area` VALUES ('500223', '潼南县', 'Tongnan', '500100');
INSERT INTO `area` VALUES ('500226', '荣昌县', 'Rongchang', '500100');
INSERT INTO `area` VALUES ('500228', '梁平县', 'Liangping', '500100');
INSERT INTO `area` VALUES ('500229', '城口县', 'Chengkou', '500100');
INSERT INTO `area` VALUES ('500230', '丰都县', 'Fengdu', '500100');
INSERT INTO `area` VALUES ('500231', '垫江县', 'Dianjiang', '500100');
INSERT INTO `area` VALUES ('500232', '武隆县', 'Wulong', '500100');
INSERT INTO `area` VALUES ('500233', '忠县', 'Zhongxian', '500100');
INSERT INTO `area` VALUES ('500234', '开县', 'Kaixian', '500100');
INSERT INTO `area` VALUES ('500235', '云阳县', 'Yunyang', '500100');
INSERT INTO `area` VALUES ('500236', '奉节县', 'Fengjie', '500100');
INSERT INTO `area` VALUES ('500237', '巫山县', 'Wushan', '500100');
INSERT INTO `area` VALUES ('500238', '巫溪县', 'Wuxi', '500100');
INSERT INTO `area` VALUES ('500240', '石柱土家族自治县', 'Shizhu', '500100');
INSERT INTO `area` VALUES ('500241', '秀山土家族苗族自治县', 'Xiushan', '500100');
INSERT INTO `area` VALUES ('500242', '酉阳土家族苗族自治县', 'Youyang', '500100');
INSERT INTO `area` VALUES ('500243', '彭水苗族土家族自治县', 'Pengshui', '500100');
INSERT INTO `area` VALUES ('500300', '两江新区', 'Liangjiangxinqu', '500000');
INSERT INTO `area` VALUES ('500301', '北部新区', 'Beibuxinqu', '500300');
INSERT INTO `area` VALUES ('500302', '保税港区', 'Baoshuigangqu', '500300');
INSERT INTO `area` VALUES ('500303', '工业园区', 'Gongyeyuanqu', '500300');
INSERT INTO `area` VALUES ('510000', '四川省', 'Sichuan', '0');
INSERT INTO `area` VALUES ('510100', '成都市', 'Chengdu', '510000');
INSERT INTO `area` VALUES ('510104', '锦江区', 'Jinjiang', '510100');
INSERT INTO `area` VALUES ('510105', '青羊区', 'Qingyang', '510100');
INSERT INTO `area` VALUES ('510106', '金牛区', 'Jinniu', '510100');
INSERT INTO `area` VALUES ('510107', '武侯区', 'Wuhou', '510100');
INSERT INTO `area` VALUES ('510108', '成华区', 'Chenghua', '510100');
INSERT INTO `area` VALUES ('510112', '龙泉驿区', 'Longquanyi', '510100');
INSERT INTO `area` VALUES ('510113', '青白江区', 'Qingbaijiang', '510100');
INSERT INTO `area` VALUES ('510114', '新都区', 'Xindu', '510100');
INSERT INTO `area` VALUES ('510115', '温江区', 'Wenjiang', '510100');
INSERT INTO `area` VALUES ('510121', '金堂县', 'Jintang', '510100');
INSERT INTO `area` VALUES ('510122', '双流县', 'Shuangliu', '510100');
INSERT INTO `area` VALUES ('510124', '郫县', 'Pixian', '510100');
INSERT INTO `area` VALUES ('510129', '大邑县', 'Dayi', '510100');
INSERT INTO `area` VALUES ('510131', '蒲江县', 'Pujiang', '510100');
INSERT INTO `area` VALUES ('510132', '新津县', 'Xinjin', '510100');
INSERT INTO `area` VALUES ('510181', '都江堰市', 'Dujiangyan', '510100');
INSERT INTO `area` VALUES ('510182', '彭州市', 'Pengzhou', '510100');
INSERT INTO `area` VALUES ('510183', '邛崃市', 'Qionglai', '510100');
INSERT INTO `area` VALUES ('510184', '崇州市', 'Chongzhou', '510100');
INSERT INTO `area` VALUES ('510300', '自贡市', 'Zigong', '510000');
INSERT INTO `area` VALUES ('510302', '自流井区', 'Ziliujing', '510300');
INSERT INTO `area` VALUES ('510303', '贡井区', 'Gongjing', '510300');
INSERT INTO `area` VALUES ('510304', '大安区', 'Da\'an', '510300');
INSERT INTO `area` VALUES ('510311', '沿滩区', 'Yantan', '510300');
INSERT INTO `area` VALUES ('510321', '荣县', 'Rongxian', '510300');
INSERT INTO `area` VALUES ('510322', '富顺县', 'Fushun', '510300');
INSERT INTO `area` VALUES ('510400', '攀枝花市', 'Panzhihua', '510000');
INSERT INTO `area` VALUES ('510402', '东区', 'Dongqu', '510400');
INSERT INTO `area` VALUES ('510403', '西区', 'Xiqu', '510400');
INSERT INTO `area` VALUES ('510411', '仁和区', 'Renhe', '510400');
INSERT INTO `area` VALUES ('510421', '米易县', 'Miyi', '510400');
INSERT INTO `area` VALUES ('510422', '盐边县', 'Yanbian', '510400');
INSERT INTO `area` VALUES ('510500', '泸州市', 'Luzhou', '510000');
INSERT INTO `area` VALUES ('510502', '江阳区', 'Jiangyang', '510500');
INSERT INTO `area` VALUES ('510503', '纳溪区', 'Naxi', '510500');
INSERT INTO `area` VALUES ('510504', '龙马潭区', 'Longmatan', '510500');
INSERT INTO `area` VALUES ('510521', '泸县', 'Luxian', '510500');
INSERT INTO `area` VALUES ('510522', '合江县', 'Hejiang', '510500');
INSERT INTO `area` VALUES ('510524', '叙永县', 'Xuyong', '510500');
INSERT INTO `area` VALUES ('510525', '古蔺县', 'Gulin', '510500');
INSERT INTO `area` VALUES ('510600', '德阳市', 'Deyang', '510000');
INSERT INTO `area` VALUES ('510603', '旌阳区', 'Jingyang', '510600');
INSERT INTO `area` VALUES ('510623', '中江县', 'Zhongjiang', '510600');
INSERT INTO `area` VALUES ('510626', '罗江县', 'Luojiang', '510600');
INSERT INTO `area` VALUES ('510681', '广汉市', 'Guanghan', '510600');
INSERT INTO `area` VALUES ('510682', '什邡市', 'Shifang', '510600');
INSERT INTO `area` VALUES ('510683', '绵竹市', 'Mianzhu', '510600');
INSERT INTO `area` VALUES ('510700', '绵阳市', 'Mianyang', '510000');
INSERT INTO `area` VALUES ('510703', '涪城区', 'Fucheng', '510700');
INSERT INTO `area` VALUES ('510704', '游仙区', 'Youxian', '510700');
INSERT INTO `area` VALUES ('510722', '三台县', 'Santai', '510700');
INSERT INTO `area` VALUES ('510723', '盐亭县', 'Yanting', '510700');
INSERT INTO `area` VALUES ('510724', '安县', 'Anxian', '510700');
INSERT INTO `area` VALUES ('510725', '梓潼县', 'Zitong', '510700');
INSERT INTO `area` VALUES ('510726', '北川羌族自治县', 'Beichuan', '510700');
INSERT INTO `area` VALUES ('510727', '平武县', 'Pingwu', '510700');
INSERT INTO `area` VALUES ('510781', '江油市', 'Jiangyou', '510700');
INSERT INTO `area` VALUES ('510800', '广元市', 'Guangyuan', '510000');
INSERT INTO `area` VALUES ('510802', '利州区', 'Lizhou', '510800');
INSERT INTO `area` VALUES ('510811', '昭化区', 'Zhaohua', '510800');
INSERT INTO `area` VALUES ('510812', '朝天区', 'Chaotian', '510800');
INSERT INTO `area` VALUES ('510821', '旺苍县', 'Wangcang', '510800');
INSERT INTO `area` VALUES ('510822', '青川县', 'Qingchuan', '510800');
INSERT INTO `area` VALUES ('510823', '剑阁县', 'Jiange', '510800');
INSERT INTO `area` VALUES ('510824', '苍溪县', 'Cangxi', '510800');
INSERT INTO `area` VALUES ('510900', '遂宁市', 'Suining', '510000');
INSERT INTO `area` VALUES ('510903', '船山区', 'Chuanshan', '510900');
INSERT INTO `area` VALUES ('510904', '安居区', 'Anju', '510900');
INSERT INTO `area` VALUES ('510921', '蓬溪县', 'Pengxi', '510900');
INSERT INTO `area` VALUES ('510922', '射洪县', 'Shehong', '510900');
INSERT INTO `area` VALUES ('510923', '大英县', 'Daying', '510900');
INSERT INTO `area` VALUES ('511000', '内江市', 'Neijiang', '510000');
INSERT INTO `area` VALUES ('511002', '市中区', 'Shizhongqu', '511000');
INSERT INTO `area` VALUES ('511011', '东兴区', 'Dongxing', '511000');
INSERT INTO `area` VALUES ('511024', '威远县', 'Weiyuan', '511000');
INSERT INTO `area` VALUES ('511025', '资中县', 'Zizhong', '511000');
INSERT INTO `area` VALUES ('511028', '隆昌县', 'Longchang', '511000');
INSERT INTO `area` VALUES ('511100', '乐山市', 'Leshan', '510000');
INSERT INTO `area` VALUES ('511102', '市中区', 'Shizhongqu', '511100');
INSERT INTO `area` VALUES ('511111', '沙湾区', 'Shawan', '511100');
INSERT INTO `area` VALUES ('511112', '五通桥区', 'Wutongqiao', '511100');
INSERT INTO `area` VALUES ('511113', '金口河区', 'Jinkouhe', '511100');
INSERT INTO `area` VALUES ('511123', '犍为县', 'Qianwei', '511100');
INSERT INTO `area` VALUES ('511124', '井研县', 'Jingyan', '511100');
INSERT INTO `area` VALUES ('511126', '夹江县', 'Jiajiang', '511100');
INSERT INTO `area` VALUES ('511129', '沐川县', 'Muchuan', '511100');
INSERT INTO `area` VALUES ('511132', '峨边彝族自治县', 'Ebian', '511100');
INSERT INTO `area` VALUES ('511133', '马边彝族自治县', 'Mabian', '511100');
INSERT INTO `area` VALUES ('511181', '峨眉山市', 'Emeishan', '511100');
INSERT INTO `area` VALUES ('511300', '南充市', 'Nanchong', '510000');
INSERT INTO `area` VALUES ('511302', '顺庆区', 'Shunqing', '511300');
INSERT INTO `area` VALUES ('511303', '高坪区', 'Gaoping', '511300');
INSERT INTO `area` VALUES ('511304', '嘉陵区', 'Jialing', '511300');
INSERT INTO `area` VALUES ('511321', '南部县', 'Nanbu', '511300');
INSERT INTO `area` VALUES ('511322', '营山县', 'Yingshan', '511300');
INSERT INTO `area` VALUES ('511323', '蓬安县', 'Peng\'an', '511300');
INSERT INTO `area` VALUES ('511324', '仪陇县', 'Yilong', '511300');
INSERT INTO `area` VALUES ('511325', '西充县', 'Xichong', '511300');
INSERT INTO `area` VALUES ('511381', '阆中市', 'Langzhong', '511300');
INSERT INTO `area` VALUES ('511400', '眉山市', 'Meishan', '510000');
INSERT INTO `area` VALUES ('511402', '东坡区', 'Dongpo', '511400');
INSERT INTO `area` VALUES ('511403', '彭山区', 'Pengshan', '511400');
INSERT INTO `area` VALUES ('511421', '仁寿县', 'Renshou', '511400');
INSERT INTO `area` VALUES ('511423', '洪雅县', 'Hongya', '511400');
INSERT INTO `area` VALUES ('511424', '丹棱县', 'Danling', '511400');
INSERT INTO `area` VALUES ('511425', '青神县', 'Qingshen', '511400');
INSERT INTO `area` VALUES ('511500', '宜宾市', 'Yibin', '510000');
INSERT INTO `area` VALUES ('511502', '翠屏区', 'Cuiping', '511500');
INSERT INTO `area` VALUES ('511503', '南溪区', 'Nanxi', '511500');
INSERT INTO `area` VALUES ('511521', '宜宾县', 'Yibin', '511500');
INSERT INTO `area` VALUES ('511523', '江安县', 'Jiang\'an', '511500');
INSERT INTO `area` VALUES ('511524', '长宁县', 'Changning', '511500');
INSERT INTO `area` VALUES ('511525', '高县', 'Gaoxian', '511500');
INSERT INTO `area` VALUES ('511526', '珙县', 'Gongxian', '511500');
INSERT INTO `area` VALUES ('511527', '筠连县', 'Junlian', '511500');
INSERT INTO `area` VALUES ('511528', '兴文县', 'Xingwen', '511500');
INSERT INTO `area` VALUES ('511529', '屏山县', 'Pingshan', '511500');
INSERT INTO `area` VALUES ('511600', '广安市', 'Guang\'an', '510000');
INSERT INTO `area` VALUES ('511602', '广安区', 'Guang\'an', '511600');
INSERT INTO `area` VALUES ('511603', '前锋区', 'Qianfeng', '511600');
INSERT INTO `area` VALUES ('511621', '岳池县', 'Yuechi', '511600');
INSERT INTO `area` VALUES ('511622', '武胜县', 'Wusheng', '511600');
INSERT INTO `area` VALUES ('511623', '邻水县', 'Linshui', '511600');
INSERT INTO `area` VALUES ('511681', '华蓥市', 'Huaying', '511600');
INSERT INTO `area` VALUES ('511700', '达州市', 'Dazhou', '510000');
INSERT INTO `area` VALUES ('511702', '通川区', 'Tongchuan', '511700');
INSERT INTO `area` VALUES ('511703', '达川区', 'Dachuan', '511700');
INSERT INTO `area` VALUES ('511722', '宣汉县', 'Xuanhan', '511700');
INSERT INTO `area` VALUES ('511723', '开江县', 'Kaijiang', '511700');
INSERT INTO `area` VALUES ('511724', '大竹县', 'Dazhu', '511700');
INSERT INTO `area` VALUES ('511725', '渠县', 'Quxian', '511700');
INSERT INTO `area` VALUES ('511781', '万源市', 'Wanyuan', '511700');
INSERT INTO `area` VALUES ('511800', '雅安市', 'Ya\'an', '510000');
INSERT INTO `area` VALUES ('511802', '雨城区', 'Yucheng', '511800');
INSERT INTO `area` VALUES ('511803', '名山区', 'Mingshan', '511800');
INSERT INTO `area` VALUES ('511822', '荥经县', 'Yingjing', '511800');
INSERT INTO `area` VALUES ('511823', '汉源县', 'Hanyuan', '511800');
INSERT INTO `area` VALUES ('511824', '石棉县', 'Shimian', '511800');
INSERT INTO `area` VALUES ('511825', '天全县', 'Tianquan', '511800');
INSERT INTO `area` VALUES ('511826', '芦山县', 'Lushan', '511800');
INSERT INTO `area` VALUES ('511827', '宝兴县', 'Baoxing', '511800');
INSERT INTO `area` VALUES ('511900', '巴中市', 'Bazhong', '510000');
INSERT INTO `area` VALUES ('511902', '巴州区', 'Bazhou', '511900');
INSERT INTO `area` VALUES ('511903', '恩阳区', 'Enyang', '511900');
INSERT INTO `area` VALUES ('511921', '通江县', 'Tongjiang', '511900');
INSERT INTO `area` VALUES ('511922', '南江县', 'Nanjiang', '511900');
INSERT INTO `area` VALUES ('511923', '平昌县', 'Pingchang', '511900');
INSERT INTO `area` VALUES ('512000', '资阳市', 'Ziyang', '510000');
INSERT INTO `area` VALUES ('512002', '雁江区', 'Yanjiang', '512000');
INSERT INTO `area` VALUES ('512021', '安岳县', 'Anyue', '512000');
INSERT INTO `area` VALUES ('512022', '乐至县', 'Lezhi', '512000');
INSERT INTO `area` VALUES ('512081', '简阳市', 'Jianyang', '512000');
INSERT INTO `area` VALUES ('513200', '阿坝藏族羌族自治州', 'Aba', '510000');
INSERT INTO `area` VALUES ('513221', '汶川县', 'Wenchuan', '513200');
INSERT INTO `area` VALUES ('513222', '理县', 'Lixian', '513200');
INSERT INTO `area` VALUES ('513223', '茂县', 'Maoxian', '513200');
INSERT INTO `area` VALUES ('513224', '松潘县', 'Songpan', '513200');
INSERT INTO `area` VALUES ('513225', '九寨沟县', 'Jiuzhaigou', '513200');
INSERT INTO `area` VALUES ('513226', '金川县', 'Jinchuan', '513200');
INSERT INTO `area` VALUES ('513227', '小金县', 'Xiaojin', '513200');
INSERT INTO `area` VALUES ('513228', '黑水县', 'Heishui', '513200');
INSERT INTO `area` VALUES ('513229', '马尔康县', 'Maerkang', '513200');
INSERT INTO `area` VALUES ('513230', '壤塘县', 'Rangtang', '513200');
INSERT INTO `area` VALUES ('513231', '阿坝县', 'Aba', '513200');
INSERT INTO `area` VALUES ('513232', '若尔盖县', 'Ruoergai', '513200');
INSERT INTO `area` VALUES ('513233', '红原县', 'Hongyuan', '513200');
INSERT INTO `area` VALUES ('513300', '甘孜藏族自治州', 'Garze', '510000');
INSERT INTO `area` VALUES ('513321', '康定县', 'Kangding', '513300');
INSERT INTO `area` VALUES ('513322', '泸定县', 'Luding', '513300');
INSERT INTO `area` VALUES ('513323', '丹巴县', 'Danba', '513300');
INSERT INTO `area` VALUES ('513324', '九龙县', 'Jiulong', '513300');
INSERT INTO `area` VALUES ('513325', '雅江县', 'Yajiang', '513300');
INSERT INTO `area` VALUES ('513326', '道孚县', 'Daofu', '513300');
INSERT INTO `area` VALUES ('513327', '炉霍县', 'Luhuo', '513300');
INSERT INTO `area` VALUES ('513328', '甘孜县', 'Ganzi', '513300');
INSERT INTO `area` VALUES ('513329', '新龙县', 'Xinlong', '513300');
INSERT INTO `area` VALUES ('513330', '德格县', 'Dege', '513300');
INSERT INTO `area` VALUES ('513331', '白玉县', 'Baiyu', '513300');
INSERT INTO `area` VALUES ('513332', '石渠县', 'Shiqu', '513300');
INSERT INTO `area` VALUES ('513333', '色达县', 'Seda', '513300');
INSERT INTO `area` VALUES ('513334', '理塘县', 'Litang', '513300');
INSERT INTO `area` VALUES ('513335', '巴塘县', 'Batang', '513300');
INSERT INTO `area` VALUES ('513336', '乡城县', 'Xiangcheng', '513300');
INSERT INTO `area` VALUES ('513337', '稻城县', 'Daocheng', '513300');
INSERT INTO `area` VALUES ('513338', '得荣县', 'Derong', '513300');
INSERT INTO `area` VALUES ('513400', '凉山彝族自治州', 'Liangshan', '510000');
INSERT INTO `area` VALUES ('513401', '西昌市', 'Xichang', '513400');
INSERT INTO `area` VALUES ('513422', '木里藏族自治县', 'Muli', '513400');
INSERT INTO `area` VALUES ('513423', '盐源县', 'Yanyuan', '513400');
INSERT INTO `area` VALUES ('513424', '德昌县', 'Dechang', '513400');
INSERT INTO `area` VALUES ('513425', '会理县', 'Huili', '513400');
INSERT INTO `area` VALUES ('513426', '会东县', 'Huidong', '513400');
INSERT INTO `area` VALUES ('513427', '宁南县', 'Ningnan', '513400');
INSERT INTO `area` VALUES ('513428', '普格县', 'Puge', '513400');
INSERT INTO `area` VALUES ('513429', '布拖县', 'Butuo', '513400');
INSERT INTO `area` VALUES ('513430', '金阳县', 'Jinyang', '513400');
INSERT INTO `area` VALUES ('513431', '昭觉县', 'Zhaojue', '513400');
INSERT INTO `area` VALUES ('513432', '喜德县', 'Xide', '513400');
INSERT INTO `area` VALUES ('513433', '冕宁县', 'Mianning', '513400');
INSERT INTO `area` VALUES ('513434', '越西县', 'Yuexi', '513400');
INSERT INTO `area` VALUES ('513435', '甘洛县', 'Ganluo', '513400');
INSERT INTO `area` VALUES ('513436', '美姑县', 'Meigu', '513400');
INSERT INTO `area` VALUES ('513437', '雷波县', 'Leibo', '513400');
INSERT INTO `area` VALUES ('520000', '贵州省', 'Guizhou', '0');
INSERT INTO `area` VALUES ('520100', '贵阳市', 'Guiyang', '520000');
INSERT INTO `area` VALUES ('520102', '南明区', 'Nanming', '520100');
INSERT INTO `area` VALUES ('520103', '云岩区', 'Yunyan', '520100');
INSERT INTO `area` VALUES ('520111', '花溪区', 'Huaxi', '520100');
INSERT INTO `area` VALUES ('520112', '乌当区', 'Wudang', '520100');
INSERT INTO `area` VALUES ('520113', '白云区', 'Baiyun', '520100');
INSERT INTO `area` VALUES ('520115', '观山湖区', 'Guanshanhu', '520100');
INSERT INTO `area` VALUES ('520121', '开阳县', 'Kaiyang', '520100');
INSERT INTO `area` VALUES ('520122', '息烽县', 'Xifeng', '520100');
INSERT INTO `area` VALUES ('520123', '修文县', 'Xiuwen', '520100');
INSERT INTO `area` VALUES ('520181', '清镇市', 'Qingzhen', '520100');
INSERT INTO `area` VALUES ('520200', '六盘水市', 'Liupanshui', '520000');
INSERT INTO `area` VALUES ('520201', '钟山区', 'Zhongshan', '520200');
INSERT INTO `area` VALUES ('520203', '六枝特区', 'Liuzhi', '520200');
INSERT INTO `area` VALUES ('520221', '水城县', 'Shuicheng', '520200');
INSERT INTO `area` VALUES ('520222', '盘县', 'Panxian', '520200');
INSERT INTO `area` VALUES ('520300', '遵义市', 'Zunyi', '520000');
INSERT INTO `area` VALUES ('520302', '红花岗区', 'Honghuagang', '520300');
INSERT INTO `area` VALUES ('520303', '汇川区', 'Huichuan', '520300');
INSERT INTO `area` VALUES ('520321', '遵义县', 'Zunyi', '520300');
INSERT INTO `area` VALUES ('520322', '桐梓县', 'Tongzi', '520300');
INSERT INTO `area` VALUES ('520323', '绥阳县', 'Suiyang', '520300');
INSERT INTO `area` VALUES ('520324', '正安县', 'Zheng\'an', '520300');
INSERT INTO `area` VALUES ('520325', '道真仡佬族苗族自治县', 'Daozhen', '520300');
INSERT INTO `area` VALUES ('520326', '务川仡佬族苗族自治县', 'Wuchuan', '520300');
INSERT INTO `area` VALUES ('520327', '凤冈县', 'Fenggang', '520300');
INSERT INTO `area` VALUES ('520328', '湄潭县', 'Meitan', '520300');
INSERT INTO `area` VALUES ('520329', '余庆县', 'Yuqing', '520300');
INSERT INTO `area` VALUES ('520330', '习水县', 'Xishui', '520300');
INSERT INTO `area` VALUES ('520381', '赤水市', 'Chishui', '520300');
INSERT INTO `area` VALUES ('520382', '仁怀市', 'Renhuai', '520300');
INSERT INTO `area` VALUES ('520400', '安顺市', 'Anshun', '520000');
INSERT INTO `area` VALUES ('520402', '西秀区', 'Xixiu', '520400');
INSERT INTO `area` VALUES ('520421', '平坝区', 'Pingba', '520400');
INSERT INTO `area` VALUES ('520422', '普定县', 'Puding', '520400');
INSERT INTO `area` VALUES ('520423', '镇宁布依族苗族自治县', 'Zhenning', '520400');
INSERT INTO `area` VALUES ('520424', '关岭布依族苗族自治县', 'Guanling', '520400');
INSERT INTO `area` VALUES ('520425', '紫云苗族布依族自治县', 'Ziyun', '520400');
INSERT INTO `area` VALUES ('520500', '毕节市', 'Bijie', '520000');
INSERT INTO `area` VALUES ('520502', '七星关区', 'Qixingguan', '520500');
INSERT INTO `area` VALUES ('520521', '大方县', 'Dafang', '520500');
INSERT INTO `area` VALUES ('520522', '黔西县', 'Qianxi', '520500');
INSERT INTO `area` VALUES ('520523', '金沙县', 'Jinsha', '520500');
INSERT INTO `area` VALUES ('520524', '织金县', 'Zhijin', '520500');
INSERT INTO `area` VALUES ('520525', '纳雍县', 'Nayong', '520500');
INSERT INTO `area` VALUES ('520526', '威宁彝族回族苗族自治县', 'Weining', '520500');
INSERT INTO `area` VALUES ('520527', '赫章县', 'Hezhang', '520500');
INSERT INTO `area` VALUES ('520600', '铜仁市', 'Tongren', '520000');
INSERT INTO `area` VALUES ('520602', '碧江区', 'Bijiang', '520600');
INSERT INTO `area` VALUES ('520603', '万山区', 'Wanshan', '520600');
INSERT INTO `area` VALUES ('520621', '江口县', 'Jiangkou', '520600');
INSERT INTO `area` VALUES ('520622', '玉屏侗族自治县', 'Yuping', '520600');
INSERT INTO `area` VALUES ('520623', '石阡县', 'Shiqian', '520600');
INSERT INTO `area` VALUES ('520624', '思南县', 'Sinan', '520600');
INSERT INTO `area` VALUES ('520625', '印江土家族苗族自治县', 'Yinjiang', '520600');
INSERT INTO `area` VALUES ('520626', '德江县', 'Dejiang', '520600');
INSERT INTO `area` VALUES ('520627', '沿河土家族自治县', 'Yuanhe', '520600');
INSERT INTO `area` VALUES ('520628', '松桃苗族自治县', 'Songtao', '520600');
INSERT INTO `area` VALUES ('522300', '黔西南布依族苗族自治州', 'Qianxinan', '520000');
INSERT INTO `area` VALUES ('522301', '兴义市 ', 'Xingyi', '522300');
INSERT INTO `area` VALUES ('522322', '兴仁县', 'Xingren', '522300');
INSERT INTO `area` VALUES ('522323', '普安县', 'Pu\'an', '522300');
INSERT INTO `area` VALUES ('522324', '晴隆县', 'Qinglong', '522300');
INSERT INTO `area` VALUES ('522325', '贞丰县', 'Zhenfeng', '522300');
INSERT INTO `area` VALUES ('522326', '望谟县', 'Wangmo', '522300');
INSERT INTO `area` VALUES ('522327', '册亨县', 'Ceheng', '522300');
INSERT INTO `area` VALUES ('522328', '安龙县', 'Anlong', '522300');
INSERT INTO `area` VALUES ('522600', '黔东南苗族侗族自治州', 'Qiandongnan', '520000');
INSERT INTO `area` VALUES ('522601', '凯里市', 'Kaili', '522600');
INSERT INTO `area` VALUES ('522622', '黄平县', 'Huangping', '522600');
INSERT INTO `area` VALUES ('522623', '施秉县', 'Shibing', '522600');
INSERT INTO `area` VALUES ('522624', '三穗县', 'Sansui', '522600');
INSERT INTO `area` VALUES ('522625', '镇远县', 'Zhenyuan', '522600');
INSERT INTO `area` VALUES ('522626', '岑巩县', 'Cengong', '522600');
INSERT INTO `area` VALUES ('522627', '天柱县', 'Tianzhu', '522600');
INSERT INTO `area` VALUES ('522628', '锦屏县', 'Jinping', '522600');
INSERT INTO `area` VALUES ('522629', '剑河县', 'Jianhe', '522600');
INSERT INTO `area` VALUES ('522630', '台江县', 'Taijiang', '522600');
INSERT INTO `area` VALUES ('522631', '黎平县', 'Liping', '522600');
INSERT INTO `area` VALUES ('522632', '榕江县', 'Rongjiang', '522600');
INSERT INTO `area` VALUES ('522633', '从江县', 'Congjiang', '522600');
INSERT INTO `area` VALUES ('522634', '雷山县', 'Leishan', '522600');
INSERT INTO `area` VALUES ('522635', '麻江县', 'Majiang', '522600');
INSERT INTO `area` VALUES ('522636', '丹寨县', 'Danzhai', '522600');
INSERT INTO `area` VALUES ('522700', '黔南布依族苗族自治州', 'Qiannan', '520000');
INSERT INTO `area` VALUES ('522701', '都匀市', 'Duyun', '522700');
INSERT INTO `area` VALUES ('522702', '福泉市', 'Fuquan', '522700');
INSERT INTO `area` VALUES ('522722', '荔波县', 'Libo', '522700');
INSERT INTO `area` VALUES ('522723', '贵定县', 'Guiding', '522700');
INSERT INTO `area` VALUES ('522725', '瓮安县', 'Weng\'an', '522700');
INSERT INTO `area` VALUES ('522726', '独山县', 'Dushan', '522700');
INSERT INTO `area` VALUES ('522727', '平塘县', 'Pingtang', '522700');
INSERT INTO `area` VALUES ('522728', '罗甸县', 'Luodian', '522700');
INSERT INTO `area` VALUES ('522729', '长顺县', 'Changshun', '522700');
INSERT INTO `area` VALUES ('522730', '龙里县', 'Longli', '522700');
INSERT INTO `area` VALUES ('522731', '惠水县', 'Huishui', '522700');
INSERT INTO `area` VALUES ('522732', '三都水族自治县', 'Sandu', '522700');
INSERT INTO `area` VALUES ('530000', '云南省', 'Yunnan', '0');
INSERT INTO `area` VALUES ('530100', '昆明市', 'Kunming', '530000');
INSERT INTO `area` VALUES ('530102', '五华区', 'Wuhua', '530100');
INSERT INTO `area` VALUES ('530103', '盘龙区', 'Panlong', '530100');
INSERT INTO `area` VALUES ('530111', '官渡区', 'Guandu', '530100');
INSERT INTO `area` VALUES ('530112', '西山区', 'Xishan', '530100');
INSERT INTO `area` VALUES ('530113', '东川区', 'Dongchuan', '530100');
INSERT INTO `area` VALUES ('530114', '呈贡区', 'Chenggong', '530100');
INSERT INTO `area` VALUES ('530122', '晋宁县', 'Jinning', '530100');
INSERT INTO `area` VALUES ('530124', '富民县', 'Fumin', '530100');
INSERT INTO `area` VALUES ('530125', '宜良县', 'Yiliang', '530100');
INSERT INTO `area` VALUES ('530126', '石林彝族自治县', 'Shilin', '530100');
INSERT INTO `area` VALUES ('530127', '嵩明县', 'Songming', '530100');
INSERT INTO `area` VALUES ('530128', '禄劝彝族苗族自治县', 'Luquan', '530100');
INSERT INTO `area` VALUES ('530129', '寻甸回族彝族自治县 ', 'Xundian', '530100');
INSERT INTO `area` VALUES ('530181', '安宁市', 'Anning', '530100');
INSERT INTO `area` VALUES ('530300', '曲靖市', 'Qujing', '530000');
INSERT INTO `area` VALUES ('530302', '麒麟区', 'Qilin', '530300');
INSERT INTO `area` VALUES ('530321', '马龙县', 'Malong', '530300');
INSERT INTO `area` VALUES ('530322', '陆良县', 'Luliang', '530300');
INSERT INTO `area` VALUES ('530323', '师宗县', 'Shizong', '530300');
INSERT INTO `area` VALUES ('530324', '罗平县', 'Luoping', '530300');
INSERT INTO `area` VALUES ('530325', '富源县', 'Fuyuan', '530300');
INSERT INTO `area` VALUES ('530326', '会泽县', 'Huize', '530300');
INSERT INTO `area` VALUES ('530328', '沾益县', 'Zhanyi', '530300');
INSERT INTO `area` VALUES ('530381', '宣威市', 'Xuanwei', '530300');
INSERT INTO `area` VALUES ('530400', '玉溪市', 'Yuxi', '530000');
INSERT INTO `area` VALUES ('530402', '红塔区', 'Hongta', '530400');
INSERT INTO `area` VALUES ('530421', '江川县', 'Jiangchuan', '530400');
INSERT INTO `area` VALUES ('530422', '澄江县', 'Chengjiang', '530400');
INSERT INTO `area` VALUES ('530423', '通海县', 'Tonghai', '530400');
INSERT INTO `area` VALUES ('530424', '华宁县', 'Huaning', '530400');
INSERT INTO `area` VALUES ('530425', '易门县', 'Yimen', '530400');
INSERT INTO `area` VALUES ('530426', '峨山彝族自治县', 'Eshan', '530400');
INSERT INTO `area` VALUES ('530427', '新平彝族傣族自治县', 'Xinping', '530400');
INSERT INTO `area` VALUES ('530428', '元江哈尼族彝族傣族自治县', 'Yuanjiang', '530400');
INSERT INTO `area` VALUES ('530500', '保山市', 'Baoshan', '530000');
INSERT INTO `area` VALUES ('530502', '隆阳区', 'Longyang', '530500');
INSERT INTO `area` VALUES ('530521', '施甸县', 'Shidian', '530500');
INSERT INTO `area` VALUES ('530522', '腾冲县', 'Tengchong', '530500');
INSERT INTO `area` VALUES ('530523', '龙陵县', 'Longling', '530500');
INSERT INTO `area` VALUES ('530524', '昌宁县', 'Changning', '530500');
INSERT INTO `area` VALUES ('530600', '昭通市', 'Zhaotong', '530000');
INSERT INTO `area` VALUES ('530602', '昭阳区', 'Zhaoyang', '530600');
INSERT INTO `area` VALUES ('530621', '鲁甸县', 'Ludian', '530600');
INSERT INTO `area` VALUES ('530622', '巧家县', 'Qiaojia', '530600');
INSERT INTO `area` VALUES ('530623', '盐津县', 'Yanjin', '530600');
INSERT INTO `area` VALUES ('530624', '大关县', 'Daguan', '530600');
INSERT INTO `area` VALUES ('530625', '永善县', 'Yongshan', '530600');
INSERT INTO `area` VALUES ('530626', '绥江县', 'Suijiang', '530600');
INSERT INTO `area` VALUES ('530627', '镇雄县', 'Zhenxiong', '530600');
INSERT INTO `area` VALUES ('530628', '彝良县', 'Yiliang', '530600');
INSERT INTO `area` VALUES ('530629', '威信县', 'Weixin', '530600');
INSERT INTO `area` VALUES ('530630', '水富县', 'Shuifu', '530600');
INSERT INTO `area` VALUES ('530700', '丽江市', 'Lijiang', '530000');
INSERT INTO `area` VALUES ('530702', '古城区', 'Gucheng', '530700');
INSERT INTO `area` VALUES ('530721', '玉龙纳西族自治县', 'Yulong', '530700');
INSERT INTO `area` VALUES ('530722', '永胜县', 'Yongsheng', '530700');
INSERT INTO `area` VALUES ('530723', '华坪县', 'Huaping', '530700');
INSERT INTO `area` VALUES ('530724', '宁蒗彝族自治县', 'Ninglang', '530700');
INSERT INTO `area` VALUES ('530800', '普洱市', 'Pu\'er', '530000');
INSERT INTO `area` VALUES ('530802', '思茅区', 'Simao', '530800');
INSERT INTO `area` VALUES ('530821', '宁洱哈尼族彝族自治县', 'Ninger', '530800');
INSERT INTO `area` VALUES ('530822', '墨江哈尼族自治县', 'Mojiang', '530800');
INSERT INTO `area` VALUES ('530823', '景东彝族自治县', 'Jingdong', '530800');
INSERT INTO `area` VALUES ('530824', '景谷傣族彝族自治县', 'Jinggu', '530800');
INSERT INTO `area` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', 'Zhenyuan', '530800');
INSERT INTO `area` VALUES ('530826', '江城哈尼族彝族自治县', 'Jiangcheng', '530800');
INSERT INTO `area` VALUES ('530827', '孟连傣族拉祜族佤族自治县', 'Menglian', '530800');
INSERT INTO `area` VALUES ('530828', '澜沧拉祜族自治县', 'Lancang', '530800');
INSERT INTO `area` VALUES ('530829', '西盟佤族自治县', 'Ximeng', '530800');
INSERT INTO `area` VALUES ('530900', '临沧市', 'Lincang', '530000');
INSERT INTO `area` VALUES ('530902', '临翔区', 'Linxiang', '530900');
INSERT INTO `area` VALUES ('530921', '凤庆县', 'Fengqing', '530900');
INSERT INTO `area` VALUES ('530922', '云县', 'Yunxian', '530900');
INSERT INTO `area` VALUES ('530923', '永德县', 'Yongde', '530900');
INSERT INTO `area` VALUES ('530924', '镇康县', 'Zhenkang', '530900');
INSERT INTO `area` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', 'Shuangjiang', '530900');
INSERT INTO `area` VALUES ('530926', '耿马傣族佤族自治县', 'Gengma', '530900');
INSERT INTO `area` VALUES ('530927', '沧源佤族自治县', 'Cangyuan', '530900');
INSERT INTO `area` VALUES ('532300', '楚雄彝族自治州', 'Chuxiong', '530000');
INSERT INTO `area` VALUES ('532301', '楚雄市', 'Chuxiong', '532300');
INSERT INTO `area` VALUES ('532322', '双柏县', 'Shuangbai', '532300');
INSERT INTO `area` VALUES ('532323', '牟定县', 'Mouding', '532300');
INSERT INTO `area` VALUES ('532324', '南华县', 'Nanhua', '532300');
INSERT INTO `area` VALUES ('532325', '姚安县', 'Yao\'an', '532300');
INSERT INTO `area` VALUES ('532326', '大姚县', 'Dayao', '532300');
INSERT INTO `area` VALUES ('532327', '永仁县', 'Yongren', '532300');
INSERT INTO `area` VALUES ('532328', '元谋县', 'Yuanmou', '532300');
INSERT INTO `area` VALUES ('532329', '武定县', 'Wuding', '532300');
INSERT INTO `area` VALUES ('532331', '禄丰县', 'Lufeng', '532300');
INSERT INTO `area` VALUES ('532500', '红河哈尼族彝族自治州', 'Honghe', '530000');
INSERT INTO `area` VALUES ('532501', '个旧市', 'Gejiu', '532500');
INSERT INTO `area` VALUES ('532502', '开远市', 'Kaiyuan', '532500');
INSERT INTO `area` VALUES ('532503', '蒙自市', 'Mengzi', '532500');
INSERT INTO `area` VALUES ('532504', '弥勒市', 'Mile ', '532500');
INSERT INTO `area` VALUES ('532523', '屏边苗族自治县', 'Pingbian', '532500');
INSERT INTO `area` VALUES ('532524', '建水县', 'Jianshui', '532500');
INSERT INTO `area` VALUES ('532525', '石屏县', 'Shiping', '532500');
INSERT INTO `area` VALUES ('532527', '泸西县', 'Luxi', '532500');
INSERT INTO `area` VALUES ('532528', '元阳县', 'Yuanyang', '532500');
INSERT INTO `area` VALUES ('532529', '红河县', 'Honghexian', '532500');
INSERT INTO `area` VALUES ('532530', '金平苗族瑶族傣族自治县', 'Jinping', '532500');
INSERT INTO `area` VALUES ('532531', '绿春县', 'Lvchun', '532500');
INSERT INTO `area` VALUES ('532532', '河口瑶族自治县', 'Hekou', '532500');
INSERT INTO `area` VALUES ('532600', '文山壮族苗族自治州', 'Wenshan', '530000');
INSERT INTO `area` VALUES ('532601', '文山市', 'Wenshan', '532600');
INSERT INTO `area` VALUES ('532622', '砚山县', 'Yanshan', '532600');
INSERT INTO `area` VALUES ('532623', '西畴县', 'Xichou', '532600');
INSERT INTO `area` VALUES ('532624', '麻栗坡县', 'Malipo', '532600');
INSERT INTO `area` VALUES ('532625', '马关县', 'Maguan', '532600');
INSERT INTO `area` VALUES ('532626', '丘北县', 'Qiubei', '532600');
INSERT INTO `area` VALUES ('532627', '广南县', 'Guangnan', '532600');
INSERT INTO `area` VALUES ('532628', '富宁县', 'Funing', '532600');
INSERT INTO `area` VALUES ('532800', '西双版纳傣族自治州', 'Xishuangbanna', '530000');
INSERT INTO `area` VALUES ('532801', '景洪市', 'Jinghong', '532800');
INSERT INTO `area` VALUES ('532822', '勐海县', 'Menghai', '532800');
INSERT INTO `area` VALUES ('532823', '勐腊县', 'Mengla', '532800');
INSERT INTO `area` VALUES ('532900', '大理白族自治州', 'Dali', '530000');
INSERT INTO `area` VALUES ('532901', '大理市', 'Dali', '532900');
INSERT INTO `area` VALUES ('532922', '漾濞彝族自治县', 'Yangbi', '532900');
INSERT INTO `area` VALUES ('532923', '祥云县', 'Xiangyun', '532900');
INSERT INTO `area` VALUES ('532924', '宾川县', 'Binchuan', '532900');
INSERT INTO `area` VALUES ('532925', '弥渡县', 'Midu', '532900');
INSERT INTO `area` VALUES ('532926', '南涧彝族自治县', 'Nanjian', '532900');
INSERT INTO `area` VALUES ('532927', '巍山彝族回族自治县', 'Weishan', '532900');
INSERT INTO `area` VALUES ('532928', '永平县', 'Yongping', '532900');
INSERT INTO `area` VALUES ('532929', '云龙县', 'Yunlong', '532900');
INSERT INTO `area` VALUES ('532930', '洱源县', 'Eryuan', '532900');
INSERT INTO `area` VALUES ('532931', '剑川县', 'Jianchuan', '532900');
INSERT INTO `area` VALUES ('532932', '鹤庆县', 'Heqing', '532900');
INSERT INTO `area` VALUES ('533100', '德宏傣族景颇族自治州', 'Dehong', '530000');
INSERT INTO `area` VALUES ('533102', '瑞丽市', 'Ruili', '533100');
INSERT INTO `area` VALUES ('533103', '芒市', 'Mangshi', '533100');
INSERT INTO `area` VALUES ('533122', '梁河县', 'Lianghe', '533100');
INSERT INTO `area` VALUES ('533123', '盈江县', 'Yingjiang', '533100');
INSERT INTO `area` VALUES ('533124', '陇川县', 'Longchuan', '533100');
INSERT INTO `area` VALUES ('533300', '怒江傈僳族自治州', 'Nujiang', '530000');
INSERT INTO `area` VALUES ('533321', '泸水县', 'Lushui', '533300');
INSERT INTO `area` VALUES ('533323', '福贡县', 'Fugong', '533300');
INSERT INTO `area` VALUES ('533324', '贡山独龙族怒族自治县', 'Gongshan', '533300');
INSERT INTO `area` VALUES ('533325', '兰坪白族普米族自治县', 'Lanping', '533300');
INSERT INTO `area` VALUES ('533400', '迪庆藏族自治州', 'Deqen', '530000');
INSERT INTO `area` VALUES ('533421', '香格里拉市', 'Xianggelila', '533400');
INSERT INTO `area` VALUES ('533422', '德钦县', 'Deqin', '533400');
INSERT INTO `area` VALUES ('533423', '维西傈僳族自治县', 'Weixi', '533400');
INSERT INTO `area` VALUES ('540000', '西藏自治区', 'Tibet', '0');
INSERT INTO `area` VALUES ('540100', '拉萨市', 'Lhasa', '540000');
INSERT INTO `area` VALUES ('540102', '城关区', 'Chengguan', '540100');
INSERT INTO `area` VALUES ('540121', '林周县', 'Linzhou', '540100');
INSERT INTO `area` VALUES ('540122', '当雄县', 'Dangxiong', '540100');
INSERT INTO `area` VALUES ('540123', '尼木县', 'Nimu', '540100');
INSERT INTO `area` VALUES ('540124', '曲水县', 'Qushui', '540100');
INSERT INTO `area` VALUES ('540125', '堆龙德庆县', 'Duilongdeqing', '540100');
INSERT INTO `area` VALUES ('540126', '达孜县', 'Dazi', '540100');
INSERT INTO `area` VALUES ('540127', '墨竹工卡县', 'Mozhugongka', '540100');
INSERT INTO `area` VALUES ('540200', '日喀则市', 'Rikaze', '540000');
INSERT INTO `area` VALUES ('540202', '桑珠孜区', 'Sangzhuzi', '540200');
INSERT INTO `area` VALUES ('540221', '南木林县', 'Nanmulin', '540200');
INSERT INTO `area` VALUES ('540222', '江孜县', 'Jiangzi', '540200');
INSERT INTO `area` VALUES ('540223', '定日县', 'Dingri', '540200');
INSERT INTO `area` VALUES ('540224', '萨迦县', 'Sajia', '540200');
INSERT INTO `area` VALUES ('540225', '拉孜县', 'Lazi', '540200');
INSERT INTO `area` VALUES ('540226', '昂仁县', 'Angren', '540200');
INSERT INTO `area` VALUES ('540227', '谢通门县', 'Xietongmen', '540200');
INSERT INTO `area` VALUES ('540228', '白朗县', 'Bailang', '540200');
INSERT INTO `area` VALUES ('540229', '仁布县', 'Renbu', '540200');
INSERT INTO `area` VALUES ('540230', '康马县', 'Kangma', '540200');
INSERT INTO `area` VALUES ('540231', '定结县', 'Dingjie', '540200');
INSERT INTO `area` VALUES ('540232', '仲巴县', 'Zhongba', '540200');
INSERT INTO `area` VALUES ('540233', '亚东县', 'Yadong', '540200');
INSERT INTO `area` VALUES ('540234', '吉隆县', 'Jilong', '540200');
INSERT INTO `area` VALUES ('540235', '聂拉木县', 'Nielamu', '540200');
INSERT INTO `area` VALUES ('540236', '萨嘎县', 'Saga', '540200');
INSERT INTO `area` VALUES ('540237', '岗巴县', 'Gangba', '540200');
INSERT INTO `area` VALUES ('540300', '昌都市', 'Qamdo', '540000');
INSERT INTO `area` VALUES ('540302', '卡若区', 'Karuo', '540300');
INSERT INTO `area` VALUES ('540321', '江达县', 'Jiangda', '540300');
INSERT INTO `area` VALUES ('540322', '贡觉县', 'Gongjue', '540300');
INSERT INTO `area` VALUES ('540323', '类乌齐县', 'Leiwuqi', '540300');
INSERT INTO `area` VALUES ('540324', '丁青县', 'Dingqing', '540300');
INSERT INTO `area` VALUES ('540325', '察雅县', 'Chaya', '540300');
INSERT INTO `area` VALUES ('540326', '八宿县', 'Basu', '540300');
INSERT INTO `area` VALUES ('540327', '左贡县', 'Zuogong', '540300');
INSERT INTO `area` VALUES ('540328', '芒康县', 'Mangkang', '540300');
INSERT INTO `area` VALUES ('540329', '洛隆县', 'Luolong', '540300');
INSERT INTO `area` VALUES ('540330', '边坝县', 'Bianba', '540300');
INSERT INTO `area` VALUES ('542200', '山南地区', 'Shannan', '540000');
INSERT INTO `area` VALUES ('542221', '乃东县', 'Naidong', '542200');
INSERT INTO `area` VALUES ('542222', '扎囊县', 'Zhanang', '542200');
INSERT INTO `area` VALUES ('542223', '贡嘎县', 'Gongga', '542200');
INSERT INTO `area` VALUES ('542224', '桑日县', 'Sangri', '542200');
INSERT INTO `area` VALUES ('542225', '琼结县', 'Qiongjie', '542200');
INSERT INTO `area` VALUES ('542226', '曲松县', 'Qusong', '542200');
INSERT INTO `area` VALUES ('542227', '措美县', 'Cuomei', '542200');
INSERT INTO `area` VALUES ('542228', '洛扎县', 'Luozha', '542200');
INSERT INTO `area` VALUES ('542229', '加查县', 'Jiacha', '542200');
INSERT INTO `area` VALUES ('542231', '隆子县', 'Longzi', '542200');
INSERT INTO `area` VALUES ('542232', '错那县', 'Cuona', '542200');
INSERT INTO `area` VALUES ('542233', '浪卡子县', 'Langkazi', '542200');
INSERT INTO `area` VALUES ('542400', '那曲地区', 'Nagqu', '540000');
INSERT INTO `area` VALUES ('542421', '那曲县', 'Naqu', '542400');
INSERT INTO `area` VALUES ('542422', '嘉黎县', 'Jiali', '542400');
INSERT INTO `area` VALUES ('542423', '比如县', 'Biru', '542400');
INSERT INTO `area` VALUES ('542424', '聂荣县', 'Nierong', '542400');
INSERT INTO `area` VALUES ('542425', '安多县', 'Anduo', '542400');
INSERT INTO `area` VALUES ('542426', '申扎县', 'Shenzha', '542400');
INSERT INTO `area` VALUES ('542427', '索县', 'Suoxian', '542400');
INSERT INTO `area` VALUES ('542428', '班戈县', 'Bange', '542400');
INSERT INTO `area` VALUES ('542429', '巴青县', 'Baqing', '542400');
INSERT INTO `area` VALUES ('542430', '尼玛县', 'Nima', '542400');
INSERT INTO `area` VALUES ('542431', '双湖县', 'Shuanghu', '542400');
INSERT INTO `area` VALUES ('542500', '阿里地区', 'Ngari', '540000');
INSERT INTO `area` VALUES ('542521', '普兰县', 'Pulan', '542500');
INSERT INTO `area` VALUES ('542522', '札达县', 'Zhada', '542500');
INSERT INTO `area` VALUES ('542523', '噶尔县', 'Gaer', '542500');
INSERT INTO `area` VALUES ('542524', '日土县', 'Ritu', '542500');
INSERT INTO `area` VALUES ('542525', '革吉县', 'Geji', '542500');
INSERT INTO `area` VALUES ('542526', '改则县', 'Gaize', '542500');
INSERT INTO `area` VALUES ('542527', '措勤县', 'Cuoqin', '542500');
INSERT INTO `area` VALUES ('542600', '林芝地区', 'Nyingchi', '540000');
INSERT INTO `area` VALUES ('542621', '林芝县', 'Linzhi', '542600');
INSERT INTO `area` VALUES ('542622', '工布江达县', 'Gongbujiangda', '542600');
INSERT INTO `area` VALUES ('542623', '米林县', 'Milin', '542600');
INSERT INTO `area` VALUES ('542624', '墨脱县', 'Motuo', '542600');
INSERT INTO `area` VALUES ('542625', '波密县', 'Bomi', '542600');
INSERT INTO `area` VALUES ('542626', '察隅县', 'Chayu', '542600');
INSERT INTO `area` VALUES ('542627', '朗县', 'Langxian', '542600');
INSERT INTO `area` VALUES ('610000', '陕西省', 'Shaanxi', '0');
INSERT INTO `area` VALUES ('610100', '西安市', 'Xi\'an', '610000');
INSERT INTO `area` VALUES ('610102', '新城区', 'Xincheng', '610100');
INSERT INTO `area` VALUES ('610103', '碑林区', 'Beilin', '610100');
INSERT INTO `area` VALUES ('610104', '莲湖区', 'Lianhu', '610100');
INSERT INTO `area` VALUES ('610111', '灞桥区', 'Baqiao', '610100');
INSERT INTO `area` VALUES ('610112', '未央区', 'Weiyang', '610100');
INSERT INTO `area` VALUES ('610113', '雁塔区', 'Yanta', '610100');
INSERT INTO `area` VALUES ('610114', '阎良区', 'Yanliang', '610100');
INSERT INTO `area` VALUES ('610115', '临潼区', 'Lintong', '610100');
INSERT INTO `area` VALUES ('610116', '长安区', 'Chang\'an', '610100');
INSERT INTO `area` VALUES ('610122', '蓝田县', 'Lantian', '610100');
INSERT INTO `area` VALUES ('610124', '周至县', 'Zhouzhi', '610100');
INSERT INTO `area` VALUES ('610125', '户县', 'Huxian', '610100');
INSERT INTO `area` VALUES ('610126', '高陵区', 'Gaoling', '610100');
INSERT INTO `area` VALUES ('610200', '铜川市', 'Tongchuan', '610000');
INSERT INTO `area` VALUES ('610202', '王益区', 'Wangyi', '610200');
INSERT INTO `area` VALUES ('610203', '印台区', 'Yintai', '610200');
INSERT INTO `area` VALUES ('610204', '耀州区', 'Yaozhou', '610200');
INSERT INTO `area` VALUES ('610222', '宜君县', 'Yijun', '610200');
INSERT INTO `area` VALUES ('610300', '宝鸡市', 'Baoji', '610000');
INSERT INTO `area` VALUES ('610302', '渭滨区', 'Weibin', '610300');
INSERT INTO `area` VALUES ('610303', '金台区', 'Jintai', '610300');
INSERT INTO `area` VALUES ('610304', '陈仓区', 'Chencang', '610300');
INSERT INTO `area` VALUES ('610322', '凤翔县', 'Fengxiang', '610300');
INSERT INTO `area` VALUES ('610323', '岐山县', 'Qishan', '610300');
INSERT INTO `area` VALUES ('610324', '扶风县', 'Fufeng', '610300');
INSERT INTO `area` VALUES ('610326', '眉县', 'Meixian', '610300');
INSERT INTO `area` VALUES ('610327', '陇县', 'Longxian', '610300');
INSERT INTO `area` VALUES ('610328', '千阳县', 'Qianyang', '610300');
INSERT INTO `area` VALUES ('610329', '麟游县', 'Linyou', '610300');
INSERT INTO `area` VALUES ('610330', '凤县', 'Fengxian', '610300');
INSERT INTO `area` VALUES ('610331', '太白县', 'Taibai', '610300');
INSERT INTO `area` VALUES ('610400', '咸阳市', 'Xianyang', '610000');
INSERT INTO `area` VALUES ('610402', '秦都区', 'Qindu', '610400');
INSERT INTO `area` VALUES ('610403', '杨陵区', 'Yangling', '610400');
INSERT INTO `area` VALUES ('610404', '渭城区', 'Weicheng', '610400');
INSERT INTO `area` VALUES ('610422', '三原县', 'Sanyuan', '610400');
INSERT INTO `area` VALUES ('610423', '泾阳县', 'Jingyang', '610400');
INSERT INTO `area` VALUES ('610424', '乾县', 'Qianxian', '610400');
INSERT INTO `area` VALUES ('610425', '礼泉县', 'Liquan', '610400');
INSERT INTO `area` VALUES ('610426', '永寿县', 'Yongshou', '610400');
INSERT INTO `area` VALUES ('610427', '彬县', 'Binxian', '610400');
INSERT INTO `area` VALUES ('610428', '长武县', 'Changwu', '610400');
INSERT INTO `area` VALUES ('610429', '旬邑县', 'Xunyi', '610400');
INSERT INTO `area` VALUES ('610430', '淳化县', 'Chunhua', '610400');
INSERT INTO `area` VALUES ('610431', '武功县', 'Wugong', '610400');
INSERT INTO `area` VALUES ('610481', '兴平市', 'Xingping', '610400');
INSERT INTO `area` VALUES ('610500', '渭南市', 'Weinan', '610000');
INSERT INTO `area` VALUES ('610502', '临渭区', 'Linwei', '610500');
INSERT INTO `area` VALUES ('610521', '华县', 'Huaxian', '610500');
INSERT INTO `area` VALUES ('610522', '潼关县', 'Tongguan', '610500');
INSERT INTO `area` VALUES ('610523', '大荔县', 'Dali', '610500');
INSERT INTO `area` VALUES ('610524', '合阳县', 'Heyang', '610500');
INSERT INTO `area` VALUES ('610525', '澄城县', 'Chengcheng', '610500');
INSERT INTO `area` VALUES ('610526', '蒲城县', 'Pucheng', '610500');
INSERT INTO `area` VALUES ('610527', '白水县', 'Baishui', '610500');
INSERT INTO `area` VALUES ('610528', '富平县', 'Fuping', '610500');
INSERT INTO `area` VALUES ('610581', '韩城市', 'Hancheng', '610500');
INSERT INTO `area` VALUES ('610582', '华阴市', 'Huayin', '610500');
INSERT INTO `area` VALUES ('610600', '延安市', 'Yan\'an', '610000');
INSERT INTO `area` VALUES ('610602', '宝塔区', 'Baota', '610600');
INSERT INTO `area` VALUES ('610621', '延长县', 'Yanchang', '610600');
INSERT INTO `area` VALUES ('610622', '延川县', 'Yanchuan', '610600');
INSERT INTO `area` VALUES ('610623', '子长县', 'Zichang', '610600');
INSERT INTO `area` VALUES ('610624', '安塞县', 'Ansai', '610600');
INSERT INTO `area` VALUES ('610625', '志丹县', 'Zhidan', '610600');
INSERT INTO `area` VALUES ('610626', '吴起县', 'Wuqi', '610600');
INSERT INTO `area` VALUES ('610627', '甘泉县', 'Ganquan', '610600');
INSERT INTO `area` VALUES ('610628', '富县', 'Fuxian', '610600');
INSERT INTO `area` VALUES ('610629', '洛川县', 'Luochuan', '610600');
INSERT INTO `area` VALUES ('610630', '宜川县', 'Yichuan', '610600');
INSERT INTO `area` VALUES ('610631', '黄龙县', 'Huanglong', '610600');
INSERT INTO `area` VALUES ('610632', '黄陵县', 'Huangling', '610600');
INSERT INTO `area` VALUES ('610700', '汉中市', 'Hanzhong', '610000');
INSERT INTO `area` VALUES ('610702', '汉台区', 'Hantai', '610700');
INSERT INTO `area` VALUES ('610721', '南郑县', 'Nanzheng', '610700');
INSERT INTO `area` VALUES ('610722', '城固县', 'Chenggu', '610700');
INSERT INTO `area` VALUES ('610723', '洋县', 'Yangxian', '610700');
INSERT INTO `area` VALUES ('610724', '西乡县', 'Xixiang', '610700');
INSERT INTO `area` VALUES ('610725', '勉县', 'Mianxian', '610700');
INSERT INTO `area` VALUES ('610726', '宁强县', 'Ningqiang', '610700');
INSERT INTO `area` VALUES ('610727', '略阳县', 'Lueyang', '610700');
INSERT INTO `area` VALUES ('610728', '镇巴县', 'Zhenba', '610700');
INSERT INTO `area` VALUES ('610729', '留坝县', 'Liuba', '610700');
INSERT INTO `area` VALUES ('610730', '佛坪县', 'Foping', '610700');
INSERT INTO `area` VALUES ('610800', '榆林市', 'Yulin', '610000');
INSERT INTO `area` VALUES ('610802', '榆阳区', 'Yuyang', '610800');
INSERT INTO `area` VALUES ('610821', '神木县', 'Shenmu', '610800');
INSERT INTO `area` VALUES ('610822', '府谷县', 'Fugu', '610800');
INSERT INTO `area` VALUES ('610823', '横山县', 'Hengshan', '610800');
INSERT INTO `area` VALUES ('610824', '靖边县', 'Jingbian', '610800');
INSERT INTO `area` VALUES ('610825', '定边县', 'Dingbian', '610800');
INSERT INTO `area` VALUES ('610826', '绥德县', 'Suide', '610800');
INSERT INTO `area` VALUES ('610827', '米脂县', 'Mizhi', '610800');
INSERT INTO `area` VALUES ('610828', '佳县', 'Jiaxian', '610800');
INSERT INTO `area` VALUES ('610829', '吴堡县', 'Wubu', '610800');
INSERT INTO `area` VALUES ('610830', '清涧县', 'Qingjian', '610800');
INSERT INTO `area` VALUES ('610831', '子洲县', 'Zizhou', '610800');
INSERT INTO `area` VALUES ('610900', '安康市', 'Ankang', '610000');
INSERT INTO `area` VALUES ('610902', '汉滨区', 'Hanbin', '610900');
INSERT INTO `area` VALUES ('610921', '汉阴县', 'Hanyin', '610900');
INSERT INTO `area` VALUES ('610922', '石泉县', 'Shiquan', '610900');
INSERT INTO `area` VALUES ('610923', '宁陕县', 'Ningshan', '610900');
INSERT INTO `area` VALUES ('610924', '紫阳县', 'Ziyang', '610900');
INSERT INTO `area` VALUES ('610925', '岚皋县', 'Langao', '610900');
INSERT INTO `area` VALUES ('610926', '平利县', 'Pingli', '610900');
INSERT INTO `area` VALUES ('610927', '镇坪县', 'Zhenping', '610900');
INSERT INTO `area` VALUES ('610928', '旬阳县', 'Xunyang', '610900');
INSERT INTO `area` VALUES ('610929', '白河县', 'Baihe', '610900');
INSERT INTO `area` VALUES ('611000', '商洛市', 'Shangluo', '610000');
INSERT INTO `area` VALUES ('611002', '商州区', 'Shangzhou', '611000');
INSERT INTO `area` VALUES ('611021', '洛南县', 'Luonan', '611000');
INSERT INTO `area` VALUES ('611022', '丹凤县', 'Danfeng', '611000');
INSERT INTO `area` VALUES ('611023', '商南县', 'Shangnan', '611000');
INSERT INTO `area` VALUES ('611024', '山阳县', 'Shanyang', '611000');
INSERT INTO `area` VALUES ('611025', '镇安县', 'Zhen\'an', '611000');
INSERT INTO `area` VALUES ('611026', '柞水县', 'Zhashui', '611000');
INSERT INTO `area` VALUES ('611100', '西咸新区', 'Xixian', '610000');
INSERT INTO `area` VALUES ('611101', '空港新城', 'Konggang', '611100');
INSERT INTO `area` VALUES ('611102', '沣东新城', 'Fengdong', '611100');
INSERT INTO `area` VALUES ('611103', '秦汉新城', 'Qinhan', '611100');
INSERT INTO `area` VALUES ('611104', '沣西新城', 'Fengxi', '611100');
INSERT INTO `area` VALUES ('611105', '泾河新城', 'Jinghe', '611100');
INSERT INTO `area` VALUES ('620000', '甘肃省', 'Gansu', '0');
INSERT INTO `area` VALUES ('620100', '兰州市', 'Lanzhou', '620000');
INSERT INTO `area` VALUES ('620102', '城关区', 'Chengguan', '620100');
INSERT INTO `area` VALUES ('620103', '七里河区', 'Qilihe', '620100');
INSERT INTO `area` VALUES ('620104', '西固区', 'Xigu', '620100');
INSERT INTO `area` VALUES ('620105', '安宁区', 'Anning', '620100');
INSERT INTO `area` VALUES ('620111', '红古区', 'Honggu', '620100');
INSERT INTO `area` VALUES ('620121', '永登县', 'Yongdeng', '620100');
INSERT INTO `area` VALUES ('620122', '皋兰县', 'Gaolan', '620100');
INSERT INTO `area` VALUES ('620123', '榆中县', 'Yuzhong', '620100');
INSERT INTO `area` VALUES ('620200', '嘉峪关市', 'Jiayuguan', '620000');
INSERT INTO `area` VALUES ('620201', '雄关区', 'Xiongguan', '620200');
INSERT INTO `area` VALUES ('620202', '长城区', 'Changcheng', '620200');
INSERT INTO `area` VALUES ('620203', '镜铁区', 'Jingtie', '620200');
INSERT INTO `area` VALUES ('620300', '金昌市', 'Jinchang', '620000');
INSERT INTO `area` VALUES ('620302', '金川区', 'Jinchuan', '620300');
INSERT INTO `area` VALUES ('620321', '永昌县', 'Yongchang', '620300');
INSERT INTO `area` VALUES ('620400', '白银市', 'Baiyin', '620000');
INSERT INTO `area` VALUES ('620402', '白银区', 'Baiyin', '620400');
INSERT INTO `area` VALUES ('620403', '平川区', 'Pingchuan', '620400');
INSERT INTO `area` VALUES ('620421', '靖远县', 'Jingyuan', '620400');
INSERT INTO `area` VALUES ('620422', '会宁县', 'Huining', '620400');
INSERT INTO `area` VALUES ('620423', '景泰县', 'Jingtai', '620400');
INSERT INTO `area` VALUES ('620500', '天水市', 'Tianshui', '620000');
INSERT INTO `area` VALUES ('620502', '秦州区', 'Qinzhou', '620500');
INSERT INTO `area` VALUES ('620503', '麦积区', 'Maiji', '620500');
INSERT INTO `area` VALUES ('620521', '清水县', 'Qingshui', '620500');
INSERT INTO `area` VALUES ('620522', '秦安县', 'Qin\'an', '620500');
INSERT INTO `area` VALUES ('620523', '甘谷县', 'Gangu', '620500');
INSERT INTO `area` VALUES ('620524', '武山县', 'Wushan', '620500');
INSERT INTO `area` VALUES ('620525', '张家川回族自治县', 'Zhangjiachuan', '620500');
INSERT INTO `area` VALUES ('620600', '武威市', 'Wuwei', '620000');
INSERT INTO `area` VALUES ('620602', '凉州区', 'Liangzhou', '620600');
INSERT INTO `area` VALUES ('620621', '民勤县', 'Minqin', '620600');
INSERT INTO `area` VALUES ('620622', '古浪县', 'Gulang', '620600');
INSERT INTO `area` VALUES ('620623', '天祝藏族自治县', 'Tianzhu', '620600');
INSERT INTO `area` VALUES ('620700', '张掖市', 'Zhangye', '620000');
INSERT INTO `area` VALUES ('620702', '甘州区', 'Ganzhou', '620700');
INSERT INTO `area` VALUES ('620721', '肃南裕固族自治县', 'Sunan', '620700');
INSERT INTO `area` VALUES ('620722', '民乐县', 'Minle', '620700');
INSERT INTO `area` VALUES ('620723', '临泽县', 'Linze', '620700');
INSERT INTO `area` VALUES ('620724', '高台县', 'Gaotai', '620700');
INSERT INTO `area` VALUES ('620725', '山丹县', 'Shandan', '620700');
INSERT INTO `area` VALUES ('620800', '平凉市', 'Pingliang', '620000');
INSERT INTO `area` VALUES ('620802', '崆峒区', 'Kongtong', '620800');
INSERT INTO `area` VALUES ('620821', '泾川县', 'Jingchuan', '620800');
INSERT INTO `area` VALUES ('620822', '灵台县', 'Lingtai', '620800');
INSERT INTO `area` VALUES ('620823', '崇信县', 'Chongxin', '620800');
INSERT INTO `area` VALUES ('620824', '华亭县', 'Huating', '620800');
INSERT INTO `area` VALUES ('620825', '庄浪县', 'Zhuanglang', '620800');
INSERT INTO `area` VALUES ('620826', '静宁县', 'Jingning', '620800');
INSERT INTO `area` VALUES ('620900', '酒泉市', 'Jiuquan', '620000');
INSERT INTO `area` VALUES ('620902', '肃州区', 'Suzhou', '620900');
INSERT INTO `area` VALUES ('620921', '金塔县', 'Jinta', '620900');
INSERT INTO `area` VALUES ('620922', '瓜州县', 'Guazhou', '620900');
INSERT INTO `area` VALUES ('620923', '肃北蒙古族自治县', 'Subei', '620900');
INSERT INTO `area` VALUES ('620924', '阿克塞哈萨克族自治县', 'Akesai', '620900');
INSERT INTO `area` VALUES ('620981', '玉门市', 'Yumen', '620900');
INSERT INTO `area` VALUES ('620982', '敦煌市', 'Dunhuang', '620900');
INSERT INTO `area` VALUES ('621000', '庆阳市', 'Qingyang', '620000');
INSERT INTO `area` VALUES ('621002', '西峰区', 'Xifeng', '621000');
INSERT INTO `area` VALUES ('621021', '庆城县', 'Qingcheng', '621000');
INSERT INTO `area` VALUES ('621022', '环县', 'Huanxian', '621000');
INSERT INTO `area` VALUES ('621023', '华池县', 'Huachi', '621000');
INSERT INTO `area` VALUES ('621024', '合水县', 'Heshui', '621000');
INSERT INTO `area` VALUES ('621025', '正宁县', 'Zhengning', '621000');
INSERT INTO `area` VALUES ('621026', '宁县', 'Ningxian', '621000');
INSERT INTO `area` VALUES ('621027', '镇原县', 'Zhenyuan', '621000');
INSERT INTO `area` VALUES ('621100', '定西市', 'Dingxi', '620000');
INSERT INTO `area` VALUES ('621102', '安定区', 'Anding', '621100');
INSERT INTO `area` VALUES ('621121', '通渭县', 'Tongwei', '621100');
INSERT INTO `area` VALUES ('621122', '陇西县', 'Longxi', '621100');
INSERT INTO `area` VALUES ('621123', '渭源县', 'Weiyuan', '621100');
INSERT INTO `area` VALUES ('621124', '临洮县', 'Lintao', '621100');
INSERT INTO `area` VALUES ('621125', '漳县', 'Zhangxian', '621100');
INSERT INTO `area` VALUES ('621126', '岷县', 'Minxian', '621100');
INSERT INTO `area` VALUES ('621200', '陇南市', 'Longnan', '620000');
INSERT INTO `area` VALUES ('621202', '武都区', 'Wudu', '621200');
INSERT INTO `area` VALUES ('621221', '成县', 'Chengxian', '621200');
INSERT INTO `area` VALUES ('621222', '文县', 'Wenxian', '621200');
INSERT INTO `area` VALUES ('621223', '宕昌县', 'Dangchang', '621200');
INSERT INTO `area` VALUES ('621224', '康县', 'Kangxian', '621200');
INSERT INTO `area` VALUES ('621225', '西和县', 'Xihe', '621200');
INSERT INTO `area` VALUES ('621226', '礼县', 'Lixian', '621200');
INSERT INTO `area` VALUES ('621227', '徽县', 'Huixian', '621200');
INSERT INTO `area` VALUES ('621228', '两当县', 'Liangdang', '621200');
INSERT INTO `area` VALUES ('622900', '临夏回族自治州', 'Linxia', '620000');
INSERT INTO `area` VALUES ('622901', '临夏市', 'Linxia', '622900');
INSERT INTO `area` VALUES ('622921', '临夏县', 'Linxia', '622900');
INSERT INTO `area` VALUES ('622922', '康乐县', 'Kangle', '622900');
INSERT INTO `area` VALUES ('622923', '永靖县', 'Yongjing', '622900');
INSERT INTO `area` VALUES ('622924', '广河县', 'Guanghe', '622900');
INSERT INTO `area` VALUES ('622925', '和政县', 'Hezheng', '622900');
INSERT INTO `area` VALUES ('622926', '东乡族自治县', 'Dongxiangzu', '622900');
INSERT INTO `area` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', 'Jishishan', '622900');
INSERT INTO `area` VALUES ('623000', '甘南藏族自治州', 'Gannan', '620000');
INSERT INTO `area` VALUES ('623001', '合作市', 'Hezuo', '623000');
INSERT INTO `area` VALUES ('623021', '临潭县', 'Lintan', '623000');
INSERT INTO `area` VALUES ('623022', '卓尼县', 'Zhuoni', '623000');
INSERT INTO `area` VALUES ('623023', '舟曲县', 'Zhouqu', '623000');
INSERT INTO `area` VALUES ('623024', '迭部县', 'Diebu', '623000');
INSERT INTO `area` VALUES ('623025', '玛曲县', 'Maqu', '623000');
INSERT INTO `area` VALUES ('623026', '碌曲县', 'Luqu', '623000');
INSERT INTO `area` VALUES ('623027', '夏河县', 'Xiahe', '623000');
INSERT INTO `area` VALUES ('630000', '青海省', 'Qinghai', '0');
INSERT INTO `area` VALUES ('630100', '西宁市', 'Xining', '630000');
INSERT INTO `area` VALUES ('630102', '城东区', 'Chengdong', '630100');
INSERT INTO `area` VALUES ('630103', '城中区', 'Chengzhong', '630100');
INSERT INTO `area` VALUES ('630104', '城西区', 'Chengxi', '630100');
INSERT INTO `area` VALUES ('630105', '城北区', 'Chengbei', '630100');
INSERT INTO `area` VALUES ('630121', '大通回族土族自治县', 'Datong', '630100');
INSERT INTO `area` VALUES ('630122', '湟中县', 'Huangzhong', '630100');
INSERT INTO `area` VALUES ('630123', '湟源县', 'Huangyuan', '630100');
INSERT INTO `area` VALUES ('630200', '海东市', 'Haidong', '630000');
INSERT INTO `area` VALUES ('630202', '乐都区', 'Ledu', '630200');
INSERT INTO `area` VALUES ('630221', '平安县', 'Ping\'an', '630200');
INSERT INTO `area` VALUES ('630222', '民和回族土族自治县', 'Minhe', '630200');
INSERT INTO `area` VALUES ('630223', '互助土族自治县', 'Huzhu', '630200');
INSERT INTO `area` VALUES ('630224', '化隆回族自治县', 'Hualong', '630200');
INSERT INTO `area` VALUES ('630225', '循化撒拉族自治县', 'Xunhua', '630200');
INSERT INTO `area` VALUES ('632200', '海北藏族自治州', 'Haibei', '630000');
INSERT INTO `area` VALUES ('632221', '门源回族自治县', 'Menyuan', '632200');
INSERT INTO `area` VALUES ('632222', '祁连县', 'Qilian', '632200');
INSERT INTO `area` VALUES ('632223', '海晏县', 'Haiyan', '632200');
INSERT INTO `area` VALUES ('632224', '刚察县', 'Gangcha', '632200');
INSERT INTO `area` VALUES ('632300', '黄南藏族自治州', 'Huangnan', '630000');
INSERT INTO `area` VALUES ('632321', '同仁县', 'Tongren', '632300');
INSERT INTO `area` VALUES ('632322', '尖扎县', 'Jianzha', '632300');
INSERT INTO `area` VALUES ('632323', '泽库县', 'Zeku', '632300');
INSERT INTO `area` VALUES ('632324', '河南蒙古族自治县', 'Henan', '632300');
INSERT INTO `area` VALUES ('632500', '海南藏族自治州', 'Hainan', '630000');
INSERT INTO `area` VALUES ('632521', '共和县', 'Gonghe', '632500');
INSERT INTO `area` VALUES ('632522', '同德县', 'Tongde', '632500');
INSERT INTO `area` VALUES ('632523', '贵德县', 'Guide', '632500');
INSERT INTO `area` VALUES ('632524', '兴海县', 'Xinghai', '632500');
INSERT INTO `area` VALUES ('632525', '贵南县', 'Guinan', '632500');
INSERT INTO `area` VALUES ('632600', '果洛藏族自治州', 'Golog', '630000');
INSERT INTO `area` VALUES ('632621', '玛沁县', 'Maqin', '632600');
INSERT INTO `area` VALUES ('632622', '班玛县', 'Banma', '632600');
INSERT INTO `area` VALUES ('632623', '甘德县', 'Gande', '632600');
INSERT INTO `area` VALUES ('632624', '达日县', 'Dari', '632600');
INSERT INTO `area` VALUES ('632625', '久治县', 'Jiuzhi', '632600');
INSERT INTO `area` VALUES ('632626', '玛多县', 'Maduo', '632600');
INSERT INTO `area` VALUES ('632700', '玉树藏族自治州', 'Yushu', '630000');
INSERT INTO `area` VALUES ('632701', '玉树市', 'Yushu', '632700');
INSERT INTO `area` VALUES ('632722', '杂多县', 'Zaduo', '632700');
INSERT INTO `area` VALUES ('632723', '称多县', 'Chenduo', '632700');
INSERT INTO `area` VALUES ('632724', '治多县', 'Zhiduo', '632700');
INSERT INTO `area` VALUES ('632725', '囊谦县', 'Nangqian', '632700');
INSERT INTO `area` VALUES ('632726', '曲麻莱县', 'Qumalai', '632700');
INSERT INTO `area` VALUES ('632800', '海西蒙古族藏族自治州', 'Haixi', '630000');
INSERT INTO `area` VALUES ('632801', '格尔木市', 'Geermu', '632800');
INSERT INTO `area` VALUES ('632802', '德令哈市', 'Delingha', '632800');
INSERT INTO `area` VALUES ('632821', '乌兰县', 'Wulan', '632800');
INSERT INTO `area` VALUES ('632822', '都兰县', 'Dulan', '632800');
INSERT INTO `area` VALUES ('632823', '天峻县', 'Tianjun', '632800');
INSERT INTO `area` VALUES ('640000', '宁夏回族自治区', 'Ningxia', '0');
INSERT INTO `area` VALUES ('640100', '银川市', 'Yinchuan', '640000');
INSERT INTO `area` VALUES ('640104', '兴庆区', 'Xingqing', '640100');
INSERT INTO `area` VALUES ('640105', '西夏区', 'Xixia', '640100');
INSERT INTO `area` VALUES ('640106', '金凤区', 'Jinfeng', '640100');
INSERT INTO `area` VALUES ('640121', '永宁县', 'Yongning', '640100');
INSERT INTO `area` VALUES ('640122', '贺兰县', 'Helan', '640100');
INSERT INTO `area` VALUES ('640181', '灵武市', 'Lingwu', '640100');
INSERT INTO `area` VALUES ('640200', '石嘴山市', 'Shizuishan', '640000');
INSERT INTO `area` VALUES ('640202', '大武口区', 'Dawukou', '640200');
INSERT INTO `area` VALUES ('640205', '惠农区', 'Huinong', '640200');
INSERT INTO `area` VALUES ('640221', '平罗县', 'Pingluo', '640200');
INSERT INTO `area` VALUES ('640300', '吴忠市', 'Wuzhong', '640000');
INSERT INTO `area` VALUES ('640302', '利通区', 'Litong', '640300');
INSERT INTO `area` VALUES ('640303', '红寺堡区', 'Hongsibao', '640300');
INSERT INTO `area` VALUES ('640323', '盐池县', 'Yanchi', '640300');
INSERT INTO `area` VALUES ('640324', '同心县', 'Tongxin', '640300');
INSERT INTO `area` VALUES ('640381', '青铜峡市', 'Qingtongxia', '640300');
INSERT INTO `area` VALUES ('640400', '固原市', 'Guyuan', '640000');
INSERT INTO `area` VALUES ('640402', '原州区', 'Yuanzhou', '640400');
INSERT INTO `area` VALUES ('640422', '西吉县', 'Xiji', '640400');
INSERT INTO `area` VALUES ('640423', '隆德县', 'Longde', '640400');
INSERT INTO `area` VALUES ('640424', '泾源县', 'Jingyuan', '640400');
INSERT INTO `area` VALUES ('640425', '彭阳县', 'Pengyang', '640400');
INSERT INTO `area` VALUES ('640500', '中卫市', 'Zhongwei', '640000');
INSERT INTO `area` VALUES ('640502', '沙坡头区', 'Shapotou', '640500');
INSERT INTO `area` VALUES ('640521', '中宁县', 'Zhongning', '640500');
INSERT INTO `area` VALUES ('640522', '海原县', 'Haiyuan', '640500');
INSERT INTO `area` VALUES ('650000', '新疆维吾尔自治区', 'Xinjiang', '0');
INSERT INTO `area` VALUES ('650100', '乌鲁木齐市', 'Urumqi', '650000');
INSERT INTO `area` VALUES ('650102', '天山区', 'Tianshan', '650100');
INSERT INTO `area` VALUES ('650103', '沙依巴克区', 'Shayibake', '650100');
INSERT INTO `area` VALUES ('650104', '新市区', 'Xinshi', '650100');
INSERT INTO `area` VALUES ('650105', '水磨沟区', 'Shuimogou', '650100');
INSERT INTO `area` VALUES ('650106', '头屯河区', 'Toutunhe', '650100');
INSERT INTO `area` VALUES ('650107', '达坂城区', 'Dabancheng', '650100');
INSERT INTO `area` VALUES ('650109', '米东区', 'Midong', '650100');
INSERT INTO `area` VALUES ('650121', '乌鲁木齐县', 'Wulumuqi', '650100');
INSERT INTO `area` VALUES ('650200', '克拉玛依市', 'Karamay', '650000');
INSERT INTO `area` VALUES ('650202', '独山子区', 'Dushanzi', '650200');
INSERT INTO `area` VALUES ('650203', '克拉玛依区', 'Kelamayi', '650200');
INSERT INTO `area` VALUES ('650204', '白碱滩区', 'Baijiantan', '650200');
INSERT INTO `area` VALUES ('650205', '乌尔禾区', 'Wuerhe', '650200');
INSERT INTO `area` VALUES ('652100', '吐鲁番地区', 'Turpan', '650000');
INSERT INTO `area` VALUES ('652101', '吐鲁番市', 'Tulufan', '652100');
INSERT INTO `area` VALUES ('652122', '鄯善县', 'Shanshan', '652100');
INSERT INTO `area` VALUES ('652123', '托克逊县', 'Tuokexun', '652100');
INSERT INTO `area` VALUES ('652200', '哈密地区', 'Hami', '650000');
INSERT INTO `area` VALUES ('652201', '哈密市', 'Hami', '652200');
INSERT INTO `area` VALUES ('652222', '巴里坤哈萨克自治县', 'Balikun', '652200');
INSERT INTO `area` VALUES ('652223', '伊吾县', 'Yiwu', '652200');
INSERT INTO `area` VALUES ('652300', '昌吉回族自治州', 'Changji', '650000');
INSERT INTO `area` VALUES ('652301', '昌吉市', 'Changji', '652300');
INSERT INTO `area` VALUES ('652302', '阜康市', 'Fukang', '652300');
INSERT INTO `area` VALUES ('652323', '呼图壁县', 'Hutubi', '652300');
INSERT INTO `area` VALUES ('652324', '玛纳斯县', 'Manasi', '652300');
INSERT INTO `area` VALUES ('652325', '奇台县', 'Qitai', '652300');
INSERT INTO `area` VALUES ('652327', '吉木萨尔县', 'Jimusaer', '652300');
INSERT INTO `area` VALUES ('652328', '木垒哈萨克自治县', 'Mulei', '652300');
INSERT INTO `area` VALUES ('652700', '博尔塔拉蒙古自治州', 'Bortala', '650000');
INSERT INTO `area` VALUES ('652701', '博乐市', 'Bole', '652700');
INSERT INTO `area` VALUES ('652702', '阿拉山口市', 'Alashankou', '652700');
INSERT INTO `area` VALUES ('652722', '精河县', 'Jinghe', '652700');
INSERT INTO `area` VALUES ('652723', '温泉县', 'Wenquan', '652700');
INSERT INTO `area` VALUES ('652800', '巴音郭楞蒙古自治州', 'Bayingol', '650000');
INSERT INTO `area` VALUES ('652801', '库尔勒市', 'Kuerle', '652800');
INSERT INTO `area` VALUES ('652822', '轮台县', 'Luntai', '652800');
INSERT INTO `area` VALUES ('652823', '尉犁县', 'Yuli', '652800');
INSERT INTO `area` VALUES ('652824', '若羌县', 'Ruoqiang', '652800');
INSERT INTO `area` VALUES ('652825', '且末县', 'Qiemo', '652800');
INSERT INTO `area` VALUES ('652826', '焉耆回族自治县', 'Yanqi', '652800');
INSERT INTO `area` VALUES ('652827', '和静县', 'Hejing', '652800');
INSERT INTO `area` VALUES ('652828', '和硕县', 'Heshuo', '652800');
INSERT INTO `area` VALUES ('652829', '博湖县', 'Bohu', '652800');
INSERT INTO `area` VALUES ('652900', '阿克苏地区', 'Aksu', '650000');
INSERT INTO `area` VALUES ('652901', '阿克苏市', 'Akesu', '652900');
INSERT INTO `area` VALUES ('652922', '温宿县', 'Wensu', '652900');
INSERT INTO `area` VALUES ('652923', '库车县', 'Kuche', '652900');
INSERT INTO `area` VALUES ('652924', '沙雅县', 'Shaya', '652900');
INSERT INTO `area` VALUES ('652925', '新和县', 'Xinhe', '652900');
INSERT INTO `area` VALUES ('652926', '拜城县', 'Baicheng', '652900');
INSERT INTO `area` VALUES ('652927', '乌什县', 'Wushi', '652900');
INSERT INTO `area` VALUES ('652928', '阿瓦提县', 'Awati', '652900');
INSERT INTO `area` VALUES ('652929', '柯坪县', 'Keping', '652900');
INSERT INTO `area` VALUES ('653000', '克孜勒苏柯尔克孜自治州', 'Kizilsu', '650000');
INSERT INTO `area` VALUES ('653001', '阿图什市', 'Atushi', '653000');
INSERT INTO `area` VALUES ('653022', '阿克陶县', 'Aketao', '653000');
INSERT INTO `area` VALUES ('653023', '阿合奇县', 'Aheqi', '653000');
INSERT INTO `area` VALUES ('653024', '乌恰县', 'Wuqia', '653000');
INSERT INTO `area` VALUES ('653100', '喀什地区', 'Kashgar', '650000');
INSERT INTO `area` VALUES ('653101', '喀什市', 'Kashi', '653100');
INSERT INTO `area` VALUES ('653121', '疏附县', 'Shufu', '653100');
INSERT INTO `area` VALUES ('653122', '疏勒县', 'Shule', '653100');
INSERT INTO `area` VALUES ('653123', '英吉沙县', 'Yingjisha', '653100');
INSERT INTO `area` VALUES ('653124', '泽普县', 'Zepu', '653100');
INSERT INTO `area` VALUES ('653125', '莎车县', 'Shache', '653100');
INSERT INTO `area` VALUES ('653126', '叶城县', 'Yecheng', '653100');
INSERT INTO `area` VALUES ('653127', '麦盖提县', 'Maigaiti', '653100');
INSERT INTO `area` VALUES ('653128', '岳普湖县', 'Yuepuhu', '653100');
INSERT INTO `area` VALUES ('653129', '伽师县', 'Jiashi', '653100');
INSERT INTO `area` VALUES ('653130', '巴楚县', 'Bachu', '653100');
INSERT INTO `area` VALUES ('653131', '塔什库尔干塔吉克自治县', 'Tashikuergantajike', '653100');
INSERT INTO `area` VALUES ('653200', '和田地区', 'Hotan', '650000');
INSERT INTO `area` VALUES ('653201', '和田市', 'Hetianshi', '653200');
INSERT INTO `area` VALUES ('653221', '和田县', 'Hetianxian', '653200');
INSERT INTO `area` VALUES ('653222', '墨玉县', 'Moyu', '653200');
INSERT INTO `area` VALUES ('653223', '皮山县', 'Pishan', '653200');
INSERT INTO `area` VALUES ('653224', '洛浦县', 'Luopu', '653200');
INSERT INTO `area` VALUES ('653225', '策勒县', 'Cele', '653200');
INSERT INTO `area` VALUES ('653226', '于田县', 'Yutian', '653200');
INSERT INTO `area` VALUES ('653227', '民丰县', 'Minfeng', '653200');
INSERT INTO `area` VALUES ('654000', '伊犁哈萨克自治州', 'Ili', '650000');
INSERT INTO `area` VALUES ('654002', '伊宁市', 'Yining', '654000');
INSERT INTO `area` VALUES ('654003', '奎屯市', 'Kuitun', '654000');
INSERT INTO `area` VALUES ('654004', '霍尔果斯市', 'Huoerguosi', '654000');
INSERT INTO `area` VALUES ('654021', '伊宁县', 'Yining', '654000');
INSERT INTO `area` VALUES ('654022', '察布查尔锡伯自治县', 'Chabuchaerxibo', '654000');
INSERT INTO `area` VALUES ('654023', '霍城县', 'Huocheng', '654000');
INSERT INTO `area` VALUES ('654024', '巩留县', 'Gongliu', '654000');
INSERT INTO `area` VALUES ('654025', '新源县', 'Xinyuan', '654000');
INSERT INTO `area` VALUES ('654026', '昭苏县', 'Zhaosu', '654000');
INSERT INTO `area` VALUES ('654027', '特克斯县', 'Tekesi', '654000');
INSERT INTO `area` VALUES ('654028', '尼勒克县', 'Nileke', '654000');
INSERT INTO `area` VALUES ('654200', '塔城地区', 'Qoqek', '650000');
INSERT INTO `area` VALUES ('654201', '塔城市', 'Tacheng', '654200');
INSERT INTO `area` VALUES ('654202', '乌苏市', 'Wusu', '654200');
INSERT INTO `area` VALUES ('654221', '额敏县', 'Emin', '654200');
INSERT INTO `area` VALUES ('654223', '沙湾县', 'Shawan', '654200');
INSERT INTO `area` VALUES ('654224', '托里县', 'Tuoli', '654200');
INSERT INTO `area` VALUES ('654225', '裕民县', 'Yumin', '654200');
INSERT INTO `area` VALUES ('654226', '和布克赛尔蒙古自治县', 'Hebukesaier', '654200');
INSERT INTO `area` VALUES ('654300', '阿勒泰地区', 'Altay', '650000');
INSERT INTO `area` VALUES ('654301', '阿勒泰市', 'Aletai', '654300');
INSERT INTO `area` VALUES ('654321', '布尔津县', 'Buerjin', '654300');
INSERT INTO `area` VALUES ('654322', '富蕴县', 'Fuyun', '654300');
INSERT INTO `area` VALUES ('654323', '福海县', 'Fuhai', '654300');
INSERT INTO `area` VALUES ('654324', '哈巴河县', 'Habahe', '654300');
INSERT INTO `area` VALUES ('654325', '青河县', 'Qinghe', '654300');
INSERT INTO `area` VALUES ('654326', '吉木乃县', 'Jimunai', '654300');
INSERT INTO `area` VALUES ('659000', '直辖县级', '', '650000');
INSERT INTO `area` VALUES ('659001', '石河子市', 'Shihezi', '659000');
INSERT INTO `area` VALUES ('659002', '阿拉尔市', 'Aral', '659000');
INSERT INTO `area` VALUES ('659003', '图木舒克市', 'Tumxuk', '659000');
INSERT INTO `area` VALUES ('659004', '五家渠市', 'Wujiaqu', '659000');
INSERT INTO `area` VALUES ('659005', '北屯市', 'Beitun', '659000');
INSERT INTO `area` VALUES ('659006', '铁门关市', 'Tiemenguan', '659000');
INSERT INTO `area` VALUES ('659007', '双河市', 'Shuanghe', '659000');
INSERT INTO `area` VALUES ('710000', '台湾', 'Taiwan', '0');
INSERT INTO `area` VALUES ('710100', '台北市', 'Taipei', '710000');
INSERT INTO `area` VALUES ('710101', '松山区', 'Songshan', '710100');
INSERT INTO `area` VALUES ('710102', '信义区', 'Xinyi', '710100');
INSERT INTO `area` VALUES ('710103', '大安区', 'Da\'an', '710100');
INSERT INTO `area` VALUES ('710104', '中山区', 'Zhongshan', '710100');
INSERT INTO `area` VALUES ('710105', '中正区', 'Zhongzheng', '710100');
INSERT INTO `area` VALUES ('710106', '大同区', 'Datong', '710100');
INSERT INTO `area` VALUES ('710107', '万华区', 'Wanhua', '710100');
INSERT INTO `area` VALUES ('710108', '文山区', 'Wenshan', '710100');
INSERT INTO `area` VALUES ('710109', '南港区', 'Nangang', '710100');
INSERT INTO `area` VALUES ('710110', '内湖区', 'Nahu', '710100');
INSERT INTO `area` VALUES ('710111', '士林区', 'Shilin', '710100');
INSERT INTO `area` VALUES ('710112', '北投区', 'Beitou', '710100');
INSERT INTO `area` VALUES ('710200', '高雄市', 'Kaohsiung', '710000');
INSERT INTO `area` VALUES ('710201', '盐埕区', 'Yancheng', '710200');
INSERT INTO `area` VALUES ('710202', '鼓山区', 'Gushan', '710200');
INSERT INTO `area` VALUES ('710203', '左营区', 'Zuoying', '710200');
INSERT INTO `area` VALUES ('710204', '楠梓区', 'Nanzi', '710200');
INSERT INTO `area` VALUES ('710205', '三民区', 'Sanmin', '710200');
INSERT INTO `area` VALUES ('710206', '新兴区', 'Xinxing', '710200');
INSERT INTO `area` VALUES ('710207', '前金区', 'Qianjin', '710200');
INSERT INTO `area` VALUES ('710208', '苓雅区', 'Lingya', '710200');
INSERT INTO `area` VALUES ('710209', '前镇区', 'Qianzhen', '710200');
INSERT INTO `area` VALUES ('710210', '旗津区', 'Qijin', '710200');
INSERT INTO `area` VALUES ('710211', '小港区', 'Xiaogang', '710200');
INSERT INTO `area` VALUES ('710212', '凤山区', 'Fengshan', '710200');
INSERT INTO `area` VALUES ('710213', '林园区', 'Linyuan', '710200');
INSERT INTO `area` VALUES ('710214', '大寮区', 'Daliao', '710200');
INSERT INTO `area` VALUES ('710215', '大树区', 'Dashu', '710200');
INSERT INTO `area` VALUES ('710216', '大社区', 'Dashe', '710200');
INSERT INTO `area` VALUES ('710217', '仁武区', 'Renwu', '710200');
INSERT INTO `area` VALUES ('710218', '鸟松区', 'Niaosong', '710200');
INSERT INTO `area` VALUES ('710219', '冈山区', 'Gangshan', '710200');
INSERT INTO `area` VALUES ('710220', '桥头区', 'Qiaotou', '710200');
INSERT INTO `area` VALUES ('710221', '燕巢区', 'Yanchao', '710200');
INSERT INTO `area` VALUES ('710222', '田寮区', 'Tianliao', '710200');
INSERT INTO `area` VALUES ('710223', '阿莲区', 'Alian', '710200');
INSERT INTO `area` VALUES ('710224', '路竹区', 'Luzhu', '710200');
INSERT INTO `area` VALUES ('710225', '湖内区', 'Huna', '710200');
INSERT INTO `area` VALUES ('710226', '茄萣区', 'Qieding', '710200');
INSERT INTO `area` VALUES ('710227', '永安区', 'Yong\'an', '710200');
INSERT INTO `area` VALUES ('710228', '弥陀区', 'Mituo', '710200');
INSERT INTO `area` VALUES ('710229', '梓官区', 'Ziguan', '710200');
INSERT INTO `area` VALUES ('710230', '旗山区', 'Qishan', '710200');
INSERT INTO `area` VALUES ('710231', '美浓区', 'Meinong', '710200');
INSERT INTO `area` VALUES ('710232', '六龟区', 'Liugui', '710200');
INSERT INTO `area` VALUES ('710233', '甲仙区', 'Jiaxian', '710200');
INSERT INTO `area` VALUES ('710234', '杉林区', 'Shanlin', '710200');
INSERT INTO `area` VALUES ('710235', '内门区', 'Namen', '710200');
INSERT INTO `area` VALUES ('710236', '茂林区', 'Maolin', '710200');
INSERT INTO `area` VALUES ('710237', '桃源区', 'Taoyuan', '710200');
INSERT INTO `area` VALUES ('710238', '那玛夏区', 'Namaxia', '710200');
INSERT INTO `area` VALUES ('710300', '基隆市', 'Keelung', '710000');
INSERT INTO `area` VALUES ('710301', '中正区', 'Zhongzheng', '710300');
INSERT INTO `area` VALUES ('710302', '七堵区', 'Qidu', '710300');
INSERT INTO `area` VALUES ('710303', '暖暖区', 'Nuannuan', '710300');
INSERT INTO `area` VALUES ('710304', '仁爱区', 'Renai', '710300');
INSERT INTO `area` VALUES ('710305', '中山区', 'Zhongshan', '710300');
INSERT INTO `area` VALUES ('710306', '安乐区', 'Anle', '710300');
INSERT INTO `area` VALUES ('710307', '信义区', 'Xinyi', '710300');
INSERT INTO `area` VALUES ('710400', '台中市', 'Taichung', '710000');
INSERT INTO `area` VALUES ('710401', '中区', 'Zhongqu', '710400');
INSERT INTO `area` VALUES ('710402', '东区', 'Dongqu', '710400');
INSERT INTO `area` VALUES ('710403', '南区', 'Nanqu', '710400');
INSERT INTO `area` VALUES ('710404', '西区', 'Xiqu', '710400');
INSERT INTO `area` VALUES ('710405', '北区', 'Beiqu', '710400');
INSERT INTO `area` VALUES ('710406', '西屯区', 'Xitun', '710400');
INSERT INTO `area` VALUES ('710407', '南屯区', 'Nantun', '710400');
INSERT INTO `area` VALUES ('710408', '北屯区', 'Beitun', '710400');
INSERT INTO `area` VALUES ('710409', '丰原区', 'Fengyuan', '710400');
INSERT INTO `area` VALUES ('710410', '东势区', 'Dongshi', '710400');
INSERT INTO `area` VALUES ('710411', '大甲区', 'Dajia', '710400');
INSERT INTO `area` VALUES ('710412', '清水区', 'Qingshui', '710400');
INSERT INTO `area` VALUES ('710413', '沙鹿区', 'Shalu', '710400');
INSERT INTO `area` VALUES ('710414', '梧栖区', 'Wuqi', '710400');
INSERT INTO `area` VALUES ('710415', '后里区', 'Houli', '710400');
INSERT INTO `area` VALUES ('710416', '神冈区', 'Shengang', '710400');
INSERT INTO `area` VALUES ('710417', '潭子区', 'Tanzi', '710400');
INSERT INTO `area` VALUES ('710418', '大雅区', 'Daya', '710400');
INSERT INTO `area` VALUES ('710419', '新社区', 'Xinshe', '710400');
INSERT INTO `area` VALUES ('710420', '石冈区', 'Shigang', '710400');
INSERT INTO `area` VALUES ('710421', '外埔区', 'Waipu', '710400');
INSERT INTO `area` VALUES ('710422', '大安区', 'Da\'an', '710400');
INSERT INTO `area` VALUES ('710423', '乌日区', 'Wuri', '710400');
INSERT INTO `area` VALUES ('710424', '大肚区', 'Dadu', '710400');
INSERT INTO `area` VALUES ('710425', '龙井区', 'Longjing', '710400');
INSERT INTO `area` VALUES ('710426', '雾峰区', 'Wufeng', '710400');
INSERT INTO `area` VALUES ('710427', '太平区', 'Taiping', '710400');
INSERT INTO `area` VALUES ('710428', '大里区', 'Dali', '710400');
INSERT INTO `area` VALUES ('710429', '和平区', 'Heping', '710400');
INSERT INTO `area` VALUES ('710500', '台南市', 'Tainan', '710000');
INSERT INTO `area` VALUES ('710501', '东区', 'Dongqu', '710500');
INSERT INTO `area` VALUES ('710502', '南区', 'Nanqu', '710500');
INSERT INTO `area` VALUES ('710504', '北区', 'Beiqu', '710500');
INSERT INTO `area` VALUES ('710506', '安南区', 'Annan', '710500');
INSERT INTO `area` VALUES ('710507', '安平区', 'Anping', '710500');
INSERT INTO `area` VALUES ('710508', '中西区', 'Zhongxi', '710500');
INSERT INTO `area` VALUES ('710509', '新营区', 'Xinying', '710500');
INSERT INTO `area` VALUES ('710510', '盐水区', 'Yanshui', '710500');
INSERT INTO `area` VALUES ('710511', '白河区', 'Baihe', '710500');
INSERT INTO `area` VALUES ('710512', '柳营区', 'Liuying', '710500');
INSERT INTO `area` VALUES ('710513', '后壁区', 'Houbi', '710500');
INSERT INTO `area` VALUES ('710514', '东山区', 'Dongshan', '710500');
INSERT INTO `area` VALUES ('710515', '麻豆区', 'Madou', '710500');
INSERT INTO `area` VALUES ('710516', '下营区', 'Xiaying', '710500');
INSERT INTO `area` VALUES ('710517', '六甲区', 'Liujia', '710500');
INSERT INTO `area` VALUES ('710518', '官田区', 'Guantian', '710500');
INSERT INTO `area` VALUES ('710519', '大内区', 'Dana', '710500');
INSERT INTO `area` VALUES ('710520', '佳里区', 'Jiali', '710500');
INSERT INTO `area` VALUES ('710521', '学甲区', 'Xuejia', '710500');
INSERT INTO `area` VALUES ('710522', '西港区', 'Xigang', '710500');
INSERT INTO `area` VALUES ('710523', '七股区', 'Qigu', '710500');
INSERT INTO `area` VALUES ('710524', '将军区', 'Jiangjun', '710500');
INSERT INTO `area` VALUES ('710525', '北门区', 'Beimen', '710500');
INSERT INTO `area` VALUES ('710526', '新化区', 'Xinhua', '710500');
INSERT INTO `area` VALUES ('710527', '善化区', 'Shanhua', '710500');
INSERT INTO `area` VALUES ('710528', '新市区', 'Xinshi', '710500');
INSERT INTO `area` VALUES ('710529', '安定区', 'Anding', '710500');
INSERT INTO `area` VALUES ('710530', '山上区', 'Shanshang', '710500');
INSERT INTO `area` VALUES ('710531', '玉井区', 'Yujing', '710500');
INSERT INTO `area` VALUES ('710532', '楠西区', 'Nanxi', '710500');
INSERT INTO `area` VALUES ('710533', '南化区', 'Nanhua', '710500');
INSERT INTO `area` VALUES ('710534', '左镇区', 'Zuozhen', '710500');
INSERT INTO `area` VALUES ('710535', '仁德区', 'Rende', '710500');
INSERT INTO `area` VALUES ('710536', '归仁区', 'Guiren', '710500');
INSERT INTO `area` VALUES ('710537', '关庙区', 'Guanmiao', '710500');
INSERT INTO `area` VALUES ('710538', '龙崎区', 'Longqi', '710500');
INSERT INTO `area` VALUES ('710539', '永康区', 'Yongkang', '710500');
INSERT INTO `area` VALUES ('710600', '新竹市', 'Hsinchu', '710000');
INSERT INTO `area` VALUES ('710601', '东区', 'Dongqu', '710600');
INSERT INTO `area` VALUES ('710602', '北区', 'Beiqu', '710600');
INSERT INTO `area` VALUES ('710603', '香山区', 'Xiangshan', '710600');
INSERT INTO `area` VALUES ('710700', '嘉义市', 'Chiayi', '710000');
INSERT INTO `area` VALUES ('710701', '东区', 'Dongqu', '710700');
INSERT INTO `area` VALUES ('710702', '西区', 'Xiqu', '710700');
INSERT INTO `area` VALUES ('710800', '新北市', 'New Taipei', '710000');
INSERT INTO `area` VALUES ('710801', '板桥区', 'Banqiao', '710800');
INSERT INTO `area` VALUES ('710802', '三重区', 'Sanzhong', '710800');
INSERT INTO `area` VALUES ('710803', '中和区', 'Zhonghe', '710800');
INSERT INTO `area` VALUES ('710804', '永和区', 'Yonghe', '710800');
INSERT INTO `area` VALUES ('710805', '新庄区', 'Xinzhuang', '710800');
INSERT INTO `area` VALUES ('710806', '新店区', 'Xindian', '710800');
INSERT INTO `area` VALUES ('710807', '树林区', 'Shulin', '710800');
INSERT INTO `area` VALUES ('710808', '莺歌区', 'Yingge', '710800');
INSERT INTO `area` VALUES ('710809', '三峡区', 'Sanxia', '710800');
INSERT INTO `area` VALUES ('710810', '淡水区', 'Danshui', '710800');
INSERT INTO `area` VALUES ('710811', '汐止区', 'Xizhi', '710800');
INSERT INTO `area` VALUES ('710812', '瑞芳区', 'Ruifang', '710800');
INSERT INTO `area` VALUES ('710813', '土城区', 'Tucheng', '710800');
INSERT INTO `area` VALUES ('710814', '芦洲区', 'Luzhou', '710800');
INSERT INTO `area` VALUES ('710815', '五股区', 'Wugu', '710800');
INSERT INTO `area` VALUES ('710816', '泰山区', 'Taishan', '710800');
INSERT INTO `area` VALUES ('710817', '林口区', 'Linkou', '710800');
INSERT INTO `area` VALUES ('710818', '深坑区', 'Shenkeng', '710800');
INSERT INTO `area` VALUES ('710819', '石碇区', 'Shiding', '710800');
INSERT INTO `area` VALUES ('710820', '坪林区', 'Pinglin', '710800');
INSERT INTO `area` VALUES ('710821', '三芝区', 'Sanzhi', '710800');
INSERT INTO `area` VALUES ('710822', '石门区', 'Shimen', '710800');
INSERT INTO `area` VALUES ('710823', '八里区', 'Bali', '710800');
INSERT INTO `area` VALUES ('710824', '平溪区', 'Pingxi', '710800');
INSERT INTO `area` VALUES ('710825', '双溪区', 'Shuangxi', '710800');
INSERT INTO `area` VALUES ('710826', '贡寮区', 'Gongliao', '710800');
INSERT INTO `area` VALUES ('710827', '金山区', 'Jinshan', '710800');
INSERT INTO `area` VALUES ('710828', '万里区', 'Wanli', '710800');
INSERT INTO `area` VALUES ('710829', '乌来区', 'Wulai', '710800');
INSERT INTO `area` VALUES ('712200', '宜兰县', 'Yilan', '710000');
INSERT INTO `area` VALUES ('712201', '宜兰市', 'Yilan', '712200');
INSERT INTO `area` VALUES ('712221', '罗东镇', 'Luodong', '712200');
INSERT INTO `area` VALUES ('712222', '苏澳镇', 'Suao', '712200');
INSERT INTO `area` VALUES ('712223', '头城镇', 'Toucheng', '712200');
INSERT INTO `area` VALUES ('712224', '礁溪乡', 'Jiaoxi', '712200');
INSERT INTO `area` VALUES ('712225', '壮围乡', 'Zhuangwei', '712200');
INSERT INTO `area` VALUES ('712226', '员山乡', 'Yuanshan', '712200');
INSERT INTO `area` VALUES ('712227', '冬山乡', 'Dongshan', '712200');
INSERT INTO `area` VALUES ('712228', '五结乡', 'Wujie', '712200');
INSERT INTO `area` VALUES ('712229', '三星乡', 'Sanxing', '712200');
INSERT INTO `area` VALUES ('712230', '大同乡', 'Datong', '712200');
INSERT INTO `area` VALUES ('712231', '南澳乡', 'Nanao', '712200');
INSERT INTO `area` VALUES ('712300', '桃园县', 'Taoyuan', '710000');
INSERT INTO `area` VALUES ('712301', '桃园市', 'Taoyuan', '712300');
INSERT INTO `area` VALUES ('712302', '中坜市', 'Zhongli', '712300');
INSERT INTO `area` VALUES ('712303', '平镇市', 'Pingzhen', '712300');
INSERT INTO `area` VALUES ('712304', '八德市', 'Bade', '712300');
INSERT INTO `area` VALUES ('712305', '杨梅市', 'Yangmei', '712300');
INSERT INTO `area` VALUES ('712306', '芦竹市', 'Luzhu', '712300');
INSERT INTO `area` VALUES ('712321', '大溪镇', 'Daxi', '712300');
INSERT INTO `area` VALUES ('712324', '大园乡', 'Dayuan', '712300');
INSERT INTO `area` VALUES ('712325', '龟山乡', 'Guishan', '712300');
INSERT INTO `area` VALUES ('712327', '龙潭乡', 'Longtan', '712300');
INSERT INTO `area` VALUES ('712329', '新屋乡', 'Xinwu', '712300');
INSERT INTO `area` VALUES ('712330', '观音乡', 'Guanyin', '712300');
INSERT INTO `area` VALUES ('712331', '复兴乡', 'Fuxing', '712300');
INSERT INTO `area` VALUES ('712400', '新竹县', 'Hsinchu', '710000');
INSERT INTO `area` VALUES ('712401', '竹北市', 'Zhubei', '712400');
INSERT INTO `area` VALUES ('712421', '竹东镇', 'Zhudong', '712400');
INSERT INTO `area` VALUES ('712422', '新埔镇', 'Xinpu', '712400');
INSERT INTO `area` VALUES ('712423', '关西镇', 'Guanxi', '712400');
INSERT INTO `area` VALUES ('712424', '湖口乡', 'Hukou', '712400');
INSERT INTO `area` VALUES ('712425', '新丰乡', 'Xinfeng', '712400');
INSERT INTO `area` VALUES ('712426', '芎林乡', 'Xionglin', '712400');
INSERT INTO `area` VALUES ('712427', '横山乡', 'Hengshan', '712400');
INSERT INTO `area` VALUES ('712428', '北埔乡', 'Beipu', '712400');
INSERT INTO `area` VALUES ('712429', '宝山乡', 'Baoshan', '712400');
INSERT INTO `area` VALUES ('712430', '峨眉乡', 'Emei', '712400');
INSERT INTO `area` VALUES ('712431', '尖石乡', 'Jianshi', '712400');
INSERT INTO `area` VALUES ('712432', '五峰乡', 'Wufeng', '712400');
INSERT INTO `area` VALUES ('712500', '苗栗县', 'Miaoli', '710000');
INSERT INTO `area` VALUES ('712501', '苗栗市', 'Miaoli', '712500');
INSERT INTO `area` VALUES ('712521', '苑里镇', 'Yuanli', '712500');
INSERT INTO `area` VALUES ('712522', '通霄镇', 'Tongxiao', '712500');
INSERT INTO `area` VALUES ('712523', '竹南镇', 'Zhunan', '712500');
INSERT INTO `area` VALUES ('712524', '头份镇', 'Toufen', '712500');
INSERT INTO `area` VALUES ('712525', '后龙镇', 'Houlong', '712500');
INSERT INTO `area` VALUES ('712526', '卓兰镇', 'Zhuolan', '712500');
INSERT INTO `area` VALUES ('712527', '大湖乡', 'Dahu', '712500');
INSERT INTO `area` VALUES ('712528', '公馆乡', 'Gongguan', '712500');
INSERT INTO `area` VALUES ('712529', '铜锣乡', 'Tongluo', '712500');
INSERT INTO `area` VALUES ('712530', '南庄乡', 'Nanzhuang', '712500');
INSERT INTO `area` VALUES ('712531', '头屋乡', 'Touwu', '712500');
INSERT INTO `area` VALUES ('712532', '三义乡', 'Sanyi', '712500');
INSERT INTO `area` VALUES ('712533', '西湖乡', 'Xihu', '712500');
INSERT INTO `area` VALUES ('712534', '造桥乡', 'Zaoqiao', '712500');
INSERT INTO `area` VALUES ('712535', '三湾乡', 'Sanwan', '712500');
INSERT INTO `area` VALUES ('712536', '狮潭乡', 'Shitan', '712500');
INSERT INTO `area` VALUES ('712537', '泰安乡', 'Tai\'an', '712500');
INSERT INTO `area` VALUES ('712700', '彰化县', 'Changhua', '710000');
INSERT INTO `area` VALUES ('712701', '彰化市', 'Zhanghuashi', '712700');
INSERT INTO `area` VALUES ('712721', '鹿港镇', 'Lugang', '712700');
INSERT INTO `area` VALUES ('712722', '和美镇', 'Hemei', '712700');
INSERT INTO `area` VALUES ('712723', '线西乡', 'Xianxi', '712700');
INSERT INTO `area` VALUES ('712724', '伸港乡', 'Shengang', '712700');
INSERT INTO `area` VALUES ('712725', '福兴乡', 'Fuxing', '712700');
INSERT INTO `area` VALUES ('712726', '秀水乡', 'Xiushui', '712700');
INSERT INTO `area` VALUES ('712727', '花坛乡', 'Huatan', '712700');
INSERT INTO `area` VALUES ('712728', '芬园乡', 'Fenyuan', '712700');
INSERT INTO `area` VALUES ('712729', '员林镇', 'Yuanlin', '712700');
INSERT INTO `area` VALUES ('712730', '溪湖镇', 'Xihu', '712700');
INSERT INTO `area` VALUES ('712731', '田中镇', 'Tianzhong', '712700');
INSERT INTO `area` VALUES ('712732', '大村乡', 'Dacun', '712700');
INSERT INTO `area` VALUES ('712733', '埔盐乡', 'Puyan', '712700');
INSERT INTO `area` VALUES ('712734', '埔心乡', 'Puxin', '712700');
INSERT INTO `area` VALUES ('712735', '永靖乡', 'Yongjing', '712700');
INSERT INTO `area` VALUES ('712736', '社头乡', 'Shetou', '712700');
INSERT INTO `area` VALUES ('712737', '二水乡', 'Ershui', '712700');
INSERT INTO `area` VALUES ('712738', '北斗镇', 'Beidou', '712700');
INSERT INTO `area` VALUES ('712739', '二林镇', 'Erlin', '712700');
INSERT INTO `area` VALUES ('712740', '田尾乡', 'Tianwei', '712700');
INSERT INTO `area` VALUES ('712741', '埤头乡', 'Pitou', '712700');
INSERT INTO `area` VALUES ('712742', '芳苑乡', 'Fangyuan', '712700');
INSERT INTO `area` VALUES ('712743', '大城乡', 'Dacheng', '712700');
INSERT INTO `area` VALUES ('712744', '竹塘乡', 'Zhutang', '712700');
INSERT INTO `area` VALUES ('712745', '溪州乡', 'Xizhou', '712700');
INSERT INTO `area` VALUES ('712800', '南投县', 'Nantou', '710000');
INSERT INTO `area` VALUES ('712801', '南投市', 'Nantoushi', '712800');
INSERT INTO `area` VALUES ('712821', '埔里镇', 'Puli', '712800');
INSERT INTO `area` VALUES ('712822', '草屯镇', 'Caotun', '712800');
INSERT INTO `area` VALUES ('712823', '竹山镇', 'Zhushan', '712800');
INSERT INTO `area` VALUES ('712824', '集集镇', 'Jiji', '712800');
INSERT INTO `area` VALUES ('712825', '名间乡', 'Mingjian', '712800');
INSERT INTO `area` VALUES ('712826', '鹿谷乡', 'Lugu', '712800');
INSERT INTO `area` VALUES ('712827', '中寮乡', 'Zhongliao', '712800');
INSERT INTO `area` VALUES ('712828', '鱼池乡', 'Yuchi', '712800');
INSERT INTO `area` VALUES ('712829', '国姓乡', 'Guoxing', '712800');
INSERT INTO `area` VALUES ('712830', '水里乡', 'Shuili', '712800');
INSERT INTO `area` VALUES ('712831', '信义乡', 'Xinyi', '712800');
INSERT INTO `area` VALUES ('712832', '仁爱乡', 'Renai', '712800');
INSERT INTO `area` VALUES ('712900', '云林县', 'Yunlin', '710000');
INSERT INTO `area` VALUES ('712901', '斗六市', 'Douliu', '712900');
INSERT INTO `area` VALUES ('712921', '斗南镇', 'Dounan', '712900');
INSERT INTO `area` VALUES ('712922', '虎尾镇', 'Huwei', '712900');
INSERT INTO `area` VALUES ('712923', '西螺镇', 'Xiluo', '712900');
INSERT INTO `area` VALUES ('712924', '土库镇', 'Tuku', '712900');
INSERT INTO `area` VALUES ('712925', '北港镇', 'Beigang', '712900');
INSERT INTO `area` VALUES ('712926', '古坑乡', 'Gukeng', '712900');
INSERT INTO `area` VALUES ('712927', '大埤乡', 'Dapi', '712900');
INSERT INTO `area` VALUES ('712928', '莿桐乡', 'Citong', '712900');
INSERT INTO `area` VALUES ('712929', '林内乡', 'Linna', '712900');
INSERT INTO `area` VALUES ('712930', '二仑乡', 'Erlun', '712900');
INSERT INTO `area` VALUES ('712931', '仑背乡', 'Lunbei', '712900');
INSERT INTO `area` VALUES ('712932', '麦寮乡', 'Mailiao', '712900');
INSERT INTO `area` VALUES ('712933', '东势乡', 'Dongshi', '712900');
INSERT INTO `area` VALUES ('712934', '褒忠乡', 'Baozhong', '712900');
INSERT INTO `area` VALUES ('712935', '台西乡', 'Taixi', '712900');
INSERT INTO `area` VALUES ('712936', '元长乡', 'Yuanchang', '712900');
INSERT INTO `area` VALUES ('712937', '四湖乡', 'Sihu', '712900');
INSERT INTO `area` VALUES ('712938', '口湖乡', 'Kouhu', '712900');
INSERT INTO `area` VALUES ('712939', '水林乡', 'Shuilin', '712900');
INSERT INTO `area` VALUES ('713000', '嘉义县', 'Chiayi', '710000');
INSERT INTO `area` VALUES ('713001', '太保市', 'Taibao', '713000');
INSERT INTO `area` VALUES ('713002', '朴子市', 'Puzi', '713000');
INSERT INTO `area` VALUES ('713023', '布袋镇', 'Budai', '713000');
INSERT INTO `area` VALUES ('713024', '大林镇', 'Dalin', '713000');
INSERT INTO `area` VALUES ('713025', '民雄乡', 'Minxiong', '713000');
INSERT INTO `area` VALUES ('713026', '溪口乡', 'Xikou', '713000');
INSERT INTO `area` VALUES ('713027', '新港乡', 'Xingang', '713000');
INSERT INTO `area` VALUES ('713028', '六脚乡', 'Liujiao', '713000');
INSERT INTO `area` VALUES ('713029', '东石乡', 'Dongshi', '713000');
INSERT INTO `area` VALUES ('713030', '义竹乡', 'Yizhu', '713000');
INSERT INTO `area` VALUES ('713031', '鹿草乡', 'Lucao', '713000');
INSERT INTO `area` VALUES ('713032', '水上乡', 'Shuishang', '713000');
INSERT INTO `area` VALUES ('713033', '中埔乡', 'Zhongpu', '713000');
INSERT INTO `area` VALUES ('713034', '竹崎乡', 'Zhuqi', '713000');
INSERT INTO `area` VALUES ('713035', '梅山乡', 'Meishan', '713000');
INSERT INTO `area` VALUES ('713036', '番路乡', 'Fanlu', '713000');
INSERT INTO `area` VALUES ('713037', '大埔乡', 'Dapu', '713000');
INSERT INTO `area` VALUES ('713038', '阿里山乡', 'Alishan', '713000');
INSERT INTO `area` VALUES ('713300', '屏东县', 'Pingtung', '710000');
INSERT INTO `area` VALUES ('713301', '屏东市', 'Pingdong', '713300');
INSERT INTO `area` VALUES ('713321', '潮州镇', 'Chaozhou', '713300');
INSERT INTO `area` VALUES ('713322', '东港镇', 'Donggang', '713300');
INSERT INTO `area` VALUES ('713323', '恒春镇', 'Hengchun', '713300');
INSERT INTO `area` VALUES ('713324', '万丹乡', 'Wandan', '713300');
INSERT INTO `area` VALUES ('713325', '长治乡', 'Changzhi', '713300');
INSERT INTO `area` VALUES ('713326', '麟洛乡', 'Linluo', '713300');
INSERT INTO `area` VALUES ('713327', '九如乡', 'Jiuru', '713300');
INSERT INTO `area` VALUES ('713328', '里港乡', 'Ligang', '713300');
INSERT INTO `area` VALUES ('713329', '盐埔乡', 'Yanpu', '713300');
INSERT INTO `area` VALUES ('713330', '高树乡', 'Gaoshu', '713300');
INSERT INTO `area` VALUES ('713331', '万峦乡', 'Wanluan', '713300');
INSERT INTO `area` VALUES ('713332', '内埔乡', 'Napu', '713300');
INSERT INTO `area` VALUES ('713333', '竹田乡', 'Zhutian', '713300');
INSERT INTO `area` VALUES ('713334', '新埤乡', 'Xinpi', '713300');
INSERT INTO `area` VALUES ('713335', '枋寮乡', 'Fangliao', '713300');
INSERT INTO `area` VALUES ('713336', '新园乡', 'Xinyuan', '713300');
INSERT INTO `area` VALUES ('713337', '崁顶乡', 'Kanding', '713300');
INSERT INTO `area` VALUES ('713338', '林边乡', 'Linbian', '713300');
INSERT INTO `area` VALUES ('713339', '南州乡', 'Nanzhou', '713300');
INSERT INTO `area` VALUES ('713340', '佳冬乡', 'Jiadong', '713300');
INSERT INTO `area` VALUES ('713341', '琉球乡', 'Liuqiu', '713300');
INSERT INTO `area` VALUES ('713342', '车城乡', 'Checheng', '713300');
INSERT INTO `area` VALUES ('713343', '满州乡', 'Manzhou', '713300');
INSERT INTO `area` VALUES ('713344', '枋山乡', 'Fangshan', '713300');
INSERT INTO `area` VALUES ('713345', '三地门乡', 'Sandimen', '713300');
INSERT INTO `area` VALUES ('713346', '雾台乡', 'Wutai', '713300');
INSERT INTO `area` VALUES ('713347', '玛家乡', 'Majia', '713300');
INSERT INTO `area` VALUES ('713348', '泰武乡', 'Taiwu', '713300');
INSERT INTO `area` VALUES ('713349', '来义乡', 'Laiyi', '713300');
INSERT INTO `area` VALUES ('713350', '春日乡', 'Chunri', '713300');
INSERT INTO `area` VALUES ('713351', '狮子乡', 'Shizi', '713300');
INSERT INTO `area` VALUES ('713352', '牡丹乡', 'Mudan', '713300');
INSERT INTO `area` VALUES ('713400', '台东县', 'Taitung', '710000');
INSERT INTO `area` VALUES ('713401', '台东市', 'Taidong', '713400');
INSERT INTO `area` VALUES ('713421', '成功镇', 'Chenggong', '713400');
INSERT INTO `area` VALUES ('713422', '关山镇', 'Guanshan', '713400');
INSERT INTO `area` VALUES ('713423', '卑南乡', 'Beinan', '713400');
INSERT INTO `area` VALUES ('713424', '鹿野乡', 'Luye', '713400');
INSERT INTO `area` VALUES ('713425', '池上乡', 'Chishang', '713400');
INSERT INTO `area` VALUES ('713426', '东河乡', 'Donghe', '713400');
INSERT INTO `area` VALUES ('713427', '长滨乡', 'Changbin', '713400');
INSERT INTO `area` VALUES ('713428', '太麻里乡', 'Taimali', '713400');
INSERT INTO `area` VALUES ('713429', '大武乡', 'Dawu', '713400');
INSERT INTO `area` VALUES ('713430', '绿岛乡', 'Lvdao', '713400');
INSERT INTO `area` VALUES ('713431', '海端乡', 'Haiduan', '713400');
INSERT INTO `area` VALUES ('713432', '延平乡', 'Yanping', '713400');
INSERT INTO `area` VALUES ('713433', '金峰乡', 'Jinfeng', '713400');
INSERT INTO `area` VALUES ('713434', '达仁乡', 'Daren', '713400');
INSERT INTO `area` VALUES ('713435', '兰屿乡', 'Lanyu', '713400');
INSERT INTO `area` VALUES ('713500', '花莲县', 'Hualien', '710000');
INSERT INTO `area` VALUES ('713501', '花莲市', 'Hualian', '713500');
INSERT INTO `area` VALUES ('713521', '凤林镇', 'Fenglin', '713500');
INSERT INTO `area` VALUES ('713522', '玉里镇', 'Yuli', '713500');
INSERT INTO `area` VALUES ('713523', '新城乡', 'Xincheng', '713500');
INSERT INTO `area` VALUES ('713524', '吉安乡', 'Ji\'an', '713500');
INSERT INTO `area` VALUES ('713525', '寿丰乡', 'Shoufeng', '713500');
INSERT INTO `area` VALUES ('713526', '光复乡', 'Guangfu', '713500');
INSERT INTO `area` VALUES ('713527', '丰滨乡', 'Fengbin', '713500');
INSERT INTO `area` VALUES ('713528', '瑞穗乡', 'Ruisui', '713500');
INSERT INTO `area` VALUES ('713529', '富里乡', 'Fuli', '713500');
INSERT INTO `area` VALUES ('713530', '秀林乡', 'Xiulin', '713500');
INSERT INTO `area` VALUES ('713531', '万荣乡', 'Wanrong', '713500');
INSERT INTO `area` VALUES ('713532', '卓溪乡', 'Zhuoxi', '713500');
INSERT INTO `area` VALUES ('713600', '澎湖县', 'Penghu', '710000');
INSERT INTO `area` VALUES ('713601', '马公市', 'Magong', '713600');
INSERT INTO `area` VALUES ('713621', '湖西乡', 'Huxi', '713600');
INSERT INTO `area` VALUES ('713622', '白沙乡', 'Baisha', '713600');
INSERT INTO `area` VALUES ('713623', '西屿乡', 'Xiyu', '713600');
INSERT INTO `area` VALUES ('713624', '望安乡', 'Wang\'an', '713600');
INSERT INTO `area` VALUES ('713625', '七美乡', 'Qimei', '713600');
INSERT INTO `area` VALUES ('713700', '金门县', 'Jinmen', '710000');
INSERT INTO `area` VALUES ('713701', '金城镇', 'Jincheng', '713700');
INSERT INTO `area` VALUES ('713702', '金湖镇', 'Jinhu', '713700');
INSERT INTO `area` VALUES ('713703', '金沙镇', 'Jinsha', '713700');
INSERT INTO `area` VALUES ('713704', '金宁乡', 'Jinning', '713700');
INSERT INTO `area` VALUES ('713705', '烈屿乡', 'Lieyu', '713700');
INSERT INTO `area` VALUES ('713706', '乌丘乡', 'Wuqiu', '713700');
INSERT INTO `area` VALUES ('713800', '连江县', 'Lienchiang', '710000');
INSERT INTO `area` VALUES ('713801', '南竿乡', 'Nangan', '713800');
INSERT INTO `area` VALUES ('713802', '北竿乡', 'Beigan', '713800');
INSERT INTO `area` VALUES ('713803', '莒光乡', 'Juguang', '713800');
INSERT INTO `area` VALUES ('713804', '东引乡', 'Dongyin', '713800');
INSERT INTO `area` VALUES ('810000', '香港特别行政区', 'Hong Kong', '0');
INSERT INTO `area` VALUES ('810100', '香港岛', 'Hong Kong Island', '810000');
INSERT INTO `area` VALUES ('810101', '中西区', 'Central and Western District', '810100');
INSERT INTO `area` VALUES ('810102', '湾仔区', 'Wan Chai District', '810100');
INSERT INTO `area` VALUES ('810103', '东区', 'Eastern District', '810100');
INSERT INTO `area` VALUES ('810104', '南区', 'Southern District', '810100');
INSERT INTO `area` VALUES ('810200', '九龙', 'Kowloon', '810000');
INSERT INTO `area` VALUES ('810201', '油尖旺区', 'Yau Tsim Mong', '810200');
INSERT INTO `area` VALUES ('810202', '深水埗区', 'Sham Shui Po', '810200');
INSERT INTO `area` VALUES ('810203', '九龙城区', 'Jiulongcheng', '810200');
INSERT INTO `area` VALUES ('810204', '黄大仙区', 'Wong Tai Sin', '810200');
INSERT INTO `area` VALUES ('810205', '观塘区', 'Kwun Tong', '810200');
INSERT INTO `area` VALUES ('810300', '新界', 'New Territories', '810000');
INSERT INTO `area` VALUES ('810301', '荃湾区', 'Tsuen Wan', '810300');
INSERT INTO `area` VALUES ('810302', '屯门区', 'Tuen Mun', '810300');
INSERT INTO `area` VALUES ('810303', '元朗区', 'Yuen Long', '810300');
INSERT INTO `area` VALUES ('810304', '北区', 'North District', '810300');
INSERT INTO `area` VALUES ('810305', '大埔区', 'Tai Po', '810300');
INSERT INTO `area` VALUES ('810306', '西贡区', 'Sai Kung', '810300');
INSERT INTO `area` VALUES ('810307', '沙田区', 'Sha Tin', '810300');
INSERT INTO `area` VALUES ('810308', '葵青区', 'Kwai Tsing', '810300');
INSERT INTO `area` VALUES ('810309', '离岛区', 'Outlying Islands', '810300');
INSERT INTO `area` VALUES ('820000', '澳门特别行政区', 'Macau', '0');
INSERT INTO `area` VALUES ('820100', '澳门半岛', 'MacauPeninsula', '820000');
INSERT INTO `area` VALUES ('820101', '花地玛堂区', 'Nossa Senhora de Fatima', '820100');
INSERT INTO `area` VALUES ('820102', '圣安多尼堂区', 'Santo Antonio', '820100');
INSERT INTO `area` VALUES ('820103', '大堂区', 'Sé', '820100');
INSERT INTO `area` VALUES ('820104', '望德堂区', 'Sao Lazaro', '820100');
INSERT INTO `area` VALUES ('820105', '风顺堂区', 'Sao Lourenco', '820100');
INSERT INTO `area` VALUES ('820200', '氹仔岛', 'Taipa', '820000');
INSERT INTO `area` VALUES ('820201', '嘉模堂区', 'Our Lady Of Carmel\'s Parish', '820200');
INSERT INTO `area` VALUES ('820300', '路环岛', 'Coloane', '820000');
INSERT INTO `area` VALUES ('820301', '圣方济各堂区', 'St Francis Xavier\'s Parish', '820300');
INSERT INTO `area` VALUES ('900000', '钓鱼岛', 'DiaoyuDao', '0');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0 无效 1 有效',
  `update_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章表';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '第一个新闻', '这是简介', '<p>这是文章的内容</p><audio controls=\"controls\" style=\"display: none;\"></audio>', '1547889665', '1', '1547889909');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL DEFAULT '' COMMENT '权限规则ID',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='权限组表';

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '超级管理员', '1', '1,2,3,44,50,4,42,43,6,10,11,12,13,14,15,7,16,17,18,19,20,21,8,9,22,25,26,27,28,29,30,36,37,38,39,40,41', '1547798620', '1547890565');
INSERT INTO `auth_group` VALUES ('2', '经销商', '1', '6,10,11,12,13,14,15,7,16,17,18,19,20,21,8,9,22,36,37,38,39,40,41', '1547798626', '1547890667');
INSERT INTO `auth_group` VALUES ('3', '后台管理员', '1', '1,2,3,44,50,4,42,43,22,25,26,27,28,29,30,36,37,38,39,40,41,56,57,58,59,60,61,62,63,64,65,66', '1547890580', '1547890642');
INSERT INTO `auth_group` VALUES ('4', '出单员', '1', '6,10,11,12,14,15,7,16,17,18,20,21', '1548041554', '1548144542');
INSERT INTO `auth_group` VALUES ('5', '业务员', '1', '6,10,11,12,14,15,7,16,17,18,20,21', '1548041567', '1548144556');

-- ----------------------------
-- Table structure for auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_access`;
CREATE TABLE `auth_group_access` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED COMMENT='权限组规则表';

-- ----------------------------
-- Records of auth_group_access
-- ----------------------------
INSERT INTO `auth_group_access` VALUES ('1', '1');
INSERT INTO `auth_group_access` VALUES ('2', '2');
INSERT INTO `auth_group_access` VALUES ('4', '2');
INSERT INTO `auth_group_access` VALUES ('5', '3');
INSERT INTO `auth_group_access` VALUES ('6', '4');
INSERT INTO `auth_group_access` VALUES ('7', '4');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `condition` varchar(100) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='规则表';

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('1', 'admin/User/default', '用户管理', '1', '1', '0', '', '0', '', '0', '1548048795');
INSERT INTO `auth_rule` VALUES ('2', 'admin/Order/default', '订单管理', '1', '1', '0', '', '0', '', '0', '1548048808');
INSERT INTO `auth_rule` VALUES ('3', 'admin/Payment/default', '还款管理', '1', '1', '0', '', '0', '', '0', '1548048818');
INSERT INTO `auth_rule` VALUES ('4', 'admin/Overdue/default', '逾期管理', '1', '1', '0', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('6', 'admin/Instalment/default', '车险分期管理', '1', '1', '0', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('7', 'admin/PolicyStages/default', '保单分期管理', '1', '1', '0', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('8', 'admin/Insurance/index', '车险管理', '1', '1', '0', '', '0', '', '0', '1548212132');
INSERT INTO `auth_rule` VALUES ('9', 'admin/Policy/index', '保单管理', '1', '1', '0', '', '0', '', '0', '1548212144');
INSERT INTO `auth_rule` VALUES ('10', 'admin/Instalment/add', '新增车险分期', '1', '1', '6', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('11', 'admin/Instalment/subsist', '存续车险分期', '1', '1', '6', '', '0', '', '0', '1548211941');
INSERT INTO `auth_rule` VALUES ('12', 'admin/Instalment/customer', '客户列表', '1', '1', '6', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('13', 'admin/Instalment/index', '待审核申请', '1', '1', '6', '', '0', '', '0', '1548123201');
INSERT INTO `auth_rule` VALUES ('14', 'admin/Instalment/apply', '分期申请查询', '1', '1', '6', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('15', 'admin/Instalment/verify', '存续车险验真结果', '1', '1', '6', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('16', 'admin/PolicyStages/add', '新增保单分期', '1', '1', '7', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('17', 'admin/PolicyStages/subsist', '存续保单分期', '1', '1', '7', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('18', 'admin/PolicyStages/customer', '客户列表', '1', '1', '7', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('19', 'admin/PolicyStages/index', '待审核申请', '1', '1', '7', '', '0', '', '0', '1548211991');
INSERT INTO `auth_rule` VALUES ('20', 'admin/PolicyStages/apply', '分期申请查询', '1', '1', '7', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('21', 'admin/PolicyStages/verify', '存续保单验真结果', '1', '1', '7', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('22', 'admin/adminUser/default', '组织架构', '1', '1', '0', '', '0', '', '1547798306', '1548048843');
INSERT INTO `auth_rule` VALUES ('25', 'admin/authGroup/index', '权限组管理', '1', '1', '22', '', '0', '', '1547800008', '1547800008');
INSERT INTO `auth_rule` VALUES ('26', 'admin/authGroup/add', '添加', '1', '0', '25', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('27', 'admin/authGroup/save', '保存', '1', '0', '25', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('28', 'admin/authGroup/edit', '编辑', '1', '0', '25', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('29', 'admin/authGroup/update', '更新', '1', '0', '25', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('30', 'admin/authGroup/delete', '删除', '1', '0', '25', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('36', 'admin/adminUser/index', '人员管理', '1', '1', '22', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('37', 'admin/adminUser/add', '添加', '1', '0', '36', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('38', 'admin/adminUser/save', '保存', '1', '0', '36', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('39', 'admin/adminUser/edit', '编辑', '1', '0', '36', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('40', 'admin/adminUser/update', '更新', '1', '0', '36', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('41', 'admin/adminUser/delete', '删除', '1', '0', '36', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('42', 'admin/overdue/indexYes', '逾期已还列表', '1', '1', '4', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('43', 'admin/overdue/indexNo', '逾期未还列表', '1', '1', '4', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('44', 'admin/bill/index', '还款记录', '1', '1', '3', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('50', 'admin/bill/counts', '还款统计', '1', '0', '3', '', '0', '', '0', '1548214918');
INSERT INTO `auth_rule` VALUES ('56', 'admin/system/default', '配置管理', '1', '1', '0', '', '0', '', '0', '1548048862');
INSERT INTO `auth_rule` VALUES ('57', 'admin/system/siteConfig', '网站配置', '1', '1', '56', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('58', 'admin/system/updateSiteConfig', '更新网站配置', '1', '0', '57', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('59', 'admin/system/index', '其他配置', '1', '1', '56', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('60', 'admin/system/add', '添加', '1', '0', '59', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('61', 'admin/system/save', '保存', '1', '0', '59', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('62', 'admin/system/edit', '编辑', '1', '0', '59', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('63', 'admin/system/update', '更新', '1', '0', '59', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('64', 'admin/system/delete', '删除', '1', '0', '59', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('65', 'admin/article/default', '文章管理', '1', '1', '0', '', '0', '', '0', '1548048853');
INSERT INTO `auth_rule` VALUES ('66', 'admin/article/index', '新闻管理', '1', '1', '65', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('67', 'admin/user/index', '用户列表', '1', '1', '1', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('68', 'admin/insured/default', '保险分期金融政策', '1', '1', '0', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('69', 'admin/company/index', '保险公司配置', '1', '1', '68', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('70', 'admin/product/index', '保险产品配置', '1', '1', '68', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('71', 'admin/Order/auditing', '订单审核', '1', '1', '2', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('72', 'admin/Order/index', '订单查询', '1', '1', '2', '', '0', '', '0', '0');
INSERT INTO `auth_rule` VALUES ('73', 'admin/record/billFail', '还款失败记录', '1', '1', '3', '', '0', '', '0', '0');

-- ----------------------------
-- Table structure for bankcard
-- ----------------------------
DROP TABLE IF EXISTS `bankcard`;
CREATE TABLE `bankcard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL DEFAULT '' COMMENT '用户id',
  `card` varchar(50) NOT NULL DEFAULT '' COMMENT '卡号',
  `type` varchar(10) NOT NULL DEFAULT '0' COMMENT '卡的类型',
  `bank` varchar(255) NOT NULL DEFAULT '' COMMENT '所属银行',
  `name` varchar(255) NOT NULL COMMENT '持卡人姓名',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '银行预留手机',
  `is_sign` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否签约',
  `is_master` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否主卡',
  `idcard` varchar(255) NOT NULL COMMENT '身份证',
  `id_type` tinyint(3) unsigned NOT NULL COMMENT '身份类型',
  `agrmno` varchar(255) NOT NULL COMMENT '签约协议号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `card` (`card`) USING BTREE,
  KEY `uid` (`uid`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='银行卡';

-- ----------------------------
-- Records of bankcard
-- ----------------------------
INSERT INTO `bankcard` VALUES ('1', '16', '6258101645858205', '00', '0306', '东东', '13717394597', '1', '0', '', '0', 'AIP8205190125000023847', '1548383924', '1548383924');
INSERT INTO `bankcard` VALUES ('2', '16', '6225883746567298', '00', '0308', '张三', '13717394597', '1', '0', '', '0', 'AIP7298190125000001986', '1548384058', '1548384058');

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '还款金额',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '订单状态:1=未还,2=已还,3=逾期',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `real_time` int(10) unsigned NOT NULL COMMENT '实际还款时间',
  `repay_time` int(10) unsigned NOT NULL COMMENT '应还款时间',
  `stage` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '期数',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='账单还款表';

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('1', '1', '16', '10.00', '1', '11', '0', '1547793809', '1', '1547793809', '1547793809');
INSERT INTO `bill` VALUES ('2', '1', '16', '10.00', '1', '11', '0', '1547793809', '1', '1547793809', '1547793809');
INSERT INTO `bill` VALUES ('3', '1', '16', '10.00', '2', '11', '0', '1547793809', '1', '1547793809', '1547793809');
INSERT INTO `bill` VALUES ('4', '1', '16', '10.00', '1', '11', '0', '1547793809', '1', '1547793809', '1547793809');
INSERT INTO `bill` VALUES ('5', '1', '16', '10.00', '2', '11', '0', '1547793809', '1', '1547793809', '1547793809');
INSERT INTO `bill` VALUES ('6', '8', '0', '222.10', '1', '', '0', '1548432000', '1', '0', '0');
INSERT INTO `bill` VALUES ('7', '8', '0', '111.10', '1', '', '0', '1551110400', '2', '0', '0');
INSERT INTO `bill` VALUES ('8', '8', '0', '111.10', '1', '', '0', '1556208000', '3', '0', '0');
INSERT INTO `bill` VALUES ('9', '8', '0', '111.10', '1', '', '0', '1564070400', '4', '0', '0');
INSERT INTO `bill` VALUES ('10', '8', '0', '111.10', '1', '', '0', '1574697600', '5', '0', '0');
INSERT INTO `bill` VALUES ('11', '8', '0', '111.10', '1', '', '0', '1587830400', '6', '0', '0');
INSERT INTO `bill` VALUES ('12', '8', '0', '111.10', '1', '', '0', '1603641600', '7', '0', '0');
INSERT INTO `bill` VALUES ('13', '8', '0', '111.10', '1', '', '0', '1621958400', '8', '0', '0');
INSERT INTO `bill` VALUES ('14', '8', '0', '111.10', '1', '', '0', '1643126400', '9', '0', '0');
INSERT INTO `bill` VALUES ('15', '8', '0', '111.10', '1', '', '0', '1666713600', '10', '0', '0');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `hash` varchar(255) NOT NULL DEFAULT '' COMMENT 'hash值',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='图片表';

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('3', 'a.JPG', '/uploads/20190122/1002020e5466b308a3b5d8ff9c39d65d.JPG', '064e3f25a30f8e24f24a0672e88c2f0731307d9e', '1548121614');
INSERT INTO `image` VALUES ('4', 'f9dcd100baa1cd114b39c73eb512c8fcc3ce2d24.jpg', '/uploads/20190122/e6520ad95bc9ed99ff84c2d2eb2c9ba7.jpg', '6c53b4fce7c2c6bf14fa6f995d2212cbb1273680', '1548121618');
INSERT INTO `image` VALUES ('5', 'TIM截图20190107163534.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', 'b861bfe7bc976fdcab51491c5a3cb5fa7333ec0b', '1548229894');
INSERT INTO `image` VALUES ('6', 'timg.jpg', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '71eff3d1fcf2e16bfe13a4e77212acc3477f69c9', '1548230316');

-- ----------------------------
-- Table structure for insurance_company
-- ----------------------------
DROP TABLE IF EXISTS `insurance_company`;
CREATE TABLE `insurance_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='保险公司表';

-- ----------------------------
-- Records of insurance_company
-- ----------------------------
INSERT INTO `insurance_company` VALUES ('1', '太平洋保险公司', '1548059863', '1548065659');
INSERT INTO `insurance_company` VALUES ('2', '平安保险公司', '1548059991', '1548065676');

-- ----------------------------
-- Table structure for insured
-- ----------------------------
DROP TABLE IF EXISTS `insured`;
CREATE TABLE `insured` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID(授信开户绑定用户ID)',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属经销商',
  `type` smallint(3) unsigned NOT NULL DEFAULT '1' COMMENT '被保人类型 1 个人 2 企业',
  `is_legal` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否法人 0 否 1 是',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机',
  `card` varchar(20) NOT NULL DEFAULT '' COMMENT '身份证号',
  `card_front` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证正面',
  `card_con` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证反面',
  `province` varchar(10) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '城市',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `agreement` varchar(255) NOT NULL DEFAULT '' COMMENT '授权协议',
  `enterprise` varchar(50) NOT NULL DEFAULT '' COMMENT '企业名字',
  `enterprise_license` varchar(255) NOT NULL DEFAULT '' COMMENT '营业执照',
  `code` varchar(28) NOT NULL DEFAULT '' COMMENT '信用代码',
  `expiry` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '有效期',
  `legal` varchar(50) NOT NULL DEFAULT '' COMMENT '法人',
  `legal_card` varchar(20) NOT NULL DEFAULT '' COMMENT '法人身份证号',
  `account` varchar(20) NOT NULL DEFAULT '' COMMENT '企业账号',
  `bank` varchar(100) NOT NULL DEFAULT '' COMMENT '开户行',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='客户表(还款人，经办人，被保人)';

-- ----------------------------
-- Records of insured
-- ----------------------------
INSERT INTO `insured` VALUES ('16', '16', '1', '2', '1', '韦小宝', '17302003009', '111111111', '/uploads/20190122/e6520ad95bc9ed99ff84c2d2eb2c9ba7.jpg', '', '110000', '110100', '紫禁城', '', '大唐帝国', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '100001', '2222', '爱新觉罗', '111111', '100000', '中国银行总行');
INSERT INTO `insured` VALUES ('17', '0', '1', '1', '0', '韦小宝', '18826810424', '1', '/uploads/20190122/e6520ad95bc9ed99ff84c2d2eb2c9ba7.jpg', '/uploads/20190122/e6520ad95bc9ed99ff84c2d2eb2c9ba7.jpg', '110000', '110100', '1', '', '', '', '', '0', '', '', '', '');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(32) NOT NULL DEFAULT '' COMMENT '订单编号',
  `insured_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '客户id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `company_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '保险公司ID',
  `premium` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '保费总额',
  `service` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '服务费',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '订单状态:1=申请中,2=审核成功,3=驳回,4=待认证,5=保单生效',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '驳回原因等等',
  `stage` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '还款期数',
  `repayment` tinyint(3) unsigned NOT NULL COMMENT '还款方式 1=趸交,2=等额等息',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '订单类型:1=车险,2=保单',
  `verify` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '审核次数',
  `is_face` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '百度身份识别',
  `is_sign` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '签章',
  `is_bank` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '银行卡',
  `is_renewal` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '存续',
  `salesman_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '业务员ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`insured_id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `company_id` (`company_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('5', '', '16', '1', '1', '1000.00', '100.00', '1', '', '6', '1', '1', '0', '0', '0', '0', '0', '1', '1', '1548310333', '1548310333');
INSERT INTO `order` VALUES ('6', '', '16', '1', '1', '1000.00', '100.00', '1', '', '6', '1', '1', '0', '0', '0', '0', '0', '1', '1', '1548310340', '1548310340');
INSERT INTO `order` VALUES ('7', '', '16', '1', '1', '1000.00', '100.00', '1', '', '6', '1', '1', '0', '0', '0', '0', '0', '1', '1', '1548310344', '1548310344');
INSERT INTO `order` VALUES ('8', '', '16', '2', '2', '1111.00', '111.00', '5', '', '10', '1', '1', '0', '0', '1', '1', '0', '1', '1', '1548311430', '1548505810');
INSERT INTO `order` VALUES ('9', '', '16', '2', '2', '1111.00', '111.00', '3', '', '10', '1', '1', '0', '0', '0', '0', '0', '1', '1', '1548311771', '1548311771');
INSERT INTO `order` VALUES ('10', '', '16', '3', '2', '1111.00', '11.00', '5', '', '12', '1', '1', '0', '0', '0', '0', '1', '1', '1', '1548311973', '1548311973');
INSERT INTO `order` VALUES ('11', '', '16', '3', '2', '1111.00', '11.00', '2', '', '12', '1', '1', '0', '0', '0', '1', '1', '1', '1', '1548312002', '1548642098');
INSERT INTO `order` VALUES ('12', '', '17', '3', '2', '1111.00', '11.00', '1', '', '12', '1', '1', '0', '0', '0', '0', '1', '1', '1', '1548312197', '1548312197');
INSERT INTO `order` VALUES ('13', '', '17', '3', '2', '1111.00', '11.00', '1', '', '12', '1', '1', '0', '0', '0', '0', '1', '1', '1', '1548312501', '1548312501');
INSERT INTO `order` VALUES ('14', '', '17', '3', '2', '1111.00', '11.00', '1', '', '12', '1', '1', '0', '0', '0', '0', '1', '1', '1', '1548312589', '1548312589');
INSERT INTO `order` VALUES ('15', '', '17', '1', '1', '1.00', '1.00', '1', '', '6', '1', '1', '0', '0', '0', '0', '1', '1', '1', '1548312780', '1548312780');
INSERT INTO `order` VALUES ('16', '', '17', '1', '1', '1.00', '1.00', '1', '', '6', '1', '1', '0', '0', '0', '0', '1', '1', '1', '1548312845', '1548312845');

-- ----------------------------
-- Table structure for order_car
-- ----------------------------
DROP TABLE IF EXISTS `order_car`;
CREATE TABLE `order_car` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分期订单ID',
  `plate_no` varchar(10) NOT NULL DEFAULT '' COMMENT '车牌号',
  `owner` varchar(100) NOT NULL DEFAULT '' COMMENT '车主',
  `vin` varchar(17) NOT NULL DEFAULT '' COMMENT '车辆识别码',
  `engine` varchar(10) NOT NULL DEFAULT '' COMMENT '发动机号码',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '车辆价格',
  `license_original` varchar(255) NOT NULL DEFAULT '' COMMENT '行驶证正本',
  `license_copy` varchar(255) NOT NULL DEFAULT '' COMMENT '行驶证副本',
  `is_new` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否新车',
  `invoice` varchar(255) NOT NULL DEFAULT '' COMMENT '合格证或发票',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='分期订单车辆信息表';

-- ----------------------------
-- Records of order_car
-- ----------------------------
INSERT INTO `order_car` VALUES ('1', '1', '粤A88888', '土豪', '13246', '146', '10000000.00', '/uploads/20190122/e6520ad95bc9ed99ff84c2d2eb2c9ba7.jpg', '/uploads/20190122/e6520ad95bc9ed99ff84c2d2eb2c9ba7.jpg', '0', '');
INSERT INTO `order_car` VALUES ('2', '2', '粤E15K05', '李厚堂', 'LSGJT52U67H106722', '76110577', '200000.00', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '0', '');
INSERT INTO `order_car` VALUES ('3', '3', '粤E15K05', '李厚堂', 'LSGJT52U67H106722', '76110577', '200000.00', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '0', '');
INSERT INTO `order_car` VALUES ('4', '4', '粤E15K05', '李厚堂', 'LSGJT52U67H106722', '76110577', '200000.00', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '0', '');
INSERT INTO `order_car` VALUES ('5', '5', '粤E15K05', '李厚堂', 'LSGJT52U67H106722', '76110577', '200000.00', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '0', '');
INSERT INTO `order_car` VALUES ('6', '6', '粤E15K05', '李厚堂', 'LSGJT52U67H106722', '76110577', '200000.00', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '0', '');
INSERT INTO `order_car` VALUES ('7', '7', '粤E15K05', '李厚堂', 'LSGJT52U67H106722', '76110577', '200000.00', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '0', '');
INSERT INTO `order_car` VALUES ('8', '8', '', '王尼玛', '1111111', '1111111', '111111.00', '', '', '1', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg');
INSERT INTO `order_car` VALUES ('9', '9', '', '王尼玛', '1111111', '1111111', '111111.00', '', '', '1', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg');
INSERT INTO `order_car` VALUES ('10', '10', '', '王尼玛', '111111', '111111', '11111.00', '', '', '1', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg');
INSERT INTO `order_car` VALUES ('11', '11', '粤E15K05', '李厚堂', 'LSGJT52U67H106722', '76110577', '11111.00', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '0', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg');
INSERT INTO `order_car` VALUES ('12', '12', '粤E15K05', '李厚堂', 'LSGJT52U67H106722', '76110577', '11111.00', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '0', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg');
INSERT INTO `order_car` VALUES ('13', '13', '粤E15K05', '李厚堂', 'LSGJT52U67H106722', '76110577', '11111.00', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '0', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg');
INSERT INTO `order_car` VALUES ('14', '14', '粤E15K05', '李厚堂', 'LSGJT52U67H106722', '76110577', '11111.00', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg', '0', '/uploads/20190123/428ae8031eec5a04f6f5ebaae9f8d38a.jpg');
INSERT INTO `order_car` VALUES ('15', '15', '', '1', '1', '1', '1.00', '', '', '1', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png');
INSERT INTO `order_car` VALUES ('16', '16', '', '1', '1', '1', '1.00', '', '', '1', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png');

-- ----------------------------
-- Table structure for order_extra
-- ----------------------------
DROP TABLE IF EXISTS `order_extra`;
CREATE TABLE `order_extra` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `investor` varchar(255) NOT NULL DEFAULT '' COMMENT '投资方',
  `policy` varchar(255) NOT NULL DEFAULT '' COMMENT '投保人',
  `policy_no` varchar(50) NOT NULL COMMENT '保单编号',
  `policy_expiry` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '保单截止日期',
  `policy_update` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '保单变更日期',
  `policy_img` varchar(255) NOT NULL DEFAULT '' COMMENT '保单照片',
  `endorsement` varchar(255) NOT NULL DEFAULT '' COMMENT '批单',
  `receipt` varchar(255) NOT NULL DEFAULT '' COMMENT '发票',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='订单扩展数据表';

-- ----------------------------
-- Records of order_extra
-- ----------------------------
INSERT INTO `order_extra` VALUES ('1', '1', '中国银行', '太平洋保险', '', '0', '0', '/uploads/20190122/e6520ad95bc9ed99ff84c2d2eb2c9ba7.jpg', '', '', '1548121972', '1548121972');
INSERT INTO `order_extra` VALUES ('2', '2', ' 中国银行', '太平洋保险', '', '0', '0', '/uploads/20190122/1002020e5466b308a3b5d8ff9c39d65d.JPG', '', '', '1548309818', '1548309818');
INSERT INTO `order_extra` VALUES ('3', '3', ' 中国银行', '太平洋保险', '', '0', '0', '/uploads/20190122/1002020e5466b308a3b5d8ff9c39d65d.JPG', '', '', '1548309874', '1548309874');
INSERT INTO `order_extra` VALUES ('4', '4', ' 中国银行', '太平洋保险', '', '0', '0', '/uploads/20190122/1002020e5466b308a3b5d8ff9c39d65d.JPG', '', '', '1548309889', '1548309889');
INSERT INTO `order_extra` VALUES ('5', '5', ' 中国银行', '太平洋保险', '', '0', '0', '/uploads/20190122/1002020e5466b308a3b5d8ff9c39d65d.JPG', '', '', '1548310333', '1548310333');
INSERT INTO `order_extra` VALUES ('6', '6', ' 中国银行', '太平洋保险', '', '0', '0', '/uploads/20190122/1002020e5466b308a3b5d8ff9c39d65d.JPG', '', '', '1548310340', '1548310340');
INSERT INTO `order_extra` VALUES ('7', '7', ' 中国银行', '太平洋保险', '', '0', '0', '/uploads/20190122/1002020e5466b308a3b5d8ff9c39d65d.JPG', '', '', '1548310344', '1548310344');
INSERT INTO `order_extra` VALUES ('8', '8', '中国人民银行', '平安保险', '', '2019', '2019', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '1548311430', '1548311430');
INSERT INTO `order_extra` VALUES ('9', '9', '中国人民银行', '平安保险', '', '2019', '2019', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '', '1548311771', '1548311771');
INSERT INTO `order_extra` VALUES ('10', '10', '中国人民银行', '平安保险', '', '2019', '2019', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '1548311973', '1548311973');
INSERT INTO `order_extra` VALUES ('11', '11', '中国人民银行', '平安保险', '', '2019', '2019', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '1548312002', '1548312002');
INSERT INTO `order_extra` VALUES ('12', '12', '中国人民银行', '平安保险', '', '2019', '2019', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '1548312197', '1548312197');
INSERT INTO `order_extra` VALUES ('13', '13', '中国人民银行', '平安保险', '', '2019', '2019', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '1548312501', '1548312501');
INSERT INTO `order_extra` VALUES ('14', '14', '中国人民银行', '平安保险', '', '2019', '2019', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '1548312589', '1548312589');
INSERT INTO `order_extra` VALUES ('15', '15', '1', '1', '', '2019', '2019', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '1548312780', '1548312780');
INSERT INTO `order_extra` VALUES ('16', '16', '1', '1', '', '2019', '2019', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '/uploads/20190123/7c5064aa4fc11a35b0b91ab1363c1750.png', '1548312845', '1548312845');

-- ----------------------------
-- Table structure for overdue
-- ----------------------------
DROP TABLE IF EXISTS `overdue`;
CREATE TABLE `overdue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL COMMENT '订单id',
  `bill_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '还款账单id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '还款金额',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '订单状态:1=逾期未还,2=逾期已还',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `repay_time` int(11) NOT NULL DEFAULT '0' COMMENT '应还款时间',
  `real_time` int(11) NOT NULL DEFAULT '0' COMMENT '实际还款时间',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `bill_id` (`bill_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='逾期表';

-- ----------------------------
-- Records of overdue
-- ----------------------------
INSERT INTO `overdue` VALUES ('1', '1', '1', '1', '15.00', '1', '', '1547793809', '0', '1547793809', '1547793809');

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` int(10) unsigned NOT NULL COMMENT '账单id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `req_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '支付订单号',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '支付金额',
  `bankcard` varchar(50) NOT NULL DEFAULT '' COMMENT '银行卡号',
  `id_card` varchar(50) NOT NULL DEFAULT '' COMMENT '身份证号',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '支付状态 1=支付中 2=支付成功  3=支付失败',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '支付方式 1=银行卡',
  `remark` varchar(255) NOT NULL COMMENT '失败原因/备注',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `req_sn` (`req_sn`) USING BTREE,
  KEY `uid` (`uid`) USING HASH,
  KEY `bill_id` (`bill_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='交易记录';

-- ----------------------------
-- Records of pay
-- ----------------------------

-- ----------------------------
-- Table structure for pay_fail
-- ----------------------------
DROP TABLE IF EXISTS `pay_fail`;
CREATE TABLE `pay_fail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` int(10) unsigned NOT NULL COMMENT '账单id',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `pay_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付id',
  `req_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '支付订单号',
  `remark` varchar(255) NOT NULL COMMENT '失败原因/备注',
  `repay_time` int(10) unsigned NOT NULL COMMENT '应还款时间',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '还款金额',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '当前状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pay_id` (`pay_id`) USING BTREE,
  KEY `uid` (`uid`) USING HASH,
  KEY `bill_id` (`bill_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='支付失败记录';

-- ----------------------------
-- Records of pay_fail
-- ----------------------------
INSERT INTO `pay_fail` VALUES ('1', '1', '1', '1', 'qweqeqweqeq', 'asdad as', '1521152111', '11.00', '1', '1521152111', '1521152111');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `stage` smallint(2) unsigned NOT NULL DEFAULT '0' COMMENT '期数',
  `rate` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '费率',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '产品类型',
  `object` varchar(50) NOT NULL DEFAULT '' COMMENT '分期标的',
  `charge` tinyint(4) NOT NULL DEFAULT '0' COMMENT '收费方式 1=趸交,2=等额等息',
  `premium` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '保费总额',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='分期产品表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '保分期科技XSY06', '6', '11', '新购车险分期', '商业险分期', '1', '11.00', '商业险分期6期', '1548059027', '1548065065');
INSERT INTO `product` VALUES ('2', '保分期科技XSY10', '10', '11', '新购车险分期', '商业险分期', '1', '123.00', '商业险分期10期', '1548059749', '1548065474');
INSERT INTO `product` VALUES ('3', '保分期科技XSY12', '12', '11', '新购车险分期', '商业险分期', '1', '1111.00', '商业险分期一年，分12期', '1548065510', '1548065510');
INSERT INTO `product` VALUES ('4', '保分期科技XSF12', '12', '11', '新购车险分期', '商业险分期', '2', '1111.00', '商业险分期一年，分12期,利息分期交付', '1548065549', '1548065549');
INSERT INTO `product` VALUES ('5', '保分期科技XSF10', '10', '11', '新购车险分期', '商业险分期', '2', '1111.00', '商业险分期10个月，分10期,利息分期交付', '1548065580', '1548065580');
INSERT INTO `product` VALUES ('6', '保分期科技XSF06', '6', '11', '新购车险分期', '商业险分期', '2', '2131.00', '商业险分期6个月，分6期,利息分期交付', '1548065598', '1548065598');
INSERT INTO `product` VALUES ('7', '保分期科技CSY06', '6', '13', '存续车险分期', '商业险分期', '1', '1312312.00', '保单贷款，额度为剩余价值83%续存车险保单分期，分6期，保单剩余期限6个月以上', '1548065631', '1548065631');

-- ----------------------------
-- Table structure for sms
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='短信表';

-- ----------------------------
-- Records of sms
-- ----------------------------
INSERT INTO `sms` VALUES ('1', '', '1234', '0', '1548481476', '1548481476');
INSERT INTO `sms` VALUES ('4', '17302003009', '1234', '0', '1548482891', '1548482891');

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '配置项字段',
  `value` text NOT NULL COMMENT '配置项值',
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否默认',
  `description` varchar(255) NOT NULL COMMENT '配置项描述',
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO `system` VALUES ('1', 'site_config', 'a:7:{s:10:\"site_title\";s:9:\"保分期\";s:9:\"seo_title\";s:9:\"保分期\";s:11:\"seo_keyword\";s:9:\"保分期\";s:15:\"seo_description\";s:9:\"保分期\";s:14:\"site_copyright\";s:9:\"保分期\";s:8:\"site_icp\";s:7:\"粤1001\";s:11:\"site_tongji\";s:0:\"\";}', '1', '网站配置', '1547815238', '1547867323');
INSERT INTO `system` VALUES ('3', 'car_insurance', '<p>这是车险介绍<img src=\"/uploads/images/20190123/1548215137129870.png\" title=\"1548215137129870.png\" alt=\"icon_right@2x.png\"/></p>', '1', '车险介绍', '1547865507', '1548215139');
INSERT INTO `system` VALUES ('4', 'guarantee', '<p>这是保单介绍<img src=\"/uploads/images/20190123/1548215149154540.png\" title=\"1548215149154540.png\" alt=\"icon_safety@2x.png\"/></p>', '1', '保单介绍', '1547865637', '1548215151');
INSERT INTO `system` VALUES ('6', 'contact', '1211241224<audio controls=\"controls\" style=\"display: none;\"></audio>', '1', '联系方式', '1547886843', '1547886843');

-- ----------------------------
-- Table structure for tonglian
-- ----------------------------
DROP TABLE IF EXISTS `tonglian`;
CREATE TABLE `tonglian` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `req_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '支付订单号',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型',
  `remark` varchar(255) NOT NULL COMMENT '失败原因/备注',
  `info` varchar(10000) NOT NULL COMMENT '额外json数据',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `req_sn` (`req_sn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='通联记录';

-- ----------------------------
-- Records of tonglian
-- ----------------------------
INSERT INTO `tonglian` VALUES ('1', '20060400000605104201901241442437916', '1', '3', '', '', '1548312163', '1548312163');
INSERT INTO `tonglian` VALUES ('2', '20060400000605104201901241443567510', '1', '3', '', '', '1548312236', '1548312236');
INSERT INTO `tonglian` VALUES ('3', '20060400000605104201901241444171338', '1', '3', '', '', '1548312257', '1548312257');
INSERT INTO `tonglian` VALUES ('4', '20060400000605104201901241445151886', '1', '3', '', '', '1548312315', '1548312315');
INSERT INTO `tonglian` VALUES ('5', '20060400000605104201901241445199271', '1', '3', '', '', '1548312319', '1548312319');
INSERT INTO `tonglian` VALUES ('6', '20060400000605104201901241445441296', '1', '3', '', '', '1548312344', '1548312344');
INSERT INTO `tonglian` VALUES ('7', '20060400000605104201901241446038191', '1', '3', '', '', '1548312363', '1548312363');
INSERT INTO `tonglian` VALUES ('8', '20060400000605104201901241447255157', '1', '3', '', '', '1548312445', '1548312445');
INSERT INTO `tonglian` VALUES ('9', '20060400000605104201901241448385115', '1', '3', '', '', '1548312518', '1548312518');
INSERT INTO `tonglian` VALUES ('10', '20060400000605104201901241452173045', '1', '3', '', '', '1548312737', '1548312737');
INSERT INTO `tonglian` VALUES ('11', '20060400000605104201901241453158141', '1', '3', '', '', '1548312795', '1548312795');
INSERT INTO `tonglian` VALUES ('12', '20060400000605104201901241453471088', '1', '3', '', '', '1548312827', '1548312827');
INSERT INTO `tonglian` VALUES ('13', '20060400000605104201901241454303213', '1', '3', '', '', '1548312870', '1548312870');
INSERT INTO `tonglian` VALUES ('14', '20060400000605104201901241456083134', '1', '3', '', '', '1548312968', '1548312968');
INSERT INTO `tonglian` VALUES ('15', '20060400000605104201901241456342474', '1', '3', '', '', '1548312994', '1548312994');
INSERT INTO `tonglian` VALUES ('16', '20060400000605104201901241457097442', '1', '3', '', '', '1548313029', '1548313029');
INSERT INTO `tonglian` VALUES ('17', '20060400000605104201901241458116028', '1', '3', '', '', '1548313091', '1548313091');
INSERT INTO `tonglian` VALUES ('18', '20060400000605104201901241458549037', '1', '3', '', '', '1548313134', '1548313134');
INSERT INTO `tonglian` VALUES ('19', '20060400000605104201901241459314092', '1', '3', '', '', '1548313171', '1548313171');
INSERT INTO `tonglian` VALUES ('20', '20060400000605104201901241500277248', '1', '3', '', '', '1548313227', '1548313227');
INSERT INTO `tonglian` VALUES ('21', '20060400000605104201901241500582949', '1', '3', '', '', '1548313258', '1548313258');
INSERT INTO `tonglian` VALUES ('22', '20060400000605104201901241501161797', '1', '3', '', '', '1548313276', '1548313276');
INSERT INTO `tonglian` VALUES ('23', '20060400000605104201901241506168798', '1', '1', '', '', '1548313576', '1548313576');
INSERT INTO `tonglian` VALUES ('24', '20060400000605104201901241507162064', '1', '1', '', '', '1548313636', '1548313636');
INSERT INTO `tonglian` VALUES ('25', '20060400000605104201901241507289187', '1', '1', '', '', '1548313648', '1548313648');
INSERT INTO `tonglian` VALUES ('26', '20060400000605104201901241507423046', '1', '3', '', '', '1548313662', '1548313662');
INSERT INTO `tonglian` VALUES ('27', '20060400000605104201901241508027777', '1', '3', '', '', '1548313682', '1548313682');
INSERT INTO `tonglian` VALUES ('28', '20060400000605104201901241508138867', '1', '1', '', '', '1548313693', '1548313693');
INSERT INTO `tonglian` VALUES ('29', '20060400000605104201901241508179920', '1', '1', '', '', '1548313697', '1548313697');
INSERT INTO `tonglian` VALUES ('30', '20060400000605104201901241513138340', '1', '4', '', '', '1548313993', '1548313993');
INSERT INTO `tonglian` VALUES ('31', '20060400000605104201901241513441332', '1', '4', '', '', '1548314024', '1548314024');
INSERT INTO `tonglian` VALUES ('32', '20060400000605104201901241515375416', '1', '4', '', '', '1548314137', '1548314137');
INSERT INTO `tonglian` VALUES ('33', '20060400000605104201901241516147703', '1', '4', '', '', '1548314174', '1548314174');
INSERT INTO `tonglian` VALUES ('34', '20060400000605104201901241516229173', '1', '4', '', '', '1548314182', '1548314182');
INSERT INTO `tonglian` VALUES ('35', '20060400000605104201901241516477919', '1', '4', '', '', '1548314207', '1548314207');
INSERT INTO `tonglian` VALUES ('36', '20060400000605104201901241517272434', '1', '4', '', '', '1548314247', '1548314247');
INSERT INTO `tonglian` VALUES ('37', '20060400000605104201901241520055745', '1', '4', '', '', '1548314405', '1548314405');
INSERT INTO `tonglian` VALUES ('38', '20060400000605104201901241520091512', '1', '4', '', '', '1548314409', '1548314409');
INSERT INTO `tonglian` VALUES ('39', '20060400000605104201901241520151380', '1', '4', '', '', '1548314415', '1548314415');
INSERT INTO `tonglian` VALUES ('40', '20060400000605104201901241520432906', '1', '4', '', '', '1548314443', '1548314443');
INSERT INTO `tonglian` VALUES ('41', '20060400000605104201901241521115481', '1', '4', '', '', '1548314471', '1548314471');
INSERT INTO `tonglian` VALUES ('42', '20060400000605104201901241536039005', '1', '6', '', '', '1548315363', '1548315363');
INSERT INTO `tonglian` VALUES ('43', '20060400000605104201901241537354608', '1', '6', '', '', '1548315455', '1548315455');
INSERT INTO `tonglian` VALUES ('44', '20060400000605104201901241538489506', '1', '6', '', '', '1548315528', '1548315528');
INSERT INTO `tonglian` VALUES ('45', '20060400000605104201901241539058270', '1', '6', '', '', '1548315545', '1548315545');
INSERT INTO `tonglian` VALUES ('46', '20060400000605104201901241539089828', '1', '6', '', '', '1548315548', '1548315548');
INSERT INTO `tonglian` VALUES ('47', '20060400000605104201901241542221830', '1', '6', '', '', '1548315742', '1548315742');
INSERT INTO `tonglian` VALUES ('48', '20060400000605104201901241546276837', '1', '6', '', '', '1548315987', '1548315987');
INSERT INTO `tonglian` VALUES ('49', '20060400000605104201901241547488785', '1', '6', '', '', '1548316068', '1548316068');
INSERT INTO `tonglian` VALUES ('50', '20060400000605104201901241547588604', '1', '6', '', '', '1548316078', '1548316078');
INSERT INTO `tonglian` VALUES ('51', '20060400000605104201901241548081661', '1', '6', '', '', '1548316088', '1548316088');
INSERT INTO `tonglian` VALUES ('52', '20060400000605104201901241548181174', '1', '6', '', '', '1548316098', '1548316098');
INSERT INTO `tonglian` VALUES ('53', '20060400000605104201901241548426172', '1', '6', '', '', '1548316122', '1548316122');
INSERT INTO `tonglian` VALUES ('54', '20060400000605104201901241549084553', '1', '6', '', '', '1548316148', '1548316148');
INSERT INTO `tonglian` VALUES ('55', '20060400000605104201901241549268047', '1', '6', '', '', '1548316166', '1548316166');
INSERT INTO `tonglian` VALUES ('56', '20060400000605104201901241550086774', '1', '6', '', '', '1548316208', '1548316208');
INSERT INTO `tonglian` VALUES ('57', '20060400000605104201901241550186469', '1', '6', '', '', '1548316218', '1548316218');
INSERT INTO `tonglian` VALUES ('58', '20060400000605104201901241550339600', '1', '6', '', '', '1548316233', '1548316233');
INSERT INTO `tonglian` VALUES ('59', '20060400000605104201901241550424768', '1', '4', '', '', '1548316242', '1548316242');
INSERT INTO `tonglian` VALUES ('60', '20060400000605104201901241550527315', '1', '4', '', '', '1548316252', '1548316252');
INSERT INTO `tonglian` VALUES ('61', '20060400000605104201901241551003926', '1', '6', '', '', '1548316260', '1548316260');
INSERT INTO `tonglian` VALUES ('62', '20060400000605104201901241551098857', '1', '6', '', '', '1548316269', '1548316269');
INSERT INTO `tonglian` VALUES ('63', '20060400000605104201901241615534498', '1', '2', '', '', '1548317753', '1548317753');
INSERT INTO `tonglian` VALUES ('64', '20060400000605104201901241616017378', '1', '2', '', '', '1548317761', '1548317761');
INSERT INTO `tonglian` VALUES ('65', '20060400000605104201901241616413622', '1', '2', '', '', '1548317801', '1548317801');
INSERT INTO `tonglian` VALUES ('66', '20060400000605104201901241617151522', '1', '2', '', '', '1548317835', '1548317835');
INSERT INTO `tonglian` VALUES ('67', '20060400000605104201901241617528249', '1', '2', '', '', '1548317872', '1548317872');
INSERT INTO `tonglian` VALUES ('68', '20060400000605104201901241618329949', '1', '2', '', '', '1548317912', '1548317912');
INSERT INTO `tonglian` VALUES ('69', '20060400000605104201901241618359991', '1', '2', '', '', '1548317915', '1548317915');
INSERT INTO `tonglian` VALUES ('70', '20060400000605104201901241618401398', '1', '2', '', '', '1548317920', '1548317920');
INSERT INTO `tonglian` VALUES ('71', '20060400000605104201901241618535293', '1', '2', '', '', '1548317933', '1548317933');
INSERT INTO `tonglian` VALUES ('72', '20060400000605104201901241618595274', '1', '2', '', '', '1548317939', '1548317939');
INSERT INTO `tonglian` VALUES ('73', '20060400000605104201901241619064316', '1', '4', '', '', '1548317946', '1548317946');
INSERT INTO `tonglian` VALUES ('74', '20060400000605104201901241619202795', '1', '1', '', '', '1548317960', '1548317960');
INSERT INTO `tonglian` VALUES ('75', '20060400000605104201901241619272202', '1', '3', '', '', '1548317967', '1548317967');
INSERT INTO `tonglian` VALUES ('76', '20060400000605104201901241619433827', '1', '1', '', '', '1548317983', '1548317983');
INSERT INTO `tonglian` VALUES ('77', '20060400000605104201901241619534369', '1', '4', '', '', '1548317993', '1548317993');
INSERT INTO `tonglian` VALUES ('78', '20060400000605104201901241619574002', '1', '4', '', '', '1548317997', '1548317997');
INSERT INTO `tonglian` VALUES ('79', '20060400000605104201901241620034705', '1', '2', '', '', '1548318003', '1548318003');
INSERT INTO `tonglian` VALUES ('80', '20060400000605104201901241620093060', '1', '4', '', '', '1548318009', '1548318009');
INSERT INTO `tonglian` VALUES ('81', '20060400000605104201901241635546059', '1', '7', '', '', '1548318954', '1548318954');
INSERT INTO `tonglian` VALUES ('82', '20060400000605104201901241636512883', '1', '7', '', '', '1548319011', '1548319011');
INSERT INTO `tonglian` VALUES ('83', '20060400000605104201901241637314672', '1', '7', '', '', '1548319051', '1548319051');
INSERT INTO `tonglian` VALUES ('84', '20060400000605104201901241637536578', '1', '7', '', '', '1548319073', '1548319073');
INSERT INTO `tonglian` VALUES ('85', '20060400000605104201901241709516234', '1', '3', '', '', '1548320991', '1548320991');
INSERT INTO `tonglian` VALUES ('86', '20060400000605104201901241710335187', '1', '3', '', '', '1548321033', '1548321033');
INSERT INTO `tonglian` VALUES ('87', '20060400000605104201901241717188408', '1', '3', '', '', '1548321438', '1548321438');
INSERT INTO `tonglian` VALUES ('88', '20060400000605104201901241717329459', '1', '3', '', '', '1548321452', '1548321452');
INSERT INTO `tonglian` VALUES ('89', '20060400000605104201901241719351518', '1', '3', '', '', '1548321575', '1548321575');
INSERT INTO `tonglian` VALUES ('90', '20060400000605104201901241720082087', '1', '3', '', '', '1548321608', '1548321608');
INSERT INTO `tonglian` VALUES ('91', '20060400000605104201901241720456813', '1', '3', '', '', '1548321645', '1548321645');
INSERT INTO `tonglian` VALUES ('92', '20060400000605104201901241721486583', '1', '3', '', '', '1548321708', '1548321708');
INSERT INTO `tonglian` VALUES ('93', '20060400000605104201901241723555097', '1', '3', '', '', '1548321835', '1548321835');
INSERT INTO `tonglian` VALUES ('94', '20060400000605104201901241724141524', '1', '3', '', '', '1548321854', '1548321854');
INSERT INTO `tonglian` VALUES ('95', '20060400000605104201901241725134925', '1', '3', '', '', '1548321913', '1548321913');
INSERT INTO `tonglian` VALUES ('96', '20060400000605104201901241748002841', '1', '3', '', '{\"\\/api\\/sendBind\":\"\",\"account_no\":\"6258101645858205\",\"account_name\":\"东东\",\"id_type\":\"0\",\"id\":\"431124196103142610\",\"tel\":\"13717394597\",\"account_type\":\"00\"}', '1548323280', '1548323280');
INSERT INTO `tonglian` VALUES ('97', '20060400000605104201901241748358172', '1', '3', '', '{\"\\/api\\/sendBind\":\"\",\"account_no\":\"6258101645858205\",\"account_name\":\"东东\",\"id_type\":\"0\",\"id\":\"431124196103142610\",\"tel\":\"13717394597\",\"account_type\":\"00\"}', '1548323315', '1548323315');
INSERT INTO `tonglian` VALUES ('98', '20060400000605104201901241749123448', '1', '3', '', '', '1548323352', '1548323352');
INSERT INTO `tonglian` VALUES ('99', '20060400000605104201901241753022062', '1', '3', '', '{\"account_no\":\"6258101645858205\",\"account_name\":\"东东\",\"id_type\":\"0\",\"id\":\"431124196103142610\",\"tel\":\"13717394597\",\"account_type\":\"00\"}', '1548323582', '1548323582');
INSERT INTO `tonglian` VALUES ('100', '20060400000605104201901251034147823', '1', '1', '', '{\"srcreqsn\":\"20060400000605104201901241619272202\",\"vercode\":\"111111\"}', '1548383654', '1548383654');
INSERT INTO `tonglian` VALUES ('101', '20060400000605104201901251036076389', '1', '1', '', '{\"srcreqsn\":\"20060400000605104201901241619272202\",\"vercode\":\"111111\"}', '1548383767', '1548383767');
INSERT INTO `tonglian` VALUES ('102', '20060400000605104201901251036229874', '1', '3', '', '{\"account_no\":\"6258101645858205\",\"account_name\":\"东东\",\"id_type\":\"0\",\"id\":\"431124196103142610\",\"tel\":\"13717394597\",\"account_type\":\"00\",\"bank_code\":\"1111\"}', '1548383782', '1548383782');
INSERT INTO `tonglian` VALUES ('103', '20060400000605104201901251036357342', '1', '3', '', '{\"account_no\":\"6258101645858205\",\"account_name\":\"东东\",\"id_type\":\"0\",\"id\":\"431124196103142610\",\"tel\":\"13717394597\",\"account_type\":\"00\",\"bank_code\":\"0306\"}', '1548383795', '1548383795');
INSERT INTO `tonglian` VALUES ('104', '20060400000605104201901251037236370', '1', '1', '', '{\"srcreqsn\":\"20060400000605104201901251036357342\",\"vercode\":\"111111\"}', '1548383843', '1548383843');
INSERT INTO `tonglian` VALUES ('105', '20060400000605104201901251038445638', '1', '1', '', '{\"srcreqsn\":\"20060400000605104201901251036357342\",\"vercode\":\"111111\"}', '1548383924', '1548383924');
INSERT INTO `tonglian` VALUES ('106', '20060400000605104201901251040071312', '1', '3', '', '{\"account_no\":\"6225883746567298\",\"account_name\":\"张三\",\"id_type\":\"0\",\"id\":\"431124196103142610\",\"tel\":\"13717394597\",\"account_type\":\"00\",\"bank_code\":\"0306\"}', '1548384007', '1548384007');
INSERT INTO `tonglian` VALUES ('107', '20060400000605104201901251040174803', '1', '3', '', '{\"account_no\":\"6225883746567298\",\"account_name\":\"张三\",\"id_type\":\"0\",\"id\":\"431124196103142610\",\"tel\":\"13717394597\",\"account_type\":\"00\",\"bank_code\":\"0308\"}', '1548384017', '1548384017');
INSERT INTO `tonglian` VALUES ('108', '20060400000605104201901251040581935', '1', '1', '', '{\"srcreqsn\":\"20060400000605104201901251040174803\",\"vercode\":\"111111\"}', '1548384058', '1548384058');
INSERT INTO `tonglian` VALUES ('109', '20060400000605104201901251046432424', '1', '5', '', '{\"account_name\":\"东东\",\"amount\":\"2000\",\"agrmno\":\"AIP8205190124000023803\"}', '1548384403', '1548384403');
INSERT INTO `tonglian` VALUES ('110', '20060400000605104201901251048149714', '1', '5', '', '{\"account_name\":\"东东\",\"amount\":\"2000\",\"agrmno\":\"AIP8205190124000023803\"}', '1548384494', '1548384494');
INSERT INTO `tonglian` VALUES ('111', '20060400000605104201901251049116538', '1', '5', '', '{\"account_name\":\"东东\",\"amount\":\"2000\",\"agrmno\":\"AIP8205190124000023803\"}', '1548384551', '1548384551');
INSERT INTO `tonglian` VALUES ('112', '20060400000605104201901251050074611', '1', '5', '', '{\"account_name\":\"东东\",\"amount\":\"2000\",\"agrmno\":\"AIP8205190124000023803\"}', '1548384607', '1548384607');
INSERT INTO `tonglian` VALUES ('113', '20060400000605104201901251052298571', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251050074611\"}', '1548384749', '1548384749');
INSERT INTO `tonglian` VALUES ('114', '20060400000605104201901251053111640', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251046432424\"}', '1548384791', '1548384791');
INSERT INTO `tonglian` VALUES ('115', '20060400000605104201901251053266565', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251049116538\"}', '1548384806', '1548384806');
INSERT INTO `tonglian` VALUES ('116', '20060400000605104201901251059393064', '1', '5', '', '[]', '1548385179', '1548385179');
INSERT INTO `tonglian` VALUES ('117', '20060400000605104201901251059533171', '1', '5', '', '[]', '1548385193', '1548385193');
INSERT INTO `tonglian` VALUES ('118', '20060400000605104201901251101349431', '1', '5', '', '[]', '1548385294', '1548385294');
INSERT INTO `tonglian` VALUES ('119', '20060400000605104201901251103033239', '1', '5', '', '[]', '1548385383', '1548385383');
INSERT INTO `tonglian` VALUES ('120', '20060400000605104201901251103437927', '1', '5', '', '[]', '1548385423', '1548385423');
INSERT INTO `tonglian` VALUES ('121', '20060400000605104201901251104058494', '1', '5', '', '[]', '1548385445', '1548385445');
INSERT INTO `tonglian` VALUES ('122', '20060400000605104201901251106191066', '1', '5', '', '[]', '1548385579', '1548385579');
INSERT INTO `tonglian` VALUES ('123', '20060400000605104201901251108262183', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251106191066\"}', '1548385706', '1548385706');
INSERT INTO `tonglian` VALUES ('124', '20060400000605104201901251112468178', '1', '3', '', '{\"account_no\":\"6225883746567298\",\"account_name\":\"张三\",\"id_type\":\"0\",\"id\":\"431124196103142610\",\"tel\":\"13717394597\",\"account_type\":\"00\",\"bank_code\":\"0308\"}', '1548385966', '1548385966');
INSERT INTO `tonglian` VALUES ('125', '20060400000605104201901251113196618', '1', '1', '', '{\"srcreqsn\":\"20060400000605104201901251112468178\",\"vercode\":\"111111\"}', '1548385999', '1548385999');
INSERT INTO `tonglian` VALUES ('126', '20060400000605104201901251118303365', '1', '5', '', '[]', '1548386310', '1548386310');
INSERT INTO `tonglian` VALUES ('127', '20060400000605104201901251120029056', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251118303365\"}', '1548386402', '1548386402');
INSERT INTO `tonglian` VALUES ('128', '20060400000605104201901251120392966', '1', '5', '', '[]', '1548386439', '1548386439');
INSERT INTO `tonglian` VALUES ('129', '20060400000605104201901251123566975', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251118303365\"}', '1548386636', '1548386636');
INSERT INTO `tonglian` VALUES ('130', '20060400000605104201901251201233369', '1', '5', '', '[]', '1548388883', '1548388883');
INSERT INTO `tonglian` VALUES ('131', '20060400000605104201901251330414489', '1', '5', '', '[]', '1548394241', '1548394241');
INSERT INTO `tonglian` VALUES ('132', '20060400000605104201901251331491556', '1', '5', '', '[]', '1548394309', '1548394309');
INSERT INTO `tonglian` VALUES ('133', '20060400000605104201901251333541080', '1', '5', '', '[]', '1548394434', '1548394434');
INSERT INTO `tonglian` VALUES ('134', '20060400000605104201901251334438696', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251333541080\"}', '1548394483', '1548394483');
INSERT INTO `tonglian` VALUES ('135', '20060400000605104201901251336585167', '1', '5', '', '[]', '1548394618', '1548394618');
INSERT INTO `tonglian` VALUES ('136', '20060400000605104201901251337083238', '1', '5', '', '[]', '1548394628', '1548394628');
INSERT INTO `tonglian` VALUES ('137', '20060400000605104201901251338224122', '1', '5', '', '[]', '1548394702', '1548394702');
INSERT INTO `tonglian` VALUES ('138', '20060400000605104201901251339153636', '1', '5', '', '[]', '1548394755', '1548394755');
INSERT INTO `tonglian` VALUES ('139', '20060400000605104201901251339458035', '1', '5', '', '[]', '1548394785', '1548394785');
INSERT INTO `tonglian` VALUES ('140', '20060400000605104201901251339536928', '1', '5', '', '[]', '1548394793', '1548394793');
INSERT INTO `tonglian` VALUES ('141', '20060400000605104201901251342549418', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251106191066\"}', '1548394974', '1548394974');
INSERT INTO `tonglian` VALUES ('142', '20060400000605104201901251345421376', '1', '5', '', '[]', '1548395142', '1548395142');
INSERT INTO `tonglian` VALUES ('143', '20060400000605104201901251345512011', '1', '5', '', '[]', '1548395151', '1548395151');
INSERT INTO `tonglian` VALUES ('144', '20060400000605104201901251350341727', '1', '5', '', '[]', '1548395434', '1548395434');
INSERT INTO `tonglian` VALUES ('145', '20060400000605104201901251352454700', '1', '5', '', '[]', '1548395565', '1548395565');
INSERT INTO `tonglian` VALUES ('146', '20060400000605104201901251353366659', '1', '5', '', '[]', '1548395616', '1548395616');
INSERT INTO `tonglian` VALUES ('147', '20060400000605104201901251353464526', '1', '5', '', '[]', '1548395626', '1548395626');
INSERT INTO `tonglian` VALUES ('148', '20060400000605104201901251403295892', '1', '5', '', '[]', '1548396209', '1548396209');
INSERT INTO `tonglian` VALUES ('149', '20060400000605104201901251403394525', '1', '5', '', '[]', '1548396219', '1548396219');
INSERT INTO `tonglian` VALUES ('150', '20060400000605104201901251404063357', '1', '5', '', '[]', '1548396246', '1548396246');
INSERT INTO `tonglian` VALUES ('151', '20060400000605104201901251404142043', '1', '5', '', '[]', '1548396254', '1548396254');
INSERT INTO `tonglian` VALUES ('152', '20060400000605104201901251405202107', '1', '5', '', '[]', '1548396320', '1548396320');
INSERT INTO `tonglian` VALUES ('153', '20060400000605104201901251407353428', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251405202107\"}', '1548396455', '1548396455');
INSERT INTO `tonglian` VALUES ('154', '20060400000605104201901251407424175', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251404142043\"}', '1548396462', '1548396462');
INSERT INTO `tonglian` VALUES ('155', '20060400000605104201901251407497634', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251404063357\"}', '1548396469', '1548396469');
INSERT INTO `tonglian` VALUES ('156', '20060400000605104201901251407553752', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251403394525\"}', '1548396475', '1548396475');
INSERT INTO `tonglian` VALUES ('157', '20060400000605104201901251408013868', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251403295892\"}', '1548396481', '1548396481');
INSERT INTO `tonglian` VALUES ('158', '20060400000605104201901251408081142', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251353464526\"}', '1548396488', '1548396488');
INSERT INTO `tonglian` VALUES ('159', '20060400000605104201901251417191716', '1', '1', '', '{\"srcreqsn\":\"20060400000605104201901251112468178\",\"vercode\":\"111111\"}', '1548397039', '1548397039');
INSERT INTO `tonglian` VALUES ('160', '20060400000605104201901251417222751', '1', '5', '', '[]', '1548397042', '1548397042');
INSERT INTO `tonglian` VALUES ('161', '20060400000605104201901251418543843', '1', '5', '', '[]', '1548397134', '1548397134');
INSERT INTO `tonglian` VALUES ('162', '20060400000605104201901251419254289', '1', '5', '', '[]', '1548397165', '1548397165');
INSERT INTO `tonglian` VALUES ('163', '20060400000605104201901251419455153', '1', '5', '', '[]', '1548397185', '1548397185');
INSERT INTO `tonglian` VALUES ('164', '20060400000605104201901251420516608', '1', '5', '', '[]', '1548397251', '1548397251');
INSERT INTO `tonglian` VALUES ('165', '20060400000605104201901251423563545', '1', '5', '', '[]', '1548397436', '1548397436');
INSERT INTO `tonglian` VALUES ('166', '20060400000605104201901251425295999', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251423563545\"}', '1548397529', '1548397529');
INSERT INTO `tonglian` VALUES ('167', '20060400000605104201901251430059696', '1', '5', '', '[]', '1548397805', '1548397805');
INSERT INTO `tonglian` VALUES ('168', '20060400000605104201901251433207962', '1', '5', '', '[]', '1548398000', '1548398000');
INSERT INTO `tonglian` VALUES ('169', '20060400000605104201901251433491714', '1', '5', '', '[]', '1548398029', '1548398029');
INSERT INTO `tonglian` VALUES ('170', '20060400000605104201901251434255436', '1', '5', '', '[]', '1548398065', '1548398065');
INSERT INTO `tonglian` VALUES ('171', '20060400000605104201901251444069261', '1', '7', '', '{\"query_sn\":\"20060400000605104201901251423563545\"}', '1548398646', '1548398646');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `headimg` varchar(255) NOT NULL DEFAULT '' COMMENT '微信头像',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态  1 正常  0 禁止',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 更新时间',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登陆时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `salt` varchar(25) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '2222', '8db78f84e672140977328b148ff18781', '', '', '13717394597', '1605882812@qq.com', '1', '1547793169', '1548499660', '1547793809', '', 'CKvM5O');
INSERT INTO `user` VALUES ('3', 'test3', '7b79e788e94c1c41b6d4e1b1280c4bdb', '', '', '13717394599', '1605882812@qq.com', '1', '1547793169', '1548308255', '1547793809', '', '');
INSERT INTO `user` VALUES ('7', '11', '', '', '', '13717394511', '', '1', '1548407899', '1548407899', '0', '', '');
INSERT INTO `user` VALUES ('8', '112', '', '', '', '13717394551', '', '1', '1548407952', '1548407952', '0', '', '');
INSERT INTO `user` VALUES ('10', '1122', '', '', '', '13717394111', '', '1', '1548408364', '1548408364', '0', '', '');
INSERT INTO `user` VALUES ('11', '112222', '', '', '', '13717391111', '', '1', '1548408410', '1548408410', '0', '', '');
INSERT INTO `user` VALUES ('13', '11222222', '', '', '', '18826810424', '', '1', '1548409368', '1548409368', '0', '', '');
INSERT INTO `user` VALUES ('16', '分', '16cb3711f73d59297288bf1f82c7e479', '', '', '17302003009', '', '1', '1548483159', '1548483159', '0', '', 'MduZwx');
