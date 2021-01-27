<template>
	<view>
		<view id="app">
			<view id="couponDetail" style="padding: 0px;">
				<p class="ft16" style="padding-left: 10px; padding-right: 10px;">特权内容</p>
				<view class="coupon">
					<view class="left">
						<p class="num">{{coupon.cut_money}}</p>
						<p class="ft18">元</p>
					</view>
					<view class="center">
						<p class="couponName ft18 van-ellipsis">{{coupon.title}}</p>
						<p class="ft10">{{coupon.end_at}}</p>
						<p class="ft12">可领取：{{activity.can_buy_time}} 次</p>
						<p class="ft12">已领取：{{activity_record_num}} 次</p>
					</view>
					<view class="right ft14">
						<p class="verticalcenter" @click="getCoupon(coupon)">立<br>即<br>领<br>取</p>
					</view>
				</view>
				
				
				<view class="storeList" style="margin-top: 15px;">
					<p class="ft18" style="padding-left: 10px; padding-right: 10px;">服务门店</p>
					<view role="feed" class="van-list" style="background: rgb(242, 244, 246);">
						<view class="store flex-ac">
							<view class="verticalcenter store-img van-image" style="width: 80px; height: 80px;"><img class="van-image__img"
								 :src="shop.shop_pic"></view>
							<view class="ft18 card-text">
								<view><span class="station van-multi-ellipsis--l2"> {{shop.shop_name}}</span></view>
								<view class="ft14 location">
									<view class="flex-ac"><i class="van-icon van-icon-location" style="font-size: 14px;">
											<!----></i><span class="address van-ellipsis">{{shop.address}}</span></view><span class="distanceText"></span>
								</view>
							</view>
						</view>


						<view class="van-list__placeholder"></view>
					</view>
					
					<p class="content"></p>
					<view class="member-main" >
						<view class="x-content" v-html="coupon.content"></view>
						<view class="x-content" v-html="activity.content"></view>
					</view>
					
					
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				coupon:{},
				shop:{},
				activity:{},
				share_user:{},
				share_code:"",
				activity_record_num:0,
			}
		},
		onLoad(option) {
			this.share_code = option.share_code || "";
			this.loadData(option);
		},
		onShow() {
			this.reLoadSize();
			
		},
		methods: {
			async loadData(option) {
					
					
					
					// var _this = this;
					// _this.post({
					// 	url:'/coupon_api/shareCouponDetail',
					// 	data:{
					// 		'shop_id': 1,
					// 		'share_code': this.share_code,
					// 	},
					// 	success:function(res){
					// 		console.log(res);
					// 		if(res.data.err == 0){
					// 			_this.coupon = res.data.data.user_coupon;
					// 			_this.activity = res.data.data.activity;
					// 			_this.shop = res.data.data.shop;
					// 			_this.share_user = res.data.data.share_user;
					// 		}
							
					// 	}
					// });
					
					
					await this.http.post("/coupon_api/shareCouponDetail", {
						'shop_id': 1,
						'share_code': this.share_code,
					}).then(
						async r => {
							console.log(r);
							this.coupon = r.user_coupon;
							this.activity = r.activity;
							this.shop = r.shop;
							this.share_user = r.share_user;
							
						}
					)
				},
				async getCoupon(option){
					var id = option.id || 0;
					
					await this.http.post("/coupon_api/getShareCoupon", {
						'shop_id': 1,
						'share_code': this.share_code,
					}).then(
						async r => {
							uni.showToast({
								title:"领取成功"
							})
						}
					)
				},
			
		}
	}
</script>

<style>
	[class*=van-]:focus,
	a:focus {
		outline: 0;
	}

	.van-icon {
		position: relative;
		font: normal normal normal .37333rem/1 vant-icon;
		font-size: inherit;
		text-rendering: auto;
		-webkit-font-smoothing: antialiased;
	}

	.van-icon,
	.van-icon:before {
		display: inline-block;
	}

	.van-icon-location:before {
		content: "\F07D";
	}

	.van-image {
		position: relative;
		display: inline-block;
	}

	.van-image__img {
		display: block;
		width: 100%;
		height: 100%;
	}

	.van-list__placeholder {
		height: 0;
		pointer-events: none;
	}

	a {
		text-decoration: none;
	}

	[class*=van-]:focus,
	a:focus {
		outline: none;
	}

	ul {
		margin: 0;
		padding: 0;
		list-style: none;
	}

	.van-ellipsis {
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}

	.van-multi-ellipsis--l2 {
		-webkit-line-clamp: 2;
	}

	.van-multi-ellipsis--l2 {
		display: -webkit-box;
		overflow: hidden;
		text-overflow: ellipsis;
		-webkit-box-orient: vertical;
	}

	* {
		margin: 0;
		padding: 0;
	}

	* {
		touch-action: pan-y;
	}

	img {
		display: block;
		width: 100%;
		font-size: 0;
	}

	.ft10 {
		font-size: .26667rem;
	}

	.ft12 {
		font-size: .32rem;
	}

	.ft14 {
		font-size: .37333rem;
	}

	.ft16 {
		font-size: .42667rem;
	}

	.ft18 {
		font-size: .48rem;
	}

	.flex-ac {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
	}

	.flex-ac {
		-webkit-box-align: center;
		-webkit-align-items: center;
		align-items: center;
	}

	.verticalcenter {
		position: relative;
		top: 50%;
		-webkit-transform: translateY(-50%);
		transform: translateY(-50%);
	}

	#app {
		width: 100%;
		height: 100%;
	}

	.coupon {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		width: 9.38667rem;
		height: 2.4rem;
		margin: 0 auto .26667rem;
		color: #fff;
		-webkit-align-content: center;
		align-content: center;
		background: url(https://www.czg365.com/static/img/coupon.72be727b.png) no-repeat 0/100%;
	}

	.coupon .left {
		-webkit-box-flex: 11;
		-webkit-flex: 11;
		flex: 11;
		padding-top: .13333rem;
	}

	.coupon .left p {
		text-align: center;
	}

	.coupon .left .num {
		line-height: 1.33333rem;
		margin-bottom: .08rem;
		font-size: .93333rem;
	}

	.coupon .center {
		position: relative;
		-webkit-box-flex: 25;
		-webkit-flex: 25;
		flex: 25;
		padding: .24rem 0 0 .21333rem;
	}

	.coupon .center .couponName {
		width: 4.93333rem;
		margin-bottom: .08rem;
		line-height: .66667rem;
	}

	.coupon .center .ft10 {
		line-height: .37333rem;
	}

	.coupon .center .ft12 {
		line-height: .42667rem;
	}

	.coupon .right {
		-webkit-box-flex: 6;
		-webkit-flex: 6;
		flex: 6;
		text-align: center;
		line-height: .42667rem;
	}

	#couponDetail {
		background: var(--Highlight-background-color);
		margin: 0 auto;
		padding: 0 .26667rem;
	}

	#couponDetail .member-main {
		margin-top: .26667rem;
		font-size: .42667rem;
		line-height: .64rem;
	}

	#couponDetail .ft16 {
		padding: .4rem;
	}

	#couponDetail .coupon {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		width: 9.38667rem;
		height: 2.4rem;
		margin: 0 auto;
		color: #fff;
		-webkit-align-content: center;
		align-content: center;
		background: url(https://www.czg365.com/static/img/coupon.72be727b.png) no-repeat 1;
	}

	#couponDetail .coupon .left {
		-webkit-box-flex: 11;
		-webkit-flex: 11;
		flex: 11;
		padding-top: .13333rem;
	}

	#couponDetail .coupon .left p {
		text-align: center;
	}

	#couponDetail .coupon .left .num {
		line-height: 1.33333rem;
		margin-bottom: .08rem;
		font-size: .93333rem;
	}

	#couponDetail .coupon .center {
		position: relative;
		-webkit-box-flex: 25;
		-webkit-flex: 25;
		flex: 25;
		padding: .24rem 0 0 .21333rem;
	}

	#couponDetail .coupon .center .couponName {
		width: 4.93333rem;
		margin-bottom: .08rem;
		line-height: .66667rem;
	}

	#couponDetail .coupon .center .ft10 {
		line-height: .37333rem;
	}

	#couponDetail .coupon .center .ft12 {
		line-height: .42667rem;
	}

	#couponDetail .coupon .right {
		-webkit-box-flex: 6;
		-webkit-flex: 6;
		flex: 6;
		text-align: center;
		line-height: .42667rem;
	}

	#couponDetail .store {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		-webkit-box-align: start;
		-webkit-align-items: flex-start;
		align-items: flex-start;
		height: 2.29333rem;
		padding: .37333rem .32rem .53333rem .4rem;
		background: var(--Highlight-background-color);
		margin-bottom: .26667rem;
	}

	#couponDetail .store .van-image img {
		width: 100%;
		height: 100%;
	}

	#couponDetail .store .card-text {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		-webkit-box-orient: horizontal;
		-webkit-box-direction: reverse;
		-webkit-flex-direction: row-reverse;
		flex-direction: row-reverse;
		-webkit-flex-wrap: wrap;
		flex-wrap: wrap;
		-webkit-align-content: space-between;
		align-content: space-between;
		width: calc(100% - 2.4rem);
		height: 100%;
		margin-left: .26667rem;
	}

	#couponDetail .store .card-text>div {
		width: 100%;
	}

	#couponDetail .store .card-text .station {
		width: 6.66667rem;
		color: #323232;
	}

	#couponDetail .store .location {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		-webkit-justify-content: space-around;
		justify-content: space-around;
		line-height: .45333rem;
		height: .45333rem;
		color: #a7a7a7;
	}

	#couponDetail .store .location .address {
		width: 4.66667rem;
		padding-left: .13333rem;
		box-sizing: border-box;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}

	#couponDetail .store .location .distanceText {
		white-space: nowrap;
	}
</style>
