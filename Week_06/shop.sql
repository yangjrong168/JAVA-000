CREATE TABLE `shop_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `nick_name` varchar(50) NOT NULL COMMENT '用户昵称',
  `mobile` char(11) NOT NULL COMMENT '手机',
  `create_time` timestamp NOT NULL COMMENT '加入时间',
 `update_time` timestamp NOT NULL COMMENT '修改时间',
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='用户表'


CREATE TABLE `shop_product` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '商品名称',
  `price` int NOT NULL COMMENT '价格 分',
  `stock` int NOT NULL COMMENT '库存',
 `state` int NOT NULL COMMENT '状态 0 下架 1 上架',
  `create_time` timestamp NOT NULL COMMENT '加入时间',
 `update_time` timestamp NOT NULL COMMENT '修改时间',
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='商品表'


CREATE TABLE `shop_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
 `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `amount` int NOT NULL COMMENT '金额 分',
 `state` int NOT NULL COMMENT '状态 0 待支付 1 已支付',
  `create_time` timestamp NOT NULL COMMENT '加入时间',
 `update_time` timestamp NOT NULL COMMENT '修改时间',
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='订单表'


CREATE TABLE `shop_order_product` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
 `order_id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单id',
 `product_id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `num` int NOT NULL COMMENT '数量',
  `price` int NOT NULL COMMENT '价格 分',
  `amount` int NOT NULL COMMENT '金额 分'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='订单商品表'
