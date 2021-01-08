<template>
	<view>
		<view id="app">
			<view id="ticketCenter">
				<view class="van-tabs van-tabs--line">
					<view class="van-tabs__wrap van-tabs__wrap--scrollable van-hairline--top-bottom">
						<view role="tablist" class="van-tabs__nav van-tabs__nav--line">
							<view role="tab" aria-selected="true" class="van-tab van-tab--active" style="flex-basis: 25%;"><span class="van-tab__text van-tab__text--ellipsis">全部</span></view>
							<view role="tab" class="van-tab" style="flex-basis: 25%;"><span class="van-tab__text van-tab__text--ellipsis">满减券</span></view>
							<!-- <view role="tab" class="van-tab" style="flex-basis: 22%;"><span class="van-tab__text van-tab__text--ellipsis">兑换券</span></view> -->
							<view role="tab" class="van-tab" style="flex-basis: 25%;"><span class="van-tab__text van-tab__text--ellipsis">折扣券</span></view>
							<view role="tab" class="van-tab" style="flex-basis: 25%;"><span class="van-tab__text van-tab__text--ellipsis">已使用</span></view>
							<view role="tab" class="van-tab" style="flex-basis: 25%;"><span class="van-tab__text van-tab__text--ellipsis">已过期</span></view>
							<!-- <view class="van-tabs__line" style="width: 30px; transform: translateX(30px) translateX(-50%);"></view> -->
						</view>
					</view>
					<view class="van-tabs__content">
						<view role="tabpanel" class="van-tab__pane" style="">
							<view role="feed" class="merchantList van-list" aria-busy="true">
								<couponlist :coupons="coupons"></couponlist>
								<view class="van-list__finished-text center">没有更多了</view>
								<view class="van-list__placeholder"></view>
							</view>
						</view>
						
					</view>
				</view>
								
			</view>
		</view>
	</view>
</template>

<script>
	import qrcodeshow from "@/components/qrcodeshow.vue"
	import couponlist from "@/components/couponlist.vue"
	export default {
		components: {
			qrcodeshow,
			couponlist,
			
		},
		data() {
			return {
				coupons:[],
				page:1,
			}
		},
		onShow() {
			this.reLoadSize();
			this.LoadData();
		},
		onPullDownRefresh() {
			this.page = 1;
			console.log("刷新");
			this.LoadData();
		},
		onReachBottom() {
			this.page = this.page + 1;
			console.log("加载下一页");
			// this.LoadData();
		},
		methods: {
			LoadData(){
				var _this = this;
				_this.post({
					url:'/user/getCouponList',
					data:{page:_this.page},
					success:function(res){
						if(res.data.err==0){
							_this.coupons = res.data.data.user_coupons;
						}
					}
				});
			},
		}
	}
</script>

<style>
	
	
	
	


*{margin:0;padding:0;}
*{touch-action:pan-y;}
.ft10{font-size:.26667rem;}
.ft14{font-size:.37333rem;}
.ft18{font-size:.48rem;}
.verticalcenter{position:relative;top:50%;-webkit-transform:translateY(-50%);transform:translateY(-50%);}
#app{width:100%;height:100%;}
.coupon{display:-webkit-box;display:-webkit-flex;display:flex;width:9.38667rem;height:2.4rem;margin:0 auto .26667rem;color:#fff;-webkit-align-content:center;align-content:center;background:url(../../static/img/coupon2.png) no-repeat 0/100%;}
.coupon .left{-webkit-box-flex:11;-webkit-flex:11;flex:11;padding-top:.13333rem;}
.coupon .left p{text-align:center;}
.coupon .left .num{line-height:1.33333rem;margin-bottom:.08rem;font-size:.93333rem;}
.coupon .center{position:relative;-webkit-box-flex:25;-webkit-flex:25;flex:25;padding:.24rem 0 0 .21333rem;}
.coupon .center .couponName{width:4.93333rem;margin-bottom:.08rem;line-height:.66667rem;}
.coupon .center .ft10{line-height:.37333rem;}

.coupon .right{-webkit-box-flex:6;-webkit-flex:6;flex:6;text-align:center;line-height:.42667rem;}

.usedTicket{display:-webkit-box;display:-webkit-flex;display:flex;width:9.38667rem;height:2.4rem;margin:0 auto .26667rem;color:#fff;-webkit-align-content:center;align-content:center;background:url(../../static/img/used.png) no-repeat 0/100%;}
.usedTicket .left{-webkit-box-flex:9;-webkit-flex:9;flex:9;padding-top:.13333rem;}
.usedTicket .left p{text-align:center;}
.usedTicket .left .num{line-height:1.33333rem;margin-bottom:.08rem;font-size:.93333rem;}
.usedTicket .center{position:relative;-webkit-box-flex:25;-webkit-flex:25;flex:25;padding:.24rem 0 0 .21333rem;}
.usedTicket .center .couponName{width:4.93333rem;margin-bottom:.08rem;line-height:.66667rem;}
.usedTicket .center .ft10{line-height:.37333rem;}




.van-tab{position:relative;display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-align:center;-webkit-align-items:center;align-items:center;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-box-flex:1;-webkit-flex:1;flex:1;box-sizing:border-box;padding:0 .10667rem;color:#646566;font-size:.37333rem;cursor:pointer;}
.van-tab--active{color:#323233;font-weight:500;}
.van-tab__text--ellipsis{display:-webkit-box;-webkit-line-clamp:1;-webkit-box-orient:vertical;overflow:hidden;}
.van-tabs{position:relative;}
.van-tabs__wrap{overflow:hidden;}
.van-tabs__wrap--scrollable .van-tab{-webkit-box-flex:0;-webkit-flex:0 0 25%;flex:0 0 25%;}
.van-tabs__wrap--scrollable .van-tabs__nav{overflow-x:auto;overflow-y:hidden;-webkit-overflow-scrolling:touch;}
.van-tabs__wrap--scrollable .van-tabs__nav::-webkit-scrollbar{display:none;}
.van-tabs__nav{position:relative;display:-webkit-box;display:-webkit-flex;display:flex;background-color:#fff;-webkit-user-select:none;user-select:none;}
.van-tabs__nav--line{box-sizing:initial;height:100%;padding-bottom:.4rem;}
.van-tabs__line{position:absolute;bottom:.4rem;left:0;z-index:1;height:.08rem;background-color:#ee0a24;border-radius:.08rem;}
.van-tabs--line .van-tabs__wrap{height:1.17333rem;}
.van-tab__pane{-webkit-flex-shrink:0;flex-shrink:0;box-sizing:border-box;width:100%;}
#ticketCenter .van-tab--active{color:#ff7214;font-size:.42667rem;width:1.6rem;}
#ticketCenter .van-tabs__line{background-color:#ff7214;}
#ticketCenter .van-tabs__content{margin-top:.26667rem;}
#ticketCenter .van-tab{-webkit-flex-basis:16%!important;flex-basis:16%!important;}
.ticket-list{margin:0 auto .26667rem;}
</style>
