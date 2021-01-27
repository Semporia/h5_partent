<template>
	<view class="user-coupon">
		<view class="card" >
			<view class="user_info">
				<image class="portrait" :src="shop.share_pic">
				<view class="nickname">{{shop.shop_name}}</view>
			</view>
			<view class="vip">{{coupon.cut_money}}元</view>
			<view class="bottom">
				<view class="activity" v-if="coupon.over_money>0">满{{coupon.over_money}}元 <span v-if="coupon.discount>0">可抵扣总金额的{{coupon.discount}}% </span> <span v-else>可抵扣{{coupon.cut_money}}元</span></view>
				<view class="activity" v-else>无门槛<span v-if="coupon.discount>0">可抵扣总金额的{{coupon.discount}}% </span> <span v-else>可抵扣{{coupon.cut_money}}元</span></view>
				<view class="can_use_time">有效期{{coupon.can_use_at|formatData}}<br/>至{{coupon.can_use_end_at|formatData}}</view>
			</view>
		</view>
		
		<view class="bottomBox">
			<view class="flip" >
				<image class="img" :src="user.headimgurl" />
			</view>
			<h4>余额：{{coupon.has_money}}元</h4>
				<button class="send" @click="toShare">赠送给好友</button>
				<view class="menu">
					<view class="title">使用须知</view>
						<view class="info">
								{{coupon.mark}}				
						</view>
					<view class="title">商家信息</view>
					<view class="info">
						<view class="info-list">店名:{{shop.shop_name}}</view>
						<view class="info-list">地址:{{shop.shop_address}}</view>
						<view class="info-list">联系人:{{shop.name}}</view>
						<view class="info-list">电话:{{shop.tel}}</view>						
					</view>
				</view>
		</view>
		
		
		<!-- 分享引导 -->
		<view class="popup spec " :class="{'sharehide':sharehide}" @click="hideShareSpec">
			<!-- 遮罩层 -->
			<view class="mask" @click="hideShareSpec"></view>
			<view class="share-bg">
				<!-- <image src="@/static/img/vip-card.png"></image> -->
			</view>
		</view>
		
		
	</view>
</template>
<script>

	import jweixin from '@/utils/wechat/jweixin.js';
	
	export default {
		components: {
			
		},		
		data() {
			return {
				hostUrl:'2018-5562-1158',
				qrcode_show:0,
				begin:0,
				makeOnLoad:true,
				coupon:{hash_code:'2222'},
				shop:{},
				user:{},
				jssdk_config:{},
				sharehide: true, // 分享引导弹窗
				shareBg: "",
			};
		},
		filters: {
			hash_fomart:function(s){
				if(s == undefined){
					return '';
				}
				return s.slice(0,4)+' - '+s.slice(4,8)
			},
			formatData(data){
				if(data == undefined){
					return '';
				}
				return data.slice(0,10)
			}
		},
		onShow() {
			this.reSize();
		},
		onLoad(options) {
			var id = options.id||0;
			this.coupon.hash_code="";
			this.reloa_data(id);
			this.initData(options);
		},
		methods: {
			reSize(){
				var html = document.getElementsByTagName("html")[0];
				var body = document.getElementsByTagName("body")[0];
				var width = document.body.offsetWidth; // 获取当前页面的宽度
				console.log(width);
				var nowFont = width / 375 * 37.5/ 2; // 通过标签名称来获取元素 
				html.style.fontSize = nowFont + "px";
				body.style = "font-size: 12px; overflow: auto;";
			},
			
			hideShareSpec() {
				this.sharehide = true;
				setTimeout(() => {
					this.sharehide = true;
				}, 250);
			},
			share() {
				var _this = this;
				this.sharehide = false;
				console.log('ooo');
			},
			async initData(options) {
				var from_user_id = options.from_user_id;
				if(from_user_id){
					uni.setStorageSync('from_user_id',from_user_id);
				}
				this.wxConfig();
			},
			wxConfig(){
				var _this = this;
				_this.post({
					url:'/wechat/config',
					data:{},
					success:function(res){
						if(res.data.err==0){
							_this.jssdk_config=res.data.data.jssdk_config;
							jweixin.config({
							    ...res.data.data.jssdk_config
							});
						}
					}
				});
			},
			show(){
				this.qrcode_show = this.qrcode_show?0:1;
				this.makeOnLoad = false ;

			},
			reloa_data(id){
				var _this = this;
				_this.post({
					url:'/user/couponDetail',
					data:{user_coupon_id:id},
					success:function(res){
						_this.coupon = res.data.data.user_coupon;
						_this.shop = res.data.data.shop;
						_this.user = res.data.data.user;			
					}
				});
			},
			toShare(){
				var _this = this;
				_this.post({
					url:'/coupon_api/toShareCoupon',
					data:{user_coupon_id:_this.coupon.id},
					success:function(res){
						var sharedata = res.data.data;
						var shareOption={
							title: sharedata.title , // 分享标题
							desc: "送你一张优惠券请速领取"+sharedata.title , // 分享描述
							link: "http://h5.zhusutao.com/h5/newhome/#/pages/public/share_view?share_code="+sharedata.share_code , // 分享链接
							imgUrl: sharedata.pic , // 分享图标
							success: function () { 
							        // 用户确认分享后执行的回调函数
							},
							cancel: function () { 
								// 用户取消分享后执行的回调函数
							}
						};
						console.log(sharedata);
						jweixin.onMenuShareAppMessage(shareOption);
						jweixin.onMenuShareTimeline(shareOption);
						
						
						uni.showToast({
							title: "点击右上角分享给好友吧",
							duration: 3000
						});
						
					}
				});
			}
		}
	};
</script>
<style lang="scss">
	.none{
		display: none;
	}
	.qrcode{
		padding: 5px;
	}
	
	body {
		padding: 0;
		margin: 0;
		background: #f2f2f2;
	}

	a {
		text-decoration: none;
		color: inherit;
	}

	.card {
		width: 95%;
		height: auto;
		margin: 0.625rem auto;
		overflow: hidden;
		border-radius: 0.3125rem;
		background: #ead793;
		.user_info {
			display: flex;
			padding: 0.9375rem;

			.portrait {
				width: 3.125rem;
				height: 3.125rem;
				border-radius: 3.125rem;
			}

			.nickname {
				margin: 0rem 0.9375rem;
				line-height: 3.125rem;
				font-size: 0.875rem;
				align-content: center;
				color: white;
				font-weight: bold;
			}
		}

		.vip {
			text-align: center;
			color: white;
			font-size: 1.5rem;
			font-weight: bold;
		}

		.bottom {
			display: flex;
			padding: 0.9375rem;

			.activity {
				width: 80%;
				height: 3.125rem;
				line-height: 3.125rem;
				color: white;
				letter-spacing: 0.0625rem;
			}

			.can_use_time {
				width: 8.125rem;
				height: 3.125rem;
				border-radius: 0.3125rem;
				color: #FFF;
				font-size: 8px;
			}
		}
	}

	.panel {
		// display: none;
		width: 95%;
		height: auto;
		margin: 0rem auto;
		padding: 1rem 0;
		text-align: center;
		background: white;
		border-radius: 0.3125rem;
		overflow: hidden;
	}

	.bottomBox {
		display: block;
		width: 95%;
		height: auto;
		padding: 0rem;
		margin: 3.125rem auto;
		text-align: center;
		border-radius: 0.3125rem;
		background: white;
		.flip {
			position: relative;
			top: -1.25rem;
			width: 3.125rem;
			height: 3.125rem;
			padding: 0.9375rem;
			margin: 0 auto;
			border-radius: 3.125rem;
			background: white;
			box-shadow: 0rem 0rem 0.5rem rgba(0,0,0,.5);
			text-align: center;
			.qrcode{
				text-align: center;
			}
			.img {
				width: 100%;
				height: 100%;
			}
		}

		.send {
			width: 80%;
			height: auto;
			padding: 0rem;
			margin: 1.25rem auto;
			font-size: 0.874rem;
			color: #666666;
			border: 0.0625rem solid #dedcdc;
			border-radius: 0.3125rem;
			background: white;
		}

		.menu {
			padding: 0.9375rem;

			.title {
				position: relative;
				display: -webkit-box;
				display: -webkit-flex;
				display: flex;
				-webkit-box-align: center;
				-webkit-align-items: center;
				align-items: center;
				line-height: 3.125rem;
				font-size: 0.874rem;
				text-align: left;
				border-bottom: 0.0625rem solid #dedcdc;

				&:nth-child(1) {
					border-top: 0.0625rem solid #dedcdc;
				}

				&:after {
					content: "";
					display: inline-block;
					vertical-align: middle;
					width: 0.9375rem;
					height: 0.9375rem;
					background-image: url(https://m.zhusutao.com/templates/mshop/default/themes/img/icon/right.png);
					background-repeat: no-repeat;
					background-size: 100%;
					position: absolute;
					top: 44%;
					right: 0.625rem;
					margin-top: -0.3125rem;
				}
			}
		}
	}
</style>
