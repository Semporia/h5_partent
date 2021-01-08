<template>
	<view>
		<view id="app">
			<view v-show="!show" style="width: 100%;text-align: center;padding: 20px 0;"> 暂无活动 </view>
			<view id="privilegeCenter" class="pb50" v-show="show">
				<view class="member">
					<view class="left">
						<view class="logo"><img :src="shop.shop_pic"></view>
						<view class="text">
							<p class="name ft16">{{activity.title}}</p>
							<p class="endTime ft10">结束时间:{{activity.end_at}}</p>
						</view>
					</view>
					<view class="right ft12" @click="getActivity(activity)">立即领取</view>
				</view>
				<p class="black ft18">活动优惠券</p>
				<view role="feed" class="merchantList van-list">
					<view class="merchant">
						
						<view v-for="(coupon,c_index) in activity_coupons" :key="c_index">
							
							<view class="coupon">
								<view class="left">
									<p class="num">{{coupon.cut_money}}</p>
									<p class="ft18">元</p>
								</view>
								<view class="center">
									<p class="couponName ft18 van-ellipsis">{{coupon.title}}</p>
									<p class="ft10">有效期：{{coupon.end_at}}</p>
									<view class="couponDetailBtn ft12" @click="goCouponDetail(coupon)">查看详情</view>
								</view>
								<view class="right ft14">
									<p class="verticalcenter" @click="getCoupon(coupon)">立<br>即<br>领<br>取</p>
								</view>
							</view>
							
							<view class="x-line"></view>
							
						</view>
						
						<!-- <view class="coupon">
							<view class="left">
								<p class="num">3000</p>
								<p class="ft18">元</p>
							</view>
							<view class="center">
								<p class="couponName ft18 van-ellipsis">3000元私教抵用券</p>
								<p class="ft10">有效期：2023年6月25日0时</p>
								<view class="couponDetailBtn ft12" @click="NavTo('/pages/public/coupon_detail')">查看详情</view>
							</view>
							<view class="right ft14">
								<p class="verticalcenter">立<br>即<br>领<br>取</p>
							</view>
						</view> -->
						
						<p class="ft16">服务门店</p>
						<view class="store">
							<view class="logo"><img :src="shop.shop_pic"></view>
							<view class="detail">
								<p class="name ft16 van-multi-ellipsis--l2">{{shop.shop_name}}</p>
								<p class="address van-ellipsis ft10">{{shop.address}}</p>
								<view class="ft14">电话：{{shop.tel}}</view>
							</view>
						</view>
						
						
						<!-- <view class="showMoreStore ft12">
							查看更多门店
						</view> -->
					</view>
					<view class="x-content">
						<p class="ft16">活动详情</p>
						<view class="member-main" style="">
							
							<view class="x-content" v-html="activity.content"></view>
							<!-- <ul>
								<li>客户购买99会员后可以领取5张，每次到店每人/每车仅可使用1张，不可叠加使用；</li>
								<li>此券可在任何一个合作商户使用（合作网点有变更将不提前通知，以平台显示商户为主）；</li>
								<li>所有机油品牌为合作商正常使用的机油品牌;</li>
								<li>本券仅在店内保养时抵扣，不可外带：</li>
								<li>本券不可兑换现金，不可转赠，不可退.；</li>
								<li>超过有效期后本券自动作废；</li>
								<li>使用有效期三年（6.26-2023.6.25)</li>
								<li>需提前一天预约合作商.</li>
							</ul> -->
						</view>
					</view>
					<view class="van-list__placeholder"></view>
				</view>
				
				
				<footnav nav=""> </footnav>
				
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				shop:{},
				activity_coupons:[],
				activity:{},
				show:false,
				
			}
		},
		onLoad(option) {
			var id = option.id || 0;
			this.loadData(id);
		},
		onShow() {
			this.reLoadSize();
			
		},
		methods: {
			loadData(id){
				var _this = this;
				uni.showLoading({title: '加载中'});
				_this.post({
					url: '/index/activityDetail',
					data: {id:id},
					success: function(res) {
						uni.hideLoading();
						if(res.data.err==0){
							_this.shop = res.data.data.shop;
							_this.activity_coupons = res.data.data.activity_coupons;
							_this.activity = res.data.data.activity;
							_this.show = true;
						}
					}
				});
			},
		
			goCouponDetail(item){
				this.NavTo('/pages/public/coupon_detail?id='+item.id);
			},
			
			getCoupon(coupon){
				var _this = this;
				var id = coupon.id || 0;
				uni.showLoading({title: '加载中'});
				_this.post({
					url: '/coupon_api/getCoupon',
					data: {id:id},
					success: function(res) {
						uni.hideLoading();
						uni.showToast({
							title:res.data.msg
						})
						if(res.data.err==0){
							
						}
					}
				});
			},
			getActivity(activity){
				var _this = this;
				var id = activity.id || 0;
				uni.showLoading({title: '加载中'});
				_this.post({
					url: '/coupon_api/getActivity',
					data: {id:id},
					success: function(res) {
						uni.hideLoading();
						uni.showToast({
							title:res.data.msg
						})
						if(res.data.err==0){
							
						}
					}
				});
			},
		}
	}
</script>

<style>
	
	.x-line{
		width: 100%;
		height: 10px;
	}
	
[class*=van-]:focus{outline:0;}
.van-list__placeholder{height:0;pointer-events:none;}
[class*=van-]:focus{outline:none;}
ul{margin:0;padding:0;list-style:none;}
.van-ellipsis{overflow:hidden;white-space:nowrap;text-overflow:ellipsis;}
.van-multi-ellipsis--l2{-webkit-line-clamp:2;}
.van-multi-ellipsis--l2{display:-webkit-box;overflow:hidden;text-overflow:ellipsis;-webkit-box-orient:vertical;}

*{margin:0;padding:0;}
*{touch-action:pan-y;}
.pb50{padding-bottom:1.33333rem;}
img{display:block;width:100%;font-size:0;}
.ft10{font-size:.26667rem;}
.ft12{font-size:.32rem;}
.ft14{font-size:.37333rem;}
.ft16{font-size:.42667rem;}
.ft18{font-size:.48rem;}
.flex{display:-webkit-box;display:-webkit-flex;display:flex;}
.flex-1{-webkit-box-flex:1;-webkit-flex:1;flex:1;}
.flex-1{display:-webkit-box;display:-webkit-flex;display:flex;}
.flex-center{-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center;}
.flex-center{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-align:center;-webkit-align-items:center;align-items:center;}
.w-100{width:100%;}
.verticalcenter{position:relative;top:50%;-webkit-transform:translateY(-50%);transform:translateY(-50%);}
#app{width:100%;height:100%;}
.coupon{display:-webkit-box;display:-webkit-flex;display:flex;width:9.38667rem;height:2.4rem;margin:0 auto .26667rem;color:#fff;-webkit-align-content:center;align-content:center;background:url(https://www.czg365.com/static/img/coupon.72be727b.png) no-repeat 0/100%;}
.coupon .left{-webkit-box-flex:11;-webkit-flex:11;flex:11;padding-top:.13333rem;}
.coupon .left p{text-align:center;}
.coupon .left .num{line-height:1.33333rem;margin-bottom:.08rem;font-size:.93333rem;}
.coupon .center{position:relative;-webkit-box-flex:25;-webkit-flex:25;flex:25;padding:.24rem 0 0 .21333rem;}
.coupon .center .couponName{width:4.93333rem;margin-bottom:.08rem;line-height:.66667rem;}
.coupon .center .ft10{line-height:.37333rem;}
.coupon .center .ft12{line-height:.42667rem;}
.coupon .center .couponDetailBtn{position:absolute;left:3.46667rem;top:1.6rem;width:1.6rem;height:.53333rem;background-color:#fff;border-radius:.32rem;color:#ff3c46;text-align:center;line-height:.53333rem;}
.coupon .right{-webkit-box-flex:6;-webkit-flex:6;flex:6;text-align:center;line-height:.42667rem;}

#privilegeCenter .member{height:3.6rem;padding:0 .53333rem;display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-pack:justify;-webkit-justify-content:space-between;justify-content:space-between;background:url(https://www.czg365.com/static/img/head.0ee9ae8a.jpg) no-repeat 0 -1.73333rem/100% auto;}
#privilegeCenter .member .left{margin-top:.53333rem;}
#privilegeCenter .member .left > view{display:inline-block;}
#privilegeCenter .member .left .logo{width:1.06667rem;height:1.06667rem;vertical-align:middle;}
#privilegeCenter .member .left .logo img{width:100%;height:100%;border:.02667rem solid #fff;border-radius:50%;}
@media (prefers-color-scheme: dark) {
    #privilegeCenter .member .left .logo img {
      -webkit-filter: brightness(0) invert(1);
      filter: brightness(0) invert(1);
    }
  }
#privilegeCenter .member .left .text{vertical-align:middle;margin-left:.21333rem;}
#privilegeCenter .member .left .text .name{line-height:.58667rem;}
#privilegeCenter .member .left .text .endTime{line-height:.37333rem;}
#privilegeCenter .member .right{width:1.6rem;height:.53333rem;margin-top:.85333rem;background-color:#fff;border-radius:.53333rem;color:#ff3c46;text-align:center;line-height:.53333rem;}
#privilegeCenter .black{width:8.21333rem;height:.48rem;margin:-1.06667rem auto .8rem;color:#fff;text-align:center;}
#privilegeCenter .merchantList{padding-top:.02667rem;background-color:#fff;}
#privilegeCenter .merchantList .merchant{width:9.33333rem;margin:.21333rem auto 0;border:.02667rem solid #ddd;border-radius:.08rem;}
#privilegeCenter .merchantList .merchant .coupon{display:-webkit-box;display:-webkit-flex;display:flex;width:9.38667rem;height:2.4rem;margin:0 auto;color:#fff;-webkit-align-content:center;align-content:center;background:url(https://www.czg365.com/static/img/coupon.72be727b.png) no-repeat 0/100%;}
#privilegeCenter .merchantList .merchant .coupon .left{-webkit-box-flex:11;-webkit-flex:11;flex:11;padding-top:.13333rem;}
#privilegeCenter .merchantList .merchant .coupon .left p{text-align:center;}
#privilegeCenter .merchantList .merchant .coupon .left .num{line-height:1.33333rem;margin-bottom:.08rem;font-size:.93333rem;}
#privilegeCenter .merchantList .merchant .coupon .center{position:relative;-webkit-box-flex:25;-webkit-flex:25;flex:25;padding:.24rem 0 0 .21333rem;}
#privilegeCenter .merchantList .merchant .coupon .center .couponName{width:4.93333rem;margin-bottom:.08rem;line-height:.66667rem;}
#privilegeCenter .merchantList .merchant .coupon .center .ft10{line-height:.37333rem;}
#privilegeCenter .merchantList .merchant .coupon .center .ft12{line-height:.42667rem;}
#privilegeCenter .merchantList .merchant .coupon .center .couponDetailBtn{position:absolute;left:3.46667rem;top:1.6rem;width:1.6rem;height:.53333rem;background-color:#fff;border-radius:.32rem;color:#ff3c46;text-align:center;line-height:.53333rem;}
#privilegeCenter .merchantList .merchant .coupon .right{-webkit-box-flex:6;-webkit-flex:6;flex:6;text-align:center;line-height:.42667rem;}
#privilegeCenter .merchantList .merchant>.ft16{height:.8rem;padding:.4rem 0 0 .32rem;}
#privilegeCenter .merchantList .merchant .store{position:relative;padding:.26667rem .16rem .26667rem .26667rem;}
#privilegeCenter .merchantList .merchant .store>view{display:inline-block;}
#privilegeCenter .merchantList .merchant .store .logo{width:2.13333rem;height:2.13333rem;}
#privilegeCenter .merchantList .merchant .store .logo img{width:100%;height:100%;}
#privilegeCenter .merchantList .merchant .store .detail{width:6.53333rem;height:2.13333rem;margin:.02667rem 0 0 .21333rem;text-align:justify;vertical-align:top;}
#privilegeCenter .merchantList .merchant .store .detail .name{width:5.86667rem;line-height:.58667rem;}
#privilegeCenter .merchantList .merchant .store .detail .address{position:absolute;width:5.46667rem;bottom:.26667rem;line-height:.37333rem;vertical-align:bottom;color:#9e9e9e;}
#privilegeCenter .merchantList .merchant .store .detail .goStore{position:absolute;width:1.06667rem;color:#aaa;line-height:.48rem;text-align:center;border:.02667rem solid #666;bottom:.26667rem;right:.21333rem;border-radius:.32rem;}
#privilegeCenter .merchantList .merchant .showMoreStore{margin:.4rem 0;text-align:center;color:#323232;}

</style>
